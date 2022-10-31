Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C257612E72
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:59:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opJ9B-0008Sn-F0; Sun, 30 Oct 2022 20:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opJ98-0008Sb-Tz
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:59:23 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opJ97-0006WX-54
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:59:22 -0400
Received: by mail-pf1-x42a.google.com with SMTP id k15so1328726pfg.2
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K8JgP1uwldtjtxP+Yutssm6CjcxATHI0xgAE4llPZ0g=;
 b=MDDQmhIVcC9mvhUR3HI7Vou/yR+P8I1Tsdr2HKlheWU+EefaJMOsC4njATyFSQr65r
 ds7JQ0vT6ahwkZ1xbXgXsFIYCh5ZqDCF3b/2XApfujj5yztSXxHvpSJ05EzSq5IynYNw
 6p42gZEJa/w5qq8eQArUtm7wd4WT0D7CSyrDWaZXFfme3oKx0q1IC71wbdZT0j1TAgTe
 qDA++1oDRHkCPhsb67kxn9IohSJrSwc98UL63OB33vq6ikbuPLszmbHRGRh+Clx2T1tJ
 YWvvaKIfwRyXfVKASNIi/nqa6O4V8ntG4Jii3gHl6lozyK2cgfbNs0bC4Z6VjnN2q+cB
 AxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K8JgP1uwldtjtxP+Yutssm6CjcxATHI0xgAE4llPZ0g=;
 b=E8TD4/b5RF1AgvxNDITkPhwOSOy7wVYazSZ4M/48MJtD+ByFzwoDo89LysU9AtUHXD
 w8zzV6X7C5zQZ7VbKnNlwvuxFiZjq+n3cZwAVfr9dxL9pDUj4mlJcIhkeic/zxG1RDVt
 vhVgz5haQ2KmmjctSqlkV9DaNL89vehxyRHR7PODJuy2GGNXM/ro6SpFKWZgb3IY/mXb
 vgAKyF/zezm+o8TsD2DpQj6bBuFrG+/pPxZa72ezprUgoRKQpKHX3v7hXS5F1Z+nhdV1
 RvulQTAm1fnRuoxMdtrmIf5vUHTBM7bVC7/ooZQXR2+qgpPJC6jcrBIdMrUCsTeI/uqP
 8L1Q==
X-Gm-Message-State: ACrzQf3aFitNm6qUlYKiiafE99xx7lN0l3IPrsGjzEe7HiqQKdMZSozo
 ZVib2/qo44WzOSr6sFE5NbE/+Q==
X-Google-Smtp-Source: AMsMyM6PNQX9OavY/Eyl0b7R9H0GTU33TmxXP0vxDvkTN0cejD6BAfsyi+FVCBEfJzxEaXPURBVSkQ==
X-Received: by 2002:a63:2c90:0:b0:439:ee2c:ab2f with SMTP id
 s138-20020a632c90000000b00439ee2cab2fmr10756367pgs.2.1667177959300; 
 Sun, 30 Oct 2022 17:59:19 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 h130-20020a628388000000b0056a93838606sm3196255pfe.58.2022.10.30.17.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 17:59:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] cutils: Fix get_relocated_path on Windows
Date: Mon, 31 Oct 2022 09:59:08 +0900
Message-Id: <20221031005908.3393-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

get_relocated_path() did not have error handling for PathCchSkipRoot()
because a path given to get_relocated_path() was expected to be a valid
path containing a drive letter or UNC server/share path elements on
Windows, but sometimes it turned out otherwise.

The paths passed to get_relocated_path() are defined by macros generated
by Meson. Meson in turn uses a prefix given by the configure script to
generate them. For Windows, the script passes /qemu as a prefix to
Meson by default.

As documented in docs/about/build-platforms.rst, typically MSYS2 is used
for the build system, but it is also possible to use Linux as well. When
MSYS2 is used, its Bash variant recognizes /qemu as a MSYS2 path, and
converts it to a Windows path, adding the MSYS2 prefix including a drive
letter or UNC server/share path elements. Such a conversion does not
happen on a shell on Linux however, and /qemu will be passed as is in
the case.

Implement a proper error handling of PathCchSkipRoot() in
get_relocated_path() so that it can handle a path without a drive letter
or UNC server/share path elements.

Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 util/cutils.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/util/cutils.c b/util/cutils.c
index cb43dda213..932c741d2b 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -1088,17 +1088,21 @@ char *get_relocated_path(const char *dir)
     g_string_append(result, "/qemu-bundle");
     if (access(result->str, R_OK) == 0) {
 #ifdef G_OS_WIN32
-        size_t size = mbsrtowcs(NULL, &dir, 0, &(mbstate_t){0}) + 1;
+        const char *src = dir;
+        size_t size = mbsrtowcs(NULL, &src, 0, &(mbstate_t){0}) + 1;
         PWSTR wdir = g_new(WCHAR, size);
-        mbsrtowcs(wdir, &dir, size, &(mbstate_t){0});
+        mbsrtowcs(wdir, &src, size, &(mbstate_t){0});
 
         PCWSTR wdir_skipped_root;
-        PathCchSkipRoot(wdir, &wdir_skipped_root);
+        if (PathCchSkipRoot(wdir, &wdir_skipped_root)) {
+            g_string_append(result, dir);
+        } else {
+            size = wcsrtombs(NULL, &wdir_skipped_root, 0, &(mbstate_t){0});
+            char *cursor = result->str + result->len;
+            g_string_set_size(result, result->len + size);
+            wcsrtombs(cursor, &wdir_skipped_root, size + 1, &(mbstate_t){0});
+        }
 
-        size = wcsrtombs(NULL, &wdir_skipped_root, 0, &(mbstate_t){0});
-        char *cursor = result->str + result->len;
-        g_string_set_size(result, result->len + size);
-        wcsrtombs(cursor, &wdir_skipped_root, size + 1, &(mbstate_t){0});
         g_free(wdir);
 #else
         g_string_append(result, dir);
-- 
2.38.1


