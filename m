Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559672B5256
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:19:23 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keky9-00088T-6g
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1keksa-0002jh-JB
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:13:36 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jrtc27@jrtc27.com>) id 1keksY-0008Bl-St
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:13:36 -0500
Received: by mail-wr1-x442.google.com with SMTP id j7so20199113wrp.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 12:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69gd4UN+z86xHk+RMAE90GOrIog9CrBV8/hHw9xYkTg=;
 b=WzruLyA9WWaWInrZAKheBmzCCPJZ2S7H5CPk0qRESdE1PCCKV+7hES0U8E7E+SaTML
 bmstiNAQNmBhHEt9w4sZ1bJvmsOj577b1jihCOZ0YuYzpBWnkGQuygBtenOaPLrXfdod
 sT3ApR+/jc+I/WKi6cWzprw9GLFiEvvMWh8K53WmCK6+PDSBkvnSNO7I1LzeuBRfKQz8
 mjCPFXblQwc/iDIeFsZqD+YbG7ZNTuRPiWzsHAH7JtpEPpTlsSYStcRTjreq+ipF5F7b
 SQawhL/QcT2hacVybKWSLNpHduHO7RGumeaPDZKSyGr5AUDy8Al4P9AkwKYd33MbX6z+
 cyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=69gd4UN+z86xHk+RMAE90GOrIog9CrBV8/hHw9xYkTg=;
 b=D5w74aD0zYYi794FNP33r0URDEmsKa3fcSiwUENQbrL9cRKJZ/g921Vpwqnnyt2Koa
 NPX/oVtXjgLAELJkbBjVfLIR2ZGr4kSDPdw8yWz/q1ez7h2gXYjb8821qgMofaSwxg8H
 JgXyFZ6E9npoQc2YTNU2o9FxaAtVCF7eu/gPtRytQRQ+//eX8LG+aa1Cg+9sNi8OxJOk
 fPbwjl1nM8jLNy3JsvFLX6Lc0gzQgpa0asjwmzR5dtTelD/StiaOxZuAbm15XywDDvoY
 zhXphMg6GwzzPSrhQz3pjNoRo0NClKfKrgZLJBf5DDyf3enRWOvl0MxJj00g3Mo9/H2f
 EQnQ==
X-Gm-Message-State: AOAM532d29LrcIh0Hs+ZG6NbzCy48AYN4hcb8y2Ck3yG7vSF7oEu3Mgx
 ITmR0olg5NnZY9+FoBZ+6qpGqA==
X-Google-Smtp-Source: ABdhPJyAOKUbK2wVcSCIMK2RKztI7B0CQcwWv3kFv1zVsCobRKzXSrw5a8BCOpuC58Vk/IA5lsWKMA==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr22234175wrt.66.1605557612456; 
 Mon, 16 Nov 2020 12:13:32 -0800 (PST)
Received: from Jessicas-MacBook.local (trinity-students-nat.trin.cam.ac.uk.
 [131.111.193.104])
 by smtp.gmail.com with ESMTPSA id u203sm468594wme.32.2020.11.16.12.13.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Nov 2020 12:13:31 -0800 (PST)
Received: by Jessicas-MacBook.local (Postfix, from userid 501)
 id 8D59720985F670; Mon, 16 Nov 2020 20:13:31 +0000 (GMT)
From: Jessica Clarke <jrtc27@jrtc27.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: Fix value of MMU_PAGE_NX and add MMU_PAGE_RS
Date: Mon, 16 Nov 2020 20:13:22 +0000
Message-Id: <20201116201322.29262-1-jrtc27@jrtc27.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=jrtc27@jrtc27.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jessica Clarke <jrtc27@jrtc27.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are meant to correspond to the error code reported for #PF, so fix
the definition for Instruction Fetch faults and add one for Reserved Bit
faults (checking for that is currently a TODO in x86_mmu.c).

Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
---
 target/i386/hvf/x86_mmu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h
index cd6e137e79..710adb82b5 100644
--- a/target/i386/hvf/x86_mmu.h
+++ b/target/i386/hvf/x86_mmu.h
@@ -34,7 +34,8 @@
 #define MMU_PAGE_PT             (1 << 0)
 #define MMU_PAGE_WT             (1 << 1)
 #define MMU_PAGE_US             (1 << 2)
-#define MMU_PAGE_NX             (1 << 3)
+#define MMU_PAGE_RS             (1 << 3)
+#define MMU_PAGE_NX             (1 << 4)
 
 bool mmu_gva_to_gpa(struct CPUState *cpu, target_ulong gva, uint64_t *gpa);
 
-- 
2.28.0


