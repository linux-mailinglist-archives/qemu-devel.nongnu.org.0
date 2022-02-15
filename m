Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BA94B6195
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 04:23:40 +0100 (CET)
Received: from localhost ([::1]:50656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJoRH-0003Tx-Jv
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 22:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKn-0006bX-1n; Mon, 14 Feb 2022 22:16:57 -0500
Received: from [2607:f8b0:4864:20::62a] (port=33360
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nJoKl-0002e0-4j; Mon, 14 Feb 2022 22:16:56 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l9so10456283plg.0;
 Mon, 14 Feb 2022 19:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iW95jiWHq7hECOJI/obcQVaCPVlP+gNDbE+ofAMilUg=;
 b=VmS29VkIXJc4/v2zsG7WQgBLCgx5R9M/2bDJw+K0Flj6obI/p0ZbYujtmbtIQsv7n5
 I7jHax8oKno8U6N/mT0lbei080yrIV+KUFSYVrn73jXDd/FJkQltaDt5ZPdbc4iZI/io
 InfvzI4vMiTIofvl6xbdtkxuJ8fPmHfGDxWScvR38bwKt8i2L/seK2XNQo14y76sDMP4
 8bSP/QxOuYRb277xDH0JLNCBMyJRp8/Bw6O1VFlZF0O2WCdv7+pHH2V4e/o4jh/XY+gB
 i4rNV5Luj1yfnxSpaUC32Z1y08YZEnX/LfMc8c/IoDxRMQnbHdlC/9M49sd2q8yrHHsV
 LvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iW95jiWHq7hECOJI/obcQVaCPVlP+gNDbE+ofAMilUg=;
 b=3cmapXy3MR34PbOIXC3Nhe71NCP+eaN1ePY2FPoyNNIBk3ybeC5avOeqe/Vp3GdBC9
 UWWQVEBFbrD+LzeVaX+Gt/MlJI5f2D9KAs3/9kw3UwDph93ahPz8Qft7EEM+tqpIaNeI
 pwcMPDcSvRWS6WsZ1yXsyZ9pOlL6xsr4/loeFWQPmidewN9Ta3mWxXzXd+jZCUVZdBLL
 nITJJES7bFOkil60zdBdMzh89i771hEOWdrFP4YDiV4unq+j3wPZ79HG5lVkz3Wh6GCZ
 Dcx9WUNzk3drfsvs+b4Vw2m28YYsqIbc4CWz7tejpI4pJ2itKHd2pHrOqyYmeN/jx05L
 HSBA==
X-Gm-Message-State: AOAM531bUJIoY57JtpbwSY/1PRe5GP9g3Rqfovd/YX7AIV+aJzLbza6z
 HbNiaxPRScWG/WYjhj+IryqSXKKQM9I=
X-Google-Smtp-Source: ABdhPJxbQlQ1MuYX5ySkqBjW61rEmSMyqzvkniwYf5FgRVwCDS6+Sk/HO3XvTH4yr1WJS1/bCJpsCg==
X-Received: by 2002:a17:90a:306:: with SMTP id 6mr2046260pje.169.1644895013109; 
 Mon, 14 Feb 2022 19:16:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-33-251-132.static.tpgi.com.au.
 [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id f22sm38667399pfj.206.2022.02.14.19.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 19:16:52 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/9] target/ppc: raise HV interrupts for partition table entry
 problems
Date: Tue, 15 Feb 2022 13:16:34 +1000
Message-Id: <20220215031642.1691873-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220215031642.1691873-1-npiggin@gmail.com>
References: <20220215031642.1691873-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62a.google.com
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

Invalid or missing partition table entry exceptions should cause HV
interrupts. HDSISR is set to bad MMU config, which is consistent with
the ISA and experimentally matches what POWER9 generates.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/mmu-radix64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index d4e16bd7db..df2fec80ce 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -556,13 +556,13 @@ static bool ppc_radix64_xlate_impl(PowerPCCPU *cpu, vaddr eaddr,
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


