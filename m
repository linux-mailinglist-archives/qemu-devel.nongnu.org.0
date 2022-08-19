Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B78599CED
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 15:33:17 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP27g-0001us-Ng
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 09:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22x-0004nv-TE
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:41571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22w-0001zt-AX
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so4910951pjl.0
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=MPQW4Rnem4KMReYwXiEy55PhYSsQ/M3unNrHvLUzwfA=;
 b=TUml19oXwiREqzt7pFgdB8eacU4HUzHtxk+4APzqCZK9K10wuxzEHolNTwlwUoq4Ez
 jzx6BT7JcbgsSGMzk3wi3v/2hoODqfm/12n9NZyWBGt7KtXrE7RtPx6tH4VVRB/xHpe8
 ZEzaIuHRFtdS//LIADr1N7gNLB541GQr9et0Ioo4ld+FAWx4a3wQhiHGp//U9Nl0YZ9k
 9msBV/hXRyuIIBxQhcBxFhes9NHrm0FtREiRTvGAp/zBzMaJerhD7gFE/ZYeZQSjwwDw
 p824JUVc+Y8w55YHSnhmb7Y7FdIQAjSw90I+8BcYZlbo7rQQC9ERnDZB8yfZ9uPKB0Js
 WyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=MPQW4Rnem4KMReYwXiEy55PhYSsQ/M3unNrHvLUzwfA=;
 b=X+IrJUGLJ4KtKLVThvsqeyQQf/f2u7B/rGb5LSK8AP7ZyhusXgILo3iLVLbJaDBjDd
 Mc4gjd/CcxHP6Ah3fKcjbJDAQesupUIzc/QltZnttkXFYwz/7G+Rjq6kLqITwxjLge7w
 5krs+NzDUi1EPQ9RbH4PlqT8aNwC1LgR6aK5tPMwqwjlkoBmOAxxfIRPl9EVp658UDfp
 Ql1pNwHlBFJMTN0DvSQHKEFtI6nNclKyl60AC7frf8NsHYfhzYdLB8OBSifS1oS2A7Sz
 0hGiqj+Dy5qTgP6uB3ra7mIncNXSJUzDcbk+Vpht8R01J6ptggqEnXvqVTRh8IAYUJx9
 CtAg==
X-Gm-Message-State: ACgBeo1DBGnhIBHlW3RvSDcHJuExVxwJcuG0QzOVm6JcptZdZWkfvoCP
 RoRCfj+qS8GyUZtMx2no7h+s3gRei0c=
X-Google-Smtp-Source: AA6agR7O30pC3TZVtxGOfLRcZlAoYCVv827KkXN0s8PFYXB1/fMl7QdTTNsUVbpx65L5nzwnwFTVOA==
X-Received: by 2002:a17:902:dac7:b0:16f:13c6:938d with SMTP id
 q7-20020a170902dac700b0016f13c6938dmr7533051plx.11.1660915700630; 
 Fri, 19 Aug 2022 06:28:20 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c4c3:cfa3:24fd:3a7])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b0016edb59f670sm3195005plk.6.2022.08.19.06.28.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Aug 2022 06:28:19 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 3/3] meson: Allow to enable gtk and sdl while cocoa is
 enabled
Date: Fri, 19 Aug 2022 22:27:56 +0900
Message-Id: <20220819132756.74641-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220819132756.74641-1-akihiko.odaki@gmail.com>
References: <20220819132756.74641-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1032.google.com
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

As ui/cocoa does no longer override main(), ui/gtk and ui/sdl
can be enabled even ui/cocoa is enabled.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 20fddbd707c..48b6c22aab7 100644
--- a/meson.build
+++ b/meson.build
@@ -589,12 +589,6 @@ endif
 
 cocoa = dependency('appleframeworks', modules: ['Cocoa', 'CoreVideo'],
                    required: get_option('cocoa'))
-if cocoa.found() and get_option('sdl').enabled()
-  error('Cocoa and SDL cannot be enabled at the same time')
-endif
-if cocoa.found() and get_option('gtk').enabled()
-  error('Cocoa and GTK+ cannot be enabled at the same time')
-endif
 
 vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
 if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
@@ -921,7 +915,7 @@ if not get_option('brlapi').auto() or have_system
 endif
 
 sdl = not_found
-if not get_option('sdl').auto() or (have_system and not cocoa.found())
+if not get_option('sdl').auto() or have_system
   sdl = dependency('sdl2', required: get_option('sdl'), kwargs: static_kwargs)
   sdl_image = not_found
 endif
@@ -1187,7 +1181,7 @@ endif
 gtk = not_found
 gtkx11 = not_found
 vte = not_found
-if not get_option('gtk').auto() or (have_system and not cocoa.found())
+if not get_option('gtk').auto() or have_system
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'),
-- 
2.32.1 (Apple Git-133)


