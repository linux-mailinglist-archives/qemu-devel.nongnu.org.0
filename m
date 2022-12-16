Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7364E939
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 11:13:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p67hw-0006Ra-9b; Fri, 16 Dec 2022 05:12:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67hu-0006RO-JY
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67ht-0003Dm-6L
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 05:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30j1/r+lLCiHNMK+QxLSU6zJ0uTEAXQJZLTxiZMLmnU=;
 b=CopKguvhuzjLOOhCW858N76Kp3PZdOVqyQknZ/JUEn5W0WX8yZzm+szME+sgeeJgVFMLrh
 4Uq7RDFspHifk+xj+k+kpQbNbZCVOUbU6l0SORQefKQnb9YRUNX41dXyW9wfOFhbslKeVv
 e1HoikCYld7hTBnLVvMZRk7a+kFEJlQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-ukVZfKnJNvO97U8vbpp4Zw-1; Fri, 16 Dec 2022 05:12:39 -0500
X-MC-Unique: ukVZfKnJNvO97U8vbpp4Zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC434858F09;
 Fri, 16 Dec 2022 10:12:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B1E2026D68;
 Fri, 16 Dec 2022 10:12:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E6C401801B2D; Fri, 16 Dec 2022 11:12:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] docs: add no-padding firmware feature
Date: Fri, 16 Dec 2022 11:12:34 +0100
Message-Id: <20221216101234.2202009-3-kraxel@redhat.com>
In-Reply-To: <20221216101234.2202009-1-kraxel@redhat.com>
References: <20221216101234.2202009-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/interop/firmware.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 56814f02b3c0..74f404d745b0 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -191,6 +191,8 @@
 #                  PL011 UART. @verbose-static is mutually exclusive
 #                  with @verbose-dynamic.
 #
+# @no-padding: The (arm/aarch64) firmware images are not padded to 64M.
+#
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
@@ -198,7 +200,8 @@
              'amd-sev', 'amd-sev-es', 'amd-sev-snp',
              'intel-tdx',
              'enrolled-keys', 'requires-smm', 'secure-boot',
-             'verbose-dynamic', 'verbose-static' ] }
+             'verbose-dynamic', 'verbose-static',
+             'no-padding' ] }
 
 ##
 # @FirmwareFlashFile:
-- 
2.38.1


