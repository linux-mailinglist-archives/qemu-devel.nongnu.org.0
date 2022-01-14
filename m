Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA748E516
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 08:58:11 +0100 (CET)
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8HTM-0000go-W6
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 02:58:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUy-0007i5-7k
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1n8GUs-0007Wr-H6
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 01:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642143332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17YLqj/s+D8vD82SzPimJoIWA+Z8SO5x4Ma5QCb2xHc=;
 b=eCyB1opuaXqY8sKu4l3XGmOY+973ymkJTv1t1F3VH5vayXCPbeCfYU7oj9lJe887Xu439x
 Xq8vg0z6mtNRjAxtBYTd4ukXdXIcosAYL2Rsl1WReah7DZVvyE6zkJf/eE+00AGfUctasP
 S9sXrWDut+BHJ6+sLiy4i+xd+Ef+GxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-IAdmZuhxPCGVfJFrQV67iQ-1; Fri, 14 Jan 2022 01:55:27 -0500
X-MC-Unique: IAdmZuhxPCGVfJFrQV67iQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EE0A101AFC0;
 Fri, 14 Jan 2022 06:55:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 019334EC8A;
 Fri, 14 Jan 2022 06:55:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 48FB1180084D; Fri, 14 Jan 2022 07:53:27 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/20] edid: Added support for 4k@60 Hz monitor
Date: Fri, 14 Jan 2022 07:53:21 +0100
Message-Id: <20220114065326.782420-16-kraxel@redhat.com>
In-Reply-To: <20220114065326.782420-1-kraxel@redhat.com>
References: <20220114065326.782420-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Satyeshwar Singh <satyeshwar.singh@intel.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Satyeshwar Singh <satyeshwar.singh@intel.com>

Previously, the large modes (>1080p) that were generated by Qemu in its EDID
were all 50 Hz. If we provide them to a Guest OS and the user selects
one of these modes, then the OS by default only gets 50 FPS. This is
especially true for Windows OS. With this patch, we are now exposing a
3840x2160@60 Hz which will allow the guest OS to get 60 FPS.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Satyeshwar Singh <satyeshwar.singh@intel.com>
Message-Id: <20211116221103.27128-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/edid-generate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 6f5ac6a38ad8..bccf32af69ce 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -24,6 +24,9 @@ static const struct edid_mode {
     { .xres = 2048,   .yres = 1152 },
     { .xres = 1920,   .yres = 1080,   .dta =  31 },
 
+    /* dea/dta extension timings (all @ 60 Hz) */
+    { .xres = 3840,   .yres = 2160,   .dta =  97 },
+
     /* additional standard timings 3 (all @ 60Hz) */
     { .xres = 1920,   .yres = 1200,   .xtra3 = 10,   .bit = 0 },
     { .xres = 1600,   .yres = 1200,   .xtra3 =  9,   .bit = 2 },
-- 
2.34.1


