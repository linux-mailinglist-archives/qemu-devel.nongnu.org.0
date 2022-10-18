Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76413602C9B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:13:05 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okmP0-0002cX-TQ
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmH9-00064J-KB
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1okmH7-0000Uu-IW
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666098291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lb+bXF9Y6+n4J3LMo+Jm2WnOF+HrSLWKRmxWjdZOWkQ=;
 b=c4H2XkAMI5yvxVLUGUdu2pZxBvIvjX//fmdMDT5vdg1UKfUwZEzFAXwmb01bmn2W1h9iYo
 7yAyQ2eiPT/U1MKg6LyGBtgPsZzO5Za3KiKaJ/r9P+QutIcDHMowY2+vu/K4XVWsU7bThL
 Qh0sTxwo+HO2PYLCIAXcs0z8RdPxunI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-0c4N1jJFPmqY3BQkH0hnsg-1; Tue, 18 Oct 2022 09:04:48 -0400
X-MC-Unique: 0c4N1jJFPmqY3BQkH0hnsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D37E42999B33;
 Tue, 18 Oct 2022 13:04:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEC4B14657C0;
 Tue, 18 Oct 2022 13:04:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 967CD21E6936; Tue, 18 Oct 2022 15:04:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  michael.roth@amd.com,  jsnow@redhat.com,
 eblake@redhat.com,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 21/28] qapi run-state: Elide redundant has_FOO in
 generated C
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-22-armbru@redhat.com>
 <8266adb1-ea48-4ef7-eadc-9aa1e1dde842@linaro.org>
Date: Tue, 18 Oct 2022 15:04:46 +0200
In-Reply-To: <8266adb1-ea48-4ef7-eadc-9aa1e1dde842@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Tue, 18 Oct 2022 14:11:20
 +0200")
Message-ID: <87h7012sgh.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 18/10/22 08:28, Markus Armbruster wrote:
>> The has_FOO for pointer-valued FOO are redundant, except for arrays.
>> They are also a nuisance to work with.  Recent commit "qapi: Start to
>> elide redundant has_FOO in generated C" provided the means to elide
>> them step by step.  This is the step for qapi/run-state.json.
>> Said commit explains the transformation in more detail.  The invariant
>> violations mentioned there do not occur here.
>
> The rationale here is qapi free() has always be able to deal with a NULL
> argument (commit fb3182ce6e "qapi: add qapi-types.py code generator"
> from Tue Jul 19 14:50:40 2011).
>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>   softmmu/runstate.c     | 18 +++++-------------
>>   scripts/qapi/schema.py |  1 -
>>   2 files changed, 5 insertions(+), 14 deletions(-)
>> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>> index 1e68680b9d..682a810d3c 100644
>> --- a/softmmu/runstate.c
>> +++ b/softmmu/runstate.c
>
>> @@ -517,13 +514,8 @@ void qemu_system_guest_panicked(GuestPanicInformati=
on *info)
>>   void qemu_system_guest_crashloaded(GuestPanicInformation *info)
>>   {
>>       qemu_log_mask(LOG_GUEST_ERROR, "Guest crash loaded");
>> -
>> -    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN,
>> -                                   !!info, info);
>> -
>> -    if (info) {
>> -        qapi_free_GuestPanicInformation(info);
>> -    }
>> +    qapi_event_send_guest_crashloaded(GUEST_PANIC_ACTION_RUN, info);
>> +    qapi_free_GuestPanicInformation(info);
>>   }

Yes, dropping the conditional is an unrelated, but trivial cleanup, and
mentioning such things in the commit message is good practice.

> Preferably updating the commit description:

Intend to add "Drop a superfluous conditional around
qapi_free_GuestPanicInformation() while there."  Okay?

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks!


