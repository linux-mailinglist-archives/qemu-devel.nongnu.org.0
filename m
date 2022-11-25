Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D96388FE
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyX4z-0000NV-2x; Fri, 25 Nov 2022 06:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX4v-0000NM-Ui
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:09 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX4u-000774-8s
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:09 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so2758213pjo.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6D5WXm3U8AFefut/ddoBCFTmXCdpyUuRqoPeLaxrZ58=;
 b=qZlnKqhBKgbxJmXnwfD5mcFSaGP3CIUEfXoKfe7Z2HSjxB7n3w6IN/8aY7k+e0poyk
 VGHkptml9myb2p0nDOqXk3mLn8yi8AYrYmY9VXceukD4fjEnqdh4LiEgTAoQXAvy5zME
 Z8q5CsruDByA+gfUHfd7FSXxQzerhoWrjPfCKNeqTJQqvGu7vqeuAn2r3dA+rV5EewK5
 4MWS6YYGrqDlfOWAwowQlN7c++ps0DWKuqUpEODi+hhi/C1yHn87FpyMZEaYPHGJDhtb
 Zt24MOzpfZoTJZG4dhUNN4E5bhkkFLbe/wzzwKzmc0DszEjpXNSE3HOUGzDwvUyycoEn
 xFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6D5WXm3U8AFefut/ddoBCFTmXCdpyUuRqoPeLaxrZ58=;
 b=KUnp5lCt1YsWcYfibl/J7tvVJ5qmpd6Z+8CQKi1Kz56g0JcXImy5E+MXbfzo+NnZ99
 6GTs5WI8r/1uEwhOoq2Jk8jtd2UmrVictOrxi8mydYxGs02cStWcD7l/FecuOZ2fV9X5
 6F4cvG4uT2RDu+dGA46daXgUKNUDC0AeFNQN/eKTiOkzXSOA4VBjeQaB8cyqgQ6MpnHZ
 4VUSfJAd+zJJlwZZZIQWG1bdTo87kd1oPR7RQfh0C4Lq7Kur5rrEDZeZzN1RNKyw8uUR
 4/Ep6zVDMET2Q9gBqjOhRVsrPxpEyaekAqk8WW/WQShEvfmhe/A5dI/8b/PYFvtcd4KD
 tgtg==
X-Gm-Message-State: ANoB5plofkXvAYZah/WpMYi783M6PmjrsPAOfHcPGJ+dy3Fj9LXSamnu
 mgIe0MjxQqvlJx+gPxaPPXkDLCnV4dY=
X-Google-Smtp-Source: AA0mqf4BrytwRW0MUj5NmA3KTYehNPKTXM2NZKSQ+xNNMi2W11LTIqJILucIi2ZR9eS3xP2DzH6Qqg==
X-Received: by 2002:a17:90b:f04:b0:218:8ec2:a4e2 with SMTP id
 br4-20020a17090b0f0400b002188ec2a4e2mr33047919pjb.174.1669376466298; 
 Fri, 25 Nov 2022 03:41:06 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a62830b000000b0056c063dd4cfsm2917884pfe.66.2022.11.25.03.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:41:05 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 1/4] .gitlab-ci.d/windows.yml: Unify the prerequisite
 packages
Date: Fri, 25 Nov 2022 19:40:57 +0800
Message-Id: <20221125114100.3184790-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

At present the prerequisite packages for 64-bit and 32-bit builds
are slightly different. Let's use the same packages for both for
easier maintenance in the future.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 .gitlab-ci.d/windows.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index a3e7a37022..99d78c2213 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -41,11 +41,15 @@ msys2-64bit:
       mingw-w64-x86_64-gcc
       mingw-w64-x86_64-glib2
       mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-gtk3
+      mingw-w64-x86_64-libgcrypt
+      mingw-w64-x86_64-libjpeg-turbo
       mingw-w64-x86_64-libnfs
       mingw-w64-x86_64-libpng
       mingw-w64-x86_64-libssh
       mingw-w64-x86_64-libtasn1
       mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-lzo2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
       mingw-w64-x86_64-pixman
@@ -79,16 +83,22 @@ msys2-32bit:
       mingw-w64-i686-gtk3
       mingw-w64-i686-libgcrypt
       mingw-w64-i686-libjpeg-turbo
+      mingw-w64-i686-libnfs
+      mingw-w64-i686-libpng
       mingw-w64-i686-libssh
       mingw-w64-i686-libtasn1
       mingw-w64-i686-libusb
       mingw-w64-i686-lzo2
+      mingw-w64-i686-nettle
       mingw-w64-i686-ninja
       mingw-w64-i686-pixman
       mingw-w64-i686-pkgconf
       mingw-w64-i686-python
+      mingw-w64-i686-SDL2
+      mingw-w64-i686-SDL2_image
       mingw-w64-i686-snappy
-      mingw-w64-i686-usbredir "
+      mingw-w64-i686-usbredir
+      mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
-- 
2.34.1


