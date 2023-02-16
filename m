Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AD6699ADE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:13:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShnW-0000gJ-37; Thu, 16 Feb 2023 12:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnU-0000dE-R4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShnS-0007sY-V0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id o15so2520346wrc.9
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XVRtdPWy6SO/+ib4dr2eJvk7NAPUzEubpNbchybnbuU=;
 b=P2VxbLaosfCf1ciXxTbdEXDxtGbVReKmF58y+bRoIHDTkKoOKK/h1nOrWP6gMjil9S
 SELZG2uF2HL4LhGv9XWgilwQCFcoHjoD0Pl+0C/NHaZZ5dRqZu2MaovVSegM8wB3ZnQ/
 lbCL2t5flQZhs5di4GCMZUxz2/Vs+svSOOOCsaG4rm9vYQEMBKliuoM3dq5ZVzGDvurW
 lnMPeAGFaP1UBYtSm/MiLINdp7W/v7IEPTjtmxy7/+HU9DppwGAaF7EfM2KChylr5RxK
 mWLdvFf9xqeqnO83CtKQi+eC9Li7too11kdlQ/AL9KJVAD3lnUImhtitTpGXFllhgFZJ
 8/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVRtdPWy6SO/+ib4dr2eJvk7NAPUzEubpNbchybnbuU=;
 b=nHQH6Te/IwZBG95iiPLloPHkuDq6yx5GnZ0nxt5z9MOxSpcSfcSyOxa/7+2DgPAEWO
 Vn0T8HuYDxVvIADX58T0LJ87Xio6LQytXuGwIFhc2GPo2JaleqZ3vU2eX5vQC6IKJBJt
 gplrFLy4pWn/CU5tsHpcI1pCmMGBldH3etJOI6bbSaJ11OvjNxgQLpr+mA8KDz7wCrm3
 km8h167qlQg93fHLNU/oLH5imBZ+NbIyuho+bBrUK0/ZfxTtuwUKwRKC7AUfHw8gtnP+
 89wBawNmKpyDXAifZ0s+cXZGTey+mMlesjEBDJSu1zcg7+ArC73hujTrPpu0R7Xvw+6I
 qLMg==
X-Gm-Message-State: AO0yUKXFeybQlpkSxDx/aEONoeO5M+1B9+BK/JaZdJmQVOFzCwnNwRS6
 gXfABGhsP02PBvMw4VmjWZRmdd8wlfb2uMdN
X-Google-Smtp-Source: AK7set+/seRN9IpQ+GZOlm+Df85F2En9TdX88UpFgkwU402PUdXFhbUf05JunGmuH8E9QV2SNw9aaQ==
X-Received: by 2002:a5d:6486:0:b0:2c5:519f:307a with SMTP id
 o6-20020a5d6486000000b002c5519f307amr2844105wri.30.1676567510137; 
 Thu, 16 Feb 2023 09:11:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] target/arm: Use "max" as default cpu for the virt
 machine with KVM
Date: Thu, 16 Feb 2023 17:11:21 +0000
Message-Id: <20230216171123.2518285-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Fabiano Rosas <farosas@suse.de>

Now that the cortex-a15 is under CONFIG_TCG, use as default CPU for a
KVM-only build the 'max' cpu.

Note that we cannot use 'host' here because the qtests can run without
any other accelerator (than qtest) and 'host' depends on KVM being
enabled.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 8d13e4486b1..ac626b3bef7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3013,7 +3013,11 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->minimum_page_bits = 12;
     mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
+#ifdef CONFIG_TCG
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
+#else
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("max");
+#endif
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
     assert(!mc->get_hotplug_handler);
-- 
2.34.1


