Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2FB4B61B2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:33:41 +0100 (CET)
Received: from localhost ([::1]:37816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoay-0005gz-CF
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoL0-0006yW-Qr; Mon, 14 Feb 2022 22:17:10 -0500
Received: from [2607:f8b0:4864:20::429] (port=41963
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKy-0002gW-VW; Mon, 14 Feb 2022 22:17:10 -0500
Received: by mail-pf1-x429.google.com with SMTP id c10so6992638pfv.8;
 Mon, 14 Feb 2022 19:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UP/NifnjtG03ztW6os0y7Mr2ny8ELcbFp0l1fTD7QdY=;
 b=Xi0JIRfkNeX3SE95A5AZxmExSs0A01whsulZN0TEBtzDxY4etJJXNqzoeeAZ5AkY7f
 Zqsg4ycN9B8RiOWs1jg5xMTjHcD1VOLoLv9u9TqUTfhfXLNPsjJzOR8DakXua7NfVuCj
 omekAhJswp0Whv13rwuLfU+1bG/cxkH9pJDb8AsyN3LI/QLgvUYwghQEaObvMwf+kIXB
 cCi6+EnXZTiPboYjnvbXxH55DF2ZN4E3GO0NPIHqDwuNizRD1rLRcKl1ZZQ2JS2bIiCr
 U0gJ+M4Xf3ouFlNqZa4qxV3gVEO1Th+9qSWzHFmb0tv1uOXipb+l72Uy7l4+NNgP1old
 6DsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UP/NifnjtG03ztW6os0y7Mr2ny8ELcbFp0l1fTD7QdY=;
 b=fn3kiBCt6UrcL//vEBRtvJD9Wfb8P8lCWO3H8fDOjdCKJvbVhCAEhXinYgFufTqgWx
 fc3qxXU3q4iuwfJfG6DYCczEP7qUAyzF/YJPex7fakLrWRWIOqxfGrbwd7s6EszrySQJ
 m9F8wju/8woGG/mU7VDmK3y3yeH6G6RZ0s54J3YPlX0LqHbznjZlOkNhxwt12fKNu/Z5
 BqyGJA2BE973NCa7l/p7kE6kW07e9rB5L7+VASoPam5WGxSUwm20Md5eHycU6Y9YsD4X
 hONVvoblEmsAs2g0W15J2OOhIutY43Muimb481xIh1vt+50o/9sVfCZ7LLj3NXbfofW2
 Hmdw==
X-Gm-Message-State: AOAM530OUKBKPXuR+wnRQWGVVLU/gHM/W4cB2dRUAsuL/3hbtC3hXhkD
 Rb6bVlMMPeOrQQv+ANo9aivcZpGXmtc=
X-Google-Smtp-Source: ABdhPJwatsd9WK7QZruriOJy2qXRBRj4PYLTFEKAl5/a5Vy3CKbiNlWsK42iuxjv6SeHRW+474p68w==
X-Received: by 2002:a63:2b84:: with SMTP id r126mr1802914pgr.71.1644895027269; 
 Mon, 14 Feb 2022 19:17:07 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:17:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 6/9] target/ppc: add helper for books vhyp hypercall handler
Date: Tue, 15 Feb 2022 13:16:39 +1000
Message-Id: <20220215031642.1691873-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtual hypervisor currently always intercepts and handles
hypercalls but with a future change this will not always be the case.

Add a helper for the test so the logic is abstracted from the mechanism.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/excp_helper.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fcc83a7701..6b6ec71bc2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1278,6 +1278,18 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 }
 
 #ifdef TARGET_PPC64
+/*
+ * When running under vhyp, hcalls are always intercepted and sent to the
+ * vhc->hypercall handler.
+ */
+static bool books_vhyp_handles_hcall(PowerPCCPU *cpu)
+{
+    if (cpu->vhyp) {
+        return true;
+    }
+    return false;
+}
+
 static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 {
     CPUState *cs = CPU(cpu);
@@ -1439,7 +1451,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         env->nip += 4;
 
         /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
+        if ((lev == 1) && books_vhyp_handles_hcall(cpu)) {
             PPCVirtualHypervisorClass *vhc =
                 PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
             vhc->hypercall(cpu->vhyp, cpu);
-- 
2.23.0


