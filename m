Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F88566896A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 03:11:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG9WS-0007iC-Hk; Thu, 12 Jan 2023 21:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pG7vk-0000F9-Si
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 19:28:25 -0500
Received: from mailout2.w2.samsung.com ([211.189.100.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fan.ni@samsung.com>)
 id 1pG7vi-0008QK-22
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 19:28:24 -0500
Received: from uscas1p1.samsung.com (unknown [182.198.245.206])
 by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id
 20230113002757usoutp0204ba9a43543560b704b11ed97443aaba~5tsFB1Mhi1740517405usoutp02V;
 Fri, 13 Jan 2023 00:27:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com
 20230113002757usoutp0204ba9a43543560b704b11ed97443aaba~5tsFB1Mhi1740517405usoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1673569677;
 bh=oWqGJnJGLrQ5/0hamlu/ZPIWW/Y/lauwsfROf89DE3o=;
 h=From:To:CC:Subject:Date:References:From;
 b=WVKAHz/9J3Oxxjgg2mBEekDY8huSlY/Wdg4EqGCv6piZtIYc9H8pUdF1jfEkxglEU
 DFQXQWtraSvXZ+iZR6MRZCJbLybSvwM6vUH8Qa2frG0Y5tiNrZAxhoFqnOfKCfYVP5
 iLVp1ArFnvVfEW+xGiE+/9az4u+huFTxAITPH29s=
Received: from ussmges1new.samsung.com (u109.gpu85.samsung.co.kr
 [203.254.195.109]) by uscas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230113002757uscas1p18bf8ee4512339a860c8aafdae7abc2ea~5tsEluj9G1759417594uscas1p1F;
 Fri, 13 Jan 2023 00:27:57 +0000 (GMT)
Received: from uscas1p2.samsung.com ( [182.198.245.207]) by
 ussmges1new.samsung.com (USCPEMTA) with SMTP id AC.CE.26002.D85A0C36; Thu,
 12 Jan 2023 19:27:57 -0500 (EST)
Received: from ussmgxs3new.samsung.com (u92.gpu85.samsung.co.kr
 [203.254.195.92]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230113002756uscas1p2b602bff26576110407491f67eff5e065~5tsEFXtLt2472824728uscas1p2f;
 Fri, 13 Jan 2023 00:27:56 +0000 (GMT)
X-AuditID: cbfec36d-ec9fe70000026592-31-63c0a58d04b5
Received: from SSI-EX1.ssi.samsung.com ( [105.128.2.145]) by
 ussmgxs3new.samsung.com (USCPEXMTA) with SMTP id D9.11.07107.C85A0C36; Thu,
 12 Jan 2023 19:27:56 -0500 (EST)
Received: from SSI-EX2.ssi.samsung.com (105.128.2.227) by
 SSI-EX1.ssi.samsung.com (105.128.2.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.2375.24; Thu, 12 Jan 2023 16:27:55 -0800
Received: from SSI-EX2.ssi.samsung.com ([105.128.2.227]) by
 SSI-EX2.ssi.samsung.com ([105.128.2.227]) with mapi id 15.01.2375.024; Thu,
 12 Jan 2023 16:27:55 -0800
From: Fan Ni <fan.ni@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
 "alison.schofield@intel.com" <alison.schofield@intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>, Adam Manzanares
 <a.manzanares@samsung.com>, "bwidawsk@kernel.org" <bwidawsk@kernel.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>,
 "hchkuo@avery-design.com.tw" <hchkuo@avery-design.com.tw>,
 "cbrowy@avery-design.com" <cbrowy@avery-design.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, Fan Ni <fan.ni@samsung.com>
Subject: [RFC] cxl-host: Fix committed check for passthrough decoder
Thread-Topic: [RFC] cxl-host: Fix committed check for passthrough decoder
Thread-Index: AQHZJuXhSxTSwCcfWUCp6ChLVpTS/Q==
Date: Fri, 13 Jan 2023 00:27:55 +0000
Message-ID: <20230113002727.11411-1-fan.ni@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [105.128.2.176]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djX87q9Sw8kG3TdZbG4+/gCm0Xz5MWM
 Ft3nNzBarL65htGioekRi0XL7vdMFvufPmexWLXwGpvF+VmnWCyO9+5gceDyuDB5AqvH4gZX
 j5Yjb4GMPS+ZPDat6mTz2PjxP7vHk2ubmTymzq73+LxJLoAzissmJTUnsyy1SN8ugSvj/O3J
 LAVd/BUbb09lbmBcx9PFyMkhIWAiMaH3IyOILSSwklFi/eLMLkYuILuVSeLcx2vMMEVd+44y
 QSTWMkq83XeIEcL5xCjx/NhEZghnGaPErkWrmEBa2AQUJfZ1bWcDsUUEjCWOHV4CVsQssItF
 4uOMG2BzhQVcJNb93Q9V5CnRfOIaK4StJ7F0/2Wwo1gEVCXa570Fqufg4BUwl7g9JQYkzCgg
 JvH91BqwXcwC4hK3nsxngjhVUGLR7D1QZ4tJ/Nv1kA3CVpS4//0lO0S9nsSNqVPYIGxtiWUL
 X4PV8wL1npz5hAWiXlLi4IobLCA3Swg84JD4dWI7I8gNEkA3r/rrCFEjLTF9zWWo+mKJ0zNf
 MkPUNzBKrLtzgxUiYS2x8M96qEP5JP7+egQ1h1eio01oAqPSLCQvzEJy3iwk581Cct4CRpZV
 jOKlxcW56anFhnmp5XrFibnFpXnpesn5uZsYgYns9L/DuTsYd9z6qHeIkYmD8RCjBAezkgjv
 nqP7k4V4UxIrq1KL8uOLSnNSiw8xSnOwKInzdm+dnywkkJ5YkpqdmlqQWgSTZeLglGpgqmx+
 yecr658j+U3/dMaX03afWLqZs14k7bd1+ffOoDrIZeX3qA1X9YOiHe7OrnXLNZxgMSvvTPot
 4Qru6J96snsP5ynJL3/+PaXR6qvSee5vYgtXn61KNWCR4Nt00uetrYXlYRfTN1nzjavSzpyq
 rAj8MkcqVWS6RXzeSw3tww0v5hf9f9A05dWKM5d8WJyKHHNnv5l7f27d9VtC+0qnbQnnCj2y
 z/7aDSXJ6M3Zy4PEVr/s6PbSPldtYSztXzPtYPK8Hhs5V7XQ40n3NWdtdNJ64Pt+hVjbpiM2
 pZzHzZ/E9k2RNLwY8fvi2rnM6/gWreC4VN3FuPv15fSlVcucvhkzfjbZ9GXF/uQnE7pXKrEU
 ZyQaajEXFScCAPW+t4HTAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRmVeSWpSXmKPExsWS2cA0Ubdn6YFkg3fHlS3uPr7AZtE8eTGj
 Rff5DYwWq2+uYbRoaHrEYtGy+z2Txf6nz1ksVi28xmZxftYpFovjvTtYHLg8LkyewOqxuMHV
 o+XIWyBjz0smj02rOtk8Nn78z+7x5NpmJo+ps+s9Pm+SC+CM4rJJSc3JLEst0rdL4Mo4f3sy
 S0EXf8XG21OZGxjX8XQxcnJICJhIdO07ygRiCwmsZpQ4vy20i5ELyP7EKLG3+z0ThLOMUeLM
 5t1sIFVsAooS+7q2g9kiAsYSxw4vYQYpYhbYxSLxccYNZpCEsICLxLq/+6GKPCWaT1xjhbD1
 JJbuv8wIYrMIqEq0z3sLVM/BwStgLnF7SgxImFFATOL7qTVgFzELiEvcejKfCeJSAYkle84z
 Q9iiEi8f/2OFsBUl7n9/yQ5RrydxY+oUNghbW2LZwtdg9bwCghInZz5hgaiXlDi44gbLBEbR
 WUhWzELSPgtJ+ywk7QsYWVYxipcWF+emVxQb56WW6xUn5haX5qXrJefnbmIERu/pf4djdjDe
 u/VR7xAjEwfjIUYJDmYlEd49R/cnC/GmJFZWpRblxxeV5qQWH2KU5mBREuf1iJ0YLySQnliS
 mp2aWpBaBJNl4uCUamBSnjn1JPeSd68WC23f9Knpnvn1sv+ZC13u3zFKue9//mhzutyHpE96
 MnFcfCtcRDseC4pHzL/ieSs7gvMml1DHaSOtnMtLmFmc+rQKz+ZdLbY2kZo9bcn50mmMe0/Y
 T+WNabOWNlpZEROr/Lo6MNTkwVSx5Zu3PD5a7fu+eyOv0oM9quK1IWslpp9bbfPit/u77ZPi
 7FdHbVhva3BAvO3yF4/8q9uXiXjpyUmqiuaGhzv3ySXe9l7LH7Li773mLX5L87RC+xivehdL
 Npw6t/0X7x+VqcdeL5SskKxmPVbbYst1duqdE5m+K4TKrnx4pre2cburmnHfrqqPdl6Orqdd
 p9n/4/m9Y1Lp94tNz6KUWIozEg21mIuKEwGkApMOTQMAAA==
X-CMS-MailID: 20230113002756uscas1p2b602bff26576110407491f67eff5e065
CMS-TYPE: 301P
X-CMS-RootMailID: 20230113002756uscas1p2b602bff26576110407491f67eff5e065
References: <CGME20230113002756uscas1p2b602bff26576110407491f67eff5e065@uscas1p2.samsung.com>
Received-SPF: pass client-ip=211.189.100.12; envelope-from=fan.ni@samsung.com;
 helo=mailout2.w2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Jan 2023 21:10:18 -0500
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

For passthrough decoder (a decoder hosted by a cxl component with only
one downstream port), its cache_mem_registers field COMMITTED
(see spec 2.0 8.2.5.12 - CXL HDM Decoder Capability Structure) will not
be set by the current Linux CXL driver. Without the fix, for a cxl
topology setup with a single HB and single root port, the memdev read/write
requests cannot be passed to the device successfully as the function
cxl_hdm_find_target will fail the decoder COMMITTED check and return
directly, which causes read/write not being directed to cxl type3 device.

Before the fix, a segfault is observed when trying using cxl memory for
htop command through 'numactl --membind' after converting cxl memory
into normal RAM.

Detailed steps to reproduce the issue with the cxl setup where there is
only one HB and a memdev is directly attached to the only root port of
the HB are listed as below,
1. cxl create-region region0
2. ndctl create-namespace -m dax -r region0
3. daxctl reconfigure-device --mode=3Dsystem-ram --no-online dax0.0
4. daxctl online-memory dax0.0
5. numactl --membind=3D1 htop

Signed-off-by: Fan Ni <fan.ni@samsung.com>
---
 hw/cxl/cxl-host.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 1adf61231a..5ca0d6fd8f 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -107,8 +107,11 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, h=
waddr addr,
     uint32_t target_idx;
=20
     ctrl =3D cache_mem[R_CXL_HDM_DECODER0_CTRL];
-    if (!FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
-        return false;
+
+    /* skip the check for passthrough decoder */
+	if (FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMIT)
+		&& !FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, COMMITTED)) {
+		return false;
     }
=20
     ig_enc =3D FIELD_EX32(ctrl, CXL_HDM_DECODER0_CTRL, IG);
--=20
2.25.1

