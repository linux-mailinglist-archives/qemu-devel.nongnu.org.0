Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94D443711
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 21:14:15 +0100 (CET)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi0Ag-0008Ma-0z
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 16:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08E-0006Bx-6a; Tue, 02 Nov 2021 16:11:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1mi08C-0006Y7-JW; Tue, 02 Nov 2021 16:11:41 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A2HktAA008778; 
 Tue, 2 Nov 2021 20:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ZTFXr5STcVXkM7SXR4jILpaQTziRDEJfKC4FFX6EVS0=;
 b=st8BOwYPovcdEwe1cr+ISk7262ekD/Ao4UIu4C1b3CeO8UONnSUmPaOLwyIPPHANRXPi
 BcmGlvtbdQabpJA4mVpal9W8NH/Zc+3AB8Ayj77m6sjLWV9pkYEr2/IZFdlpa6AsZd6e
 pOpDWgeS0M7PCZZ6FOVK1Bdf/rxkqZ0sJlcMMkzSZ7W0dUiq16JfHDsc6PR7eVXveFNe
 dRotihWm3w1OpoUAPRc4tFBJ8/IWJZ3CN3yIAVtXKzkZQyHFRWfEDwuin9YpW6POg8M0
 MLymKUjc5oGfASq/jbw9vixiQfJ7ML0QBqqdxufKD71R0i6RlybxHaRe95NRwnnPgYj9 hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qetbda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:36 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A2JxJ9i023090;
 Tue, 2 Nov 2021 20:11:36 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c35qetbcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:36 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A2K2knu010951;
 Tue, 2 Nov 2021 20:11:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3c0wpaq4me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 20:11:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A2KBV5R3342870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Nov 2021 20:11:31 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1A4BA4062;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD7C9A405B;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Nov 2021 20:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 7BBAFE2136; Tue,  2 Nov 2021 21:11:30 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [RFC PATCH v2 1/2] Temporary linux-headers update
Date: Tue,  2 Nov 2021 21:11:21 +0100
Message-Id: <20211102201122.3188108-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102201122.3188108-1-farman@linux.ibm.com>
References: <20211102201122.3188108-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: TGxvcxuvDS8NPKzeURleZY9YD-w-AK17
X-Proofpoint-GUID: B6QGuAxcFzC4UUssfvl5n-fKDPlV1po8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1011 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111020106
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be replaced with ./scripts/update-linux-headers.sh

But this is enough for the RFC.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..b70b3b3148 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1112,6 +1112,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_S390_USER_SIGP_BUSY 206
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2004,4 +2005,7 @@ struct kvm_stats_desc {
 
 #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
 
+/* Available with KVM_CAP_S390_USER_SIGP_BUSY */
+#define KVM_S390_VCPU_RESET_SIGP_BUSY       _IO(KVMIO, 0xcf)
+
 #endif /* __LINUX_KVM_H */
-- 
2.25.1


