Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD55083C8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:43:18 +0200 (CEST)
Received: from localhost ([::1]:39542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5vh-00071c-E8
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh5eK-0004z2-HF; Wed, 20 Apr 2022 04:25:21 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:48516 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d.tihov@yadro.com>)
 id 1nh5eI-0003wk-9A; Wed, 20 Apr 2022 04:25:20 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 957DC45969;
 Wed, 20 Apr 2022 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-disposition:content-type
 :content-type:mime-version:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1650443113;
 x=1652257514; bh=hX7e17X0QPT1iJanzJp1JNPqZEw6zAiVo//E8oyg2hQ=; b=
 noLhZ33//3mI5m4ALUAu1wybcN9fNZyAArjaa2yuaUAWZK4Dq/LFgkIo6M0KD4mu
 1Zn6s14/TxHS4Hs4GIZOhp3ygqwQ+yYtyQxgtxjMlySVhrHbhfI5MxYaylpEbRxj
 2x1E3O2uEDrv2ut5lKVynaqqwSkDMQ60RmwkkwtjpsQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Avucj6lNQGN; Wed, 20 Apr 2022 11:25:13 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2D66341459;
 Wed, 20 Apr 2022 11:25:13 +0300 (MSK)
Received: from localhost.localdomain (10.178.113.54) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 20 Apr 2022 11:21:20 +0300
Date: Wed, 20 Apr 2022 11:20:44 +0300
From: Dmitry Tikhov <d.tihov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/nvme: add new command abort case
Message-ID: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.178.113.54]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=d.tihov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kbusch@kernel.org, its@irrelevant.dk, ddtikhov@gmail.com,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMe command set specification for end-to-end data protection formatted
namespace states:

    o If the Reference Tag Check bit of the PRCHK field is set to ‘1’ and
      the namespace is formatted for Type 3 protection, then the
      controller:
          ▪ should not compare the protection Information Reference Tag
            field to the computed reference tag; and
          ▪ may ignore the ILBRT and EILBRT fields. If a command is
            aborted as a result of the Reference Tag Check bit of the
            PRCHK field being set to ‘1’, then that command should be
            aborted with a status code of Invalid Protection Information,
            but may be aborted with a status code of Invalid Field in
            Command.

Currently qemu compares reftag in the nvme_dif_prchk function whenever
Reference Tag Check bit is set in the command. For type 3 namespaces
however, caller of nvme_dif_prchk - nvme_dif_check does not increment
reftag for each subsequent logical block. That way commands incorporating
more than one logical block for type 3 formatted namespaces with reftag
check bit set, always fail with End-to-end Reference Tag Check Error.
Comply with spec by handling case of set Reference Tag Check
bit in the type 3 formatted namespace.

Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
---
 hw/nvme/dif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvme/dif.c b/hw/nvme/dif.c
index 62d885f83e..63c44c86ab 100644
--- a/hw/nvme/dif.c
+++ b/hw/nvme/dif.c
@@ -26,6 +26,11 @@ uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint8_t prinfo, uint64_t slba,
         return NVME_INVALID_PROT_INFO | NVME_DNR;
     }
 
+    if ((NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) == NVME_ID_NS_DPS_TYPE_3) &&
+        (prinfo & NVME_PRINFO_PRCHK_REF)) {
+        return NVME_INVALID_PROT_INFO;
+    }
+
     return NVME_SUCCESS;
 }
 
-- 
2.35.1


