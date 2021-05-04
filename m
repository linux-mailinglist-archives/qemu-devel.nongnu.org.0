Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1483725E1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:38:43 +0200 (CEST)
Received: from localhost ([::1]:42926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldohe-000885-Nm
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:38:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0v-0006eG-Jd; Tue, 04 May 2021 01:54:34 -0400
Received: from ozlabs.org ([203.11.71.1]:46663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0t-00058w-VE; Tue, 04 May 2021 01:54:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CN5lCfz9t0Y; Tue,  4 May 2021 15:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107600;
 bh=OHhNrur6TQw1fecKrtW3azDhMVUz44PDqaV7D4I5q98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QTwiOQB8PW3d9XT+F0H1YidlMYNC0PMriLmVRaekE9uVmJMn6g4inr6IfIFyZyg1e
 wmLzMOtLZbqxTqqANfhox7aqdbhJ8asEgqyH+KqA8VShlwkt1IWu824IFtG40OU45W
 PzHkd8YWNf7yo/SP/baYIMQLseW4j4hBKH/z8rlk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 35/46] spapr.h: increase FDT_MAX_SIZE
Date: Tue,  4 May 2021 15:53:01 +1000
Message-Id: <20210504055312.306823-36-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Certain SMP topologies stress, e.g. 1 thread/core, 2048 cores and
1 socket, stress the current maximum size of the pSeries FDT:

Calling ibm,client-architecture-support...qemu-system-ppc64: error
creating device tree: (fdt_setprop(fdt, offset,
"ibm,processor-segment-sizes", segs, sizeof(segs))): FDT_ERR_NOSPACE

2048 is the default NR_CPUS value for the pSeries kernel. It's expected
that users will want QEMU to be able to handle this kind of
configuration.

Bumping FDT_MAX_SIZE to 2MB is enough for these setups to be created.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210408204049.221802-3-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 include/hw/ppc/spapr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 49a79fbf96..7f40a158f4 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -95,7 +95,7 @@ typedef enum {
 #define SPAPR_CAP_FIXED_CCD             0x03
 #define SPAPR_CAP_FIXED_NA              0x10 /* Lets leave a bit of a gap... */
 
-#define FDT_MAX_SIZE                    0x100000
+#define FDT_MAX_SIZE                    0x200000
 
 /*
  * NUMA related macros. MAX_DISTANCE_REF_POINTS was taken
-- 
2.31.1


