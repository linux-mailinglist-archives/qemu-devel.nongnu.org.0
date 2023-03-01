Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBA36A67B8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 07:50:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGHS-0007o0-N6; Wed, 01 Mar 2023 01:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXGHC-0007nK-K0; Wed, 01 Mar 2023 01:49:24 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pXGH3-000164-Mn; Wed, 01 Mar 2023 01:49:19 -0500
Received: by mail-ed1-x52d.google.com with SMTP id i34so49708157eda.7;
 Tue, 28 Feb 2023 22:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677653352;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gR1g9fu7EmJ0v8S6vl6vcrhzA34p1EuNGvvEylw4iCA=;
 b=HwDxkxv1lzPeRB0oBc8N4pXBtMtR6P6HhQoF8EM5Zwb4teZqpZpnjgmwRf2k0bwR0Y
 eWQTlOVdyur7le9c6+JqMo9eEVBnvBr6w7hooohDxbbMTO3WAjbjjPhgXiA86rbdtueZ
 lUeBwnfBNs4e5jrerhyUN441jQf6W0M7iVa2iDLHOW071diEs6IQbHi85tAmWrT3KdjZ
 LUaHg79N/QjpKe4S/UCwFa198wM721VjnintrFM9dHtVgeKv+vfMsw7DTYitdbBNILgD
 4KVPTGTYk2qBM+qtEC44PMQb4x3VEzEi0hm56jE3iJpFGdlImE3bK0KlT0Ia/NjscbIp
 CuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677653352;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gR1g9fu7EmJ0v8S6vl6vcrhzA34p1EuNGvvEylw4iCA=;
 b=ogOyd1f67Pdqd8hyMNcwSkCEr8xOs2Vx72nNXOHDs35IhmlGLf/9CQrvgCBEJTPhpE
 S8UcbmFG1NLb+NA598s4ORsfvMQMb8+GGtCRzCc500/3lXutNAJQxUKImqTVR08P+UXO
 lNlE87p3nWrKusXwbDbd7G/S3N60NWa4xnmoXz+hz7rER5fSBFKs9u76D/jP5c2lOHEw
 oLnbmomQGRfQWyDfAGOpvg6HsLB245Ch7JldKvgtufP3RxH66smZ62vH9XJBp5oCgvPF
 jNT3KT2UOYB0WcPJ4q0W3whWUcuDtCbscvgLlN+tH61lqBxU2MPOQHyDQHFxmqKyDcbO
 MGcQ==
X-Gm-Message-State: AO0yUKUiX9qyTOz6WU0Gr2u45ONei07TUOgl5rJC1k7WSh4uAHaYL83w
 pymAVzx+eO3gGXw5OEVCMos=
X-Google-Smtp-Source: AK7set/8SdYekDDEqJBPF7mUE3oq15RffDd9h1cg0feCHKeAburbjcj4Diy/qfn/J24iuSObTvkrlw==
X-Received: by 2002:a17:906:1751:b0:8aa:bf4e:7b2c with SMTP id
 d17-20020a170906175100b008aabf4e7b2cmr4883008eje.21.1677653351802; 
 Tue, 28 Feb 2023 22:49:11 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-154-055.78.54.pool.telefonica.de.
 [78.54.154.55]) by smtp.gmail.com with ESMTPSA id
 w2-20020a17090649c200b008c16025b318sm5393785ejv.155.2023.02.28.22.49.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 22:49:11 -0800 (PST)
Date: Wed, 01 Mar 2023 06:49:01 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
CC: Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 ReneEngel80@emailn.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_5/7=5D_hw/isa/vt82c686=3A_Work_arou?=
 =?US-ASCII?Q?nd_missing_level_sensitive_irq_in_i8259_model?=
In-Reply-To: <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
References: <cover.1677628524.git.balaton@eik.bme.hu>
 <cd0b323bb88df202e36014f950c0eb13a9fafd54.1677628524.git.balaton@eik.bme.hu>
Message-ID: <CC88085A-C269-4BCF-8CFD-EB3B457533C9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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



Am 1=2E M=C3=A4rz 2023 00:17:11 UTC schrieb BALATON Zoltan <balaton@eik=2E=
bme=2Ehu>:
>MorphOS sets the ISA PIC to level sensitive mode but QEMU does not
>support that so this causes a freeze if multiple devices try to raise
>a shared interrupt=2E Work around it by lowering the interrupt before
>raising it again if it is already raised=2E This could be reverted when
>the i8259 model is fixed=2E
>
>Signed-off-by: BALATON Zoltan <balaton@eik=2Ebme=2Ehu>
>---
> hw/isa/vt82c686=2Ec | 9 +++++++++
> 1 file changed, 9 insertions(+)
>
>diff --git a/hw/isa/vt82c686=2Ec b/hw/isa/vt82c686=2Ec
>index 018a119964=2E=2E3e44a51f92 100644
>--- a/hw/isa/vt82c686=2Ec
>+++ b/hw/isa/vt82c686=2Ec
>@@ -549,6 +549,7 @@ struct ViaISAState {
>     PCIDevice dev;
>     qemu_irq cpu_intr;
>     qemu_irq *isa_irqs_in;
>+    uint16_t isa_irqs_state;
>     ViaSuperIOState via_sio;
>     MC146818RtcState rtc;
>     PCIIDEState ide;
>@@ -636,6 +637,14 @@ static void via_isa_set_pci_irq(void *opaque, int ir=
q_num, int level)
>             pic_level |=3D pci_bus_get_irq_level(bus, i);
>         }
>     }
>+    /* FIXME: workaround for i8259: level sensitive irq not supported */
>+    if ((s->isa_irqs_state & BIT(pic_irq)) && pic_level) {
>+        qemu_irq_lower(s->isa_irqs_in[pic_irq]);
>+    } else if (pic_level) {
>+        s->isa_irqs_state |=3D BIT(pic_irq);
>+    } else {
>+        s->isa_irqs_state &=3D ~BIT(pic_irq);
>+    }

Let's not clutter the device model with workarounds which quickly snowball=
 into unmaintainable code=2E Please fix the i8259 instead=2E

>     /* Now we change the pic irq level according to the via irq mappings=
=2E */
>     qemu_set_irq(s->isa_irqs_in[pic_irq], pic_level);
> }

