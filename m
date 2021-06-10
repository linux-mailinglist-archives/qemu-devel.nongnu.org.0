Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5123A2589
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 09:34:08 +0200 (CEST)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFCZ-00025p-TM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 03:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrFBY-0001Qk-SB
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lrFBV-0005Sg-Lr
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 03:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623310380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D9azznltn6g+O5PsyxbdWkLmBMLSEtsNZojHaKfFw4g=;
 b=SCoLAGy2+1+uuMa5yLGzO4sYWX/ZRKT5GVwuVCgnws0/Gf/2SSCzUhoIBYLPtN8pQ4Is+9
 1GcqS+jl4n2oZYz0/9nen+As0ZPn+Mi9gifo+aCmEoCdFmePWrb3r9DLkC/SQO2u6sdprg
 hcCrmQpgUkCesOrPvxi+EflqwEOgj7A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-xRbzWdGcNVCqZYgPMFgvWQ-1; Thu, 10 Jun 2021 03:32:57 -0400
X-MC-Unique: xRbzWdGcNVCqZYgPMFgvWQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E53E80573A;
 Thu, 10 Jun 2021 07:32:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-222.ams2.redhat.com
 [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31CF118F0A;
 Thu, 10 Jun 2021 07:32:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ACB3A113865F; Thu, 10 Jun 2021 09:32:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [PATCH] vl: Fix an assert failure in error path
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
 <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
 <87fsxrnss4.fsf@dusky.pond.sub.org> <YMCw5E2havaaC+UI@redhat.com>
 <2a094460-5549-4a64-8df0-c376e046b012@huawei.com>
Date: Thu, 10 Jun 2021 09:32:54 +0200
In-Reply-To: <2a094460-5549-4a64-8df0-c376e046b012@huawei.com> (Peng Liang's
 message of "Thu, 10 Jun 2021 09:47:26 +0800")
Message-ID: <87v96mfa3d.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peng Liang <liangpeng10@huawei.com> writes:

> On 6/9/2021 8:15 PM, Daniel P. Berrang=C3=A9 wrote:
>> On Wed, Jun 09, 2021 at 02:09:47PM +0200, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>>
>>>> On 10/06/21 10:47, Zhenzhong Duan wrote:
>>>>> Based on the description of error_setg(), the local variable err in
>>>>> qemu_maybe_daemonize() should be initialized to NULL.
>>>>> Without fix, the uninitialized *errp triggers assert failure which
>>>>> doesn't show much valuable information.
>>>>> Before the fix:
>>>>> qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp =
=3D=3D NULL' failed.
>>>>> After fix:
>>>>> qemu-system-x86_64: cannot create PID file: Cannot open pid file: Per=
mission denied
>>>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>>>> ---
>>>>>   softmmu/vl.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>>> index 326c1e9080..feb4d201f3 100644
>>>>> --- a/softmmu/vl.c
>>>>> +++ b/softmmu/vl.c
>>>>> @@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
>>>>>     static void qemu_maybe_daemonize(const char *pid_file)
>>>>>   {
>>>>> -    Error *err;
>>>>> +    Error *err =3D NULL;
>>>
>>> Common mistake, I'm afraid.
>>=20
>> Initializing isn't likely to be a performance impact, so I'd think
>> we should make 'checkpatch.pl' complain about any 'Error *' variable
>> that is not initialized to NULL, as a safety net, even if not technicall=
y
>> required in some cases.
>>=20
>> Regards,
>> Daniel
>>=20
>
> Hi,
> Could we add a coccinelle script to check (and fix) these problems?  e.g.=
:

Coccinelle is good for finding and fixing instances of bad patterns that
have crept in.  checkpatch is good for keeping them out.  Both has its
uses.

> @ r @
> identifier id;
> @@
>   Error *id
> + =3D NULL
>   ;
>
> Using this script, I found that local variable err in
> qemu_init_subsystems is not initialized to NULL too.

Crash bug, broken in commit efd7ab22fb "vl: extract
qemu_init_subsystems", v6.0.0.  Care to submit a fix?

>                                                       The script is not
> prefect though, it will initialize all global/static 'Error *' variables
> and all local 'Error *' variables in util/error.c to NULL, which is
> unnecessary.

Excluding util/error.c is easy once you know how to:

    @ depends on !(file in "util/error.c")@
    identifier id;
    @@
    ...

Excluding variable definitions with static storage duraction shouldn't
be too hard, either.  If Coccinelle is sufficiently clever, adding
keyword auto suffices.  Else, try matching keyword static separately,
like so:

    (
        static Error *id;
    |
    -   Error *id;
    +   Error *id =3D NULL;
    )

Completely untested.


