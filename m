Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF74BF2A2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 08:27:09 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMPZi-0006EL-P3
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 02:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMPSH-0000OX-BI
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:19:30 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMPSB-0002GS-8E
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 02:19:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M6foWS006869; 
 Tue, 22 Feb 2022 07:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KjcSbuz0VasmKcLIWy/HLnsmkFTZgObfaKU4XPWBZjM=;
 b=hOJI6bbWDG9B6TyuXTwD3fev/nl0onYSjZM8qjCbTXsRyFHV7HLN80yXd0XcqxVKoVjz
 ISuOxIJwxAzAJTKCulm/K5+DbnDu4ATtwH8+SxH8cMuDYuCR16tBQNf4bSf/SxCSXOso
 X0wqXVCkVI3H+f9QPShgFFNJHcZlUquKe5g0WpXcJctSwimmF/hJEvoFbDkAKp9z3xU4
 OZ6EyL4qWz+QlbHpJFBManJwhmpDDpmSi3PzYv5T5XTSlzE/Bftr6EJECJrBau7kt0j4
 1tB6rub/KYbt62LwEm7YFVUwWn/3TibP0FkegTdPjceJoG/V4NWWszE6nfSiycUUaJOy yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ectsq8rdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:13 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21M7Al67013478;
 Tue, 22 Feb 2022 07:19:12 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ectsq8rd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:12 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21M7DJ0d011909;
 Tue, 22 Feb 2022 07:19:11 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3ear69mdup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 07:19:11 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21M7JAwM33816842
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 07:19:10 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5EC7112071;
 Tue, 22 Feb 2022 07:19:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B16BA112063;
 Tue, 22 Feb 2022 07:19:09 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 22 Feb 2022 07:19:09 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] hw/i386: OVMF table parsing fixes
Date: Tue, 22 Feb 2022 07:19:04 +0000
Message-Id: <20220222071906.2632426-1-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ONheUscvTJ_QBQGM9YlxMAVxZ5kYwNW3
X-Proofpoint-ORIG-GUID: GmTOfMVH0AR9MHs03Jjt44zMnowzJkUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220040
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix missing bounds check when parsing the OVMF table.

This already had two iterations as a single patch; I decided to split it
to two patches.  The first deals only with bounds checking, and the
second is a non-functional change to clear the code according to
reviewers' suggestions.

v3:
- simplify bounds check and remove max_tot_len (thanks Dave)
- split one patch to two

v2:
- add error message example to commit description
- replace magic numbers 48 and 50 with size calculations (thanks Phil
  MD)

Dov Murik (2):
  hw/i386: Improve bounds checking in OVMF table parsing
  hw/i386: Replace magic number with field length calculation

 hw/i386/pc_sysfw_ovmf.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)


base-commit: 477c3b934a47adf7de285863f59d6e4503dd1a6d
-- 
2.25.1


