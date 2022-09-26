Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA75EA488
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 13:47:27 +0200 (CEST)
Received: from localhost ([::1]:59430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocma6-0003ui-Dg
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 07:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ocmS2-0006GD-8n; Mon, 26 Sep 2022 07:39:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:20312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1ocmRw-00039y-0d; Mon, 26 Sep 2022 07:39:02 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QBLhV2001485;
 Mon, 26 Sep 2022 11:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tfIBb3fsW1l1UO32OFoyCoJFg8m5H9Vu4iJhsEpeqVE=;
 b=V5VDOpAynmd6OBlvZtcmp9XZhElJdnLcwDxTlfbH9xlUCcoxuC6Rz7E/sIdfHIwCi5Gr
 /4iTUJ1Zcfz3+jtOwWdqjifWIG+em7VxiXxGuXIn/C2C7ajT727gNfbB86Kg7WHoCk+V
 l4pC/BDSzmljaL2bk3xlWl82ZQM0V4boZd3qs2jpPBaLGLKvfi5+4itA46yMpzLzn5Ol
 heB5zKg4S7ZWYgrVKsmamQ0bRKWvr8pV+IGFIPMb7K9eSqXM4fE/fDUYw4sCh7Im8xiI
 5SWZ8zlLKpVq5TPm3+RtAK78WAupHx83iUeRITWzfOYEL9di/1Fb7/WDlpUIBkiDEvav hA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jub508d5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 11:38:55 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28QBZPcT005289;
 Mon, 26 Sep 2022 11:38:54 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jub508d4j-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 11:38:54 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28QB5LxI005264;
 Mon, 26 Sep 2022 11:07:51 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3jssha0s0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 11:07:51 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28QB7nhh35783002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Sep 2022 11:07:49 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C05658052;
 Mon, 26 Sep 2022 11:07:50 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED5065804E;
 Mon, 26 Sep 2022 11:07:49 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 26 Sep 2022 11:07:49 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] docs: Add --tpm2 option to swtpm command line
Date: Mon, 26 Sep 2022 07:07:46 -0400
Message-Id: <20220926110746.2769518-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: u6oqGZjRgCvujMUlds03zHBU19txpoy3
X-Proofpoint-GUID: Fmt33Lp92PYnnY1cCPXQGv_WleignEOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the --tpm2 option to the swtpm command line to run a TPM 2.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 docs/specs/tpm.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/specs/tpm.rst b/docs/specs/tpm.rst
index 3be190343a..243e24b692 100644
--- a/docs/specs/tpm.rst
+++ b/docs/specs/tpm.rst
@@ -304,6 +304,7 @@ a socket interface. They do not need to be run as root.
   mkdir /tmp/mytpm1
   swtpm socket --tpmstate dir=/tmp/mytpm1 \
     --ctrl type=unixio,path=/tmp/mytpm1/swtpm-sock \
+    --tpm2 \
     --log level=20
 
 Command line to start QEMU with the TPM emulator device communicating
-- 
2.37.2


