Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59960653565
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:38:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p832k-0003Dp-6L; Wed, 21 Dec 2022 12:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p832i-0003AN-4r; Wed, 21 Dec 2022 12:38:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p832g-0007gb-9O; Wed, 21 Dec 2022 12:38:11 -0500
Received: by mail-ej1-x62a.google.com with SMTP id kw15so38467311ejc.10;
 Wed, 21 Dec 2022 09:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kPn9HOni7ZKouLQkdjtGGU2AaK2I/xFMZEfF54klsow=;
 b=iUgSp6swhiUdqnSSw97JC6Dc3gSqETHtVPYAm4tkcvDHNjKS7W406DJdx1q1fi5Mzc
 5sgXLBFtAzCzAUe01ZT2AEpNEwasHz+I2EWmFDxGFATjaY42EltcKvRRoQKi59Dew/8W
 7JddGOk7bBpyf9IzZj1yVE8kST+gFRJfVa8f19Dde+UheVXGMf282+/2IX8CW/XoDqZs
 RlGKqm7MwU18mDpOPup0B6WAOU48BlUdwzyLnTcclOWCklDL2NYDZREp34jIGlExV8Av
 CKt9RE5PQXJvrNm/C7rtEQ4reAjBtGIks9UH6IIqCLc81ZxCqUR3N7Vm+X5gbrg2rnT6
 tKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kPn9HOni7ZKouLQkdjtGGU2AaK2I/xFMZEfF54klsow=;
 b=fjmm9/68OEP5I3OYYLY3Up2lUTE/0mRXq7rfAYonkc/bXK1OzN10uyUJzV48zTcdZq
 AK/M+aQPM1V6Ki8gUF59hwRKHK6+wB+JQ1iFX9KryhjWdEyT4naKOuIvY8L63fNDF9mM
 30rJ3hNUFNmQVTPvR0u/aJr7xMcB+mBTIR2LfQZkhVdVVI0j4C/bhJQrclLcGJPPY8XF
 ClVanwBFmpPfDVIXy2kQwGRNcxTAyVVWOXytTjAAIJCM2BFpkaKSaSfSLHUhGXWWNwYm
 tBWRGku2Z92XZhnimwWnjrdpRz6OWFPbvCQHtc1tMnfru0xlMlZOv3Mg+WzBZGRwGHTi
 X+HA==
X-Gm-Message-State: AFqh2ko2bH6k5SAURlmArNjQy4gFKqczyXf2laiwIW5UpanrRSROJEG3
 Y58iiSr6IBB5KrLUzHcKf1g=
X-Google-Smtp-Source: AMrXdXu78Ju/g1XloHL71s4X+ffZI6C6xWjkIc2SRNeonqeTcrxj4vfL1chjV+knYOPBnj1WBcL+9w==
X-Received: by 2002:a17:906:bcc6:b0:7c0:e0d7:b73a with SMTP id
 lw6-20020a170906bcc600b007c0e0d7b73amr2098078ejb.68.1671644288306; 
 Wed, 21 Dec 2022 09:38:08 -0800 (PST)
Received: from [127.0.0.1] (dynamic-092-224-051-061.92.224.pool.telefonica.de.
 [92.224.51.61]) by smtp.gmail.com with ESMTPSA id
 v12-20020a1709064e8c00b007c0f90a9cc5sm7387146eju.105.2022.12.21.09.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 09:38:07 -0800 (PST)
Date: Wed, 21 Dec 2022 17:37:58 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
In-Reply-To: <d5e1af45-9ff9-6b01-9650-bf5b960abee7@linaro.org>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221220094738-mutt-send-email-mst@kernel.org>
 <d5e1af45-9ff9-6b01-9650-bf5b960abee7@linaro.org>
Message-ID: <BCACD74C-B5BD-407C-AECE-63507FB8CEE5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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



Am 20=2E Dezember 2022 15:08:57 UTC schrieb "Philippe Mathieu-Daud=C3=A9" =
<philmd@linaro=2Eorg>:
>On 20/12/22 15:48, Michael S=2E Tsirkin wrote:
>> On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
>>> This series consolidates the implementations of the PIIX3 and PIIX4 so=
uth
>>> bridges and is an extended version of [1]=2E The motivation is to shar=
e as much
>>> code as possible and to bring both device models to feature parity suc=
h that
>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mac=
hine=2E This
>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed o=
n this
>>> list before=2E
>>>=20
>>> The series is structured as follows: First, PIIX3 is changed to instan=
tiate
>>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets=
 prepared
>>> for the merge with PIIX4 which includes some fixes, cleanups, and rena=
mings=2E
>>> Third, the same is done for PIIX4=2E In step four the implementations =
are merged=2E
>>> Since some consolidations could be done easier with merged implementat=
ions, the
>>> consolidation continues in step five which concludes the series=2E
>>>=20
>>> One particular challenge in this series was that the PIC of PIIX3 used=
 to be
>>> instantiated outside of the south bridge while some sub functions requ=
ire a PIC
>>> with populated qemu_irqs=2E This has been solved by introducing a prox=
y PIC which
>>> furthermore allows PIIX3 to be agnostic towards the virtualization tec=
hnology
>>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PI=
C as well=2E
>>>=20
>>> Another challenge was dealing with optional devices where Peter alread=
y gave
>>> advice in [1] which this series implements=2E
>>>=20
>>> A challenge still remains with consolidating PCI interrupt handling=2E=
 There are
>>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_=
pirq()
>>> which are implemented in isa/piix=2Ec=2E Any advice how to resolve the=
se would be
>>> highly appreaciated=2E See [2] for details=2E
>>>=20
>>> Last but not least there might be some opportunity to consolidate VM s=
tate
>>> handling, probably by reusing the one from PIIX3=2E Since I'm not very=
 familiar
>>> with the requirements I didn't touch it so far=2E
>>>=20
>>> Testing done:
>>> * make check
>>> * make check-avocado
>>> * Boot live CD:
>>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manja=
ro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manj=
aro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta=
 -hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 conso=
le=3DttyS0"`
>>>=20
>>> v3:
>>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_U=
SB_UHCIx (Philippe)
>>> - Make proxy PIC generic (Philippe)
>>> - Track Malta's PIIX dependencies through KConfig
>>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bit=
s' series [3]
>>> - Also rebase onto latest master to resolve merge conflicts=2E This re=
quired copying
>>>    Philippe's series as first three patches - please ignore=2E
>>=20
>> So IIUC, you are waiting for Philippe to respin his series then
>> you can include it all in v4, right?
>Correct=2E And mine is waiting for few more R-b tags=2E

I've reviewed patches 1 & 3 and patch 2 still has a nanoMIPS TODO=2E So I =
think we need a v3 there, no? What else is missing?

Best regards,
Bernhard

> If you can Ack
>this series, no need for v4 and I can pick it via mips-next once the
>rest is ready (before Xmas I hope)=2E
>
>Regards=2E
>
>Phil=2E

