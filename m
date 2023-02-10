Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6A692083
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:09:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQU42-0005CF-MY; Fri, 10 Feb 2023 09:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQU41-0005Bz-IP
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQU40-0004ec-0b
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 09:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676038063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mztsREDFOI25lDCAUKXFWJOP09qFYtUQKnhTnKIEco=;
 b=WqVVH6t0kB8OkdN3zTfBNa+4WmU6uah+dToP/1iRmTssIrMLZ8S2Ygm0b/smP2lTBpbH7h
 XHPSOVsTzPSvar2Du380tc7neoZsziTup9+4aM8d+HqLoptNcLz9G2UsAboeRe90mvf0hK
 l5EqnRRewkRJpDi1Yli3VpFnTMo4puk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-LPGpIT94OPCsvJANpqntjQ-1; Fri, 10 Feb 2023 09:07:32 -0500
X-MC-Unique: LPGpIT94OPCsvJANpqntjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A765280D0EA;
 Fri, 10 Feb 2023 14:07:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D6C92026D4B;
 Fri, 10 Feb 2023 14:07:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 79E3521E6A1F; Fri, 10 Feb 2023 15:07:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Fabiano Rosas <farosas@suse.de>,  qemu-devel@nongnu.org,
 qemu-arm@nongnu.org,  Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,  Markus Armbruster
 <armbru@redhat.com>
Subject: Re: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
References: <20230203100551.2445547-1-alex.bennee@linaro.org>
 <87cz6loahb.fsf@suse.de> <877cwtpl1v.fsf@linaro.org>
Date: Fri, 10 Feb 2023 15:07:30 +0100
In-Reply-To: <877cwtpl1v.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Tue, 07 Feb 2023 15:09:57 +0000")
Message-ID: <87k00p7gwt.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Fabiano Rosas <farosas@suse.de> writes:
>
>> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>>
>>> Before this change booting a -cpu max,sve=3Doff would trigger and
>>> assert:
>>>
>>>   qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_=
sm: Assertion `sm' failed.
>>>
>>> when the guest attempts to write to SMCR which shouldn't even exist if
>>> SVE has been turned off.
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>>> ---
>>>  target/arm/cpu64.c | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 0e021960fb..a38d43421a 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool valu=
e, Error **errp)
>>>      t =3D cpu->isar.id_aa64pfr0;
>>>      t =3D FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>>>      cpu->isar.id_aa64pfr0 =3D t;
>>> +
>>> +    /* FEAT_SME requires SVE, so disable it if no SVE */
>>> +    if (!value) {
>>> +        t =3D cpu->isar.id_aa64pfr1;
>>> +        t =3D FIELD_DP64(t, ID_AA64PFR1, SME, 0);
>>> +        cpu->isar.id_aa64pfr1 =3D t;
>>> +    }
>>
>> What about -cpu max,sve=3Doff,sme=3Don ?
>
> Gah - I bet this is going to depend on ordering of parameters as well.
>
> Markus,
>
> Is there any way to represent optionA implies optionB in our argument par=
sing?

You meant "in the one of our multitude of ways to parse arguments that
is being used here".

The commit message implicates -cpu.  Which is its own special case.
qemu_init() passes the option argument to parse_cpu_option(), which
splits it at the first ",", interprets the first part as CPU model name,
and passes the second part to the CPU type's ->parse_features()
callback.  Three implementations, all bespoke parsers[*].  ARM CPUs
appear to use cpu_common_parse_features().  As far as I can tell, it
parses the string as a sequence of CPU properties PROP=3DVAL,... and sets
the properties.

cpu_arm_set_sve() is the setter for property "sve".  Checking the value
of another property in such a setter is usually wrong, as Fabiano
pointed out for this case.  Check in the realize() method instead.

Questions?


[*] Yes, having in the order of twenty ad hoc option argument parsers is
an embarrassment, but it's what a decade or so of unsystematic interface
growth gets you.


