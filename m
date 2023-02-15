Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99196982FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:15:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMHx-0000CJ-5j; Wed, 15 Feb 2023 13:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSMHt-0000B6-Hg; Wed, 15 Feb 2023 13:13:49 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pSMHq-0002kb-Ma; Wed, 15 Feb 2023 13:13:49 -0500
Received: by mail-ed1-x533.google.com with SMTP id dz21so12117504edb.13;
 Wed, 15 Feb 2023 10:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zVZKSbuua+zY3wiIvLS//kMOM0sbOFZmHmUQwZvINd8=;
 b=qMArlGlQlQt6bJhEch4COl6FAU/pdRwLiwftWhl9svRrm5t+KZzBaLR+z9eqE4zEsX
 k6OVltrUy7OhbAzpQxKXSrhhXeFfcoc4VoOFV1ROkW3Az3uPql9EA1QdPmivaAVfIGlp
 bH1IfwzVMp40h61UfSBMqnw44UtkgdPPoYb6Z2IFkxKIXx9rwKM05uhytVEsUJafMUH2
 amb99bVBmJMGZUgbawgMaCuMP2TnSGpv+dn2YOxlBOYGRTGY0bPvLpevZVMR2nKzCXzz
 T3Hw+j3Df5OTrTqepX9BExXZV/po1BvTh4OU0b2m3UyHykkQbdyzCAj9mQlyLuRR9Xgh
 URjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zVZKSbuua+zY3wiIvLS//kMOM0sbOFZmHmUQwZvINd8=;
 b=1kbq6nVGBEPe+jg4X+XxkVG13UxHnuzOXqWt+frf98HNy8oK3Tgn8KuNzcSidlqO19
 +eBnULC6Ue0Vd1GQ5kT3kZMJCCcXHMCJRLyBszQHXIgtrqRPYVagBCMwOukN2YhBn12I
 jf+EH6XHD78T2/DN2UJZApB46FFzAmyjooj2FgWO6Se+FQ6B5UKSg6hhOY8+ma7i1Jmb
 RAm+Q72rcyOEcys3EN6ZPTAS0vNiiVwOevTOYMnwFlOoJI1TYxzcOe+GPb7xmkIBWMoB
 u0LkIaIkMFFuZHoQW9WSCy2YnC4yl1kj+jP03DEvTE5cwsrwIMMOXuiRpgDSo3zXC2Wf
 DgVg==
X-Gm-Message-State: AO0yUKUsQItKsKU0vSlnOhel2bKwPkVo8vstqz44u/TC9uiMLfUdQZY+
 +c872YkhvUDzTFX78Ry566o=
X-Google-Smtp-Source: AK7set8QAQhfvMtMC0lTpkC0sIg3CAozxyckQvPFFovxfNwY301RVt8GbABPg1RRM9MYztYljsG8Zw==
X-Received: by 2002:aa7:d90e:0:b0:4a2:5f73:d3d2 with SMTP id
 a14-20020aa7d90e000000b004a25f73d3d2mr2754919edr.41.1676484824797; 
 Wed, 15 Feb 2023 10:13:44 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-243-024.77.183.pool.telefonica.de.
 [77.183.243.24]) by smtp.gmail.com with ESMTPSA id
 t16-20020a508d50000000b004acbe66e653sm5964585edt.84.2023.02.15.10.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 10:13:44 -0800 (PST)
Date: Wed, 15 Feb 2023 18:13:36 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 17/20] hw/ide/pci: Unexport bmdma_active_if()
In-Reply-To: <20230215112712.23110-18-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-18-philmd@linaro.org>
Message-ID: <AF8AE36D-4C5E-465D-A416-B854707166D7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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



Am 15=2E Februar 2023 11:27:09 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>From: Bernhard Beschow <shentey@gmail=2Ecom>
>
>The function is only used inside ide/pci=2Ec, so doesn't need to be expor=
ted=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/ide/pci=2Ec         | 6 ++++++
> include/hw/ide/pci=2Eh | 6 ------
> 2 files changed, 6 insertions(+), 6 deletions(-)
>
>diff --git a/hw/ide/pci=2Ec b/hw/ide/pci=2Ec
>index 2ddcb49b27=2E=2Efc9224bbc9 100644
>--- a/hw/ide/pci=2Ec
>+++ b/hw/ide/pci=2Ec
>@@ -104,6 +104,12 @@ const MemoryRegionOps pci_ide_data_le_ops =3D {
>     =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
> };
>=20
>+static IDEState *bmdma_active_if(BMDMAState *bmdma)
>+{
>+    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>+    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>+}
>+
> static void bmdma_start_dma(const IDEDMA *dma, IDEState *s,
>                             BlockCompletionFunc *dma_cb)
> {
>diff --git a/include/hw/ide/pci=2Eh b/include/hw/ide/pci=2Eh
>index 2a6284acac=2E=2E7b5e3f6e1c 100644
>--- a/include/hw/ide/pci=2Eh
>+++ b/include/hw/ide/pci=2Eh
>@@ -55,12 +55,6 @@ struct PCIIDEState {
>     MemoryRegion data_bar[2];
> };
>=20
>-static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
>-{
>-    assert(bmdma->bus->retry_unit !=3D (uint8_t)-1);
>-    return bmdma->bus->ifs + bmdma->bus->retry_unit;
>-}
>-
> void bmdma_init(IDEBus *bus, BMDMAState *bm, PCIIDEState *d);
> void bmdma_cmd_writeb(BMDMAState *bm, uint32_t val);
> extern MemoryRegionOps bmdma_addr_ioport_ops;

Cool, where did you find this? ;)

This patch, your other patches doing s/ide/ide_bus/, and the fact that IDE=
Bus instantiates two IDE devices itself make me wonder whether the IDE devi=
ces should really be instantiated in the usual QOM way=2E Then perhaps it c=
ould turn out that all the s/ide/ide_bus/ patches aren't really needed sinc=
e the functions could operate on the IDE device directly=2E Not sure though=
=2E=2E=2E

This might all be a rabbit hole, but since you already started looking int=
o it=2E=2E=2E ;)

Best regards,
Bernhard

