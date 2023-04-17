Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F66E4E41
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 18:25:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poReQ-0002yh-HE; Mon, 17 Apr 2023 12:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poReM-0002yK-GM
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:24:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaibhav@linux.ibm.com>)
 id 1poReG-0006B4-2E
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 12:24:18 -0400
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33HG3TwK010225; Mon, 17 Apr 2023 16:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=xCPzj7o65hXHG5NNmt0oHO3NGC8jAKUKfDctZ8CZdBc=;
 b=T9bCKObNq0r9NxE3MpsB12KKXf75tVlKxzjPzMyLohVX3reElRSMWyXsR0v+4OOAyvC5
 Kg/Jk49Ua0VX0PngIoi10VZiNOXC2D91M9UuUvKhe9xKDxOFGLOUvRfs5PZuFEDOCmJp
 iCekUpiO6/5V8Emj1dKy8c87XGiMP9jQmLZ7rugw8EYbjfM9sJvqKaTMzRCbL22iUTT6
 kD9EtAu4IVebDFXAuoCsh2ebmBbaNUvxMpJ/IH5x8+AewxqmuHe0fhr3gGQy2u0doS7/
 7M7+5Yj7P1QgCLcJrCLfKIg0ihKnhV3PTAGGEvfP21nPE9v0R8TiWywMEm6IZDJfDLIz GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q199vgrq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 16:24:06 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33HGMUfP009637;
 Mon, 17 Apr 2023 16:24:06 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q199vgrny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 16:24:06 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H2fP0o008218;
 Mon, 17 Apr 2023 16:24:04 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pyk6fhf8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 16:24:04 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33HGO2rq38535828
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 16:24:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F387620049;
 Mon, 17 Apr 2023 16:24:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF1722004D;
 Mon, 17 Apr 2023 16:23:58 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.20.139])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
 Mon, 17 Apr 2023 16:23:58 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 21:53:57 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2] travis.yml: Add missing 'flex',
 'bison' packages to 'GCC (user)' job
Date: Mon, 17 Apr 2023 21:53:54 +0530
Message-Id: <20230417162354.186678-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -ZdocBdYS7IOgoohXpjIRUvgzC2VZG-C
X-Proofpoint-GUID: RIc7lLq-0ntuAtmqA8mEikOiHEcN3RIQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_10,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170145
Received-SPF: pass client-ip=148.163.158.5; envelope-from=vaibhav@linux.ibm.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since commit fd8171fe52b5e("target/hexagon: import lexer for idef-parser") the
hexagon target uses 'flex', 'bison' to generate idef-parser. However default
travis builder image for 'focal' may not have these pre-installed, consequently
following error is seen with travis when trying to execute the 'GCC (user)' job
that also tries to build hexagon user binary:

<snip>
export CONFIG="--disable-containers --disable-system"
<snip>
 Program flex found: NO

../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found or not
executable
<snip>

Fix this by explicitly add 'flex' and 'bison' to the list of addon apt-packages
for the 'GCC (user)' job.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:

Since v1:
Link: https://lore.kernel.org/qemu-devel/20230414210645.820204-2-vaibhav@linux.ibm.com/

- Added 'bison' also to the addon package list (Thomas)
- Updated the patch description
---
 .travis.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 11894eb810..b958eca5de 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -237,6 +237,8 @@ jobs:
           - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
+          - flex
+          - bison
       env:
         - CONFIG="--disable-containers --disable-system"
 
-- 
2.39.2


