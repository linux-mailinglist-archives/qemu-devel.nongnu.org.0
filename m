Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD5700841
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:42:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS5A-0007jD-MP; Fri, 12 May 2023 08:41:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS58-0007iB-2P
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS56-0006aO-FY
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Swl9UtyzMhyVX2XP6pu5/NXIfZKlQCEnebl2D8xEnBM=;
 b=P50EV+DbpJd444v5Px7Q2KUBMCvWOohmqPpDXtAsavr8XwFecQ8319s98rytBTESj0g/RA
 qnvAkM8FNav6odBTXupkPZ4iO0Ls+b+2W3XzfIBfQfKIRDyYHoJr1QQMxPSzy69Ind65Iz
 F07gR5y28+BphiJ+tpgQuWWOw/GcQoQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-RaTq_wLbPb-IPAl06OAXbA-1; Fri, 12 May 2023 08:41:04 -0400
X-MC-Unique: RaTq_wLbPb-IPAl06OAXbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77478037A8;
 Fri, 12 May 2023 12:41:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C61081121314;
 Fri, 12 May 2023 12:41:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/18] tests/qtest/meson.build: Run the net filter tests only
 with default devices
Date: Fri, 12 May 2023 14:40:31 +0200
Message-Id: <20230512124033.502654-17-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

These tests rely on a default NIC to be available. Skip them if we
used the "--without-default-devices" configure option.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/meson.build | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 48cd35b5b2..8fec3103b5 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -35,9 +35,9 @@ qtests_cxl = \
   (config_all_devices.has_key('CONFIG_CXL') ? ['cxl-test'] : [])
 
 qtests_filter = \
-  (slirp.found() ? ['test-netfilter'] : []) + \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
+  (get_option('default_devices') and slirp.found() ? ['test-netfilter'] : []) + \
+  (get_option('default_devices') and config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) + \
+  (get_option('default_devices') and config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : [])
 
 qtests_i386 = \
   (slirp.found() ? ['pxe-test'] : []) + \
@@ -221,9 +221,7 @@ qtests_aarch64 = \
    'migration-test']
 
 qtests_s390x = \
-  (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                         \
-  (config_host.has_key('CONFIG_POSIX') ? ['test-filter-redirector'] : []) +                     \
+  qtests_filter + \
   ['boot-serial-test',
    'drive_del-test',
    'device-plug-test',
-- 
2.31.1


