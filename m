Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5963ABE7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 16:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozfeT-00073I-NA; Mon, 28 Nov 2022 10:02:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfeK-00071F-LI
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:28 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gourry.memverge@gmail.com>)
 id 1ozfeG-0005Wr-4v
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 10:02:24 -0500
Received: by mail-pl1-x642.google.com with SMTP id io19so10392373plb.8
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hD3JWskx463z8JLKarnN8tJtF+i70g6BGCNjkOyahI=;
 b=aXYnzYSZrLZKItaqQyR5woQt+TE7/y0NZh4x/MgPSW90slZ2gnJHnS5PbBUeuCuHR6
 cEahuQcB+M7aHUWsx1M3m50JSTWiM9jyLEoJUasYexM/SocLWfL18BdjjPyfD/Shy1bJ
 PYG7f5XSh4OAldtXFcZMOmUKma/RRRyU5QlKypoqnohBlFCTBbsEYwoJ7cl8Bdaxrpm7
 U1Be+gDNPXUp0Ii086rhLwghEFWv6qruQJFarQAP6tl8TvPc2QKQSvU8tQw00QRnhTIM
 Xw408bD6f9cewGXf3/GN3mVFfUAwCqrUXhqruIQjDGIcu2Mw2Z/cZPSTWscp6HVZDG3t
 Ki9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9hD3JWskx463z8JLKarnN8tJtF+i70g6BGCNjkOyahI=;
 b=TDc+MkbHbuwbC1QWmIE1fIjn3R3e4WLBIiECR4SbS3O28FfIGLJG32ebWbzM13bBLd
 AQSaeplollaJvCR3x7AxYekqqpCc4KDX/5cXFVV8TuHol1NAQo4DIoPul46a7jfHb/fl
 DOmw0TQbjgqd9NLW2khssoWeBWIBK7Rqn9GvNZLpLUH5G5nCqPGGjP6gUlve8/vL0XQE
 43yTK8Exq+iWUCsBPUV+NZgMc6c0SKqVoO57uOCL1gxcsFN7KTYw99lEm18XUNaw+pOB
 gMEyVKV2cSuyMNcUNyG8jUH5xU68s9gsrXONXkIMn25ZwAPZKzywfNuaQbYI8Y0EhIZA
 KLOg==
X-Gm-Message-State: ANoB5pnoY818Rv795sb2dIHoh6HlJQnGO+DwxVvD1Nw/qAPRfU8f+RXX
 PZ4pE2DmZzYdmMHnkMyoga5B06/tB+3L
X-Google-Smtp-Source: AA0mqf6B3/pu1D4l032e2H/NZQ1mxQcgQM/ErlQ5eHxB64Xt+pSrylggyBAyHN9G/tKGaC6u0Zp7FA==
X-Received: by 2002:a17:902:ec04:b0:189:8c37:6f17 with SMTP id
 l4-20020a170902ec0400b001898c376f17mr5111507pld.67.1669647737577; 
 Mon, 28 Nov 2022 07:02:17 -0800 (PST)
Received: from fedora.mshome.net ([104.184.156.161])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ecc900b001886ff82680sm8997928plh.127.2022.11.28.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 07:02:17 -0800 (PST)
From: Gregory Price <gourry.memverge@gmail.com>
X-Google-Original-From: Gregory Price <gregory.price@memverge.com>
To: qemu-devel@nongnu.org
Cc: jonathan.cameron@huawei.com, linux-cxl@vger.kernel.org,
 alison.schofield@intel.com, dave@stgolabs.net, a.manzanares@samsung.com,
 bwidawsk@kernel.org, gregory.price@memverge.com,
 hchkuo@avery-design.com.tw, cbrowy@avery-design.com, ira.weiny@intel.com
Subject: [RFC v4 2/3] tests/qtest/cxl-test: whitespace, line ending cleanup
Date: Mon, 28 Nov 2022 10:01:56 -0500
Message-Id: <20221128150157.97724-3-gregory.price@memverge.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221128150157.97724-1-gregory.price@memverge.com>
References: <20221128150157.97724-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=gourry.memverge@gmail.com; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Defines are starting to exceed line length limits, align them for
cleanliness before making modifications.

Signed-off-by: Gregory Price <gregory.price@memverge.com>

---
 tests/qtest/cxl-test.c | 99 +++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 45 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index c54f18e76b..e59ba22387 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -8,55 +8,64 @@
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 
-#define QEMU_PXB_CMD "-machine q35,cxl=on " \
-                     "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                     "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
-
-#define QEMU_2PXB_CMD "-machine q35,cxl=on "                            \
-                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
-                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
-
-#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
-                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
-                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
-                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
-
-#define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
+#define QEMU_PXB_CMD \
+  "-machine q35,cxl=on " \
+  "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+  "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.size=4G "
+
+#define QEMU_2PXB_CMD \
+  "-machine q35,cxl=on " \
+  "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+  "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
+ "- M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
+
+#define QEMU_VIRT_2PXB_CMD \
+  "-machine virt,cxl=on " \
+  "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+  "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
+  "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
+
+#define QEMU_RP \
+  "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
 
 /* Dual ports on first pxb */
-#define QEMU_2RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
-                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 "
+#define QEMU_2RP \
+  "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+  "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 "
 
 /* Dual ports on each of the pxb instances */
-#define QEMU_4RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
-                 "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 " \
-                 "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
-                 "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
-
-#define QEMU_T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
-                 "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                 "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
-
-#define QEMU_2T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
-                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 "
-
-#define QEMU_4T3D "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
-                  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
-                  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 " \
-                  "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa2,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2,id=cxl-pmem2 " \
-                  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M "    \
-                  "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M "    \
-                  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
+#define QEMU_4RP \
+  "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 " \
+  "-device cxl-rp,id=rp1,bus=cxl.0,chassis=0,slot=1 " \
+  "-device cxl-rp,id=rp2,bus=cxl.1,chassis=0,slot=2 " \
+  "-device cxl-rp,id=rp3,bus=cxl.1,chassis=0,slot=3 "
+
+#define QEMU_T3D \
+  "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M "    \
+  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 "
+
+#define QEMU_2T3D \
+  "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 "
+
+#define QEMU_4T3D \
+  "-object memory-backend-file,id=cxl-mem0,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa0,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp0,memdev=cxl-mem0,lsa=lsa0,id=cxl-pmem0 " \
+  "-object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa1,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1,id=cxl-pmem1 " \
+  "-object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa2,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2,id=cxl-pmem2 " \
+  "-object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M " \
+  "-object memory-backend-file,id=lsa3,mem-path=%s,size=256M " \
+  "-device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3,id=cxl-pmem3 "
 
 static void cxl_basic_hb(void)
 {
-- 
2.37.3


