Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE986EC2E2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 00:08:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqhrD-0003bw-2t; Sun, 23 Apr 2023 18:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhr6-0003b1-42; Sun, 23 Apr 2023 18:06:48 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqhr4-0002hl-0v; Sun, 23 Apr 2023 18:06:47 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso513649466b.3; 
 Sun, 23 Apr 2023 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682287603; x=1684879603;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=inKXuwOT7PQYiwwW8r0IDbaxjW5oVAuij9X7Goqm768=;
 b=Cnlb6suHD/ehYfKN79Se39aQh0RJpIyHN8k0+tACmrxcTTew8mQ+Bk0hkfTPoe0QQ/
 HQAMTz9zyzER1NbYtLtU+jQAKy3uX+z7SLDxt0tUYtSX+JE8Kk7jaEg+S5nnTX/piyCr
 qJrczIh+QssSDX890HtMT1JHUYe13JCdWG7o3dkg6b5/uufFGb+FRSdyOG4i5Ji89kxu
 j1UxKuyHeoyPVJaDsTVrPm1uA3aJYmgsqen3gmJOVjyhG/7uDS0JAOiSUNLoz9MOs6uR
 GQGxeePT0AfPFOpotWlQ1xpykwY1cbuflCawRQBTLw2ho9FlBYoFPwUbMKqOc/NgVyuF
 UNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682287603; x=1684879603;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=inKXuwOT7PQYiwwW8r0IDbaxjW5oVAuij9X7Goqm768=;
 b=l5reZku/jdwX02Cqo9WkVbXd3pzYOH8CHK6evC+6uWodFYWugtWy3G3xCjUOa+YXoE
 zG6nsVXuqNY/PeTn62RthVIQHOWb60z51XcX4R7MjkSxl7dNM30dlDpifl04UeCIviV0
 r+hHdyiS5XBpatrPOyTioC+3acnUc1UbMntUmvV1J00BDO6TDADG2fnP78zPptjfgrKR
 0Q1OUezJwVcvH4hQyZNynD5KmcAOygBxX99kRijOL1P50zAuEXnXICltxuXroRndV0Sc
 rjnCHk1lZFRI3G8m7U5BEQuvURlcK8ddwJIaX/BNuOOH7/YsSZGSPHkBxSDlc0JvB0v0
 fNzg==
X-Gm-Message-State: AAQBX9cul84w0KM+pNJurx39UXG59YwQD2VoAbgigL0G9E0rnELQXt0a
 KQWmyLv2C/6laZVYJ2jzJxc=
X-Google-Smtp-Source: AKy350aKREyixrd574J1Nds3ygO/2+N2065vboOJnr/0cWupR57EAtGJs7/IpD2vODp74AGKQTzQ9w==
X-Received: by 2002:a17:906:70cb:b0:947:df9e:4082 with SMTP id
 g11-20020a17090670cb00b00947df9e4082mr7949781ejk.35.1682287603138; 
 Sun, 23 Apr 2023 15:06:43 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-183-111-058.77.183.pool.telefonica.de.
 [77.183.111.58]) by smtp.gmail.com with ESMTPSA id
 sb11-20020a170906edcb00b0094f7c1b6a94sm4908298ejb.11.2023.04.23.15.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 15:06:42 -0700 (PDT)
Date: Sun, 23 Apr 2023 22:06:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
Subject: Re: [PATCH 06/13] hw/ide: Extract bmdma_init_ops()
In-Reply-To: <29951829-1aee-5c7a-bf38-58e290afb706@linaro.org>
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-7-shentey@gmail.com>
 <29951829-1aee-5c7a-bf38-58e290afb706@linaro.org>
Message-ID: <7513C99D-7240-4B0D-A3FB-66CFB32B5A9E@gmail.com>
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



Am 23=2E April 2023 17:43:22 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <ph=
ilmd@linaro=2Eorg>:
>On 22/4/23 17:07, Bernhard Beschow wrote:
>> There are three private copies of bmdma_setup_bar() with small adaption=
s=2E
>> Consolidate them into one public implementation=2E
>>=20
>> While at it rename the function to bmdma_init_ops() to reflect that the=
 memory
>> regions being initialized represent BMDMA operations=2E The actual mapp=
ing as a
>> PCI BAR is still performed separately in each device=2E
>>=20
>> Note that the bmdma_bar attribute will be renamed in a separate commit=
=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   include/hw/ide/pci=2Eh |  1 +
>>   hw/ide/cmd646=2Ec      | 20 +-------------------
>>   hw/ide/pci=2Ec         | 16 ++++++++++++++++
>>   hw/ide/piix=2Ec        | 19 +------------------
>>   hw/ide/via=2Ec         | 19 +------------------
>>   5 files changed, 20 insertions(+), 55 deletions(-)
>
>Nice=2E
>
>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>

I'd rework this patch in the next iteration=2E I think that most of the me=
mory region initialization can be moved to pci_ide_init()=2E Unlike realize=
 methods, the nice thing about these instance_init() methods is that the pa=
rent implementation is called implicitly rather than being overridden by th=
e child implementation, similar to C++ constructors=2E This allows for code=
 reuse without much gymnastics=2E

Best regards,
Bernhard

