Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53780542094
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:06:31 +0200 (CEST)
Received: from localhost ([::1]:43416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyk9V-0003TC-TZ
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3n-00087i-S7
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:1544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3m-0005yh-Ae
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:35 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2580TuE9015664;
 Wed, 8 Jun 2022 01:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5pjof+oJL2MjR94JVpYN65psJWzGKN6tyJpYBMyq2BE=;
 b=bU6PzxbrESerOXBWGK6feygpAMj7xnm8I4dEzRQcPK+ov0gSxvgz6tu31YAwC47FMVo1
 Esr3GKu9VdzFykltL7GhE79akr6Hw/axHEaEv7DAFZEOxrRi14MMA5g+Qv05AL/TFJQ4
 07GYnmXFeKXfo/IxXh4nQFGH6vyGrfTsIdPjm3Lhigdl7BaNOOA9rl+CRvVlM/eV4uzj
 pHg8pKrHHGaK+krWvp+IBO2n2kVboG3NIoVChRt0vAxFdnjh8iCvQa4sF1dfhYGKDYYL
 wgDrIlMRgg+IS6V7gPrkks5vM9iSvIkhA2cv/kafapDZoS2DzJ6Nstb1Cl33Htl06/yM Eg== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjg8esatu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2580ob7g007659;
 Wed, 8 Jun 2022 01:00:26 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3gfy1a5qwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:25 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25810NQr21234002
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jun 2022 01:00:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD425BE056;
 Wed,  8 Jun 2022 01:00:23 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76412BE051;
 Wed,  8 Jun 2022 01:00:23 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jun 2022 01:00:23 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anthony PERARD <anthony.perard@citrix.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL v1 2/2] tpm_crb: mark command buffer as dirty on request
 completion
Date: Tue,  7 Jun 2022 21:00:06 -0400
Message-Id: <20220608010006.2122022-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220608010006.2122022-1-stefanb@linux.ibm.com>
References: <20220608010006.2122022-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pmI21PKpcGmwzVhqmIJK7B8-KZzSTn6k
X-Proofpoint-ORIG-GUID: pmI21PKpcGmwzVhqmIJK7B8-KZzSTn6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080000
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anthony PERARD <anthony.perard@citrix.com>

At the moment, there doesn't seems to be any way to know that QEMU
made modification to the command buffer. This is potentially an issue
on Xen while migrating a guest, as modification to the buffer after
the migration as started could be ignored and not transfered to the
destination.

Mark the memory region of the command buffer as dirty once a request
is completed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20220411144749.47185-1-anthony.perard@citrix.com
---
 hw/tpm/tpm_crb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index aa9c00aad3..67db594c48 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -197,6 +197,7 @@ static void tpm_crb_request_completed(TPMIf *ti, int ret)
         ARRAY_FIELD_DP32(s->regs, CRB_CTRL_STS,
                          tpmSts, 1); /* fatal error */
     }
+    memory_region_set_dirty(&s->cmdmem, 0, CRB_CTRL_CMD_SIZE);
 }
 
 static enum TPMVersion tpm_crb_get_version(TPMIf *ti)
-- 
2.35.3


