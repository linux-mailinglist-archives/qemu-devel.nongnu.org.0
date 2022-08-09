Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9915758D159
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 02:27:50 +0200 (CEST)
Received: from localhost ([::1]:60962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLD65-0001Yq-Jc
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 20:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3j-0005Zt-QU; Mon, 08 Aug 2022 20:25:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oLD3b-000784-CR; Mon, 08 Aug 2022 20:25:21 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27901F1J014214;
 Tue, 9 Aug 2022 00:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=kdSzavPsLaANEVxx7BlYGtXSGm2s/JMPekbq8yrt1dE=;
 b=ApAO/xK+nRJcApcBlwjGAbNpNnIC2eVleP2halLBHxnWdt7DWbmtetHR1QWc+xO+8SSW
 ThX3hAlSiB3B+AHiPCJuAhuAVfaw/k/v2aRefsYY6qUPTx+OmOo3bVfLMmN2W+yOqT5n
 RSoWdWNEu8dDHRA2rG0QMD0IgTOv2QXssu5/ohcv7KOCNZRIUH9jJKkTUU6wHbrzUS+m
 QSCYxcS6k2HgJUBeV/HGE+kQ7XkZTu86oVdXg51P+RFGyB5TkdjAG1+ZkeCDykDii4Y2
 2wQUQPkMybfD5aHUtsTXx8Vho2V3m71WAChfdqxl/un7BPAbu76tvc7chyKS8G78bw2t Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hubrq9tub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:10 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27908IgJ021653;
 Tue, 9 Aug 2022 00:25:10 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hubrq9tu0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:10 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2790KULL018553;
 Tue, 9 Aug 2022 00:25:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 3hsfx9fh07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Aug 2022 00:25:09 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2790P88B42860848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Aug 2022 00:25:08 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 449F0BE056;
 Tue,  9 Aug 2022 00:25:08 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABA8BBE054;
 Tue,  9 Aug 2022 00:25:07 +0000 (GMT)
Received: from localhost (unknown [9.77.141.99])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  9 Aug 2022 00:25:07 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com,
 mopsfelder@gmail.com
Subject: [PATCH 0/2] tests/migration: add support for ppc64le in guestperf.py
Date: Mon,  8 Aug 2022 21:24:49 -0300
Message-Id: <20220809002451.91541-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VdPz2t3tdoXiBcxyAzDXq08Qpw6vPz8W
X-Proofpoint-ORIG-GUID: lUrPreOAQhS08AseG6qVY4X8TLbhVaZa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_14,2022-08-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=660 clxscore=1011
 impostorscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2208080105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch adds sysprof-capture-4 dependency when building stress binary in
order to fix a build error.

The second patch adds support for ppc64le in guestperf.py.

Murilo Opsfelder Araujo (2):
  tests/migration: add sysprof-capture-4 as dependency for stress binary
  tests/migration: add support for ppc64le for guestperf.py

 tests/migration/guestperf/engine.py | 28 +++++++++++++++++++++++++---
 tests/migration/meson.build         |  4 +++-
 2 files changed, 28 insertions(+), 4 deletions(-)

--
2.37.1

