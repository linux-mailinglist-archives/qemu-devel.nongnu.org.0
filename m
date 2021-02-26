Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF0325BE1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:21:53 +0100 (CET)
Received: from localhost ([::1]:48086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFThQ-0007Fw-R1
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:21:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf3-0005Q0-GA
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:25 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTf2-0000QC-1l
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:19:25 -0500
Received: by mail-pj1-x102f.google.com with SMTP id b15so5190719pjb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NII2+lFi6KYqcRFLS2WasLZwq+NpesJfgYTuWrRGis0=;
 b=DChMboaNX0woDfYbRSWEphcr6FYjiyAE1BAhefLn/hczUJDo5q/GD+SSeK8grmzmKx
 K8FFOi8Pc0WNRc0Si3A5jt8HHqyH0m9HLtl5/ii8kDm+BFftR4B51Qhx+US7rOgTgN0X
 cQAwhMT7hWik/jN5p7JRoMSvEnC1+1rK9rZdSw6PoAgF+YQL0Wan2pHexCVX7ih1ZX/K
 vpAq/koagF4e/mr3FXrBVftyLHmWTTmusoc9qU4onSc46HQWJ3tkuiqKtWhjcuzUhbe0
 fiFY/w1k5+sRXRmzeW6vDyJKOtvl5WH+5lYutWTGUOpK4iFJKD8Lhk6ycYp5UHRFv+IT
 RKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NII2+lFi6KYqcRFLS2WasLZwq+NpesJfgYTuWrRGis0=;
 b=I6/kB1LZ+G7hhfQbvmBkrn6bfc2o0i8pZlR47L37ucQdTk7GIoIvnChlmAF2mJurxQ
 b6kfW5tZEme/pWpsk7VOw2RgD/Y9lhI3xOJRVvxyiaIP2mZ2EoNFKEkerhVDgIEK6Q3k
 VuwOE72vR1ugMGygNhxRJZzXhNSPhGxJCBbCR/he00azehDgnOmiZf3vPP4WLNhX86Nm
 +YF/3iyCYH8XYxPzS+7cqseQ+9cUrdFTvAEChfycfsX7Rw3Rm5vpVg5BnkaUhNF00fDH
 YdMQypE/GGXBRlCJPqkHriQLTO1+tjO5dG3TowRFiAVBxmq01GPrOzt65qGl+y6liEeH
 jfdg==
X-Gm-Message-State: AOAM533qTMFtrRizNScBG9ASEUdWPSsc11LgiCkRzcWfbWt9ajc/F49o
 ECoxdZ8OxY0s70CInnGrN7RIgXsepGK0xA==
X-Google-Smtp-Source: ABdhPJzISPXEKYl6/ZpzYhQdaD6tcSWDuDULqaRAcAtcywlqhqomejeP5g3z4T+tiyxyIJgc4PXuZg==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr1017175plh.38.1614309562531; 
 Thu, 25 Feb 2021 19:19:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:19:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 04/75] target/riscv: rvv-1.0: add sstatus VS field
Date: Fri, 26 Feb 2021 11:17:48 +0800
Message-Id: <20210226031902.23656-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index ba4c1c7076f..73e88c2a7b1 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -414,6 +414,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_PUM         0x00040000 /* until: priv-1.9.1 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 778d5b85e92..098de1abacb 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -440,7 +440,7 @@ static const target_ulong delegable_excps =
     (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
 static const target_ulong vsip_writable_mask = MIP_VSSIP;
-- 
2.17.1


