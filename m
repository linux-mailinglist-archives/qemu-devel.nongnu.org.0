Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C41284988
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 11:44:47 +0200 (CEST)
Received: from localhost ([::1]:50414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPjWY-0000PQ-Sy
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 05:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kPjUx-0007Zc-C3
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 05:43:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:32312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1kPjUv-0002EG-FC
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 05:43:07 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0969gXce043481
 for <qemu-devel@nongnu.org>; Tue, 6 Oct 2020 05:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+u+yVVICuIk67PlOUdHTDLXAjBpKna4dj+jy3/sXglc=;
 b=A2E+V+1+QHIQqt2Zp2bSZDxvtWmWlbwD8XtH0BbGP01EXiFEICVlApPwZqS/Cwl1W1YZ
 c2ja9ALUlXFmXJgwXqMI65h37SVjuVCGwhJCyACOz/x8D+QUq8ZbKZ+heQu7CXKiRZKh
 HW0cKddRjAsBKvlQjAnywXSacNufNb0ciOfSCrKOLTSx7HtGqsqR4sF5Oj2A1UGSuPNV
 bqggbiisFP1b3Y16LMb/LHUGVxD+qyVvTf3T/s0+1XmbqYYFneoyGQclj10ePELSo9Sp
 n0EZibMaCv/se3/2gQG4SDsdP5el/6KoaNj3k7pm9b3nTZEYdYRjo7FCDm8LvjlRfQP8 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340p69808f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 06 Oct 2020 05:43:04 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0969h3Be046320
 for <qemu-devel@nongnu.org>; Tue, 6 Oct 2020 05:43:03 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 340p698082-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 05:43:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0969Rrm1011476;
 Tue, 6 Oct 2020 09:43:01 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8b2vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Oct 2020 09:43:01 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0969gx5J29295016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Oct 2020 09:42:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE4865204F;
 Tue,  6 Oct 2020 09:42:58 +0000 (GMT)
Received: from linux01.pok.stglabs.ibm.com (unknown [9.114.17.81])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4177952051;
 Tue,  6 Oct 2020 09:42:58 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/4] pc-bios: s390x: Go into disabled wait when
 encountering a PGM exception
Date: Tue,  6 Oct 2020 05:42:49 -0400
Message-Id: <20201006094249.50640-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006094249.50640-1-frankja@linux.ibm.com>
References: <20201006094249.50640-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-06_03:2020-10-06,
 2020-10-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=1 malwarescore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=926 priorityscore=1501
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010060058
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 04:55:29
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's setup a PGM PSW, so we won't load 0s when a program exception
happens. Instead we'll load a disabled wait PSW.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/start.S | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/start.S b/pc-bios/s390-ccw/start.S
index ce519300a1..4d5ad21653 100644
--- a/pc-bios/s390-ccw/start.S
+++ b/pc-bios/s390-ccw/start.S
@@ -34,7 +34,10 @@ remainder:
 	larl	%r2,memsetxc
 	ex	%r3,0(%r2)
 done:
-	j      main		/* And call C */
+        /* set up a pgm exception disabled wait psw */
+        larl	%r2, disabled_wait_psw
+        mvc	0x01d0(16), 0(%r2)
+        j      main		/* And call C */
 
 memsetxc:
 	xc	0(1,%r1),0(%r1)
-- 
2.25.1


