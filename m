Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3846A8363
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:20:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiqB-0002RV-At; Thu, 02 Mar 2023 08:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXiq9-0002Q6-4r
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pXiq7-0001yY-EY
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677763158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UJzy24w6npCM8mMn/MhvvxPgcvos6qwUZutXPQd9j+4=;
 b=QWUqenTKzTRjaFSQ6DnVYbA60g9uLXq5JvsoV1XK4tQfonVOay5T1dO3ZbjDU+xj6nj4R4
 FZG8NbINkwrxM4mkx8T8LJpeN46I/tZMZebdOC8pZn1AfW/hnC6GfEBOytf6O/FNuw5g0o
 9Y3k7jHKQs7twenMldFJNXUkgz5Rjfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-106-e4MvfVPhNJ6S9R5VTHg3RQ-1; Thu, 02 Mar 2023 08:19:03 -0500
X-MC-Unique: e4MvfVPhNJ6S9R5VTHg3RQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C0C8857A84;
 Thu,  2 Mar 2023 13:18:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566AF2166B2C;
 Thu,  2 Mar 2023 13:18:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 0/4] Add meson wrap fallback for slirp & dtc
Date: Thu,  2 Mar 2023 17:18:44 +0400
Message-Id: <20230302131848.1527460-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Hi,

Meson "wrap" is a mechanism to build dependencies that doesn't rely on git
submodules and integrate external dependencies as subproject()s.

This offers developpers a simpler way to build QEMU with missing system
dependencies (ex, libslirp in my case), but also simplify the fallback build
definition of dtc/libfdt.

In constrast with QEMU configure submodule handling, the subprojects are not
downloaded automatically, and the user has to call "meson subprojects download"
himself prior to running configure/meson.

Marc-André Lureau (4):
  mtest2make.py: teach suite name that are just "PROJECT"
  build-sys: prevent meson from downloading wrapped subprojects
  build-sys: add slirp.wrap
  build-sys: replace dtc submodule with dtc.wrap

 configure                     | 25 +++-------------
 meson.build                   | 56 +++++------------------------------
 .gitignore                    |  3 ++
 .gitmodules                   |  3 --
 dtc                           |  1 -
 meson_options.txt             |  5 ++--
 scripts/meson-buildoptions.sh |  4 +--
 scripts/mtest2make.py         |  9 +++---
 subprojects/dtc.wrap          |  6 ++++
 subprojects/slirp.wrap        |  6 ++++
 10 files changed, 35 insertions(+), 83 deletions(-)
 delete mode 160000 dtc
 create mode 100644 subprojects/dtc.wrap
 create mode 100644 subprojects/slirp.wrap

-- 
2.39.2


