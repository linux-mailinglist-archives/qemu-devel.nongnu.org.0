Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FF36EC7CF
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 10:25:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqrU8-0001OY-WD; Mon, 24 Apr 2023 04:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqrU6-0001NI-8Q; Mon, 24 Apr 2023 04:23:42 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqrU4-0005Yu-Hk; Mon, 24 Apr 2023 04:23:42 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94eff00bcdaso731816166b.1; 
 Mon, 24 Apr 2023 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682324617; x=1684916617;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p/5zV32iZnJlYmTQbgPNkcGnk912T4ahM8O2AYxPu8M=;
 b=klGplVxU7NpyAxk+Pkf+2NukrlJT6PGIn0zPTGwnpaE+iy/ayK3Vk3DmSJha4ySdB/
 MkhSj/ya4/lzCNI1AP6UELITzuVEK/1rsdzwLj5YhN2PSnhEE2wxFzQPsMUYqJUs6gB5
 cEJYtg/z57dMYFmpNjn0fil4ozEthQv9t03KizPlFqTFYY0gtShzijDJHVEdssxBQDjx
 VLJ/4UaaIYO03MMpaeqyHHBtmTU8ptIRt0KhjMDkEw8kG0cveGzJEQqW9WPPuK+e8gOi
 l0wOe+ASAIU5cE8BXe+aZCTDyWuM6h4h75C36JPvMigptFUyvKW2PcbsFV3jWCVX1GSF
 1PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682324617; x=1684916617;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p/5zV32iZnJlYmTQbgPNkcGnk912T4ahM8O2AYxPu8M=;
 b=EKEt48s3Tt8flYgpl+udpdf4TFFOW1E4W4cPgo27CV1kwykARXivHwWitLY+hyr3MV
 bBCzVqLjHOXbJ7YaxG1w+eJ7NKM58pYwp7RC1eucWiVU0noJMwCjqvgcP9hVBSOmFik2
 XXUrNnWFKQDrc39sECmEgMHVOKPRSkvEkOTp8EOxuRau0LVF3IakDqk2U3bGydYsVzka
 Kx7Ou+Iu807543/FHV/fkcS17mAR7Ht4lK2mhmQS0zW/GbnN+XFXJ9KZVVXsH7TeXvyu
 2AGCqBwF2jMXiSp12d5kMJZsLN/+6OhPFCD0UVSzLM59712dDtIDFq73aJoJ5TmFDsb9
 1/aQ==
X-Gm-Message-State: AAQBX9eKUAOAjX77FObXQXtGzV/gMQcdRQaWTDC71GDHIFZ1RHJKv5pC
 TW/zu1R4abxxTTl3HbjbjqM=
X-Google-Smtp-Source: AKy350bGBMlIjB7hCgcrCMdGBmDVNCdt6MtQPLjAT8En+ZHPqUxYWL3i9siXgA9K10x6IcjDNpDRtQ==
X-Received: by 2002:a17:906:2b11:b0:94f:5fd0:dd42 with SMTP id
 a17-20020a1709062b1100b0094f5fd0dd42mr8636324ejg.39.1682324617284; 
 Mon, 24 Apr 2023 01:23:37 -0700 (PDT)
Received: from [127.0.0.1] (business-90-187-110-129.pool2.vodafone-ip.de.
 [90.187.110.129]) by smtp.gmail.com with ESMTPSA id
 pv22-20020a170907209600b0094f0025983fsm5307767ejb.84.2023.04.24.01.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 01:23:36 -0700 (PDT)
Date: Mon, 24 Apr 2023 07:45:11 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_07/13=5D_hw/ide=3A?=
 =?US-ASCII?Q?_Extract_pci=5Fide=5F=7Bcmd=2Cdata?=
 =?US-ASCII?Q?=7D=5Fle=5Fops_initialization_into_base_class_constructor?=
In-Reply-To: <268be283-6456-c309-cc31-d67d14de6f3d@linaro.org>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-8-shentey@gmail.com>
 <268be283-6456-c309-cc31-d67d14de6f3d@linaro.org>
Message-ID: <DEA90D89-F356-44A9-BC23-3880AD6F7239@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 23=2E April 2023 17:46:18 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 22/4/23 17:07, Bernhard Beschow wrote:
>> There is redundant code in cmd646 and via which can be extracted into t=
he base
>> class=2E In case of piix and sii3112 this is currently unneccessary but=
 shouldn't
>> interfere since the memory regions aren't mapped by those devices=2E In=
 few
>> commits later this will be changed, i=2Ee=2E those device models will a=
lso make use
>> of these memory regions=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/ide/cmd646=2Ec | 11 -----------
>>   hw/ide/pci=2Ec    | 10 ++++++++++
>>   hw/ide/via=2Ec    | 11 -----------
>>   3 files changed, 10 insertions(+), 22 deletions(-)
>
>
>> diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>> index 65ed6f7f72=2E=2Ea9194313bd 100644
>> --- a/hw/ide/pci=2Ec
>> +++ b/hw/ide/pci=2Ec
>> @@ -543,6 +543,16 @@ static void pci_ide_init(Object *obj)
>>   {
>>       PCIIDEState *d =3D PCI_IDE(obj);
>>   +    memory_region_init_io(&d->data_bar[0], OBJECT(d), &pci_ide_data_=
le_ops,
>> +                          &d->bus[0], "pci-ide0-data-ops", 8);
>> +    memory_region_init_io(&d->cmd_bar[0], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>> +                          &d->bus[0], "pci-ide0-cmd-ops", 4);
>> +
>> +    memory_region_init_io(&d->data_bar[1], OBJECT(d), &pci_ide_data_le=
_ops,
>> +                          &d->bus[1], "pci-ide1-data-ops", 8);
>> +    memory_region_init_io(&d->cmd_bar[1], OBJECT(d), &pci_ide_cmd_le_o=
ps,
>> +                          &d->bus[1], "pci-ide1-cmd-ops", 4);
>
>The trailing "-ops" just adds noise IMO=2E

I'll remove them in the next iteration=2E

Best regards,
Bernhard

>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>

