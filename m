Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C74D4B06D8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 08:16:26 +0100 (CET)
Received: from localhost ([::1]:56888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI3gm-0004js-PU
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 02:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3L0-0005ZK-LH; Thu, 10 Feb 2022 01:53:54 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42656
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nI3Ky-000491-Eo; Thu, 10 Feb 2022 01:53:53 -0500
Received: by mail-pf1-x42b.google.com with SMTP id i6so6684756pfc.9;
 Wed, 09 Feb 2022 22:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=riZs8u+nRa4BArWmeC0AINrsWtXC2wYI/9AhR7r1Ynk=;
 b=kQqhJ26Cm/gcfmxkraeUzMWSYofixOdprYFhMy8/Ha51IoEb6KMRAVllamXofhSpP0
 jHOJ8lS7+6+yjdJsQZ3mf+eRbqjpQe60EXalhjc5qnd5yiS/vOijW+17XVv3mORHz0L5
 8o4aqhIvTqwlNMRZcF8zlhX2mF6skCAkUT/L0V1swhOqSJxODWbYuon9wWTcxbO+OS9J
 XYYnmfD8ZC/kUdi/cYSQgZvgNXSbLpqMskYUNrEEUQaPtwOzeevl2Tnuw3wnF1Kvzh13
 SMPCIJncUiGxpOb+z04aKQqkG+ZhggmIaXEsCHadiohrWrciy3JY0Mp2lJFbMA8RoEmA
 NNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=riZs8u+nRa4BArWmeC0AINrsWtXC2wYI/9AhR7r1Ynk=;
 b=pF1E/wO2TN4Cq9XWWBGj74vP3c9qdr0FPDQLg23D9QJskTyhOYrrmtFQglY1YXEteb
 2Wg17nrYRx9mbQ7QAmYpqeuK/UzxP5GcU7cTkb/35nQn69RxxmqdrPalfhtu6UFUFhAq
 ao/qvstwG8xkACMC+4E8kEIMMPU9hf8a2mN13wJAAxGL0uogZe9iyLOy4UnM/IeyhzU/
 BmPKnX5ymS6Nz+hCfTJCV2FmLQItVIgjkAuK2DEplKxFKNPVh9HZJYOTW7cb11b78xVq
 01Qulm99ipz4Hcaa+x55XnrzZVmwwoMVDgsuAAyxVoU7kq9pOwkfs0oUOADdgzf8wwPf
 mPLg==
X-Gm-Message-State: AOAM5336Ie8ujzhAlTeUHOelUpZDAKlCLAsbMQYU75nhh7F4T0P4Yp6w
 Cc8ZiP6Vh87VkjGLmr02IFDu7ondNcQ=
X-Google-Smtp-Source: ABdhPJxDIrSk7ru93V7ejOJuTdUxX4NprKqni2cGI8rVRpitWzNsgHuXODoctcR7l7DC5+XiOd93kQ==
X-Received: by 2002:a63:81c3:: with SMTP id t186mr5057754pgd.271.1644476030609; 
 Wed, 09 Feb 2022 22:53:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (121-44-67-214.tpgi.com.au. [121.44.67.214])
 by smtp.gmail.com with ESMTPSA id mw14sm1147729pjb.6.2022.02.09.22.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 22:53:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 1/3] target/ppc: raise HV interrupts for partition table
 entry problems
Date: Thu, 10 Feb 2022 16:53:38 +1000
Message-Id: <20220210065340.1276367-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220210065340.1276367-1-npiggin@gmail.com>
References: <20220210065340.1276367-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These are an HV exception. Not 100% sure what HDSISR bits to set in case of
an empty table -- not sure what hardware does.

not-yet-Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mmu-radix64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 040c055bff..54fb3ce98d 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -560,13 +560,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
     } else {
         if (!ppc64_v3_get_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
-                ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
+                ppc_radix64_raise_hsi(cpu, access_type, eaddr, eaddr, DSISR_R_BADCONFIG);
             }
             return false;
         }
-- 
2.23.0


