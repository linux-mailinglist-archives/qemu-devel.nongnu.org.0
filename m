Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F916387E0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWHT-0004wu-Cw; Fri, 25 Nov 2022 05:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHQ-0004wl-Dj
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:00 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHO-0004Mr-W3
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:00 -0500
Received: by mail-pf1-x42c.google.com with SMTP id l7so1349653pfl.7
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xDX+aKA/RS4d4hOmrGI6f2aGb1XqZKokkZqb6tEAlUU=;
 b=QigqTk8xDuT9GvX/g13Q7/S1F10qL4s0IYkEjJmd4uWUwoulGJmF8OimYUA3P2xGy3
 c+vNA45cLIno95wZ2monENA75n8+cjyq3nviBvotAeJhQ2YFzR8Vq2eKOFwKIo7BIOth
 i0gFKKnFEubhvVFoZZX7uS9DMziM+AYxoTr+VxAiqTVomH1vImrr6s6whBBTaaJ5/TW4
 ubqTiO9EEiWX9X/TbpRqegTolb3kkUmX5vOP6OCcYNCdW3jYxOre8KEg6WU5pRg+qaBU
 mkEZYvto0JLJinK9zVfWKrPgye0RyPHC1z9EU8rbtD8wBP9X/FIFtruq9rXdiMxEF+36
 Oszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xDX+aKA/RS4d4hOmrGI6f2aGb1XqZKokkZqb6tEAlUU=;
 b=TnFFVVn1rwyxYZ4ul8YI0emW9Vy8+PF8eTNEkxN/UMcNFhAytGd2j7DrKH1iDg8Xhd
 ICWg4J5dNfXarGoEGtGLeBrjX1fjiCYxfqLPYMGztyEPTaG7RuJNs3MvMjUC69Tl25jX
 4O07WsifNnQBxz4N7KVvMWSEaT+8RrLexeXtyJGTKFszmG/32pu3NymwaZ5s72658Pid
 Gb/WlEV+vkaq/Qd0eKwJ6vnmJjqA0RxNWc2g2PVcyZxsH1NiTLFZJHSDNefnJTor+kip
 ZP/oDpG4ckV+lEXg1yt30jJEpAsEwwEjVYUNPOeOu/WZvOtwkvaUPWcgdBJ4o+rxvuJm
 VP4g==
X-Gm-Message-State: ANoB5pnb3N9nUDNp5q0nluZrGpcsdhlV9bs7/KwF/kZJdCeLdm6Fucmg
 pEvuticEuKmP6gCK1ZGKgqtBBCaoFcY=
X-Google-Smtp-Source: AA0mqf45ZYoXbCgeUyfP/XKjHPczxlTCKJLMXJrPz7mU40ANUEerD2UF3tfYRAYQU2lNXp93bhJvsQ==
X-Received: by 2002:a63:4703:0:b0:470:27c:54b8 with SMTP id
 u3-20020a634703000000b00470027c54b8mr15596211pga.578.1669373397180; 
 Fri, 25 Nov 2022 02:49:57 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b00188f7ad561asm3055966plx.249.2022.11.25.02.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:49:56 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 1/4] .gitlab-ci.d/windows.yml: Unify the prerequisite packages
Date: Fri, 25 Nov 2022 18:49:48 +0800
Message-Id: <20221125104951.3169611-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42c.google.com
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


