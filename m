Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 702E26E2B84
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 23:08:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnQdW-0005KY-SV; Fri, 14 Apr 2023 17:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1pnQdR-0005Jn-8K
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:07:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1pnQdN-00017H-4R
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 17:07:08 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EL3Zx3003679; Fri, 14 Apr 2023 21:07:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2JGNdDU0qManBcsb+NFnszRGGGIt3BsvZ9jVv0HRMDg=;
 b=X2Aufn0OB3QQydqlDlgMYx/WHvePMRPScBQB8/F1S+NpICvXoFlzyhIuSmwDPNYJEH8T
 M7sSqCl6ogEW22gHxaOmgp7+i7QMbiix60efEa7F5lsG6Py8rrwREsG9zI9NbVHCbmQo
 q8Qg1nW6TuB/0q+d6tyoWnR/6Y6Lqau1vB5Cah2JQIQjLTsPowbTIMbEoVTyDgcem5c3
 xoeb4fJMC/NwctTDh+4V5X6d5kVo+X2xV+Pl2zRFG7UBrLdH4rcxx+n7VeKiMt/lnrQh
 snU2oB0oUslsMmkDinMyVThb8LX6InB8GI+sK6ecKspQfs7D71URf2TOt3ONJJsRDQxN PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pye4e0ytm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:07:03 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33EL3n7q004917;
 Fri, 14 Apr 2023 21:07:02 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pye4e0yrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:07:02 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33EKiarL020170;
 Fri, 14 Apr 2023 21:07:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3pu0mkb8fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 21:07:00 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com
 [10.20.54.100])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33EL6wK660293572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Apr 2023 21:06:58 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 192DA2004D;
 Fri, 14 Apr 2023 21:06:58 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1DE720043;
 Fri, 14 Apr 2023 21:06:54 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.108.50])
 by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
 Fri, 14 Apr 2023 21:06:54 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 02:36:53 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 2/2] travis.yml: Add missing 'flex' package to 'GCC (user)' job
Date: Sat, 15 Apr 2023 02:36:45 +0530
Message-Id: <20230414210645.820204-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414210645.820204-1-vaibhav@linux.ibm.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JtcuP1_XoMZKd1UYVpg4dLtKwcNBXAHr
X-Proofpoint-GUID: OoFq6yVhUKISHFHFKi4-KEFnkPI0Sg3S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_13,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140181
Received-SPF: pass client-ip=148.163.158.5; envelope-from=vaibhav@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
hexagon target uses 'flex' to generate idef-parser. However 'focal' may not have
'flex' pre-installed, consequently following error is seen with travis when
trying to execute the 'GCC (user)' job that also tries to build hexagon user
binary:

<snip>
export CONFIG="--disable-containers --disable-system"
<snip>
 Program flex found: NO

../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
executable
<snip>

Fix this by explicitly add 'flex' to the list of addon apt-packages for the
'GCC (user)' job.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 11894eb810..8dc71c294d 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -237,6 +237,7 @@ jobs:
           - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
+          - flex
       env:
         - CONFIG="--disable-containers --disable-system"
 
-- 
2.39.2


