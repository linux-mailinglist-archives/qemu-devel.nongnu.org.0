Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35273D2B65
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:49:34 +0200 (CEST)
Received: from localhost ([::1]:46398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cpB-0000Gb-Ox
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6cit-0005hh-3r; Thu, 22 Jul 2021 13:43:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:55636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6cir-000430-IV; Thu, 22 Jul 2021 13:43:02 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MHX9dh051786; Thu, 22 Jul 2021 13:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=BFcQtyguHntNRPyPGrxJoxzI8ZsYghHo98e5CDSR9C4=;
 b=SgMO6hGy70j8emOtE6RnKr3FHT7naKcJWtbKMMFujNNKPKpjc7z+FzSWKpL79ERXT0Z6
 w2DkmRfN4gcVpEHbVpqZLunaRQfJOlzBIvEtz5McBjIxhBBq3ahkdkVs3CgVd524sqWi
 Gycp8GVTTj3TpkWWoKo5abrH0wdYntnJoSCKj5N0dvgTqpmdo6+vDzSxO5S6v9koV/2f
 LrQCIgWNwDQAkIRbW9sfCLmckNOt9soBQWzQ4IVC9n3G2aBycJOEqvuV0uZtA5+MA+8N
 7aIk+ee4Tgnf2CQf9LvLdkCCYU2KnI/KGwpBcz0nZB4a+zz6WduyphlXOnqly35xHyEP gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yd0drw7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:43:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MHXPfD053077;
 Thu, 22 Jul 2021 13:42:59 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39yd0drw6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:42:59 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MHXuIS010640;
 Thu, 22 Jul 2021 17:42:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 39upu89k3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 17:42:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16MHePkb33948042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 17:40:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24C9211C058;
 Thu, 22 Jul 2021 17:42:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7B0711C04A;
 Thu, 22 Jul 2021 17:42:53 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.18.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 17:42:53 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 1/5] s390x: kvm: topology: Linux header update
Date: Thu, 22 Jul 2021 19:42:40 +0200
Message-Id: <1626975764-22131-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yaUcnGMPX7jALifrOh8sTP0XdjDEtcE0
X-Proofpoint-ORIG-GUID: gpjbLgZd-0bS8Bkm8DmIyMVQLrIRbIGj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just as information, the linux header update patch is inside the
Linux patch series.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..38e96ea6f7 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1112,6 +1112,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_S390_CPU_TOPOLOGY 206
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.25.1


