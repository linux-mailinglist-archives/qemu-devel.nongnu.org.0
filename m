Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A03713C3
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 12:48:20 +0200 (CEST)
Received: from localhost ([::1]:59970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldW7f-0005cn-9i
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 06:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4h-0003nQ-Lm
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldW4f-0003Qo-KE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 06:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620038712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0u+HFQE9R543mvapNT6gTSZfmmSTP9eHoQgd9lft0fU=;
 b=OIUtz9wdSyyY6UNqf3eSEu00JjN2Xf6u8qUKxQkB+1UAZ83cSNBdRaXDM6kH+Rf9hhwa2A
 umktvsdpEDIDV0i4oIVh/rA2fZTaIWaIXBZ4EpiVdFTcEfbMKvxfZ6R7d2130Tj6+Vaxp9
 IUssAgE29b+sVBFuI0Utxw760H0YTv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-0H0oVdObPnGVr1UnY-67IA-1; Mon, 03 May 2021 06:45:10 -0400
X-MC-Unique: 0H0oVdObPnGVr1UnY-67IA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAA28107ACC7;
 Mon,  3 May 2021 10:45:09 +0000 (UTC)
Received: from thuth.com (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D19535D9DD;
 Mon,  3 May 2021 10:45:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/10] gitlab-ci: Replace YAML anchors by extends
 (container_job)
Date: Mon,  3 May 2021 12:44:50 +0200
Message-Id: <20210503104456.1036472-5-thuth@redhat.com>
In-Reply-To: <20210503104456.1036472-1-thuth@redhat.com>
References: <20210503104456.1036472-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210418233448.1267991-2-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e23..4ef76d1f54 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,4 +1,4 @@
-.container_job_template: &container_job_definition
+.container_job_template:
   image: docker:stable
   stage: containers
   services:
@@ -22,230 +22,230 @@
     - docker logout
 
 amd64-alpine-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: alpine
 
 amd64-centos7-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: centos7
 
 amd64-centos8-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: centos8
 
 amd64-debian10-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian10
 
 amd64-debian11-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian11
 
 alpha-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
 amd64-debian-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64
 
 arm64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-arm64-cross
 
 arm64-test-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-arm64-test-cross
 
 armel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armel-cross
 
 armhf-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armhf-cross
 
 hppa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
 mips64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64el-cross
 
 mips-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
 
 mipsel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mipsel-cross
 
 powerpc-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-powerpc-cross
 
 ppc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64-cross
 
 ppc64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64el-cross
 
 riscv64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-riscv64-cross
 
 s390x-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-s390x-cross
 
 sh4-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
 
 xtensa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian-xtensa-cross
 
 cris-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-cris-cross
 
 amd64-fedora-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora
 
 i386-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-i386-cross
 
 win32-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-win64-cross
 
 amd64-ubuntu1804-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu1804
 
 amd64-ubuntu2004-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu
 
 amd64-opensuse-leap-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: opensuse-leap
-- 
2.27.0


