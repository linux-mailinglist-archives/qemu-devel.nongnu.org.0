Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EEF3B7D0D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 07:48:05 +0200 (CEST)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyT4u-0004gw-OT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 01:48:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3Y-0002fZ-Ue
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:41 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lyT3R-0002Xp-Ku
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 01:46:40 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15U5Y1Al004645; Wed, 30 Jun 2021 01:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=2fy3IZSdFTkHimwahuhLENPzHgemfdnfMUQrl3Nou84=;
 b=JkO7AFAD5K8I6WMXjRjVOGOf4PC29X8IqM3RuziqG785TMMjAwQiVmAOl0XQIXNTLaXS
 DWDn14ZO39xtWdvmYnNQCNzKjodf8HJJHY3tTGL5ZpKFakwRa9KCY2sswSyDc6qLAKFB
 vWGfULnLvYRJ1XmhbzqBI0T3EDeom+J3sMFAlx8QQNuXYhFa/OD0uCcsGFVhabhOHDtQ
 BqaH8DAUZU63XXVVA/3T5RHhRMsvDwY3KpCwFbN7fr2N1Izny5K7iiAI/6+SZqGvpnz1
 McqhdZ8i9cz0XpbOOxsO9uDPSdrV6/0gE7V6UocYyBkQ2NiIH3OzCUTJl3ccSxXX55tr Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gj9dgjvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:29 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15U5YjqW006439;
 Wed, 30 Jun 2021 01:46:28 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gj9dgjvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 01:46:28 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15U5cMfu024857;
 Wed, 30 Jun 2021 05:46:27 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 39duvce2s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 05:46:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15U5kQb525494006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 05:46:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3EE8C6069;
 Wed, 30 Jun 2021 05:46:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D89D2C605B;
 Wed, 30 Jun 2021 05:46:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.2.130.16])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 05:46:25 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] hw/i386/pc: Clarify pc_system_ovmf_table_find usage
Date: Wed, 30 Jun 2021 05:46:23 +0000
Message-Id: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ooHUQlDhsq6eZlG5Tkp2dvAnosaYf-B7
X-Proofpoint-ORIG-GUID: 40AlVaXNyG2zQtB904XTrw-O9QbPRf_8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-29_15:2021-06-29,
 2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=809 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300034
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add assertion to verify that the flash was parsed (looking for the OVMF table),
and add documentation for pc_system_ovmf_table_find.

Dov Murik (2):
  hw/i386/pc: pc_system_ovmf_table_find: Assert that flash was parsed
  hw/i386/pc: Document pc_system_ovmf_table_find

 hw/i386/pc_sysfw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

-- 
2.25.1


