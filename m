Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B47401C26
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:16:03 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNETe-0000Sp-O8
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP4-0000bG-NE
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:14 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNEP3-0007MQ-CE
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:11:14 -0400
Received: by mail-wr1-x432.google.com with SMTP id u16so9794326wrn.5
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=E4fXyTIjpI/LJXmVSN1LtWceHG5RM5rspcRAtTNtuAmgqvwPegPgnxpPH3AAZpO82Z
 R4KF0reTQsvIK3Ng9gmqjqI13CTGiVa9kIQbQlNenyKgL2WUO4gTQM0ijAyhhURYYh28
 vl10HMACgnOQNP+gM/EKlQHLO0NMivAomJLJ/U4LaYCrCv8c9Ig+rMmtaoX4ipL7+RR5
 dVJa/Xj4Mbg9C/F+YgpspdskvGkxUr5ctgqj11wcC7B49MwaJWFk60EVOMEwjuWxDQ+S
 EVAAjiLnBxL2JuMB/xsh7ga/jkOwrdfqCOLMnTW1qeTD3rab/Xybn1K/Mjk0ud474m6v
 wsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F257kBkfuJl6Q7MoJ0dNQEoRR26oeybWJUiYLakF928=;
 b=RYAK2kOz5jopJ1WDLcMWaNhIrJHocMGX70NQN65DGE+Cg8jScpQqqfIF9UI9vOuVnF
 SiFDgqwz8MOO9LAe8IV2xyPGGKd5/tPwHUCfbAmCswJTci+iFIpuXhAl2JdPjDoQKaY+
 D6Vc2vZ3jLhK62TACloSIC4XetsGsKOXeWV9avOshw+MGw3ltdTk0SqAeFcX3jkH0BKR
 8m9HOZ01nPWiYGc5FfCN4b3PErxc7rzj41tmG2qYbOJZ+Ofm9smz6h3BDiAzWUwZ1ems
 AiilVk3iJfIW1+UnCa11gQkkIjq4mUV/8zKI5oEyhmVP4SrS16RSWhTE2UIN3Tj+23Hv
 6X6Q==
X-Gm-Message-State: AOAM530OV47RnTBJTN4wzbVZK5HgWf3g4dbtMt/LLGuHLpFCTrETPIMp
 RsTQ+x2ZK4Cq00YxhSI82Z1pYMDVQYA=
X-Google-Smtp-Source: ABdhPJx7/76J+mLZGv7MRuFvO4jQUvBcLUy4pAbKHKvxyJeOOnLe5riGdQeYIYccWquBlUxLppVk6w==
X-Received: by 2002:adf:c14c:: with SMTP id w12mr13576649wre.115.1630933872095; 
 Mon, 06 Sep 2021 06:11:12 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k4sm7992331wrm.74.2021.09.06.06.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:11:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/36] target/i386: Added ignore TPR check in ctl_has_irq
Date: Mon,  6 Sep 2021 15:10:28 +0200
Message-Id: <20210906131059.55234-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906131059.55234-1-pbonzini@redhat.com>
References: <20210906131059.55234-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lara Lazier <laramglazier@gmail.com>

The APM2 states that if V_IGN_TPR is nonzero, the current
virtual interrupt ignores the (virtual) TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 4612dae1ac..a35b79548a 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -83,6 +83,11 @@ static inline bool ctl_has_irq(CPUX86State *env)
 
     int_prio = (env->int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
     tpr = env->int_ctl & V_TPR_MASK;
+
+    if (env->int_ctl & V_IGN_TPR_MASK) {
+        return env->int_ctl & V_IRQ_MASK;
+    }
+
     return (env->int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
 
-- 
2.31.1



