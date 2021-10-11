Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B024295B4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:33:04 +0200 (CEST)
Received: from localhost ([::1]:60248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzAd-0005js-7R
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mZz8V-0003h1-0O
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:30:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:47128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mZz8Q-0001sa-7E
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:30:50 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BH1ViR015159; 
 Mon, 11 Oct 2021 13:30:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6h4YUhheiyP8tOEI/uuPv2pnBxI4mnmenVPhwuGLJXo=;
 b=qRqM0xVS+3F/9Akv1D6ffNYgtCeFcXnLQFtPnetterCwCe6mSXY3LlVWoP2btwRcT7U1
 Bq7uM1pbbLBXVvq/qJk6iDdBqGRoPQe33IA7sXYR2Z03PcoUPGuzl0DYwMiBDZiRdZW2
 XY3kEQB5TeyJIbnG/AWeBERIrHk3LaXrdin90Z7Fb24XU5wX287bM55nvUWgi0Er9sgW
 fGJvPvNTCT8QbdCS1RBWmJ5oPzre6cZSO9zt2khjbK7HyetitOoRCubpsZZOVV87rGV+
 BGOelatmwQ19xUQRmo9bYadF2NuXCieh/B3XDTDUBFV9NvqOK99wAKK+4Dt5K+mNmkeM Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmsa9rhc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:30:40 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19BHUdaf009210;
 Mon, 11 Oct 2021 13:30:39 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmsa9rhbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:30:39 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BHDFQA003417;
 Mon, 11 Oct 2021 17:30:38 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3bk2qahuvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:30:38 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19BHUb8f27656452
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 17:30:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E51978077;
 Mon, 11 Oct 2021 17:30:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DF9678060;
 Mon, 11 Oct 2021 17:30:36 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 17:30:36 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/i386/sev: Use local variable for
 kvm_sev_launch_start
Date: Mon, 11 Oct 2021 17:30:25 +0000
Message-Id: <20211011173026.2454294-2-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
References: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YVtFCr6Nmmym2_vUeNbrGvNRghJSs_Mr
X-Proofpoint-ORIG-GUID: Od0NqgnUzM8ommii7bvlg0h1GaFGKxbw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_06,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110101
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The struct kvm_sev_launch_start has a constant and small size, and
therefore we can use a regular local variable for it instead of
allocating and freeing heap memory for it.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4c64c68244..0062566c71 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -647,31 +647,29 @@ sev_launch_start(SevGuestState *sev)
     gsize sz;
     int ret = 1;
     int fw_error, rc;
-    struct kvm_sev_launch_start *start;
+    struct kvm_sev_launch_start start = {
+        .handle = sev->handle, .policy = sev->policy
+    };
     guchar *session = NULL, *dh_cert = NULL;
 
-    start = g_new0(struct kvm_sev_launch_start, 1);
-
-    start->handle = sev->handle;
-    start->policy = sev->policy;
     if (sev->session_file) {
         if (sev_read_file_base64(sev->session_file, &session, &sz) < 0) {
             goto out;
         }
-        start->session_uaddr = (unsigned long)session;
-        start->session_len = sz;
+        start.session_uaddr = (unsigned long)session;
+        start.session_len = sz;
     }
 
     if (sev->dh_cert_file) {
         if (sev_read_file_base64(sev->dh_cert_file, &dh_cert, &sz) < 0) {
             goto out;
         }
-        start->dh_uaddr = (unsigned long)dh_cert;
-        start->dh_len = sz;
+        start.dh_uaddr = (unsigned long)dh_cert;
+        start.dh_len = sz;
     }
 
-    trace_kvm_sev_launch_start(start->policy, session, dh_cert);
-    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, start, &fw_error);
+    trace_kvm_sev_launch_start(start.policy, session, dh_cert);
+    rc = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_START, &start, &fw_error);
     if (rc < 0) {
         error_report("%s: LAUNCH_START ret=%d fw_error=%d '%s'",
                 __func__, ret, fw_error, fw_error_to_str(fw_error));
@@ -679,11 +677,10 @@ sev_launch_start(SevGuestState *sev)
     }
 
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_UPDATE);
-    sev->handle = start->handle;
+    sev->handle = start.handle;
     ret = 0;
 
 out:
-    g_free(start);
     g_free(session);
     g_free(dh_cert);
     return ret;
-- 
2.25.1


