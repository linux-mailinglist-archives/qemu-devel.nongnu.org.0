Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C476A67B0
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGBk-00036E-Gq; Wed, 01 Mar 2023 01:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXGBS-0002vZ-ED; Wed, 01 Mar 2023 01:43:31 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXGBM-0008LU-81; Wed, 01 Mar 2023 01:43:23 -0500
Received: by mail-ed1-x52f.google.com with SMTP id eg37so49542230edb.12;
 Tue, 28 Feb 2023 22:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677652998;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jhvWp/DQNlmCrNkLsVa9Svo9+HYSNyxJcxoWk93aT2Q=;
 b=JUPINV2W9vgjNQo21oI7W29lheq7UpBG+Ok75egr3AUGPQGRHpcWMVto9KzV+s2FIE
 rVpd8AotL9cgSDik/5yN+nGHLFxMVbij8GL+oo3qja60SH0AQfuhHd1swrmksu95PmRT
 JPHnZEKB62A4OXj38nndN81VOR356JYY+z7bEOdM8SssunWMbDBpPmPT2/nvxw+0h6FX
 kAnLwrSoSVcoEf5UjLhA4Nhew2Ay+C177o6DGEmGTr/pIxYHIs+xKe2PUsNFF/JQxGCg
 ZOXLJAah4XC451EZ8v46glmK+wA3Xbv2OeSBBm70yYs8YJKmuanooxyEUxIoL4H5lY10
 +Nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677652998;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jhvWp/DQNlmCrNkLsVa9Svo9+HYSNyxJcxoWk93aT2Q=;
 b=Ohd6i2ibgMIREiykgWF0YDM0pDMC1ycXdnqYfQxlgne35fBfW4fvhAniiKChrCaojE
 dXvyHY3Ll/aAct1zmI+1jeqc9pkzHuWrFGWg3LK47CSg1ARoVCyXObdK5/oa195Yo14G
 TzVdivctBPw4AM+GSekgE4P8DEsC0pZhynUUaFXMKcid0YeCphKVRCvVZa1v50bgHcWJ
 Gpolosrv+iwQKv9XbcgjMdq6PdyaCMQgzGm4frYEFdcw+YFzb6ikmooAzFbeNVmbJJtg
 5OEfvyJqbME2lJaJTAGmx4QtV1OC+du3xX4h1JPIpI1GKzmUcKchun/bO8EHRD9o+aKX
 e3Zg==
X-Gm-Message-State: AO0yUKV72fj0LQioQ8vfa6s6COWOWh/dIs0r8mWeV7OBtCxPKsrJBPi7
 N0Rng8jXHPbOGor5cyDNK70=
X-Google-Smtp-Source: AK7set8dSUbald2VIoxfxAFy9jXHbGCrvy47VWN41GR8wBdKdCci+mm9GXt60dHX2kPB9sPmoY7wXQ==
X-Received: by 2002:a17:906:7704:b0:8f8:b3a6:cc6b with SMTP id
 q4-20020a170906770400b008f8b3a6cc6bmr5085860ejm.58.1677652997924; 
 Tue, 28 Feb 2023 22:43:17 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-154-055.78.54.pool.telefonica.de.
 [78.54.154.55]) by smtp.gmail.com with ESMTPSA id
 m15-20020a1709061ecf00b00882f9130eafsm5383199ejj.26.2023.02.28.22.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:43:17 -0800 (PST)
Date: Wed, 01 Mar 2023 06:43:08 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_2/7=5D_Revert_=22hw/isa/vt82c?=
 =?US-ASCII?Q?686=3A_Remove_intermediate_IRQ_forwarder=22?=
In-Reply-To: <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cdfb3c5a42e505450f6803124f27856434c5b298.1677628524.git.balaton@eik.bme.hu>
 <709f5780-97e5-0cee-d776-4558cf39e000@eik.bme.hu>
Message-ID: <CDB81BB8-8136-4C97-84A2-EB3CAACC8781@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 1=2E M=C3=A4rz 2023 00:33:28 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>On Wed, 1 Mar 2023, BALATON Zoltan wrote:
>> This partially reverts commit bb98e0f59cde846666d9fddc60ae74ef7ddfca17
>> keeping the rename of a state field but reverting other cahanges which
>> break interrupts on pegasos2=2E
>
>I've found this with just booting the MorphOS iso which now hangs without=
 this revert when trying to read from the ide device=2E I think I've mentio=
ned that I've also tried this way first but then ended up adding this becau=
se it was needed in a review of the patch earlier but I can't find that mes=
sage now=2E For now it seems the easiest is to revert this and think about =
it later=2E

It looks like Philippe's patch should work, at least in theory=2E Why does=
 the indirection work while it doesn't without?

>
>Regards,
>BALATON Zoltan
>
>> Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>> ---
>> hw/isa/vt82c686=2Ec | 10 +++++++++-
>> 1 file changed, 9 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>> index f4c40965cd=2E=2E01e0148967 100644
>> --- a/hw/isa/vt82c686=2Ec
>> +++ b/hw/isa/vt82c686=2Ec
>> @@ -598,15 +598,23 @@ void via_isa_set_irq(PCIDevice *d, int n, int lev=
el)
>>     qemu_set_irq(s->isa_irqs_in[n], level);
>> }
>>=20
>> +static void via_isa_request_i8259_irq(void *opaque, int irq, int level=
)
>> +{
>> +    ViaISAState *s =3D opaque;
>> +    qemu_set_irq(s->cpu_intr, level);
>> +}
>> +
>> static void via_isa_realize(PCIDevice *d, Error **errp)
>> {
>>     ViaISAState *s =3D VIA_ISA(d);
>>     DeviceState *dev =3D DEVICE(d);
>>     PCIBus *pci_bus =3D pci_get_bus(d);
>> +    qemu_irq *isa_irq;
>>     ISABus *isa_bus;
>>     int i;
>>=20
>>     qdev_init_gpio_out(dev, &s->cpu_intr, 1);
>> +    isa_irq =3D qemu_allocate_irqs(via_isa_request_i8259_irq, s, 1);
>>     isa_bus =3D isa_bus_new(dev, pci_address_space(d), pci_address_spac=
e_io(d),
>>                           errp);
>>=20
>> @@ -614,7 +622,7 @@ static void via_isa_realize(PCIDevice *d, Error **e=
rrp)
>>         return;
>>     }
>>=20
>> -    s->isa_irqs_in =3D i8259_init(isa_bus, s->cpu_intr);
>> +    s->isa_irqs_in =3D i8259_init(isa_bus, *isa_irq);
>>     isa_bus_register_input_irqs(isa_bus, s->isa_irqs_in);
>>     i8254_pit_init(isa_bus, 0x40, 0, NULL);
>>     i8257_dma_init(isa_bus, 0);
>>=20

