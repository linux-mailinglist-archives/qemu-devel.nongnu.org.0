Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918493F2DDF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:20:22 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5Nd-00024r-K7
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jp-000561-4B
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:25 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1mH5Jl-0000qn-75
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:16:24 -0400
Received: by mail-wm1-x32e.google.com with SMTP id f10so6067304wml.2
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrrokDPajS6nMF2KbWHnqmO0OBFdFaecOU4LdS0Cd44=;
 b=fNjGOwne/fC+bcnQ/i4nmkhEsBl/y/hbWGUAsA55kcEFob7JQZbAf7+ka2WrjnaRU1
 UBB18MsS5uD9hX5wrt4AIld6Gmre1WEu3xeEQvx7Vq5HrNDQYS67gWb9SZ4Yz04r6P73
 UTVOoUDEgmf5JtthdZ56v4lYTDXafq7IP3B9Rjxyvm72eOG7hJk7wsIM8FA2g8SDrBiu
 5HABD1JgGVgRlEEkjw48imlwS5PxMX5lGC/Hq2k/cG0TlruUHdqFTkU2icgD47xQhAuk
 y3+2AESsI6hq6ac2GvRj8kWgh1MUAU1G3dVgkE1aSap71z4mtti0duhqfdBUMbVpJ2+X
 dBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrrokDPajS6nMF2KbWHnqmO0OBFdFaecOU4LdS0Cd44=;
 b=roIKphxfa1I8BTe296lYHPOA0/w1oi2aycnj0988pjw0Likip1iNBoMMhYifBTYBpY
 KmNW30km1eJpMAbYi7BWm8GJwrVMD4/L5QuIjl175NsZmpw152AzaR/uG9oxDKp7S5Sp
 vinRKyPwmVgohnx6nQOwvWFw8jfb/aXc5wA+HmvQVhlCp6nJGn0CsouncQi787gSPH8e
 eLnOzu/B/S4lBaHA1lSPAtmOuiiHpEtf39OU9z803ybb1YzPCi87CQCUrH30CKEb+7ja
 ZVkxgTWPDLLTZNiEONd594L4xYkGA/88GYVqAzkLjaSshzbpECHxRzzfHIO8yawLC69d
 A0Dg==
X-Gm-Message-State: AOAM533L1/bkTNjPV+EBAwVdE4jbTn1WtMi3DKgQ01NyR5PZag02PTwV
 UBYCzCI6eBDX3cTIOe+YTD+n/fxcI4/QxQ==
X-Google-Smtp-Source: ABdhPJxZ5Bm/dGai6KuzW/c4QoycwcsHjChcfDMfmygp+k0zkl4ic7TxclDpFIArcOntxYeIhZnH7A==
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr4187118wmk.38.1629468979941; 
 Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
Received: from laral.fritz.box
 (dslb-088-066-221-248.088.066.pools.vodafone-ip.de. [88.66.221.248])
 by smtp.gmail.com with ESMTPSA id a133sm10578968wme.5.2021.08.20.07.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 07:16:19 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] target/i386: Added ignore TPR check in ctl_has_irq
Date: Fri, 20 Aug 2021 16:15:57 +0200
Message-Id: <20210820141558.9031-4-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820141558.9031-1-laramglazier@gmail.com>
References: <20210820141558.9031-1-laramglazier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=laramglazier@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The APM2 states that if V_IGN_TPR is nonzero, the current
virtual interrupt ignores the (virtual) TPR.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 2c44bdb243..cbd3f086c4 100644
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
2.25.1


