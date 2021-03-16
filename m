Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112BA33D5F1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:40:40 +0100 (CET)
Received: from localhost ([::1]:59134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAsB-0005M2-0u
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApy-0003e8-V8
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApw-0002AZ-U5
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeghCcWJCEe+UCS0TAiCXU0ML+ql8ypkHN4QX9BicnE=;
 b=OVsNYg/RA9fg0MkiCD+RlJj37oE2MFl/0dTguaUPzMiRHxNNyK1GyfuywYddH3Z0nMvc7o
 ySUaRhvvb94PKb2wXLmS4zQysGs8Sg5hcn/HIXJ4qYNBvruwfZ8908TMTNz5UY8rcdFsaV
 y+7KicsV5q8GB1vGr5Qy3CLbGgZiF50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-XWHa-iFuO1OOJrcFR-gbCQ-1; Tue, 16 Mar 2021 10:38:18 -0400
X-MC-Unique: XWHa-iFuO1OOJrcFR-gbCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C0AA800FF0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC765DEAD;
 Tue, 16 Mar 2021 14:38:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6254E180062B; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] edid: use dta extension block descriptors
Date: Tue, 16 Mar 2021 15:38:07 +0100
Message-Id: <20210316143812.2363588-5-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the 4 descriptors in the base edid block are filled, jump to the
dta extension block.  This allows for more than four descriptors.
Happens for example when generating an edid blob with a serial number
(qemu-edid -s $serial).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 259ef7315217..489532c3bc5f 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -151,6 +151,14 @@ static uint8_t *edid_desc_next(uint8_t *edid, uint8_t *dta, uint8_t *desc)
     if (desc + 18 + 18 < edid + 127) {
         return desc + 18;
     }
+    if (dta) {
+        if (desc < edid + 127) {
+            return dta + dta[2];
+        }
+        if (desc + 18 + 18 < dta + 127) {
+            return desc + 18;
+        }
+    }
     return NULL;
 }
 
-- 
2.30.2


