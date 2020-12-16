Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834EF2DC2B2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:05:36 +0100 (CET)
Received: from localhost ([::1]:43418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYMx-0008KE-G2
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJl-0004Qm-Mf
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:17 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJk-0007Ul-07
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:17 -0500
Received: by mail-ej1-x62b.google.com with SMTP id lt17so33174260ejb.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fVM1InpNhRI/g9ZYU2u7pE3PbR6QDiLKhPiZwnr0RDE=;
 b=OPVMmZPb7sReRfnxVwqlZdMXW9tKrPQKNxV7KVXIgg+e6IHhyCRNvgGp13Mht6G5SU
 fuzp7+AAuMNwkc3AcrmAGfK6Go7Npe5MjSb+Xpje5747//6XsYCbIkwKzCV+ZUTf5FjC
 /D3OBva87GJLYEKOAVOQIApVAlxEQJQpVim4ofXm1lKCeY8iTb5EOmSZ6q3B3AdNSD5f
 83BXFi50dB3QbWtYUr+bviVManpmIwLka89RHBCNKpsQfQZAxCqYOUcbpeqs2BQUkDO/
 tkjFAJYIaqv2x43hUPk05pWPljPb7w3wicQAkrL+bNf2IBLTsWNjgbQVqa+77gab3+e6
 E7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fVM1InpNhRI/g9ZYU2u7pE3PbR6QDiLKhPiZwnr0RDE=;
 b=PjrsA25/UIBXbZnEZFiAy0isMVIo8136qOVPuri835yoK7hvtwInwa9Y/UKZTokEy6
 7wBLTa8rlMbfwcu/phLPbWDDoRBX7Zff7aZNoLiz8pB1HN+gbNP5/KJLp7NJ3wAOgKZq
 DLOHHlqCi+RzNGDrPP1XPKMNj/fzCmSixxbunzUwEuKAz7tcNUoGYE/w0q7OWYtLlr27
 8cm5cB439flBdNuewqEl4e28f58EAXwR3TPmNHA+ItRXhyDlhYpdanP3yg0TYnOnQSqe
 9xfrXbyNJYDy6I/h9i8eaIAnQEpq4/Wr1VXlGk71RYEpheOjRNjgrw47yI0Rtw7YmLvp
 oirQ==
X-Gm-Message-State: AOAM533Z1JALjxCEKuhEYJ+bW0v3hcYwcfy0iNqVaTIWxGMA2A9N/jPq
 vNSneX7r+/U8EVRE1K5LcJteLJMzYjk=
X-Google-Smtp-Source: ABdhPJz/5xdqFMuc+TkH7zYgfcDwLPiwUXFzuHhx3yoT4bw/6j2GV8Cxik2AL2XPJSn+bIiSOtNfHA==
X-Received: by 2002:a17:906:f0cc:: with SMTP id
 dk12mr13571450ejb.480.1608130934523; 
 Wed, 16 Dec 2020 07:02:14 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:14 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] meson: use dependency to gate block modules
Date: Wed, 16 Dec 2020 16:02:06 +0100
Message-Id: <20201216150207.431437-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216150207.431437-1-pbonzini@redhat.com>
References: <20201216150207.431437-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow converting the dependencies to meson options one by one,
because moving the tests to meson.build will get rid of the symbols
in config-host.mak.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 5dcc1e5cce..b02cb14aad 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -70,14 +70,14 @@ block_modules = {}
 
 modsrc = []
 foreach m : [
-  ['CONFIG_CURL', 'curl', [curl, glib], 'curl.c'],
-  ['CONFIG_GLUSTERFS', 'gluster', glusterfs, 'gluster.c'],
-  ['CONFIG_LIBISCSI', 'iscsi', libiscsi, 'iscsi.c'],
-  ['CONFIG_LIBNFS', 'nfs', libnfs, 'nfs.c'],
-  ['CONFIG_LIBSSH', 'ssh', libssh, 'ssh.c'],
-  ['CONFIG_RBD', 'rbd', rbd, 'rbd.c'],
+  [curl, 'curl', [curl, glib], 'curl.c'],
+  [glusterfs, 'gluster', glusterfs, 'gluster.c'],
+  [libiscsi, 'iscsi', libiscsi, 'iscsi.c'],
+  [libnfs, 'nfs', libnfs, 'nfs.c'],
+  [libssh, 'ssh', libssh, 'ssh.c'],
+  [rbd, 'rbd', rbd, 'rbd.c'],
 ]
-  if config_host.has_key(m[0])
+  if m[0].found()
     if enable_modules
       modsrc += files(m[3])
     endif
@@ -90,10 +90,10 @@ endforeach
 # those are not exactly regular block modules, so treat them apart
 if 'CONFIG_DMG' in config_host
   foreach m : [
-    ['CONFIG_LZFSE', 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
-    ['CONFIG_BZIP2', 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
+    [liblzfse, 'dmg-lzfse', liblzfse, 'dmg-lzfse.c'],
+    [libbzip2, 'dmg-bz2', [glib, libbzip2], 'dmg-bz2.c']
   ]
-    if config_host.has_key(m[0])
+    if m[0].found()
       module_ss = ss.source_set()
       module_ss.add(when: m[2], if_true: files(m[3]))
       block_modules += {m[1] : module_ss}
-- 
2.29.2



