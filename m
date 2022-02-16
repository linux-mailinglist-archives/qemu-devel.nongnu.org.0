Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2334B82C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:17:36 +0100 (CET)
Received: from localhost ([::1]:50790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFVH-0004dj-Cz
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDyW-0000Tp-U9; Wed, 16 Feb 2022 01:39:41 -0500
Received: from [2607:f8b0:4864:20::102d] (port=46997
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nKDyJ-0008OC-LW; Wed, 16 Feb 2022 01:39:38 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso1506609pjh.5; 
 Tue, 15 Feb 2022 22:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=faPwK3xKd/s3q84AwnCEXfzjSCVe11WPt79jOJyox+4=;
 b=bnbp6BjTF4M/fB/rnqBsS+OatSTGD9/3uTKmdKKxKRopE2XprYh8hFv1woj0asV/Gs
 TWSczvc5FsOG5jhd5xTF5Xeyq2sUB6h7Xy7SRAKlgq5xWdZUBlkw0lE/FQfgMcFDayUU
 BPnlatgfppAVsoeXIhcVF4NZTcWhYRKyDXvZ3dYKCW5EKzgJ8UCrlA/JhjeFXBh6Tw/A
 bNr4ujIOS7bWB/kcqkrDIdQ8TvWnUElhR80lCQWtatYDvxQF0+FvPMw2ssrmoPEBl9xQ
 5riebPZZVFRwzOSN45HUnOnSYRf9pBXf5kbay77wmyU37WLwDdLRHTl3Md3uBlxqMzHk
 0Zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faPwK3xKd/s3q84AwnCEXfzjSCVe11WPt79jOJyox+4=;
 b=mCQXrFHKINElGqwf9ywNgOHhQJi08xUXD4BAboxHmzv1GjdHQOtPedYrFU6nqE6KIc
 Mf+tAw2VdVLiPmE3vy41F4GVk6hyRiL/M7QsEVnJ02pwwROYQdOCOru78f8TESS0cMut
 BH9ju/e+3bzDTCIJ3iHVpITlRXPUEIGcw0Q+HqoklHwHV3GljVr/jhLESF44cta4SRlQ
 R0WUbS9Mv2vHXrL59W221xLYjGaM+IJ8BYssrWvzpJAMIoQcnNES8aP1opjth966SBSm
 9fxmg9vTgG78sHeR4oJNT+XWNiW72YBscVn4lLGHxFmXEGjK8fS6MMidIUNkZIi6U7KX
 t/yw==
X-Gm-Message-State: AOAM531HO6e7Q7PW+ncg3l9BVse7NL4CafPZmjtH1C93UrvgJ3ttXUxe
 qkb8eyBusoNo78eUvix7nk1jBoKS8GY=
X-Google-Smtp-Source: ABdhPJxMO2kqiK6cD7BoCnwQdse4hkLMYPEE0durClPqjBhR/U/+HHGckdeeSzJUtCIFu+7LT1JxBw==
X-Received: by 2002:a17:90b:4d86:b0:1b9:d5fe:b30 with SMTP id
 oj6-20020a17090b4d8600b001b9d5fe0b30mr146705pjb.142.1644993557263; 
 Tue, 15 Feb 2022 22:39:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-140-189.static.tpgi.com.au.
 [60.241.140.189])
 by smtp.gmail.com with ESMTPSA id dw20sm18379814pjb.3.2022.02.15.22.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 22:39:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 3/3] target/ppc/kvm: Use KVM_CAP_PPC_AIL_MODE_3 to
 determine cap-ail-mode-3 support
Date: Wed, 16 Feb 2022 16:39:03 +1000
Message-Id: <20220216063903.1782281-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220216063903.1782281-1-npiggin@gmail.com>
References: <20220216063903.1782281-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use KVM_CAP_PPC_AIL_MODE_3 to determine cap-ail-mode-3 support for KVM
guests. Keep the fallback heuristic for KVM hosts that pre-date this
CAP.

This is only proposed the KVM CAP has not yet been allocated. I will
ask to merge the new KVM cap when there are no objections on the QEMU
side.

not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1: 
- Remove incorrect test for unsupported cap query. Add comment instead.

 linux-headers/linux/kvm.h |  1 +
 target/ppc/kvm.c          | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 02c5e7b7bb..d91f578200 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1130,6 +1130,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_PPC_AIL_MODE_3 210
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 1338c41f8f..7f71f78253 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -90,6 +90,7 @@ static int cap_ppc_nested_kvm_hv;
 static int cap_large_decr;
 static int cap_fwnmi;
 static int cap_rpt_invalidate;
+static int cap_ail_mode_3;
 
 static uint32_t debug_inst_opcode;
 
@@ -154,6 +155,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
+    cap_ail_mode_3 = kvm_vm_check_extension(s, KVM_CAP_PPC_AIL_MODE_3);
     kvm_ppc_register_host_cpu_type();
 
     return 0;
@@ -2567,6 +2569,17 @@ bool kvmppc_supports_ail_3(void)
 {
     PowerPCCPUClass *pcc = kvm_ppc_get_host_cpu_class();
 
+    if (cap_ail_mode_3) {
+        return 1;
+    }
+
+    /*
+     * cap-ail-mode-3 is disabled, but it may be because the KVM host pre-dates
+     * the cap. Special-case the test because the performance cost for
+     * disabling the feature unconditionally is prohibitive until updated
+     * KVM is widely in use.
+     */
+
     /*
      * KVM PR only supports AIL-0
      */
@@ -2589,6 +2602,11 @@ bool kvmppc_supports_ail_3(void)
         return 0;
     }
 
+    /*
+     * Beyond ISA v3.1 (POWER10), this could return 0, because all KVM
+     * implementations for such hosts would support the cap.
+     */
+
     return 1;
 }
 
-- 
2.23.0


