Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C627E7AF
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Sep 2020 13:33:00 +0200 (CEST)
Received: from localhost ([::1]:60146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNaLz-0005Ag-9e
	for lists+qemu-devel@lfdr.de; Wed, 30 Sep 2020 07:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNaIP-0002aV-TS
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 07:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNaIN-0003ri-JC
 for qemu-devel@nongnu.org; Wed, 30 Sep 2020 07:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601465354;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yMBmbg7SUQKRbE0citzPb/yjsoHzYvKjWAcF04LGDBE=;
 b=XurpB163cnZzdKtWwiXhFn0XspdAFf6mxFj0+ikYCntRg0qgNK4W7jIi6HJB8DxmDIMDgL
 Ln8Z7pYWmD/VCHq1Sxo1KwAn/WkCLw08TyjolFac5Tcv2WOiBQyIXKaktVsePZNRX2WOQm
 FzyE50k4dnLtkcGzEbLl9HdTqoRTvMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-VQKvsWsuOyuyanJAIxhRtQ-1; Wed, 30 Sep 2020 07:29:12 -0400
X-MC-Unique: VQKvsWsuOyuyanJAIxhRtQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A80A1DE04
 for <qemu-devel@nongnu.org>; Wed, 30 Sep 2020 11:29:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDD5210013C4;
 Wed, 30 Sep 2020 11:29:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CCFF9A8F; Wed, 30 Sep 2020 13:29:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/6] chardev/spice: make qemu_chr_open_spice_port static
Date: Wed, 30 Sep 2020 13:29:00 +0200
Message-Id: <20200930112904.24397-3-kraxel@redhat.com>
In-Reply-To: <20200930112904.24397-1-kraxel@redhat.com>
References: <20200930112904.24397-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/chardev/spice.h | 3 ---
 chardev/spice.c         | 8 ++++----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/chardev/spice.h b/include/chardev/spice.h
index 99f26aedde54..1115502cdfbd 100644
--- a/include/chardev/spice.h
+++ b/include/chardev/spice.h
@@ -24,7 +24,4 @@ typedef struct SpiceChardev SpiceChardev;
 DECLARE_INSTANCE_CHECKER(SpiceChardev, SPICE_CHARDEV,
                          TYPE_CHARDEV_SPICE)
 
-void qemu_chr_open_spice_port(Chardev *chr, ChardevBackend *backend,
-                              bool *be_opened, Error **errp);
-
 #endif
diff --git a/chardev/spice.c b/chardev/spice.c
index bf7ea1e2940d..051c23a84f4c 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -296,10 +296,10 @@ static void qemu_chr_open_spice_vmc(Chardev *chr,
     chr_open(chr, type);
 }
 
-void qemu_chr_open_spice_port(Chardev *chr,
-                              ChardevBackend *backend,
-                              bool *be_opened,
-                              Error **errp)
+static void qemu_chr_open_spice_port(Chardev *chr,
+                                     ChardevBackend *backend,
+                                     bool *be_opened,
+                                     Error **errp)
 {
     ChardevSpicePort *spiceport = backend->u.spiceport.data;
     const char *name = spiceport->fqdn;
-- 
2.27.0


