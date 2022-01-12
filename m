Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C448C615
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 15:29:23 +0100 (CET)
Received: from localhost ([::1]:47592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ecs-0005Le-KZ
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 09:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3o-0008Ds-HC; Wed, 12 Jan 2022 08:53:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1n7e3l-0001bf-HD; Wed, 12 Jan 2022 08:53:08 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20CDoKdf027082; 
 Wed, 12 Jan 2022 13:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=6QPR4eX8r2DZrFYbp7h61aGJtLhY7/kEhJmD/AjR4Fs=;
 b=o+CI1JXWr5OH2LOHvQlQsw5strI0zu0FoK2+6ePOwuUeGfpfgtk7qU/ioAA2SnLEVwcX
 uyzX514JLHGOZAqr3w+N9UuQt+9wb669yyVz4UKkbUNmxwt5bgtsHgeuZfjQ/Ek7xbFz
 PTzZtp+dvp7vpmzwtYMlZB6ExW8NAy3QC7Pm4E1HSFZF7Uatog3o2AbmmPa09gLLAMre
 avHHO4VX9Hjx7dbvlhmc4mb1dJOCudv0VbeH5asO6Q7Ip8e8Pcsn3jepVCa0Qykexh7Q
 YPSPev+16amxIl2jbZPWlMqI8BS6FDpM/F9JJ1iz2Z4jIWGggcsloW/b9jMF8YnGVHu8 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhwp74y88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:36 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20CDoLCo027203;
 Wed, 12 Jan 2022 13:52:35 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dhwp74y7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:35 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20CDqKqs025802;
 Wed, 12 Jan 2022 13:52:34 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3df28auuuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jan 2022 13:52:34 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20CDqXfh12321454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Jan 2022 13:52:33 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5B54C605B;
 Wed, 12 Jan 2022 13:52:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B64C6059;
 Wed, 12 Jan 2022 13:52:30 +0000 (GMT)
Received: from lagarcia.br.ibm.com.com (unknown [9.65.79.38])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Jan 2022 13:52:30 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-ppc@nongnu.org
Subject: [PATCH 0/3] rSTify ppc-spapr-hotplug.txt
Date: Wed, 12 Jan 2022 10:52:13 -0300
Message-Id: <cover.1641995057.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: b3ZJZQDqAZdzDyaBfdyOdfZ9ev6xTNoH
X-Proofpoint-ORIG-GUID: xQ0hVrMgUESXmtEEj0OtFFrdIl7lYIDQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=765 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, danielhb413@gmail.com,
 qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

This patch series depend on previously sent patch "docs: Clarification
and formatting changes in ppc docs." which is already included in latest
pull request from Cédric.

It is important to notice that I focused mainly in the layout of the
document, and not so much on the content. My understanding is that some
sections, such as Hot plug/unplug events and Hot plug/unplug event
structure may need updates based on what I saw in the code, but I don't
have the expertise today to rewrite these sections. Hopefully someone
will be able to update them.

Leonardo Garcia (3):
  docs: rSTify ppc-spapr-hotplug.txt.
  docs: Rename ppc-spapr-hotplug.txt to ppc-spapr-hotplug.rst.
  Link new ppc-spapr-hotplug.rst file to pseries.rst.

 docs/specs/ppc-spapr-hotplug.rst | 510 +++++++++++++++++++++++++++++++
 docs/specs/ppc-spapr-hotplug.txt | 409 -------------------------
 docs/system/ppc/pseries.rst      |   2 +-
 3 files changed, 511 insertions(+), 410 deletions(-)
 create mode 100644 docs/specs/ppc-spapr-hotplug.rst
 delete mode 100644 docs/specs/ppc-spapr-hotplug.txt

-- 
2.34.1


