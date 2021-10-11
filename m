Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA14295B3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:33:03 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzAc-0005jE-4O
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mZz8U-0003gq-Up
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:30:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mZz8Q-0001sg-7J
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:30:50 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BHE5wt015997; 
 Mon, 11 Oct 2021 13:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xqrOaB1tSQt8ScnXdwklRnDgayqblurglwANibrXrLc=;
 b=lHeUx9AQxYuqHsOdzig2pBi0aMosh1cDvvb8a+jQitwiiJ8F4Juogg1S8bBKTjmijiWS
 sDkxCcbHF/703NLLhKMzmDRQ3GWM1OQX+7Fl12ddWp3Au5mejOq7bulF8jml5qNYMFvu
 cwvlWk+TT8s8KBtWoSNUT7feWTNDp7E9msPHl2fUVguOfDZdIMAIX+PrF4kV4jxuyaLr
 g2TVo4vRN9H4yTW2jrpku0mpjZ1PWvaOBzHFpuDYrA2rcVTFybpgjVrL2wMrktLzIPEf
 uQLvGwnP/VJht5lc6Tn7SabYuCsz2EIawwrKfoFeBQu121GV8RoX9C3DBkMmddmeUsqO 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmfsuevcy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:30:40 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19BH0fkl018572;
 Mon, 11 Oct 2021 13:30:40 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bmfsuevcj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 13:30:40 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19BHDHI2015584;
 Mon, 11 Oct 2021 17:30:39 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 3bk2qahs4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:30:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19BHUbeh15270208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 17:30:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2A867805E;
 Mon, 11 Oct 2021 17:30:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E177807C;
 Mon, 11 Oct 2021 17:30:37 +0000 (GMT)
Received: from amdrome3.watson.ibm.com (unknown [9.2.130.16])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Oct 2021 17:30:37 +0000 (GMT)
From: Dov Murik <dovmurik@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/i386/sev: Use local variable for
 kvm_sev_launch_measure
Date: Mon, 11 Oct 2021 17:30:26 +0000
Message-Id: <20211011173026.2454294-3-dovmurik@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
References: <20211011173026.2454294-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gMLg5R0XBhdnOr3jVY-KeGJge-Twww9h
X-Proofpoint-ORIG-GUID: GbEoxtjeZY7vP2tuM_7tGeASMDupvXIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-11_05,2021-10-11_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
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

The struct kvm_sev_launch_measure has a constant and small size, and
therefore we can use a regular local variable for it instead of
allocating and freeing heap memory for it.

Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
---
 target/i386/sev.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 0062566c71..eede07f11d 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -729,7 +729,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     SevGuestState *sev = sev_guest;
     int ret, error;
     g_autofree guchar *data = NULL;
-    g_autofree struct kvm_sev_launch_measure *measurement = NULL;
+    struct kvm_sev_launch_measure measurement = {};
 
     if (!sev_check_state(sev, SEV_STATE_LAUNCH_UPDATE)) {
         return;
@@ -743,23 +743,21 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
         }
     }
 
-    measurement = g_new0(struct kvm_sev_launch_measure, 1);
-
     /* query the measurement blob length */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
-                    measurement, &error);
-    if (!measurement->len) {
+                    &measurement, &error);
+    if (!measurement.len) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
         return;
     }
 
-    data = g_new0(guchar, measurement->len);
-    measurement->uaddr = (unsigned long)data;
+    data = g_new0(guchar, measurement.len);
+    measurement.uaddr = (unsigned long)data;
 
     /* get the measurement blob */
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_MEASURE,
-                    measurement, &error);
+                    &measurement, &error);
     if (ret) {
         error_report("%s: LAUNCH_MEASURE ret=%d fw_error=%d '%s'",
                      __func__, ret, error, fw_error_to_str(errno));
@@ -769,7 +767,7 @@ sev_launch_get_measure(Notifier *notifier, void *unused)
     sev_set_guest_state(sev, SEV_STATE_LAUNCH_SECRET);
 
     /* encode the measurement value and emit the event */
-    sev->measurement = g_base64_encode(data, measurement->len);
+    sev->measurement = g_base64_encode(data, measurement.len);
     trace_kvm_sev_launch_measurement(sev->measurement);
 }
 
-- 
2.25.1


