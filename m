Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA41F68E1BF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUMk-0006pb-KP; Tue, 07 Feb 2023 15:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMi-0006pE-Br
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:14:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMg-0007OX-Rd
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:14:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wjwREQ6LuXyrc2E/SCcJLl6+RO0tpJ6gCddEIfLWFlI=;
 b=W6+r60FsICljzjgTd58WgXwuJu704Y0s6GlIDVTYGfqU0h2VjTd00LON9dU271Gzz9/Hli
 XIE8vpZybrd5gejFzS156+rEGVEFpnMOW+iapywyokZxV5jzsIVut1PTu6TO1Ze8DGqA6m
 LI8Xapf/OWf3KQwJjo1sq/ST6t1S+CM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-AUCsLSlyN4K7sVO2YDN7sg-1; Tue, 07 Feb 2023 15:14:52 -0500
X-MC-Unique: AUCsLSlyN4K7sVO2YDN7sg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B686985C70D;
 Tue,  7 Feb 2023 20:14:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C933492B21;
 Tue,  7 Feb 2023 20:14:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 0/5] Shorten the runtime of some gitlab-CI shared runner
 jobs
Date: Tue,  7 Feb 2023 21:14:42 +0100
Message-Id: <20230207201447.566661-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

We're currently facing the problem that the gitlab-CI jobs for the
shared runners take too much of the limited CI minutes on gitlab.com.
Here are now some patches that optimize some of the jobs a little bit
to take less runtime.

v2:
- Dropped the patches that have already been merged
- Rework the sigaltstack patch according to Daniel's rewview comments
- Add Alex' patch as replacement for the gcov-gprof patch in v1
- Add patch to compile with --enable-fdt=system by default

Alex Bennée (1):
  build: deprecate --enable-gprof builds and remove from CI

Thomas Huth (4):
  gitlab-ci.d/buildtest: Remove aarch64-softmmu from the
    build-system-ubuntu job
  gitlab-ci.d/buildtest: Disintegrate the build-coroutine-sigaltstack
    job
  .gitlab-ci.d/buildtest-template: Simplify the configure step
  gitlab-ci.d: Build with --enable-fdt=system by default

 docs/about/deprecated.rst            | 14 +++++++++
 meson.build                          |  7 ++++-
 .gitlab-ci.d/buildtest-template.yml  | 10 +++----
 .gitlab-ci.d/buildtest.yml           | 43 ++++++----------------------
 .gitlab-ci.d/crossbuild-template.yml |  5 ++--
 .gitlab-ci.d/crossbuilds.yml         |  4 ++-
 .gitlab-ci.d/windows.yml             |  7 +++--
 meson_options.txt                    |  3 +-
 8 files changed, 46 insertions(+), 47 deletions(-)

-- 
2.31.1


