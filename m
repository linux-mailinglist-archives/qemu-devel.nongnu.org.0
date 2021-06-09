Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 290913A13CC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:10:49 +0200 (CEST)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqx2m-0005uy-7p
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqx1t-0005F5-Lc
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lqx1s-0003LA-1u
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cp+BEXiE8QPAfs5HEIM1OcOopNuoicQYXT1xbhVGsr0=;
 b=EM1L/zxUqcSfJinqqO+aGpI3HFafPCIrTTEaORNohwEzjF9cUIrSVNm5MC5//xq3MgVNS3
 EqoxO84QsX8BxsPCITVYoEaNsPM5aCvrSCzPC4Vp4PmLQ720WmiyPEKDAGC3/bpv7D+/Rl
 SNlksbU7qJkwIoaZrwLWkLcparkmagw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-vOa5WesJNESozYybLzGXbA-1; Wed, 09 Jun 2021 08:09:49 -0400
X-MC-Unique: vOa5WesJNESozYybLzGXbA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1F2E8186F1;
 Wed,  9 Jun 2021 12:09:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A48C75D9C6;
 Wed,  9 Jun 2021 12:09:48 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35FE0113865F; Wed,  9 Jun 2021 14:09:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl: Fix an assert failure in error path
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
 <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
Date: Wed, 09 Jun 2021 14:09:47 +0200
In-Reply-To: <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com> (Paolo
 Bonzini's message of "Wed, 9 Jun 2021 11:30:31 +0200")
Message-ID: <87fsxrnss4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 10/06/21 10:47, Zhenzhong Duan wrote:
>> Based on the description of error_setg(), the local variable err in
>> qemu_maybe_daemonize() should be initialized to NULL.
>> Without fix, the uninitialized *errp triggers assert failure which
>> doesn't show much valuable information.
>> Before the fix:
>> qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
>> After fix:
>> qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> ---
>>   softmmu/vl.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>> index 326c1e9080..feb4d201f3 100644
>> --- a/softmmu/vl.c
>> +++ b/softmmu/vl.c
>> @@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
>>     static void qemu_maybe_daemonize(const char *pid_file)
>>   {
>> -    Error *err;
>> +    Error *err = NULL;

Common mistake, I'm afraid.

>>         os_daemonize();
>>       rcu_disable_atfork();
>> 
>
> Queued, thanks.

Suggest to amend the commit message with

    Fixes: 03d2b412aaf2078425f8472f31c8a9c2340969eb


