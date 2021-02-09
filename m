Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0117B31522A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:56:59 +0100 (CET)
Received: from localhost ([::1]:44480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9URm-0001Xe-2d
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1l9UPY-0000LD-PG
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:54:40 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konstantin@daynix.com>)
 id 1l9UPR-0006U0-M1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:54:40 -0500
Received: by mail-lf1-x144.google.com with SMTP id m22so28696894lfg.5
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o7JjKKG47UV2HulC6ET5VST5cG6F551S75O7QNoicSQ=;
 b=emZnCg7GkrEUkxQ7s3Wmqj4HCyaaG+RNDUcc2I0Q1n9CgI7Ob+XMGN54vXxIhZMoQG
 2nPoxeglHFqgpBZJ4xewXyNA9NAFxXDAoDPZLWNJNjoN5s8HRbG4phLsVYBKXbIwWzaO
 /SkMogN4Ug77MrEprsB7E2iOdmnj4NHEQ331TPTeUFGN5Hu8VE3qZXsj4fHt9LRDu5sY
 Sj+/ZbKafWhcJIlay22eikeNzibfT4JJXal63tkZERGBWnSlFcYfjXASPVsvpvkManJT
 vEw4JDRp9ptXsKEP5YoBVVNlP36sSiF+m4nJ0tb4lNtjv2ny4RQh3JfSVrx6iKoSt/5c
 +ozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o7JjKKG47UV2HulC6ET5VST5cG6F551S75O7QNoicSQ=;
 b=Z0Vbpfr6u1rxUOXQNmOUDNZbkMvz0qcoBoLxNfa/Yq3PiTFcvbW5g4PoeKHT/aczuo
 GHK7f0oFLraVbg6fSHvfLQ7PcFFybF+uQBST6qhrwOGG1xr/YKCvGEbA91FltJqilJKI
 1QIrwcOHlrpE/XFHC4ODITPluRWfrD+y2/xvCjY/kCHarTfNnNN+9uk0kE9nC0tVfAl8
 F7C97d3It5TIxNUUoKTbmcDgQmClBW89C8+8tU+oiHzuXq+sDNcIyijbitIzIrwbpSVW
 hwOdrU6Q6xJsDbxTfCkzXcZ8jzMdu6azuncvlWovL0P4ucB4syGTvvnsGq9y0MKEe3/5
 x5pQ==
X-Gm-Message-State: AOAM532QUrYMsl2gya2Wx8T8eOP2Jtm6+T9aKmRTZpGS6YXN+ffXzxQk
 RtaWmqg6WQ0dR+IqHB/3XJggIlcOmUpm4Rcx
X-Google-Smtp-Source: ABdhPJxR7MQmd7vD0oIWcdYIYLKWTEAI4XSXeWE9t9+6ZAG7MsXolu3IZobUmOKNzBrlSz5U+9R0Xw==
X-Received: by 2002:ac2:5327:: with SMTP id f7mr3013682lfh.82.1612882470508;
 Tue, 09 Feb 2021 06:54:30 -0800 (PST)
Received: from kostyanf14nb.Dlink ([93.77.45.80])
 by smtp.gmail.com with ESMTPSA id l14sm769157ljc.91.2021.02.09.06.54.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 06:54:30 -0800 (PST)
From: Kostiantyn Kostiuk <konstantin@daynix.com>
To: Developers <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] qga-vss: Use dynamic linking for GLib
Date: Tue,  9 Feb 2021 16:54:23 +0200
Message-Id: <20210209145423.178611-1-konstantin@daynix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::144;
 envelope-from=konstantin@daynix.com; helo=mail-lf1-x144.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

The current GLib version implements the DllMain function. DllMain is also
present in the provider.cpp code. So in the case of static linking, the
DllMain redefinition error occurs. For now, just switch to dynamic linking
and revert this patch when the issue will be solved.

See Glib issue for more details https://gitlab.gnome.org/GNOME/glib/-/issues/692

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
---
 qga/vss-win32/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 780c461432..90825edef3 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -1,5 +1,5 @@
 if add_languages('cpp', required: false)
-  glib_static = dependency('glib-2.0', static: true)
+  glib_dynamic = dependency('glib-2.0', static: false)
   link_args = cc.get_supported_link_arguments(['-fstack-protector-all', '-fstack-protector-strong',
                                                '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
 
@@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
                 cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
                 link_args: link_args,
                 vs_module_defs: 'qga-vss.def',
-                dependencies: [glib_static, socket,
+                dependencies: [glib_dynamic, socket,
                                cc.find_library('ole32'),
                                cc.find_library('oleaut32'),
                                cc.find_library('shlwapi'),
-- 
2.25.1


