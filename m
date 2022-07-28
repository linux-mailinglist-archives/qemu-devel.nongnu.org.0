Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785C58401D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:36:56 +0200 (CEST)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3h8-00031f-Hv
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH3aa-0005VS-Qp
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:30:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH3aW-0002hA-JY
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRgLmKglc2AkDcvn4KdG9lcCd7A79+WFRksFjC3HQZM=;
 b=GkMqIIq1FzeTBlv8YbCKxsV3l7Il6B9wU2TgDVoyryFKC8HGwhz/tvDEjMFdJl8yTeRhtY
 F95Ui/Nyioxcny2c6OMNY5DuKCVr7loFIykUHvLCg20/HG3XLkQKCPy1FY7EWW2MIXKZvN
 o7WFolqScp0m8jBtZ6oFd+yRuzHVQhI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-Ich3NNGwMZyzLlsiMj99gA-1; Thu, 28 Jul 2022 09:30:01 -0400
X-MC-Unique: Ich3NNGwMZyzLlsiMj99gA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F147C101A589;
 Thu, 28 Jul 2022 13:30:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B14A618EB7;
 Thu, 28 Jul 2022 13:30:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0310A21E6930; Thu, 28 Jul 2022 15:29:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Igor Mammedov
 <imammedo@redhat.com>,  qemu-devel@nongnu.org,  mst@redhat.com,
 t0rr3sp3dr0@gmail.com,  alex.bennee@linaro.org,  dgilbert@redhat.com,
 agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
 <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
Date: Thu, 28 Jul 2022 15:29:58 +0200
In-Reply-To: <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
 (Peter Maydell's message of "Thu, 28 Jul 2022 11:52:57 +0100")
Message-ID: <87mtctxt49.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 28 Jul 2022 at 11:23, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>
>> On Thu, Jul 28, 2022 at 11:05:13AM +0100, Peter Maydell wrote:
>> > On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat=
.com> wrote:
>> > >
>> > > On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote:
>> > > > QEMU probably can't carry OSK key[1] for legal reasons so it
>> > > > can't supply the valid default key. However when tests are run
>> > > > applesmc will pollute test log with distracting warning,
>> > > > silence that warning so it won't distract maintainers/CI.
>> > >
>> > > What test is causing this problem ?
>> >
>> > bios-tables-test -- see here for the relevant bit of the log:
>> >
>> > https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=3D=
qxqptZpwTp=3DTkcXrhg@mail.gmail.com/
>>
>> The right fix is for bios-tables-tests to pass an explicit 'osk' value
>> then. As its a test it doesn't have to be a genuine OSK, jsut any old
>> 64-byte string
>>
>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-te=
st.c
>> index 359916c228..f6b5adf200 100644
>> --- a/tests/qtest/bios-tables-test.c
>> +++ b/tests/qtest/bios-tables-test.c
>> @@ -1632,7 +1632,7 @@ static void test_acpi_q35_applesmc(void)
>>          .variant =3D ".applesmc",
>>      };
>>
>> -    test_acpi_one("-device isa-applesmc", &data);
>> +    test_acpi_one("-device isa-applesmc,osk=3Diamalsonottherealoskimjus=
theretostopbiostablestestspammingstderr", &data);
>>      free_test_data(&data);
>
> We should either have a comment saying that this has to be exactly
> 64 characters and it doesn't matter what they are; or we could use
>  any64characterfakeoskisenoughtopreventinvalidkeywarningsonstderr
>
> :-)

I applaud the renaissance of roman-style inscriptions, but it's not just
words without spaces, it's also capital letters only:

    ANY64CHARACTERFAKEOSKISENOUGHTOPREVENTINVALIDKEYWARNINGSONSTDERR

Seriously, throw in some dashes or spaces.


