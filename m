Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528E86A8652
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:26:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXll3-0008Sh-Un; Thu, 02 Mar 2023 11:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXll2-0008Qj-8P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:26:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXll0-0005j8-JS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3FXfxnbEXGIu2sUzQf9ObKvGGDh9ML9hW+LsAX+7rqQ=;
 b=DH0pb5uL+z6sFt5U6iiCS4tve8d/hcZyHP+xvMuqxuhArNUejXeGIUm5w9pdQRJTLQjFsA
 A+u3QyT4uyGC7VnLRwaYKuTLeftVZQWoxMDg4nkx3IwPRpKImrvmFO8LkcRwxbMVM/IzRS
 3Rfzo+/5dnT9TD7gHVDQTfjfReNh96I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-qc6GTOyOPc64421Zo9rdiQ-1; Thu, 02 Mar 2023 11:26:09 -0500
X-MC-Unique: qc6GTOyOPc64421Zo9rdiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42AA3886064;
 Thu,  2 Mar 2023 16:26:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F17A140EBF6;
 Thu,  2 Mar 2023 16:26:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0569421E6A21; Thu,  2 Mar 2023 17:26:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,  Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org,  Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 6/6] monitor: convert monitor_cleanup() to
 AIO_WAIT_WHILE_UNLOCKED()
References: <20230301205801.2453491-1-stefanha@redhat.com>
 <20230301205801.2453491-7-stefanha@redhat.com>
 <87pm9rsjq4.fsf@pond.sub.org>
Date: Thu, 02 Mar 2023 17:26:08 +0100
In-Reply-To: <87pm9rsjq4.fsf@pond.sub.org> (Markus Armbruster's message of
 "Thu, 02 Mar 2023 08:20:03 +0100")
Message-ID: <87fsani0gv.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> writes:

> Stefan Hajnoczi <stefanha@redhat.com> writes:
>
>> monitor_cleanup() is called from the main loop thread. Calling
>
> Correct.
>
>> AIO_WAIT_WHILE(qemu_get_aio_context(), ...) from the main loop thread is
>> equivalent to AIO_WAIT_WHILE_UNLOCKED(NULL, ...) because neither unlocks
>> the AioContext and the latter's assertion that we're in the main loop
>> succeeds.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  monitor/monitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index 8dc96f6af9..602535696c 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -666,7 +666,7 @@ void monitor_cleanup(void)
>>       * We need to poll both qemu_aio_context and iohandler_ctx to make
>>       * sure that the dispatcher coroutine keeps making progress and
>>       * eventually terminates.  qemu_aio_context is automatically
>> -     * polled by calling AIO_WAIT_WHILE on it, but we must poll
>> +     * polled by calling AIO_WAIT_WHILE_UNLOCKED on it, but we must poll
>>       * iohandler_ctx manually.
>>       *
>>       * Letting the iothread continue while shutting down the dispatcher
>> @@ -679,7 +679,7 @@ void monitor_cleanup(void)
>>          aio_co_wake(qmp_dispatcher_co);
>>      }
>>  
>> -    AIO_WAIT_WHILE(qemu_get_aio_context(),
>> +    AIO_WAIT_WHILE_UNLOCKED(NULL,
>>                     (aio_poll(iohandler_get_aio_context(), false),
>>                      qatomic_mb_read(&qmp_dispatcher_co_busy)));
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
>
> For an R-by, I need to understand this in more detail.  See my reply to
> the previous patch.

Upgrading to
Reviewed-by: Markus Armbruster <armbru@redhat.com>


