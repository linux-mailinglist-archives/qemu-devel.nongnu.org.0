Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4F57A3FE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:14:35 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDprl-0000ZK-NM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDppv-0006Gn-3J
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:12:39 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:42721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oDppt-000323-De
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:12:38 -0400
Received: by mail-pg1-x531.google.com with SMTP id o18so13906273pgu.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F0uGKjPoU9Opuhyy6PqvWCSNOkLbHTJ+1qNsYpb64O8=;
 b=EQo9nqW358hdXWXZJ7p44KY9nb1GXgx/KA3nom4sHIU1n0/foSdS7Ry0ZncGjgG0Fd
 2oaSw4qJJUTup4araE4/fbLiQWI/0XlT0TCE4uOzj0Gj8VncKSa5kbxNwikna/vKSEEm
 TaOWdgD9WHCGSmW4BInyfC3z17Qw+HdYhZoubXAjcq7wuHBvRYz1USafbivKDw4T0V+o
 afW++6D7vwgyZTzdbXtSRQ0IKZVZ7x+inBZ3g1gD9zdY50t3XakfutI70y1VnkXeoruW
 oCKIWG3KmWkh6uBzOy8wpLx1esWF0/cKk+fmGkw0BvbgNI3cXYEbv1q0fq6Ja3eXTLOm
 pJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F0uGKjPoU9Opuhyy6PqvWCSNOkLbHTJ+1qNsYpb64O8=;
 b=e+zlcR44DCOChx2M7Ep/ab6POjwlTPjxe2gwklSS/laaB4RxLXv89/hVVvjKWUobtD
 MaSQRjjQxzualVLzsttzjLx6E9ZT8IpDg40Dn2U+fm6oTqg7Kkr8OK4vkUBv32P8xHdC
 i3n51XowxU5aLuVj+4EkvKFWP8/mairmMzdo9xUh7dKLP4lw17R2FIWy6v7frHfg8xY7
 e3QIUs75VXKKLBjbAgY+Y/+iMB76J/TmQ4rh/InwyJnVuhe5AzcKlj/WOigYFqWrZaL8
 CYcS/LO4145vjkk/aX7KWLs6YgPUMIu+7lQV12wtAllOSrYbw+hAS4W7fLbOP7l9w5jw
 q53A==
X-Gm-Message-State: AJIora/Cc6jtdQ+NA6TR5hWZ0xlnksPaXrqBvXwp3EHrx0hqaJVDEFXg
 rziGYMrK/H8+RyfSGo9tdmg=
X-Google-Smtp-Source: AGRyM1svCNo9KpdZe8yQvInTDvbqB1zZLsRsoE/K6p6d58hBvlBE88MipuqRyQgUJwCzZaDrkHd5/w==
X-Received: by 2002:aa7:8811:0:b0:52a:b0a4:a324 with SMTP id
 c17-20020aa78811000000b0052ab0a4a324mr34626050pfo.63.1658247155818; 
 Tue, 19 Jul 2022 09:12:35 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a170902ea1000b0016bf9437766sm11015059plg.261.2022.07.19.09.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 09:12:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] .cirrus.yml: Change winsymlinks to 'native'
Date: Wed, 20 Jul 2022 00:12:30 +0800
Message-Id: <20220719161230.766063-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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

At present winsymlinks is set to 'nativestrict', and its behavior is:

  a) if native symlinks are enabled and <target> exists, creates
     <destination> as a native Windows symlink;
  b) else if native symlinks are not enabled or if <target> does
     not exist, 'ln -s' fails.

This causes the following error message was seen during the configure:

  "ln: failed to create symbolic link
  'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"

Change winsymlinks to 'native' whose behavior is most similar to the
behavior of 'ln -s' on *nix, that is:

  a) if native symlinks are enabled, and whether <target> exists
     or not, creates <destination> as a native Windows symlink;
  b) else if native symlinks are not enabled, and whether <target>
     exists or not, 'ln -s' creates as a Windows shortcut file.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .cirrus.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 20843a420c..eac39024f2 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -10,7 +10,7 @@ windows_msys2_task:
     memory: 8G
   env:
     CIRRUS_SHELL: powershell
-    MSYS: winsymlinks:nativestrict
+    MSYS: winsymlinks:native
     MSYSTEM: MINGW64
     MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
     MSYS2_FINGERPRINT: 0
-- 
2.34.1


