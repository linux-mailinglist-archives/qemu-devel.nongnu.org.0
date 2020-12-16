Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954A2DC2AB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:03:48 +0100 (CET)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYLD-00065M-MO
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJk-0004O3-8P
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:16 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJi-0007UU-IA
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:15 -0500
Received: by mail-ed1-x529.google.com with SMTP id b2so25163399edm.3
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rZGYORyv9W21igfeV17FlgKIscLvsjmR+GC11LOjM4=;
 b=Iv5EBKwBbn9Ab6UTbjSrEq0RikArbklrJMGuJHZIaZfHHxHgzybT2iyVOGv0XysOrY
 EMqubqO3fcYf2E23MZWxSK1Sz40R8VdW9JgQ2OUPFHbIro0aTIQeJIL8/RznPfoslJxA
 VtStDvt8Sm7wrVI78X75FW1edpQSnsJmVk8qRk0vfO40ManmR9u7ZFWE0krObf9dRAqN
 Z4CN4q5Iw9hDLp36OxaRt5ZQgFv5K7X3X5fyvv858+OqOPSO8T5y2GUuO/gmXafOVj5+
 wtyksSfM7RYQ2lYWH1lPka7DVNpbCFnhUZBQ88ynFIdbfPmH/suLkugQOToWB7fi+fNF
 MZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2rZGYORyv9W21igfeV17FlgKIscLvsjmR+GC11LOjM4=;
 b=LgRMx+odHUj7UVNcCh1dll+tNhOPXDhCFESA/MEMu32AlMmbkQF8UOAs0EMILtONPI
 /+nbG8ZMeB49G0KrHitCafCZ5UrFeoOgZ+V3ZSnYmch+XL1DPhugM0vKoWZranPepL3d
 zUe6KRJ6ENl/S6AM+DKqqNqdYVGgrlOnvF+J24/lfkA/GFrZSUIbCG25r57rUMgC7/ZV
 Ut1tM1aSpAZuSyO40a1EwdEHkSMX9Q22DOcOj8158CFdEDlCpl+yKsmfY2S0VYtPGd8s
 38ib3n5Lv8RYmauihwP6fB9TsMlXwgw4B0thJw6Xx1wkw9Gw15r+KaE2IGy03B1UUae5
 lAHQ==
X-Gm-Message-State: AOAM533x2PYUl2I99IdZrr8qlBApdEYZ9XzXXpG8f8O2FebQhnP5S5k5
 u1oDOglZ0rjO3+pSWqyKJV+zZfmh344=
X-Google-Smtp-Source: ABdhPJxOajUuKs1FzE1e3JzreJP1MYi5RxagzmRRxoscYpE45gQH66RIgVIESjx4jX5e0V1it8ExDw==
X-Received: by 2002:a05:6402:318f:: with SMTP id
 di15mr34256357edb.237.1608130932892; 
 Wed, 16 Dec 2020 07:02:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:12 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] meson: fix detection of curses with pkgconfig
Date: Wed, 16 Dec 2020 16:02:04 +0100
Message-Id: <20201216150207.431437-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216150207.431437-1-pbonzini@redhat.com>
References: <20201216150207.431437-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 39fc9b7143..ab622ae8bd 100644
--- a/meson.build
+++ b/meson.build
@@ -500,16 +500,16 @@ if have_system and not get_option('curses').disabled()
     endif
   endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
+  curses_compile_args = ['-DNCURSES_WIDECHAR']
   if curses.found()
-    if cc.links(curses_test, dependencies: [curses])
-      curses = declare_dependency(compile_args: '-DNCURSES_WIDECHAR', dependencies: [curses])
+    if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
+      curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
     else
       msg = 'curses package not usable'
       curses = not_found
     endif
   endif
   if not curses.found()
-    curses_compile_args = ['-DNCURSES_WIDECHAR']
     has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
     if targetos != 'windows' and not has_curses_h
       message('Trying with /usr/include/ncursesw')
-- 
2.29.2



