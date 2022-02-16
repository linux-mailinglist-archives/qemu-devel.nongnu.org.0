Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD04B8E5C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:41:25 +0100 (CET)
Received: from localhost ([::1]:48904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNMq-0006ky-Nx
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:41:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7R-0002mJ-1G; Wed, 16 Feb 2022 11:25:29 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:29122
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nKN7O-0001YV-Qs; Wed, 16 Feb 2022 11:25:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21GGA9CH012698; 
 Wed, 16 Feb 2022 16:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=iwjGWVYse1rciRIgMPIDZyZNMILlYkWifTcLa/y4Owg=;
 b=pft1PKB6QG2XdCEr01L1K4Qt9iJ6nAAYo9HOKzeV1yy57HE7tYl4J/sDj+pzK3HXK4Uq
 drkuP0c7sl2+eGzHFw8LvwpHGr+7kZn+oOkt8fkFVah7z4SgJbS70/M3QI7GDJcim06k
 eqq4pqw8FfXVLuTrpynkqW+LmCTKaUC17zDdl2mqgQz/wCzwZrKI8kmLWikDRCgPR9k9
 iiwgpTsZ8jlLywQqj10kx9195zQxq0jpteVEXWUsUD/4usY/hNeRhkYGX8BVAg6fGIAq
 qnQHHx3oaEQXrxI9ZLns5l/U/W2jUIc+I83fF0MMLc+qV1GbK62ETD8poTWoPCno7DMi Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e944t8ss0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:21 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21GGB0gW015426;
 Wed, 16 Feb 2022 16:25:21 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e944t8srm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:20 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21GGCj9w020841;
 Wed, 16 Feb 2022 16:25:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3e91f6e9jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 16:25:19 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21GGPI0k26870038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 16:25:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6472278077;
 Wed, 16 Feb 2022 16:25:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0ADE078069;
 Wed, 16 Feb 2022 16:25:17 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.144.50])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 16:25:16 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/27] target/ppc: Rename spr_tcg.h to spr_common.h
Date: Wed, 16 Feb 2022 13:24:22 -0300
Message-Id: <20220216162426.1885923-24-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216162426.1885923-1-farosas@linux.ibm.com>
References: <20220216162426.1885923-1-farosas@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xoe7D0w3Uo9huMOgnJwnJCazyTleieoK
X-Proofpoint-ORIG-GUID: vFaTHzU_NiKKNkU2h-rrGhnVTHxFeR4T
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-16_07,2022-02-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=977
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Initial intent for the spr_tcg header was to expose the spr_read|write
callbacks that are only used by TCG code. However, although these
routines are TCG-specific, the KVM code needs access to env->sprs
which creation is currently coupled to the callback registration.

We are probably not going to decouple SPR creation and TCG callback
registration any time soon, so let's rename the header to spr_common
to accomodate the register_*_sprs functions that will be moved out of
cpu_init.c in the following patches.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c                  | 2 +-
 target/ppc/{spr_tcg.h => spr_common.h} | 4 ++--
 target/ppc/translate.c                 | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename target/ppc/{spr_tcg.h => spr_common.h} (99%)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index adb23019ef..17f12aceb6 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -44,7 +44,7 @@
 
 #include "helper_regs.h"
 #include "internal.h"
-#include "spr_tcg.h"
+#include "spr_common.h"
 #include "power8-pmu.h"
 
 /* #define PPC_DEBUG_SPR */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_common.h
similarity index 99%
rename from target/ppc/spr_tcg.h
rename to target/ppc/spr_common.h
index df2abacc64..5aec76ade4 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_common.h
@@ -16,8 +16,8 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef SPR_TCG_H
-#define SPR_TCG_H
+#ifndef SPR_COMMON_H
+#define SPR_COMMON_H
 
 #define SPR_NOACCESS (&spr_noaccess)
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 2eaffd432a..ecc5a104e0 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -35,7 +35,7 @@
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
-#include "spr_tcg.h"
+#include "spr_common.h"
 
 #include "qemu/qemu-print.h"
 #include "qapi/error.h"
-- 
2.34.1


