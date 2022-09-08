Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF15B1F65
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:38:44 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHjv-00086s-CR
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHaC-0004g5-UA
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:40 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:41663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHaB-0002c5-C3
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so2487783pjl.0
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5nS5bCvlfLFqWAAq8Ohfwhhh8km0jfFl9ekoab+BdY8=;
 b=isRo87B2KXr/v6FQl4ziq4y7JWThXM+0/PQ0yo8i01IuSW9dJp+GYSOeHL2Rx+3oJe
 FLKbgq3o+TiAXm4bXMQhe6ucaWpPQRXhcI6eP8C12FGqsOBhpoDUl/2q9BEWsDAG/TNZ
 kem+1LPlh5mQqfwYrESGYur/hOC+VX9wTwcPgEdoAEs4veDIw6UW6CqphnmI2U6U8L85
 EC3GQgVUfckhaOg0wvcWX2AssOIIyj1N5C8AC6mwiDrQE28G92RSu58YdCMyMKPB+boP
 DzJ3fYXABs+9OlgA+UN0Vk58nqhRrEYkGmVGmO/McdIC+QwbTGOnKEEtbGX+1LWQq/8b
 m8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5nS5bCvlfLFqWAAq8Ohfwhhh8km0jfFl9ekoab+BdY8=;
 b=zvLAJtLMdK72NgUZFwxADmEGV0wDkz68mR906Mll1xrKBlEPt6bnFuVFJB5tHbIAxO
 B4l+8hQNZzjhUG3o4xUsvA4zLgXC73iMShLlW64f5YOEwls3jIbRq+VSxSTresNHDVWw
 s6o/dCUBggfFxGSleKLwoMb0k97g3jhl3tUfjQRVQwyrswqrSNc5zcJWhiAdX2irUKnc
 Y5koiTff0WSmJdoiQ2yFIlAeuXng66e8HLP6gVJJI1x9Y+GH0hq9wiUy38bA3tbNRVSt
 SkkhpUZ7HPz2gsRRPKSAbkRn8Ase2nK4GaCcyYecGHqMvp4pQHl4cU10iGVUeyNA1Zpx
 lIwA==
X-Gm-Message-State: ACgBeo1H2pkv5nE6Npq9HjBIEFFdbozV6A1YmdrhxmC+OTx3S+nHIGsZ
 DNX30dAxIHL41JNFuJb3Yn8OuUzub6o=
X-Google-Smtp-Source: AA6agR6vppiVkr5DE6WVM5Dmr7N6vvlshns1QYtwD1Mefiu4VRzTeU9WmW976FeFALd483pku9IspA==
X-Received: by 2002:a17:903:41cc:b0:176:d89d:63e3 with SMTP id
 u12-20020a17090341cc00b00176d89d63e3mr8859445ple.31.1662643717880; 
 Thu, 08 Sep 2022 06:28:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 6/7] .gitlab-ci.d/windows.yml: Unify the prerequisite packages
Date: Thu,  8 Sep 2022 21:28:16 +0800
Message-Id: <20220908132817.1831008-7-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

At present the prerequisite packages for 64-bit and 32-bit builds
are slightly different. Let's use the same packages for both.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 86a4339c48..fffb202658 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -40,11 +40,15 @@ msys2-64bit:
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
@@ -77,16 +81,22 @@ msys2-32bit:
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


