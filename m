Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38B6185B0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:05:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdcc-0008OI-TZ; Thu, 03 Nov 2022 13:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oqdbd-0007kt-2J; Thu, 03 Nov 2022 13:02:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oqdbU-0007NK-SR; Thu, 03 Nov 2022 13:02:15 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A3Fqk4W001890;
 Thu, 3 Nov 2022 17:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uqt0b7Xv6p04ttu26Xn6S2so5CxuQcn1mK46SRdPmMo=;
 b=rL8G879U4lNFRrMgloPE+pMwYK7Z5bxvpzQSVJut+NpAyg3Asxpe3fjtO3NmBrs8qDhg
 xmaA5ih0+rHMutb362NMdvTD4LkTg20F8UiMemk2sx2UeSi4GpcguUF0Hlhg+e030G+u
 hfatI1j4MC/fjRLoqgjX2XQ+utcUtihYlIY8zp0C8AGGvwi+jipHQOJPPZ+mHHdJVYQR
 wk5drB48L9jAamuhOWoHw1p335tIVrFjwC4Lqq0ZGmvIegrCdj+GN0SjkE3hCxaHppp7
 qtjgPYkdor5P30fc6cR4Wc2m41tgpcu/U6vbw746iAEXCqfy/m6D2cfLTYYcqwCCvqW1 mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kme7ygnjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 17:02:02 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A3Fsnl5008644;
 Thu, 3 Nov 2022 17:02:02 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kme7ygnhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 17:02:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A3GKjOP002793;
 Thu, 3 Nov 2022 17:01:59 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 3kgut8ptkr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Nov 2022 17:01:58 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A3H2WBR42402104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Nov 2022 17:02:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6AF652051;
 Thu,  3 Nov 2022 17:01:55 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com (unknown
 [9.152.222.245])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2C77552050;
 Thu,  3 Nov 2022 17:01:55 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, scgl@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v11 08/11] s390x/cpu topology: add topology_capable QEMU
 capability
Date: Thu,  3 Nov 2022 18:01:47 +0100
Message-Id: <20221103170150.20789-9-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221103170150.20789-1-pmorel@linux.ibm.com>
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gjo6yKMx43-Nbzmm4nFQOWNbnkpjAeBH
X-Proofpoint-ORIG-GUID: quDqsrpfvntEGpuzsNckbr5DoqlCit6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-03_04,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211030114
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

S390 CPU topology is only allowed for s390-virtio-ccw-7.2 and
newer S390 machines.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 include/hw/s390x/s390-virtio-ccw.h | 1 +
 hw/s390x/s390-virtio-ccw.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 6488279690..89fca3f79f 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -48,6 +48,7 @@ struct S390CcwMachineClass {
     bool css_migration_enabled;
     bool hpage_1m_allowed;
     int max_threads;
+    bool topology_capable;
 };
 
 /* runtime-instrumentation allowed by the machine */
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4de2622f99..f1a9d6e793 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -763,6 +763,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     s390mc->css_migration_enabled = true;
     s390mc->hpage_1m_allowed = true;
     s390mc->max_threads = 1;
+    s390mc->topology_capable = true;
     mc->init = ccw_init;
     mc->reset = s390_machine_reset;
     mc->block_default_type = IF_VIRTIO;
@@ -896,6 +897,7 @@ static void ccw_machine_7_1_class_options(MachineClass *mc)
     ccw_machine_7_2_class_options(mc);
     compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
     s390mc->max_threads = S390_MAX_CPUS;
+    s390mc->topology_capable = false;
 }
 DEFINE_CCW_MACHINE(7_1, "7.1", false);
 
-- 
2.31.1


