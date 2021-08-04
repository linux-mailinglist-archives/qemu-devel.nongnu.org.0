Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB813E0338
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:31:55 +0200 (CEST)
Received: from localhost ([::1]:54812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHw2-0001e7-QS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsE-0002w7-E0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsA-0003OG-Pl
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:27:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lz3yAVLZsB+UKURKnYlyYxvL4JQUqXeNOsa1h5pg/Og=;
 b=cZfgLy3xvWHVf4xULTudR9HEVS01VxeHlJXYpB1kQfPpuIDM4F48REMjZy1lUpXsu8LTLQ
 YSf0HDcaUKI0srJXyQV8MTnpTtmSO0ElwdREGW/vHOnetaRQAKUVHc3SSQerU/Ua53HEx+
 kzTvPfHkoWF25YoFzopxBJMrvqTLdyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-ID5AoXBSNvavclWve5q84A-1; Wed, 04 Aug 2021 10:27:53 -0400
X-MC-Unique: ID5AoXBSNvavclWve5q84A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3A9892504;
 Wed,  4 Aug 2021 14:27:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A072060BF4;
 Wed,  4 Aug 2021 14:27:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 83185180098B; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] floppy: move cmos_get_fd_drive_type
Date: Wed,  4 Aug 2021 16:27:35 +0200
Message-Id: <20210804142737.3366441-6-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed by pc machine init.

Move to separate source file so we can keep it in core qemu
when building floppy as module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-isa.c    | 25 -------------------------
 hw/block/fdc-module.c | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 36c246efa822..a5a124fb9236 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -162,31 +162,6 @@ static Aml *build_fdinfo_aml(int idx, FloppyDriveType type)
     return dev;
 }
 
-int cmos_get_fd_drive_type(FloppyDriveType fd0)
-{
-    int val;
-
-    switch (fd0) {
-    case FLOPPY_DRIVE_TYPE_144:
-        /* 1.44 Mb 3"5 drive */
-        val = 4;
-        break;
-    case FLOPPY_DRIVE_TYPE_288:
-        /* 2.88 Mb 3"5 drive */
-        val = 5;
-        break;
-    case FLOPPY_DRIVE_TYPE_120:
-        /* 1.2 Mb 5"5 drive */
-        val = 2;
-        break;
-    case FLOPPY_DRIVE_TYPE_NONE:
-    default:
-        val = 0;
-        break;
-    }
-    return val;
-}
-
 static void fdc_isa_build_aml(ISADevice *isadev, Aml *scope)
 {
     Aml *dev;
diff --git a/hw/block/fdc-module.c b/hw/block/fdc-module.c
index 3682b5c1ebd1..7e2aaf86a0c0 100644
--- a/hw/block/fdc-module.c
+++ b/hw/block/fdc-module.c
@@ -98,3 +98,28 @@ FloppyDriveType isa_fdc_get_drive_type(ISADevice *fdc, int i)
 
     return isa->state.drives[i].drive;
 }
+
+int cmos_get_fd_drive_type(FloppyDriveType fd0)
+{
+    int val;
+
+    switch (fd0) {
+    case FLOPPY_DRIVE_TYPE_144:
+        /* 1.44 Mb 3"5 drive */
+        val = 4;
+        break;
+    case FLOPPY_DRIVE_TYPE_288:
+        /* 2.88 Mb 3"5 drive */
+        val = 5;
+        break;
+    case FLOPPY_DRIVE_TYPE_120:
+        /* 1.2 Mb 5"5 drive */
+        val = 2;
+        break;
+    case FLOPPY_DRIVE_TYPE_NONE:
+    default:
+        val = 0;
+        break;
+    }
+    return val;
+}
-- 
2.31.1


