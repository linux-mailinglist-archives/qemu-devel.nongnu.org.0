Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307954910A4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:29:30 +0100 (CET)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Xh2-0001rH-MG
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXY-0003Mi-UW; Mon, 17 Jan 2022 14:19:40 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:9696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n9XXX-0002A9-D6; Mon, 17 Jan 2022 14:19:40 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20HHC3Yd025475; 
 Mon, 17 Jan 2022 19:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nCqNncOpCV8isaaMyMjkEGzMytgebPhbWJI0EhNZtEw=;
 b=s7VkaKGg+dxx7FnxYoNqnVuQm/e6W/sGe/J1yNH5Ihv8wPXlgEWTMAanht7AAru458W9
 4RBZkD6RrYpBpfkimufXgjqm8uhxepv28G/pUatrZtg6Ood2xUvy++7dmUWiawnIEwpm
 cEzyCniwM35vVXv3u3D8ylOjwGZ2e7PM2I/CUCD7wbWlep2gtKcHmCfQm8Lys02O1JBu
 87pCmOW7ousju+7rFnAPSKisI91v5nCbeRTw5ICohJm0/mIBwU48R/7a8730EgfkO15J
 njfmWo7uO3jAyouLi7n7ivYPO7pFDf0duUXPdZaYGOWYVFYm7SELwwEkZ5Yf97qiEvqv nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn7kcsr43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:35 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20HIuwiC027800;
 Mon, 17 Jan 2022 19:19:35 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dn7kcsr40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:35 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20HJDE0t012792;
 Mon, 17 Jan 2022 19:19:34 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04dal.us.ibm.com with ESMTP id 3dknwa409b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jan 2022 19:19:34 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20HJJWeQ30605668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Jan 2022 19:19:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D47AA78066;
 Mon, 17 Jan 2022 19:19:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76E7378060;
 Mon, 17 Jan 2022 19:19:31 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.75.63])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Jan 2022 19:19:31 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/3] Rename ppc-spapr-uv-hcalls.txt to ppc-spapr-uv-hcalls.rst.
Date: Mon, 17 Jan 2022 16:19:18 -0300
Message-Id: <ea1554e3a02e093eaa64d1260faf01d525c9ecdc.1642446876.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642446868.git.lagarcia@br.ibm.com>
References: <cover.1642446868.git.lagarcia@br.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vWi-UaJgCHnCmFFBV4wgeBLS_vucgvA0
X-Proofpoint-GUID: bVUKmktRYepJ-RzX5ojIaJVBf-V4QRyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-17_07,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=782
 adultscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201170119
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
---
 docs/specs/{ppc-spapr-uv-hcalls.txt => ppc-spapr-uv-hcalls.rst} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename docs/specs/{ppc-spapr-uv-hcalls.txt => ppc-spapr-uv-hcalls.rst} (100%)

diff --git a/docs/specs/ppc-spapr-uv-hcalls.txt b/docs/specs/ppc-spapr-uv-hcalls.rst
similarity index 100%
rename from docs/specs/ppc-spapr-uv-hcalls.txt
rename to docs/specs/ppc-spapr-uv-hcalls.rst
-- 
2.34.1


