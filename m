Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F26FE501
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 22:28:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwqPE-0000IR-8h; Wed, 10 May 2023 16:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pwqP8-0000Hf-QZ
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:27:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1pwqP5-000102-Rl
 for qemu-devel@nongnu.org; Wed, 10 May 2023 16:27:18 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34AKJnol024633; Wed, 10 May 2023 20:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=E/oqGWqW+Yxx3TSzYwum9cBpxEeD6uL2WVg7QRCZIoc=;
 b=Q9QERfRTZyux7JYBkARMz/PFrKx4aQJruANq4JW6970381xCjFx9PIaLDekrD6yZPbY3
 sRyc1OET8xuK0f6pGsaGXwGkW4SrhAcFgLu1rzqYAi1qCkJBbtTp2RDl8J2qkFGqPV/P
 xMDjNZYQvxlxgyejlj1wnFL4khMcyXOJmHnmUmoTHc0XX2UiYHyG9nRicEbSpT6MHdRk
 xW4uXJv5NGhyoBHt/eLPXfo8OcYJEiXQfbyKfAj4lqC15XRVvXKpRiNlFaG7ra8jxaKj
 F8gnxUXFzoUy5tVq7zu40U9xunS5FATlftwgroMGgcMMmZwMWVwYBMyBOGLANQb89EDT ww== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcduud1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:14 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34AKLQgR028454;
 Wed, 10 May 2023 20:27:13 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qgcduud13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:13 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34AJA1aJ005404;
 Wed, 10 May 2023 20:27:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0s17p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 May 2023 20:27:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34AKR8KF21430854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 May 2023 20:27:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C0272006A;
 Wed, 10 May 2023 20:27:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89642004E;
 Wed, 10 May 2023 20:27:07 +0000 (GMT)
Received: from heavy.boeblingen.de.ibm.com (unknown [9.171.51.237])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 10 May 2023 20:27:07 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Cc: "Dominik 'Disconnect3d' Czarnota" <dominik.b.czarnota@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Andreas Arnez <arnez@linux.ibm.com>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH RESEND 5/6] docs: Document security implications of debugging
Date: Wed, 10 May 2023 22:26:53 +0200
Message-Id: <20230510202654.225689-6-iii@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510202654.225689-1-iii@linux.ibm.com>
References: <20230510202654.225689-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lc_lsZZC8hwcXsZxOIurlOz2HzBfDjVa
X-Proofpoint-GUID: AAs7r7BcH4IlTmt_FQ8ESI8U582Tdlrm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100163
Received-SPF: pass client-ip=148.163.158.5; envelope-from=iii@linux.ibm.com;
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

Now that the GDB stub implements reading host files, concerns may arise
that it undermines security. Document the status quo, which is that the
users are already responsible for securing the GDB connection
themselves.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 docs/system/gdb.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
index 453eb73f6c4..3cc5167d928 100644
--- a/docs/system/gdb.rst
+++ b/docs/system/gdb.rst
@@ -192,3 +192,18 @@ The memory mode can be checked by sending the following command:
 
 ``maintenance packet Qqemu.PhyMemMode:0``
     This will change it back to normal memory mode.
+
+Security considerations
+=======================
+
+Connecting to the GDB socket allows running arbitrary code inside the guest;
+in case of the TCG emulation, which is not considered a security boundary, this
+also means running arbitrary code on the host. Additionally, when debugging
+qemu-user, it allows directly downloading any file readable by QEMU from the
+host.
+
+The GDB socket is not protected by authentication, authorization or encryption.
+It is therefore a responsibility of the user to make sure that only authorized
+clients can connect to it, e.g., by using a unix socket with proper
+permissions, or by opening a TCP socket only on interfaces that are not
+reachable by potential attackers.
-- 
2.40.1


