Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFD9458D6B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:28:40 +0100 (CET)
Received: from localhost ([::1]:33118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7V1-0001YD-8C
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp7TY-0000Bq-KH
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:27:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mp7TV-0005zX-D1
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637580424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYMOCZtxlan49W5UvOznD2ssi0KjHt/rKNfsslu6u2U=;
 b=NQsRSqXeBQuSNoP5bUT2qbGnYUUEKeOJMpAG5VdqQ/0lAbuBkKDqfBqwD5vIfltWOkwH9I
 5tmiElnqrI/ojs75hHfYgHsA3WFEGNh5G5YKc+J+D2Kk4SVpX8PDON38ONXsFO375EYET5
 arFpjDtTXM5QfKK1ZVEJWDweV4Jo3T4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-avjKPKnNOdG8xcaWLCpfvw-1; Mon, 22 Nov 2021 06:27:03 -0500
X-MC-Unique: avjKPKnNOdG8xcaWLCpfvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FA119F93A;
 Mon, 22 Nov 2021 11:27:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADCD63AEA;
 Mon, 22 Nov 2021 11:26:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE7CA11380A7; Mon, 22 Nov 2021 12:26:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hyman Huang <huangy81@chinatelecom.cn>
Subject: Re: [PATCH v3 3/3] cpus-common: implement dirty limit on vCPU
References: <cover.1637403404.git.huangy81@chinatelecom.cn>
 <cover.1637403404.git.huangy81@chinatelecom.cn>
 <99ea5e76926164d60a4ee62d0a1831823bc0d7a9.1637403404.git.huangy81@chinatelecom.cn>
 <87o86cprql.fsf@dusky.pond.sub.org>
 <1a8f3590-c7be-016e-842c-b4b29df92d2c@chinatelecom.cn>
 <874k84o8t2.fsf@dusky.pond.sub.org>
 <6a71b1a4-547a-aaef-2666-deabe4b7b410@chinatelecom.cn>
Date: Mon, 22 Nov 2021 12:26:48 +0100
In-Reply-To: <6a71b1a4-547a-aaef-2666-deabe4b7b410@chinatelecom.cn> (Hyman
 Huang's message of "Mon, 22 Nov 2021 17:25:11 +0800")
Message-ID: <87wnl0l9c7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hyman Huang <huangy81@chinatelecom.cn> writes:

> =E5=9C=A8 2021/11/22 17:10, Markus Armbruster =E5=86=99=E9=81=93:
>> Hyman Huang <huangy81@chinatelecom.cn> writes:
>>=20
>>> =3DE5=3D9C=3DA8 2021/11/22 15:35, Markus Armbruster =3DE5=3D86=3D99=3DE=
9=3D81=3D93:
>>>> huangy81@chinatelecom.cn writes:
>>>>
>>>>> From: Hyman Huang(=3DE9=3DBB=3D84=3DE5=3D8B=3D87) <huangy81@chinatele=
com.cn>
>>>>>
>>>>> implement dirtyrate calculation periodically basing on
>>>>> dirty-ring and throttle vCPU until it reachs the quota
>>>>> dirtyrate given by user.
>>>>>
>>>>> introduce qmp commands set-dirty-limit/cancel-dirty-limit to
>>>>> set/cancel dirty limit on vCPU.
>>>>
>>>> Please start sentences with a capital letter.
>>>>
>>> Ok=EF=BC=8Ci'll check the syntax problem next version.
>>>>>
>>>>> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom=
.cn>
>>>>
>>>>
>>>> [...]
>>>>
>>>>> diff --git a/qapi/misc.json b/qapi/misc.json
>>>>> index 358548a..98e6001 100644
>>>>> --- a/qapi/misc.json
>>>>> +++ b/qapi/misc.json
>>>>> @@ -527,3 +527,42 @@
>>>>>     'data': { '*option': 'str' },
>>>>>     'returns': ['CommandLineOptionInfo'],
>>>>>     'allow-preconfig': true }
>>>>> +
>>>>> +##
>>>>> +# @set-dirty-limit:
>>>>> +#
>>>>> +# This command could be used to cap the vCPU memory load, which is a=
lso
>>>>> +# refered as dirtyrate. One should use "calc-dirty-rate" with "dirty=
-ring"
>>>>> +# and to calculate vCPU dirtyrate and query it with "query-dirty-rat=
e".
>>>>> +# Once getting the vCPU current dirtyrate, "set-dirty-limit" can be =
used
>>>>> +# to set the upper limit of dirtyrate for the interested vCPU.
>>>>
>>>> "dirtyrate" is not a word.  Let's spell it "dirty page rate", for
>>>> consistency with the documentation in migration.json.
>>> Ok, sounds good.
>>>>
>>>> Regarding "One should use ...": sounds like you have to run
>>>> calc-dirty-rate with argument @mode set to @dirty-ring before this
>>>> command.  Correct?  What happens when you don't?  set-dirty-limit fail=
s?
>> You didn't answer this question.
> set-dirty-limit doesn't do any pre-check about if calc-dirty-rate has
> executed, so it doesn't fail.

Peeking at qmp_set_dirty_limit()... it fails when
!kvm_dirty_ring_enabled().  kvm_dirty_ring_enabled() returns true when
kvm_state->kvm_dirty_ring_size is non-zero.  How can it become non-zero?

> Since only executing calc-dirty-rate with dirty-ring mode can we get
> the vCPU dirty page rate currently(while the dirty-bitmap only get the
> vm dirty page rate), "One should use ..." maybe misleading, what i
> actually want to say is "One should use the dirty-ring mode to
> calculate the vCPU dirty page rate".

I'm still confused on what exactly users must do for the page dirty rate
limiting to work as intended, and at least as importantly, what happens
when they get it wrong.

[...]


