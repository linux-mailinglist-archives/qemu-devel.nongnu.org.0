Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107CB6A8364
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiq5-0002Ml-F8; Thu, 02 Mar 2023 08:19:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipz-0002Kn-W6
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXipx-0001uW-7O
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdydo20J2ZZ03Z9PLrDbyECnTAXSv0/C4wHHURqdOwA=;
 b=X+cP7KjOsJELtDL5N/C4wQuqri6RCiXVrjNBJAvAGvWYkcBLLuyqkNgk1b3983W+jNfYwv
 TkbTarI0bFXichEACIFRSxykfEzo5WvTz0QoKAzwMEtzJaH+UGyzZyDoO8wgJET0C5DeZk
 9QrRRs3JbpcleaqBNQvN8q2x2v5qrT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-438-M9Re--T3MZCXublfL-qa3g-1; Thu, 02 Mar 2023 08:19:05 -0500
X-MC-Unique: M9Re--T3MZCXublfL-qa3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEAC4800050;
 Thu,  2 Mar 2023 13:19:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28F1CC16029;
 Thu,  2 Mar 2023 13:19:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 3/4] build-sys: add slirp.wrap
Date: Thu,  2 Mar 2023 17:18:47 +0400
Message-Id: <20230302131848.1527460-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
References: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to build with --enable-slirp / -D slirp=enabled, even when
libslirp is not installed on the system. Meson will pull it from git in
that case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 .gitignore             | 2 ++
 subprojects/slirp.wrap | 6 ++++++
 2 files changed, 8 insertions(+)
 create mode 100644 subprojects/slirp.wrap

diff --git a/.gitignore b/.gitignore
index 61fa39967b..1ea59f4819 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,3 +20,5 @@ GTAGS
 *.swp
 *.patch
 *.gcov
+
+/subprojects/slirp
diff --git a/subprojects/slirp.wrap b/subprojects/slirp.wrap
new file mode 100644
index 0000000000..ace4f26102
--- /dev/null
+++ b/subprojects/slirp.wrap
@@ -0,0 +1,6 @@
+[wrap-git]
+url = https://gitlab.freedesktop.org/slirp/libslirp
+revision = 15c52d697529eb3e78c5d8aa324d61715bce33b6
+
+[provide]
+slirp = libslirp_dep
-- 
2.39.2


