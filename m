Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769891E3874
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 07:47:47 +0200 (CEST)
Received: from localhost ([::1]:34022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdouo-0001c1-H3
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 01:47:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdolp-0001KW-HC; Wed, 27 May 2020 01:38:29 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jdolo-0001g6-LM; Wed, 27 May 2020 01:38:29 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49X03r5Rszz9sTR; Wed, 27 May 2020 15:38:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1590557896;
 bh=ZdziwBbHkLdIQ4OII0MTdm9IDgKyNZtOw/B7Z808atI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ff/+s4g1xs+5tdo88LExNQWKrbQFuOVjX6t2Fvpkl3vsiN0fTmAoc5uB2PhrilhVq
 aKHzrXltHChI3YghCvpxI+bT3DqtMoT+elVygergxLdoEUKg1eZ8etWQaBARd3D1/2
 U8rsqkmoLFbBWpFJgjOkCN0882Xii5N31Tzxk0cc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/15] target/ppc: Fix argument to
 ppc_radix64_partition_scoped_xlate() again
Date: Wed, 27 May 2020 15:38:08 +1000
Message-Id: <20200527053809.356168-15-david@gibson.dropbear.id.au>
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
 qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The penultimate argument of function ppc_radix64_partition_scoped_xlate()
has the bool type.

Fixes: d04ea940c597 "target/ppc: Add support for Radix partition-scoped translation"
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <159051003729.407106.10610703877543955831.stgit@bahia.lan>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/mmu-radix64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 0d3922537c..c60bf31357 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -513,7 +513,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr, int rwx,
 
             ret = ppc_radix64_partition_scoped_xlate(cpu, rwx, eaddr, g_raddr,
                                                      pate, raddr, &prot, &psize,
-                                                     0, guest_visible);
+                                                     false, guest_visible);
             if (ret) {
                 return ret;
             }
-- 
2.26.2


