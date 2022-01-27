Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0249E069
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:15:34 +0100 (CET)
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2kX-0001cX-DY
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:15:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2fp-0006lN-8m
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD2fi-00066R-FA
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643281830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGU25MCE1BEvKGk0EHtjAQcf7l2OLh/9vygomyVFZ08=;
 b=CZbpQp7NS4eJI6eSMR8s3IAgyaeu0RWnXerDdGePZguckL6fKN5U1IZ7eejvIISebfJllh
 GpN1YZA5n0yS7juKIFObskFVLrRzDSbStMlGhe2JznbIIDN1EXnOwlljN4lvUOD8NqNgS6
 qHsEDcVj0oyJTpYuXVPrkXvNqtKDrfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-377-DtUtM1DeN3OsKURy9Mf99Q-1; Thu, 27 Jan 2022 06:10:29 -0500
X-MC-Unique: DtUtM1DeN3OsKURy9Mf99Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5B69192CC42;
 Thu, 27 Jan 2022 11:10:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E1F6E4A7;
 Thu, 27 Jan 2022 11:10:17 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FE26113864A; Thu, 27 Jan 2022 12:10:16 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v6 0/7] trace qmp commands
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
 <87sft9vdkk.fsf@dusky.pond.sub.org>
 <7b974340-4f9c-274c-2218-6b379a557d2e@virtuozzo.com>
Date: Thu, 27 Jan 2022 12:10:16 +0100
In-Reply-To: <7b974340-4f9c-274c-2218-6b379a557d2e@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 27 Jan 2022 12:41:19 +0300")
Message-ID: <871r0ttox3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, michael.roth@amd.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, stefanha@redhat.com, pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 27.01.2022 10:32, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> This series aims to add trace points for each qmp command with help of
>>> qapi code generator.
>> Logging QMP traffic has worked well enough for me, but I can
>> understand
>> why you'd like to use tracing.  Other uses of tracing might come up in
>> the future.
>> I found a few last nits to pick.  Happy to address them in my tree.
>
> That would be great, thanks a lot!
>
>> Except for PATCH 4
>
> It has "Acked-by: Paolo", so seems we are done.
>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Queued, thanks!


