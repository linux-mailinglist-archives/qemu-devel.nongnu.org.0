Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7744D4A5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 11:04:08 +0100 (CET)
Received: from localhost ([::1]:59518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml6wA-0004lq-So
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 05:04:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6ty-0002TE-Mu
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:48550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1ml6tx-0000oO-1A
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 05:01:50 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9gpjI023199; 
 Thu, 11 Nov 2021 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Iha37tuMx1rP44+PH7IxlD2uRV+srxcSMimsr40vZnk=;
 b=B2pXgDYtZattBCdnKvPN1TmUQa4WFkZwA96H82nqSpYRpf5JlMuLdlXt+fsSjPRq50AN
 Q2yBWhP1lhRg1B4u03VuTuG3eKllKyTYr0EQrVgBL1oMifRrl9WU2R9x50BB5HenwtVx
 l3/IlKNOM9ym2JbCGdgwNM9DzH7BMMjho2uojA8Dx/FatORQxgpD+lpYJodRpFKP1/A2
 2LKQN0btSbOGWzIxtDuPMJ+/MgfP0D0vS3yQZlCWm6z8DFq00O6dq0hyvYfeH2GezNGZ
 IfhNka9xD1uB5+mIUNCHsK/YM3Ye6XVFbJFoZ5qZxbhnpXmCuFVOAfAy0T2tdA1f5Do4 PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c90sp8fxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:45 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AB9iRsU027561;
 Thu, 11 Nov 2021 10:01:44 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c90sp8fx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:44 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB9uwje008659;
 Thu, 11 Nov 2021 10:01:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbdggvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 10:01:43 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ABA12cI26346156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 10:01:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B64F4BE0C3;
 Thu, 11 Nov 2021 10:01:01 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0D75BE07C;
 Thu, 11 Nov 2021 10:01:00 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 10:01:00 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] target/i386/sev: Add kernel hashes only if
 sev-guest.kernel-hashes=on
Date: Thu, 11 Nov 2021 10:00:44 +0000
Message-Id: <20211111100048.3299424-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
References: <20211111100048.3299424-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4mc1jihVpB8ZUNl2EtEUEs3mVypo7ha0
X-Proofpoint-ORIG-GUID: xBolS8HKhe558Erj4q_iCx0JpOxykR-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110056
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
for measured linux boot", 2021-09-30) introduced measured direct boot
with -kernel, using an OVMF-designated hashes table which QEMU fills.

However, if OVMF doesn't designate such an area, QEMU would completely
abort the VM launch.  This breaks launching with -kernel using older
OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.

Fix that so QEMU will only look for the hashes table if the sev-guest
kernel-hashes option is set to on.  Otherwise, QEMU won't look for the
designated area in OVMF and won't fill that area.

To enable addition of kernel hashes, launch the guest with:

    -object sev-guest,...,kernel-hashes=on

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Brijesh Singh <brijesh.singh@amd.com>
---
 target/i386/sev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index cad32812f5..e3abbeef68 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -1223,6 +1223,14 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
     size_t hash_len = HASH_SIZE;
     int aligned_len;
 
+    /*
+     * Only add the kernel hashes if the sev-guest configuration explicitly
+     * stated kernel-hashes=on.
+     */
+    if (!sev_guest->kernel_hashes) {
+        return false;
+    }
+
     if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
         error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
         return false;
-- 
2.25.1


