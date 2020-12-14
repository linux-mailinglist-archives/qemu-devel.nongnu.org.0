Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3C2D9290
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:22:37 +0100 (CET)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kogJg-0004xv-9z
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogCs-0004uV-O7
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:15:34 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:37208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1kogCp-0007B4-R9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 00:15:34 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5ELdc007117;
 Mon, 14 Dec 2020 05:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2020-01-29;
 bh=VCdYtK1ET7waxmDv11zNiOqBsntP1da/gUHvLAmItp8=;
 b=C/aWdLmvELE7Y2FBmAulbBDbaRyJymqt7mekWSxI2o/3EqCnvhAo/N7JygBxg0Z9xQzL
 gtC64VSPQqACI4Zaj+YMGAjPcxP38kgL65sY91mDJcKEcdgCyRcflwh3qHpnpKUTDqr9
 lrfhgwt7rmwcgMGuJLnoz+2uWaxF5bcaxzyex9OGZfqwwCgAorNVF6nR2Sd5QzI/4A4b
 FqFiqBJEcIfDTvk78k6QYeAqsk/4Vs+mYYxelLWw8GYMKr//y+D5Bod4yTTn8IUvpIRg
 qz3c0gIo0neEyeLWmChYe186qnMNu+VNqLbE20EtDuk5UizafyDETQFbQ7uNR+cXMKrC hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35cn9r3cdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 05:15:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BE5Aopi184389;
 Mon, 14 Dec 2020 05:15:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35d7rw1nfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Dec 2020 05:15:18 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BE5FGff019047;
 Mon, 14 Dec 2020 05:15:16 GMT
Received: from jaraman-bur-1.us.oracle.com (/10.152.33.39)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sun, 13 Dec 2020 21:15:15 -0800
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 04/19] multi-process: Add config option for multi-process
 QEMU
Date: Mon, 14 Dec 2020 00:14:44 -0500
Message-Id: <e0c502ea36e6548e33b0c016391980b01ecacab6.1607922214.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
In-Reply-To: <cover.1607922214.git.jag.raman@oracle.com>
References: <cover.1607922214.git.jag.raman@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9834
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012140040
Received-SPF: pass client-ip=156.151.31.86; envelope-from=jag.raman@oracle.com;
 helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a configuration option to separate multi-process code

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 accel/Kconfig     | 1 +
 hw/Kconfig        | 1 +
 hw/remote/Kconfig | 3 +++
 3 files changed, 5 insertions(+)
 create mode 100644 hw/remote/Kconfig

diff --git a/accel/Kconfig b/accel/Kconfig
index 2ad94a3..3b6ce5a 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -3,6 +3,7 @@ config TCG
 
 config KVM
     bool
+    select MULTIPROCESS
 
 config XEN
     bool
diff --git a/hw/Kconfig b/hw/Kconfig
index 5ad3c6b..525fb52 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -27,6 +27,7 @@ source pci-host/Kconfig
 source pcmcia/Kconfig
 source pci/Kconfig
 source rdma/Kconfig
+source remote/Kconfig
 source rtc/Kconfig
 source scsi/Kconfig
 source sd/Kconfig
diff --git a/hw/remote/Kconfig b/hw/remote/Kconfig
new file mode 100644
index 0000000..5484446
--- /dev/null
+++ b/hw/remote/Kconfig
@@ -0,0 +1,3 @@
+config MULTIPROCESS
+    bool
+    depends on PCI && KVM
-- 
1.8.3.1


