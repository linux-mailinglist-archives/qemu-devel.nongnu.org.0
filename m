Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63601510342
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:23:33 +0200 (CEST)
Received: from localhost ([::1]:42670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njNyO-0003CJ-8y
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfw-0006QZ-OQ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njNfu-0007np-JT
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:04:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id s21so11437551wrb.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kUC9tG6igzVEJirEgnCTOHV137FjKUwSoYb77+c6ZRw=;
 b=lNyrgsYtPfOsC/NPE8Tl6zMXHkfjDIf2zluXg+X/aFcl88cWjCcZq+Y4hSDMi5aIYB
 L7EdlCgNVN9/EJPLkwLQ7jZePx8sD8aprb45HLgGt3h4AeMe2j22N2O01KL+yR3Szpiu
 XmvsXW8fI4Ul7zJ07Gu75byBBfeuzx5faytLqOHZ5BYsgDRWb1pY74i9T0Xf294KN0/u
 2KpyMSGGiO6UBEl6TiPJU3iZqDArgDS3nrdZY796CXYIAHf7k/A52gljDFs2pckIyZGG
 25BH2I5ia1VBEsEeW44UC6MAR2gJNXvEmJeib1fFYOB6nGFYbXYq+NEZTuOdlju/HuTw
 FJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kUC9tG6igzVEJirEgnCTOHV137FjKUwSoYb77+c6ZRw=;
 b=euhOIRM17Kmu0w3he6COFScWKxL3q0tVNNLc/d+hWN/kYs+14qyknm+W4wRk0dQwzp
 wKx28wtR2TLKxMh8wUEp69677+Zp4wobOvuAG46cpKR9/Mnx+NagJDhAyxcTVLBVLY8L
 J6fabwLVopyfxqx7SDfRdh42gT4mRam3uhKG1NV2SBPFYs8jjp7nToMz3D5y3OYRIPFL
 ADY76oDukP3m8qvPIb6ccln5KE/ePUvM/hZi88CvxBv5+zXlvI/l6vQgJ+2t5bpjGNpo
 byO9CQyerpBcnOvG3zAu/XHbHpCN3TSGOTl/2nHJ2CHwP5CdW80DOe18eBx4bPLePxNj
 AM/A==
X-Gm-Message-State: AOAM530PurWu0ylRz6WGv5YO+gi8N1vBlCKJFCtbGajnvG/kxy883Z3W
 NmUUlEsPDZm6XmJmB1vr4jVgADV6yJ7cgg==
X-Google-Smtp-Source: ABdhPJz3uPCNlgU2iX6KQ64ZAzjYmmJIXwoERbNwCPgC5iN75L9mBOKkeR/eu0CBCq5u47YnYjQf4A==
X-Received: by 2002:a5d:4303:0:b0:207:a7d8:4ce6 with SMTP id
 h3-20020a5d4303000000b00207a7d84ce6mr19164757wrq.101.1650989065217; 
 Tue, 26 Apr 2022 09:04:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p26-20020adf959a000000b0020aca418f14sm13584777wrp.54.2022.04.26.09.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:04:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/arm: Advertise support for FEAT_TTL
Date: Tue, 26 Apr 2022 17:04:20 +0100
Message-Id: <20220426160422.2353158-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426160422.2353158-1-peter.maydell@linaro.org>
References: <20220426160422.2353158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm FEAT_TTL architectural feature allows the guest to provide an
optional hint in an AArch64 TLB invalidate operation about which
translation table level holds the leaf entry for the address being
invalidated.  QEMU's TLB implementation doesn't need that hint, and
we correctly ignore the (previously RES0) bits in TLB invalidate
operation values that are now used for the TTL field.  So we can
simply advertise support for it in our 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 520fd39071e..6ed2417f6fc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -54,6 +54,7 @@ the following architecture extensions:
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
 - FEAT_TLBIRANGE (TLB invalidate range instructions)
 - FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_TTL (Translation Table Level)
 - FEAT_TTST (Small translation tables)
 - FEAT_UAO (Unprivileged Access Override control)
 - FEAT_VHE (Virtualization Host Extensions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb44c05822c..ec2d159163f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -839,6 +839,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1


