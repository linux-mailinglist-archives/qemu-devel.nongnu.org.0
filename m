Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8787735EF34
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 10:22:41 +0200 (CEST)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWanI-0005ax-KL
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 04:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakJ-0001bM-Uu
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lWakI-0004rK-BP
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 04:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kPusj4Ma0ttzjZG2Q0EjtkPUmQM1pK0r40kAZyvsR+Y=;
 b=MOd5O62f6gE4Pj6WuBvTK/pJF1OX2wSNaoMHFEe55dU+CsyoiyjRKzTre2sh8W28Qh6hep
 f0Q0dnSsSIHuhnXkWHzQL8sNXxSYrfDXp6cEpiPz5OEJC1CnEuwEkK7I+Hr0Gpxg8o3IrZ
 84qxKCRvxkri6jstjW8Z5P7kA0aU1Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-lwN52u8ZNBilZtt3TdcQMQ-1; Wed, 14 Apr 2021 04:19:29 -0400
X-MC-Unique: lwN52u8ZNBilZtt3TdcQMQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1990279EC0;
 Wed, 14 Apr 2021 08:19:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDE85D9CA;
 Wed, 14 Apr 2021 08:19:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 3/5] gitlab-ci.d/crossbuilds: Limit the amount of targets
 in the cross-win64 build
Date: Wed, 14 Apr 2021 10:19:05 +0200
Message-Id: <20210414081907.871437-4-thuth@redhat.com>
In-Reply-To: <20210414081907.871437-1-thuth@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cross-win64-system job is one of the slowest in our gitlab-ci.
With the upcoming changes that introduce ccache, it might even get
slower initially as long as the cache is not populated yet. Thus
let's limit the amount of targets that we build here even further
to avoid that we might hit the 80 minutes timeout here. Most of the
others targets are already covered by the win32 job anyway.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 2d95784ed5..017731a894 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -189,6 +189,12 @@ cross-win64-system:
     job: win64-fedora-cross-container
   variables:
     IMAGE: fedora-win64-cross
+  script:
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ./configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --target-list="cris-softmmu x86_64-softmmu microblaze-softmmu
+          mipsel-softmmu mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
+    - make -j$(expr $(nproc) + 1) all check-build
 
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
-- 
2.27.0


