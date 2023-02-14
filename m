Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E95B69698F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:32:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyD3-0006eK-Vu; Tue, 14 Feb 2023 11:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCf-0006NJ-Gc; Tue, 14 Feb 2023 11:30:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imbrenda@linux.ibm.com>)
 id 1pRyCc-0001zz-JX; Tue, 14 Feb 2023 11:30:49 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EEjJtA004512; Tue, 14 Feb 2023 16:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UtXAgxa7QBFTnKYIYOXBmUVUQwiIu7sPZ3NSKYPC3p4=;
 b=jo8aXRNoK0LqNcCeln+8u4jcpDml6X1Mbj6S8m+pflA4/2hSFZACCNhPcKWsJCER4PYR
 96R8SRUrL88c9Ry2b58tFMc8xHuzfKGenOo8Vrapkkmgx/AZ8+AYrAswprxBqkIsipHG
 MRm2rVQQXAWrzrvs+i5l/i/UV9PdKsiPSixRr4U5Qk1ac0NEeK+8dNuNdkcqUhcMWlfe
 qoSJhMv/lOI7AtkQ65zU7fN7TPB6wlRadFLjBZTJq0oVBwmQauJ4zPHHWVCbBQhT1V6M
 Tlw764Id9ZlGivfrzJHrz0LsHEg09IWt/JiJZRHzECPzs2D97syyIon3jrvB3GD40l1j zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nran070cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:42 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31EGSZbC010879;
 Tue, 14 Feb 2023 16:30:42 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nran070b5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31E6HCDh007478;
 Tue, 14 Feb 2023 16:30:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3np29fb543-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Feb 2023 16:30:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31EGUaMp37945654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Feb 2023 16:30:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8838C20040;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45E982004D;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
Received: from p-imbrenda.boeblingen.de.ibm.com (unknown [9.152.224.56])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 14 Feb 2023 16:30:36 +0000 (GMT)
From: Claudio Imbrenda <imbrenda@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, david@redhat.com, thuth@redhat.com,
 borntraeger@de.ibm.com, frankja@linux.ibm.com, pasic@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, seiden@linux.ibm.com
Subject: [PATCH v3 1/2] Linux header update
Date: Tue, 14 Feb 2023 17:30:34 +0100
Message-Id: <20230214163035.44104-2-imbrenda@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214163035.44104-1-imbrenda@linux.ibm.com>
References: <20230214163035.44104-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KJ4MzN2vgRlcZLnNGyGWstgMxVTVt20D
X-Proofpoint-GUID: Gf2RFmeN5F2W8XEbwM-AaI1o0-pBUrrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_11,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140133
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=imbrenda@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Update kvm.h Linux header with these commits:

8c516b25d6e9 ("KVM: s390: pv: add KVM_CAP_S390_PROTECTED_ASYNC_DISABLE")
fb491d5500a7 ("KVM: s390: pv: asynchronous destroy for reboot")

Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
---
 linux-headers/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index ebdafa576d..122b273433 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1175,6 +1175,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_VM_DISABLE_NX_HUGE_PAGES 220
 #define KVM_CAP_S390_ZPCI_OP 221
 #define KVM_CAP_S390_CPU_TOPOLOGY 222
+#define KVM_CAP_S390_PROTECTED_ASYNC_DISABLE 224
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1737,6 +1738,8 @@ enum pv_cmd_id {
 	KVM_PV_UNSHARE_ALL,
 	KVM_PV_INFO,
 	KVM_PV_DUMP,
+	KVM_PV_ASYNC_CLEANUP_PREPARE,
+	KVM_PV_ASYNC_CLEANUP_PERFORM,
 };
 
 struct kvm_pv_cmd {
-- 
2.39.1


