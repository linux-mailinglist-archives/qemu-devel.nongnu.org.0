Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBB845EB79
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:26:51 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYRN-0005Ne-Li
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mqYPf-0004XF-DX; Fri, 26 Nov 2021 05:25:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27630
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1mqYPd-00043I-FX; Fri, 26 Nov 2021 05:25:03 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AQ9aFV5021487; 
 Fri, 26 Nov 2021 10:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=2zQpEvRzM1W/HN3DIJyJixhxqisQXLdGgtkTrqZ5Kp4=;
 b=WFL4dgR/+Hc7Dgf1zACXAm/yC9sUH3OEIF4oE0VOt8cfxVVvwtY7CtWYcKczH1QQxq4E
 yQceRxkkeD0Dbox6BMEH3MGRXGvM2z9oP7K9+sqDnkK62XnRUESSXSWQcsHEGrdccOKm
 3rrY8AuQOlDIslMKzIo8ZUJ0ohcvD3r3zF8cZ2d5pfRvh+Ctf4g3auVT+ctILoyqflTz
 y8LiIEETpzAHYiosSNTWtJMgjYBFPMx/oXOy4+n3hIK3eSA+Q/iBE0ChKiH2mXqcvgMh
 XTPRKq7N6NKq1UOcRsv20aoOgNyijhc21vFrovNLCM5lrMCRKphNqFr8temUFUgNbiVT Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cjmwj1tuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 10:24:57 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AQAD3a7028078;
 Fri, 26 Nov 2021 10:24:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cjmwj1tua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 10:24:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AQADTwl001005;
 Fri, 26 Nov 2021 10:24:54 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3cernbhwt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 10:24:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AQAOoG855902664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Nov 2021 10:24:50 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 998A552067;
 Fri, 26 Nov 2021 10:24:50 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 886BB5205F;
 Fri, 26 Nov 2021 10:24:50 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id 3F97DE11C1; Fri, 26 Nov 2021 11:24:50 +0100 (CET)
From: Christian Borntraeger <borntraeger@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/1] MAINTAINERS: update email address of Christian
 Borntraeger
Date: Fri, 26 Nov 2021 11:24:49 +0100
Message-Id: <20211126102449.287524-1-borntraeger@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r_85d8CEN0gmhLEAjLavrSna_koZoqBF
X-Proofpoint-ORIG-GUID: e-Xp79uvFOT1XZ7ZwqaZNKizxv9PtOyu
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-26_03,2021-11-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 adultscore=0
 mlxlogscore=786 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111260059
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

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
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


