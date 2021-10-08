Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D5427273
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 22:42:06 +0200 (CEST)
Received: from localhost ([::1]:42548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYwgv-0006AR-GV
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 16:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdO-0002Ce-HJ; Fri, 08 Oct 2021 16:38:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mYwdK-0002U6-Oq; Fri, 08 Oct 2021 16:38:26 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198KVTKl023326; 
 Fri, 8 Oct 2021 16:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=f2SC6PxOGm4Qnd+dU+k6aHXB3lb5+b6Xpx6g4nIuzS4=;
 b=ndA7qJ8qOpMCXWBX7fZvb0sKoteOHxlo/SIvVi5Oqk99rtIqWru7AHZLhyX/zZFxicPI
 p+/1gGCW+Da5DU7UmTfR8ivGgU0sXz//NLRCwWXUt2fj1HONFVDifpQb+zJ903afA9B5
 dt0Op9OOtCMjiy3AdUn6tq2uENeTpeH0Qs8b4OewQavd9Kl6jikIyZb/eYEEM970Nra8
 dKZTeLT/2ri/zAV+cNq1jX0GGtHYLL9Yfjs2v5yJI9JHBh4QbbwdO6nnyA8lSrxCoSZF
 cYzBTTVuRxXshNPJD6UBpSMZqQTjOSbpi1lEh1BzMZxUjD6uYTguUVATmk5TuaXFrDBj 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjhum8js5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:19 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 198KaCpl013155;
 Fri, 8 Oct 2021 16:38:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bjhum8jrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 16:38:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 198KMbEa004919;
 Fri, 8 Oct 2021 20:38:16 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3bef2bwj88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 20:38:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 198KcCDL57606604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Oct 2021 20:38:13 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D31F342042;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCC6B42041;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Oct 2021 20:38:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 47FE9E0352; Fri,  8 Oct 2021 22:38:12 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v1 2/2] s390x/kvm: Pass SIGP Stop flags
Date: Fri,  8 Oct 2021 22:38:11 +0200
Message-Id: <20211008203811.1980478-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008203811.1980478-1-farman@linux.ibm.com>
References: <20211008203811.1980478-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ImCKSabnx8gctP50g6lYClb7gpMmD2Cd
X-Proofpoint-GUID: 69-hccbUX9YfSrRjHiceOO9FY2l8iyip
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_06,2021-10-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 mlxlogscore=921
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110080112
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building a Stop IRQ to pass to KVM, we should incorporate
the flags if handling the SIGP Stop and Store Status order.
With that, KVM can reject other orders that are submitted for
the same CPU while the operation is fully processed.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/kvm/kvm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 5b1fdb55c4..701b9ddc88 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2555,6 +2555,10 @@ void kvm_s390_stop_interrupt(S390CPU *cpu)
         .type = KVM_S390_SIGP_STOP,
     };
 
+    if (cpu->env.sigp_order == SIGP_STOP_STORE_STATUS) {
+        irq.u.stop.flags = KVM_S390_STOP_FLAG_STORE_STATUS;
+    }
+
     kvm_s390_vcpu_interrupt(cpu, &irq);
 }
 
-- 
2.25.1


