Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059F65F27C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTqY-0002YC-0r; Thu, 05 Jan 2023 12:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDTqH-0002SZ-J4; Thu, 05 Jan 2023 12:15:50 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDTqF-0000t8-2x; Thu, 05 Jan 2023 12:15:48 -0500
Received: by mail-ej1-x62c.google.com with SMTP id u9so91707173ejo.0;
 Thu, 05 Jan 2023 09:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZs7UUjpetRr1s9Jz0w6mpzHTXCOezbgi1FvQTDI7c4=;
 b=cfl3BvrQPcz1W1+6ekbag5xh1/2HpYfCmcuDDSiyi5KIBOzq8ZHcvX1TAJepMB/WZC
 zcFyXyVAkV/8d+/fz4/8258cBE6apXOP72NK86UqVR5GNk1274nyC97qiuqW3yGh88lF
 od+aF9wyB4vGXKYDU0rcpwhRp9hXP6aFyQ9fecLhXhBshieLrwDWbARqccy6BdHPb+Cv
 VRMVekO4IX/5Gkl/SWaqTJoXwFbiCrLyitvS9ma0PyFCLHmRWIGpzyXl/DhSkHW89rhy
 yxCe05d4IeZaXQ4Cn0cuVZq4rDzQSAjdZQly8helh4DsuthF6rT1QNtP/z1a2qC3rISz
 LSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZs7UUjpetRr1s9Jz0w6mpzHTXCOezbgi1FvQTDI7c4=;
 b=D0U5y9OP/iqleR03EulwoWd39aA3EHI8fBvLPmlzJMCEuDm++kekOLQNjWA6Zk5sij
 3iB8Bts98acT3HZq/UXb1PKHkNdQDLVh/aza6940309QjBdOGiWQYDirbCx8MFdwdCnz
 7PbyDwFc8gu/JhXq63AZRD11tZO/6+FHkt2jYMMgXNWMmSCA30FdxVh4WLfatyvk7DCe
 Mm7w5U4KHMH91zBYg5kMr5JEKrNOHoldql9pBTphvq77y0ymXsbr9mwCvxz1BbaiEF1f
 sZLW/h87BsWWfwIrsoNuG39Rk45EFNYQo5XUEfS7/gQPvCRurL+wRt21yjc078EG2yp1
 WCkA==
X-Gm-Message-State: AFqh2kqwWm7t2RdQyw9K/rZbVgc0wHrPZ3URt5Q0PqvX5cS/I0O6MwFy
 QSKVjbccNi1T2MrUloEL17T9+q+nrE64aA==
X-Google-Smtp-Source: AMrXdXvyIRnh/QtU8ymzv70+/ceRJFrodW1plSb0FPuLMDmr4oj9WihOpB7eux8CX06XOPHFnrABoA==
X-Received: by 2002:a17:907:6e16:b0:7c0:9f6f:6d8 with SMTP id
 sd22-20020a1709076e1600b007c09f6f06d8mr58129899ejc.2.1672938943131; 
 Thu, 05 Jan 2023 09:15:43 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200dd01067508562054.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:dd01:675:856:2054])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a1709061db100b0084c70c27407sm11161811ejh.84.2023.01.05.09.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:15:42 -0800 (PST)
Date: Thu, 05 Jan 2023 17:15:39 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-ppc@nongnu.org
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_2/7=5D_mac=5F=7Bold=2Cnew=7Dworld=3A_Use_?=
 =?US-ASCII?Q?local_variable_instead_of_qdev=5Fget=5Fmachine=28=29?=
In-Reply-To: <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <719299533b89aa4516966065eae05c75744f50d3.1672868854.git.balaton@eik.bme.hu>
Message-ID: <FC3BAA27-9C6D-4104-99B7-043BFEC6A963@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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



Am 4=2E Januar 2023 21:59:37 UTC schrieb BALATON Zoltan <balaton@eik=2Ebme=
=2Ehu>:
>We already have machine in a local variable so no need to use
>qdev_get_machine(), also remove now unneded line break=2E
>
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>---
> hw/ppc/mac_newworld=2Ec | 3 +--
> hw/ppc/mac_oldworld=2Ec | 3 +--
> 2 files changed, 2 insertions(+), 4 deletions(-)
>
>diff --git a/hw/ppc/mac_newworld=2Ec b/hw/ppc/mac_newworld=2Ec
>index 601ea518f8=2E=2E460c14b5e3 100644
>--- a/hw/ppc/mac_newworld=2Ec
>+++ b/hw/ppc/mac_newworld=2Ec
>@@ -466,8 +466,7 @@ static void ppc_core99_init(MachineState *machine)
>     fw_cfg =3D FW_CFG(dev);
>     qdev_prop_set_uint32(dev, "data_width", 1);
>     qdev_prop_set_bit(dev, "dma_enabled", false);
>-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
>-                              OBJECT(fw_cfg));
>+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cf=
g));
>     s =3D SYS_BUS_DEVICE(dev);
>     sysbus_realize_and_unref(s, &error_fatal);
>     sysbus_mmio_map(s, 0, CFG_ADDR);
>diff --git a/hw/ppc/mac_oldworld=2Ec b/hw/ppc/mac_oldworld=2Ec
>index 558c639202=2E=2E5a7b25a4a8 100644
>--- a/hw/ppc/mac_oldworld=2Ec
>+++ b/hw/ppc/mac_oldworld=2Ec
>@@ -303,8 +303,7 @@ static void ppc_heathrow_init(MachineState *machine)
>     fw_cfg =3D FW_CFG(dev);
>     qdev_prop_set_uint32(dev, "data_width", 1);
>     qdev_prop_set_bit(dev, "dma_enabled", false);
>-    object_property_add_child(OBJECT(qdev_get_machine()), TYPE_FW_CFG,
>-                              OBJECT(fw_cfg));
>+    object_property_add_child(OBJECT(machine), TYPE_FW_CFG, OBJECT(fw_cf=
g));
>     s =3D SYS_BUS_DEVICE(dev);
>     sysbus_realize_and_unref(s, &error_fatal);
>     sysbus_mmio_map(s, 0, CFG_ADDR);

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

