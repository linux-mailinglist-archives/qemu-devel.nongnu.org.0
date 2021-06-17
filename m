Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6D23ABA0E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:56:08 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltvJH-0008Hj-Pz
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:56:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltvHn-0007aD-2K
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:54:35 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltvHl-0004Lm-63
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 12:54:34 -0400
Received: by mail-pf1-x431.google.com with SMTP id a127so5471278pfa.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCw7y9EtEwsB9D6+i9SDTR0CXwenjbQuO8IWcvMH35o=;
 b=RHdA+JmK0NxkleptjScBN2ylikEKxYxhrCogqJx4haKh7jiKP4UTHMJdkMZxr+Ujd9
 aB/bKV3vdklGwP/XcAr4tt0vGS5oSJtq546QDWG/Z0rahR4fZejlfsvEMUhBai45xbfu
 odKE/+D2rwHOMpnPXZV4Gbs8J5yEr1A9JOjcpztTH5IjpZziyqSik+WryqDr73cj7ahv
 0Yd2ligBcFzncHxTtBvIpmJeEf4zE3slnnk8hdnvjnkLuvOgS60/ntA9inHvTyuYYf5p
 XWfj3aA0znSOH5CZRw3MgMzf/MHloiInQmbih1wRqtLykuwqBvAgvL6iNx3axO+QQRj5
 edlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCw7y9EtEwsB9D6+i9SDTR0CXwenjbQuO8IWcvMH35o=;
 b=kXKy/MuVLlcl1ydXkcTydzjcKXPowr9zfVBqImvXaG4nqUjalNIo72MSYyfWJ2AnmC
 tqOLrR9k9H/ns0BwE62rUbI8Oa1gEAmWMSMqhh1nzx0rDTcFfMrKlFQemc3hc1BxODRz
 3NhLWIOW3oXqIVY6rD/LB6C2fA8CUbXtlOgU2z+BDfhUVAbDpAcP4x4sxackYobUVQvN
 FZerkKMczR44ud+Rw+vmsKyOsrvwtf6m/0uYVbiVAPpQB07hTarnVnZRc/nayb4/TOT8
 ILE9Y2z8RpUbMZscjVxWsCXcnqBS6eYdOFa+j5ujL/2pPWutpTMWU43T0lqh60YCh21h
 Zm9Q==
X-Gm-Message-State: AOAM533aGJxQcQBHjt8SiFkOITlVbtVrEmoQ/Jew/8ooiqyK1r9kT2/u
 PZVU6WaGHKTDlbzYi+2V7ToK/vz98TCJqA==
X-Google-Smtp-Source: ABdhPJz0DlVbCCGYwdKk0hZ7NQ9Lq4chYTKF3ADRt4qvMVhmFoAdHUPWvzkkiJ+XeIjCiu+32/XGZw==
X-Received: by 2002:a63:2152:: with SMTP id s18mr3221355pgm.358.1623948870509; 
 Thu, 17 Jun 2021 09:54:30 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c6b:ce89:81f5:958c])
 by smtp.gmail.com with ESMTPSA id y2sm5482581pfa.195.2021.06.17.09.54.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 17 Jun 2021 09:54:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] meson: Add gnutls as a dependency to libmigration
Date: Fri, 18 Jun 2021 01:54:18 +0900
Message-Id: <20210617165418.89525-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-file-channel.c may depend on GnuTLS.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a2311eda6ec..b8812dff387 100644
--- a/meson.build
+++ b/meson.build
@@ -2090,6 +2090,7 @@ libio = static_library('io', io_ss.sources() + genh,
 io = declare_dependency(link_whole: libio, dependencies: [crypto, qom])
 
 libmigration = static_library('migration', sources: migration_files + genh,
+                              dependencies: [gnutls],
                               name_suffix: 'fa',
                               build_by_default: false)
 migration = declare_dependency(link_with: libmigration,
@@ -2160,7 +2161,7 @@ common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
                             implicit_include_directories: false,
-                            dependencies: common_all.dependencies(),
+                            dependencies: common_all.dependencies() + [gnutls],
                             name_suffix: 'fa')
 
 feature_to_c = find_program('scripts/feature_to_c.sh')
-- 
2.30.1 (Apple Git-130)


