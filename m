Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5255E45A64B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:13:07 +0100 (CET)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpXTm-0005oi-0G
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:13:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mpSWJ-0002Vx-Ls; Tue, 23 Nov 2021 04:55:23 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33430
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mpSWH-0003hx-Gd; Tue, 23 Nov 2021 04:55:23 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AN9ki5j005076; 
 Tue, 23 Nov 2021 09:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=bk3x2Rj4pkly00IgyqN0DC4lkiFQKUZn5oo1jyCl8UI=;
 b=h4g6/dNU1O51MVxHdXPc1C9icS4eleoCeJJqvEZeLXyIBqQ4BOIzszvgZ80KJHLyFvEz
 +hjXn2EA+LZ/1In9Eg4wk3L6Bcl8/suNxCfY7NToRKNlD0yyxej7+6Ok198uuNz41eLs
 jUZxNke5Y9CI21PqpdyY1whRUC6EdDiaxAee1p/Kr4JadLwlUOuS6VFJCFjpvh8y1fLT
 AWCA2ST+IVjxaINmIvyYgSs5Gg1tzzBXCILyRIPn9P85yIeW3mSaRVxpGG+rmsADewKN
 HalCwShpUS5VWr7xs4BZubqPavXnwUMD0IzNTMw2vPscPWHAKdxrua1wLofGAzG3z3fE Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgwyg84uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:55:17 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AN9lkPw008579;
 Tue, 23 Nov 2021 09:55:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cgwyg84u1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:55:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AN9r0uv015857;
 Tue, 23 Nov 2021 09:55:15 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3cer9jp8pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 09:55:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AN9tCRp17301962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Nov 2021 09:55:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61B9911C06F;
 Tue, 23 Nov 2021 09:55:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 592B511C064;
 Tue, 23 Nov 2021 09:55:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Nov 2021 09:55:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 05867E06BB; Tue, 23 Nov 2021 10:55:12 +0100 (CET)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 1/1] MAINTAINERS: update email address of Christian Borntraeger
Date: Tue, 23 Nov 2021 10:55:11 +0100
Message-Id: <20211123095511.132810-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XbregDYREHwdbARFdQa6V4Jhj5ekSOZF
X-Proofpoint-GUID: 7qWOLOvNsoAbnyRutRcCc1SDvjGSi44Z
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_03,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=797 suspectscore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230051
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Nov 2021 10:11:23 -0500
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
Cc: Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My borntraeger@de.ibm.com email is just a forwarder to the
linux.ibm.com address. Let us remove the extra hop to avoid
a potential source of errors.

While at it, add the relevant email addresses to mailmap.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 .mailmap    | 1 +
 MAINTAINERS | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 8beb2f95ae28..c45d1c530144 100644
--- a/.mailmap
+++ b/.mailmap
@@ -50,6 +50,7 @@ Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
+Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
 Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c12c..e19d88ca9960 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -393,7 +393,7 @@ F: target/ppc/kvm.c
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: target/s390x/kvm/
 F: target/s390x/ioinst.[ch]
@@ -1527,7 +1527,7 @@ S390 Machines
 -------------
 S390 Virtio-ccw
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 S: Supported
 F: hw/char/sclp*.[hc]
 F: hw/char/terminal3270.c
@@ -1541,7 +1541,7 @@ T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 S390-ccw boot
-M: Christian Borntraeger <borntraeger@de.ibm.com>
+M: Christian Borntraeger <borntraeger@linux.ibm.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Supported
 F: hw/s390x/ipl.*
-- 
2.31.1


