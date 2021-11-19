Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABB2457850
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 22:46:37 +0100 (CET)
Received: from localhost ([::1]:38514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moBiO-0006kQ-Ay
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 16:46:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBfX-0005F5-JV; Fri, 19 Nov 2021 16:43:39 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1moBfV-00070h-Nv; Fri, 19 Nov 2021 16:43:39 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJL7ZhC027180; 
 Fri, 19 Nov 2021 21:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=gqvWpXeGL+0F3m4uXdrT8PMCnHD5VQOIvUV6rxmJDQw=;
 b=Mrjc+tiWN/N1h1znmbVgUts9Qkxi75oehZS08TxVk45OHlKfhbqruvsK1cNowkOEadal
 yol1slA00F7rvschr1kKjeV9LMx4aVHDWDAQHfOxQ+k6mfeQDX7EoXwBqZPB4MOFtlSB
 8e+WdeYJwVkb+zcRAe5j6Wj90YKonwSSj93YnTTvZHI8AOMFzLcwrOqaO+3FZzqTllbt
 8DGqzHWlOse7kWDuEpNy9UsYiSpt3yJgNUExlLWQHidlT5WV9Z3dOCcIBQDUzeKic3Yn
 LDE4MSCxsz8amdmAKS1oG/VhG/1UpErVy0vG5CIeNz6+5zeFrjLa/s3GUWAQY7f0tkqA fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cek6jh18v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:34 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AJLcFnq010046;
 Fri, 19 Nov 2021 21:43:34 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cek6jh18k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AJLgAUM010735;
 Fri, 19 Nov 2021 21:43:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50c4mtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Nov 2021 21:43:31 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AJLhSIk28639576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 21:43:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97B6AA405B;
 Fri, 19 Nov 2021 21:43:28 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 847ACA4054;
 Fri, 19 Nov 2021 21:43:28 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 19 Nov 2021 21:43:28 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 34891E128D; Fri, 19 Nov 2021 22:43:28 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v4 1/2] Temporary linux-headers update
Date: Fri, 19 Nov 2021 22:43:26 +0100
Message-Id: <20211119214327.2367026-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119214327.2367026-1-farman@linux.ibm.com>
References: <20211119214327.2367026-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KNVKKXLZ1vFjwtn62psujvl3nrnUbiX0
X-Proofpoint-GUID: rni5sWd50aI_oI7mkXUfJFHsv6iLqjBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-19_15,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111190114
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should be replaced with ./scripts/update-linux-headers.sh

But this is enough for the RFC.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index bcaf66cc4d..7ea19c3c8d 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1112,6 +1112,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_BINARY_STATS_FD 203
 #define KVM_CAP_EXIT_ON_EMULATION_FAILURE 204
 #define KVM_CAP_ARM_MTE 205
+#define KVM_CAP_S390_USER_BUSY 206
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -2004,4 +2005,19 @@ struct kvm_stats_desc {
 
 #define KVM_GET_STATS_FD  _IO(KVMIO,  0xce)
 
+/* Available with KVM_CAP_S390_USER_BUSY */
+#define KVM_S390_USER_BUSY      _IOW(KVMIO, 0xcf, struct kvm_s390_user_busy_info)
+
+#define KVM_S390_USER_BUSY_REASON_SIGP          1
+
+#define KVM_S390_USER_BUSY_FUNCTION_RESET       0
+#define KVM_S390_USER_BUSY_FUNCTION_SET         1
+
+/* FIXME struct description */
+struct kvm_s390_user_busy_info {
+        __u32 reason;
+        __u32 function;
+        __u32 payload;
+};
+
 #endif /* __LINUX_KVM_H */
-- 
2.25.1


