Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E05ED6A6BC4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 12:35:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXKjG-0004JI-4U; Wed, 01 Mar 2023 06:34:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXKjE-0004J9-Bj
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:34:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXKjD-0005Yk-3v
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 06:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677670473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LJDvcWpseP2jzMvH4SxvxZh/88vgy7+LFmsPgrR0pt4=;
 b=e0j/Inyj5ehcuPn58RNjUgSbXnjM2IWJrkUOu6WdOeICwA6dAGDhom1ZPZWuT6SNLVkhIE
 Y4oVv6H4PS+doqEmIA9mNSbOuD8MNhn/YdymiNUVnANJ6sPvnZwD37tg30+Ld9fTBa/Ie6
 ifgiZ2S6aZcP2WHqJRxbYN5IbeI6aQY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-Og5VCFVZMwCL2tqMoOeWoQ-1; Wed, 01 Mar 2023 06:34:30 -0500
X-MC-Unique: Og5VCFVZMwCL2tqMoOeWoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B292888B7A0;
 Wed,  1 Mar 2023 11:34:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C6172026D4B;
 Wed,  1 Mar 2023 11:34:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH] configure: Disable thread-safety warnings on macOS
Date: Wed,  1 Mar 2023 12:34:25 +0100
Message-Id: <20230301113425.286946-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The enablement of -Wthread-safety broke compilation on macOS (if
-Werror is enabled, like in our CI). Disable it there by default
until the problems are resolved.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 2a8a9be8a1..9a0f8cdb4e 100755
--- a/configure
+++ b/configure
@@ -1230,7 +1230,10 @@ add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
 add_to warn_flags -Wimplicit-fallthrough=2
 add_to warn_flags -Wmissing-format-attribute
-add_to warn_flags -Wthread-safety
+
+if test "$targetos" != "darwin"; then
+    add_to warn_flags -Wthread-safety
+fi
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
-- 
2.31.1


