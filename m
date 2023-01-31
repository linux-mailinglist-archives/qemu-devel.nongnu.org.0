Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B86682A12
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:13:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnd9-0002ZW-Gt; Tue, 31 Jan 2023 05:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncu-0002L7-3N
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncp-0002Uz-RW
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VtV03tD6xFZ6Eigo9cPkT05NVG3YUWkgJFYc34psqHg=;
 b=Sdk6KkzcaEf2BGQ0CXzIWdJq2gqP1jSwm1eiHGU6FhO9SRz0PcIqpcsCFhhIsLrhkMC3Gz
 y3OwqTonmuxEh0woSrGg8gcdhidu+DRWiGJpaqoWTgXkWk8mFgeILEz2M7V+kpvVud0KTN
 Vc+CZCkOcISQWhy7eC3A2TY9k/HNKkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-GYmNTZz0OpGyYV2nq_Ht-w-1; Tue, 31 Jan 2023 05:12:18 -0500
X-MC-Unique: GYmNTZz0OpGyYV2nq_Ht-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3AB8185A794;
 Tue, 31 Jan 2023 10:12:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09C07C15BAD;
 Tue, 31 Jan 2023 10:12:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/27] tests/docker/dockerfiles: Add libfdt to the i386 and to
 the riscv64 container
Date: Tue, 31 Jan 2023 11:11:46 +0100
Message-Id: <20230131101205.1499867-9-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

No need to recompile the dtc submodule here again and again, we can
use the pre-built binary from the distribution instead.
(And this will also help in case we finally get rid of the dtc submodule
in QEMU one day)

Message-Id: <20230124143824.844040-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/debian-riscv64-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-i386-cross.docker    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/debian-riscv64-cross.docker b/tests/docker/dockerfiles/debian-riscv64-cross.docker
index 9715791e0b..3daf93968a 100644
--- a/tests/docker/dockerfiles/debian-riscv64-cross.docker
+++ b/tests/docker/dockerfiles/debian-riscv64-cross.docker
@@ -42,6 +42,7 @@ RUN apt update && \
     apt install -y --no-install-recommends \
          gcc-riscv64-linux-gnu \
          libc6-dev-riscv64-cross \
+         libfdt-dev:riscv64 \
          libffi-dev:riscv64 \
          libglib2.0-dev:riscv64 \
          libpixman-1-dev:riscv64
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 7eec648d2d..f58b64dc3e 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -9,6 +9,7 @@ ENV PACKAGES \
     findutils \
     gcc \
     git \
+    libfdt-devel.i686 \
     libffi-devel.i686 \
     libselinux-devel.i686 \
     libtasn1-devel.i686 \
-- 
2.31.1


