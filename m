Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028023AC2BA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:03:15 +0200 (CEST)
Received: from localhost ([::1]:35030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6ew-0007SF-1x
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:03:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YJ-00072F-MU
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6YG-00054O-8Y
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vDpDkSx1b3J6gR9ItdyzC5/KHLDeG5cQIVbLs9NVWFg=;
 b=JB/+opp6FEfivfEtKCpcCRb9i5A8u5SnrVVrRoJnyS6YVkr46SQ0IpfZmcmtPRPR0Uit8N
 2qdOtrEfHMMQhGTTseAE0lAuJobWMSaKa+Zp9JaO+j5GuBknwZ2xE9A7gxrRryTCY7WGIL
 zjo/34J/Ca5nM4dmWE0tFE3CO074cXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-C5INigWWNKGVZEjVvVqsyw-1; Fri, 18 Jun 2021 00:56:18 -0400
X-MC-Unique: C5INigWWNKGVZEjVvVqsyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02974818401;
 Fri, 18 Jun 2021 04:56:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E273060E3A;
 Fri, 18 Jun 2021 04:56:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 256BE1803550; Fri, 18 Jun 2021 06:53:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/24] accel: build qtest modular
Date: Fri, 18 Jun 2021 06:53:51 +0200
Message-Id: <20210618045353.2510174-23-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow building accelerators as module.
Start with qtest as first user.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/qtest/meson.build | 8 ++------
 meson.build             | 6 ++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/accel/qtest/meson.build b/accel/qtest/meson.build
index a2f327645980..4c6560029336 100644
--- a/accel/qtest/meson.build
+++ b/accel/qtest/meson.build
@@ -1,6 +1,2 @@
-qtest_ss = ss.source_set()
-qtest_ss.add(files(
-  'qtest.c',
-))
-
-specific_ss.add_all(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'], if_true: qtest_ss)
+qtest_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_POSIX'],
+                    if_true: files('qtest.c'))
diff --git a/meson.build b/meson.build
index e822477a231a..8f55f563eefe 100644
--- a/meson.build
+++ b/meson.build
@@ -1780,6 +1780,9 @@ trace_ss = ss.source_set()
 user_ss = ss.source_set()
 util_ss = ss.source_set()
 
+# accel modules
+qtest_module_ss = ss.source_set()
+
 modules = {}
 target_modules = {}
 hw_arch = {}
@@ -2018,6 +2021,9 @@ specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
 subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
 
+# accel modules
+target_modules += { 'accel' : { 'qtest': qtest_module_ss }}
+
 ########################
 # Library dependencies #
 ########################
-- 
2.31.1


