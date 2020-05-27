Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E6D1E3868
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 07:43:10 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdoqL-00027V-RQ
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 01:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdolm-0001Bn-Cg; Wed, 27 May 2020 01:38:26 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdoll-0001ee-GB; Wed, 27 May 2020 01:38:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49X03r1rXmz9sTG; Wed, 27 May 2020 15:38:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1590557896;
 bh=oFs/1DHUiY3Rm2+0DGzW6SZI/mjNmnW0jD38QyXReX0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BDHYPlJHL6YdXAuVUGRetEl/3ywJ8C15QF/MGSwA74acq2ATRB5U/dLFPZEtn2xoh
 VWuBdc8dgCYibQe/Yr/ZaS1zgwUmgARt36Uj2NgRbqqLj+kXvtk9t4BHmHaOH6Gs83
 CypiurfPlwuAOMDCP/OTwInbZE8zsQpzv/dYnF5s=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 10/15] target/ppc: Fix arguments to
 ppc_radix64_partition_scoped_xlate()
Date: Wed, 27 May 2020 15:38:04 +1000
Message-Id: <20200527053809.356168-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527053809.356168-1-david@gibson.dropbear.id.au>
References: <20200527053809.356168-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The last two arguments have the bool type. Also, we shouldn't raise an
exception when using gdbstub.

This was found while reading the code. Since it only affects the powernv
machine, I didn't dig further to find an actual bug.

Fixes: d04ea940c597 "target/ppc: Add support for Radix partition-scoped translation"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <158941063281.240484.9114539141307005992.stgit@bahia.lan>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-radix64.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index fb7dfe25ba..7ce37cb778 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -339,7 +339,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
          */
         ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_addr,
                                                  pate, &h_raddr, &h_prot,
-                                                 &h_page_size, 1, 1);
+                                                 &h_page_size, true,
+                                                 cause_excp);
         if (ret) {
             return ret;
         }
@@ -378,7 +379,8 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu, int rwx,
         do {
             ret = ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, pte_addr,
                                                      pate, &h_raddr, &h_prot,
-                                                     &h_page_size, 1, 1);
+                                                     &h_page_size, true,
+                                                     cause_excp);
             if (ret) {
                 return ret;
             }
-- 
2.26.2


