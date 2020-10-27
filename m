Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2BF29B28D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 15:42:48 +0100 (CET)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXQBT-0006Yi-88
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 10:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnc-0002B7-Ok; Tue, 27 Oct 2020 10:18:08 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43919 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kXPnW-0007b1-Lv; Tue, 27 Oct 2020 10:18:08 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CLDLp048dz9shp; Wed, 28 Oct 2020 01:17:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1603808274;
 bh=JgI74JbmF3SG28/ezvWrAwsZY8OPwhZsfHfAwmDCvoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gvVV/Ti+nIiA7/AvN+omg1WfDyt8GglRF4QEmLMsu16v379ByqyARRMV39pX0hb0d
 OnggVqYhE8OlVbzetHCbAiZLddnWJ8Azn6lNWkIDUysi74oAAaOgl2HTQTuMpUedGe
 0dpV3v9+7MGR9wUZy0J6lE3kKvVvmgR8T+fDMFgk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 11/18] spapr: Use appropriate getter for PC_DIMM_ADDR_PROP
Date: Wed, 28 Oct 2020 01:17:28 +1100
Message-Id: <20201027141735.728821-12-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027141735.728821-1-david@gibson.dropbear.id.au>
References: <20201027141735.728821-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 10:17:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

The PC_DIMM_ADDR_PROP property is defined as:

    DEFINE_PROP_UINT64(PC_DIMM_ADDR_PROP, PCDIMMDevice, addr, 0),

Use object_property_get_uint() instead of object_property_get_int().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160309729609.2739814.4996614957953215591.stgit@bahia.lan>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 05abf6cc57..b2405599ad 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3571,8 +3571,8 @@ static SpaprDimmState *spapr_recover_pending_dimm_state(SpaprMachineState *ms,
     uint64_t addr_start, addr;
     int i;
 
-    addr_start = object_property_get_int(OBJECT(dimm), PC_DIMM_ADDR_PROP,
-                                         &error_abort);
+    addr_start = object_property_get_uint(OBJECT(dimm), PC_DIMM_ADDR_PROP,
+                                          &error_abort);
 
     addr = addr_start;
     for (i = 0; i < nr_lmbs; i++) {
-- 
2.26.2


