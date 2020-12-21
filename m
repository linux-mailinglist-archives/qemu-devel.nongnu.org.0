Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99D2DFD94
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:31:20 +0100 (CET)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krN9b-00056B-4l
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRJ-0004wp-Nx
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:33916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007l9-Jy
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q18so11333085wrn.1
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cerUCuLfNAoPI4An40BkKkZ+H8a+IdBgs1zZ6lcMQsQ=;
 b=EobYR7HV31KkCRN6qa+MmUPKUpGgIhQaGvBr8ib9L+h8gKtsKLFA3ou+EeFscG18IO
 0/3F3DHgE2e5uBXmgpMeS7KRoEcTvWGZ1C5YNYfYcrRBsdqfoBVEZjigNdBl17gyYjsM
 jsXTRbLGrgXosYq49NA2/YGZoi8A9qeM/DgT9Wfs2HmMW3oRNJyb0TisAHPdp1PeSWPY
 zr1kLl0WrVFP8gKRNFIPab21w7VAwIq73Ol8P4YHHzR0cI2qixoOwdIOO8zcyTO2uMZ4
 jlzSzGbLJVewpRM9jJK4U8wgMRU4vhP2aHTARkO+MHKvxgd8a+biNc7f4f5JJs7nFjpb
 yG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cerUCuLfNAoPI4An40BkKkZ+H8a+IdBgs1zZ6lcMQsQ=;
 b=rdADcH4pmu4CGt3AlVOdKwCQJIFbmZxNBT7nuGG5+mce1BfnhVD2buE7ee1IOS7HQ3
 2ZSxj6iA7sApYJumu6iA5gqeBxGzP5ymx6eTLxHk3jZJNBnWD8habK2RTI73SWyitn71
 U2FUZdWlCIJalePL+tONVcOCy9n3bgfKkm+Jjz3o8L60zHRZh6rAgKVdnIXO+w5MX5LT
 QG2hYqbGkz/jDVFnPCpt4ymT6RjDRMEXWQYMJE0ktt6lvm9wV6IDXxwusS1pHAiKZeqh
 7Jf5Y8MHqKaW1hb3VYXpA+0Md57IE/wz3Ij90Fjid8TUH/f0hZJlqnN6ksGlaunSsvBW
 WbZg==
X-Gm-Message-State: AOAM533YgFWubdQUXso9CH390fJR11YOp4okz7TO4RzfM/ngJbMCeRQp
 4p/RHtVVfh036w7NdoVmseFRxZZg0pY=
X-Google-Smtp-Source: ABdhPJxv8egUFIZ1W91J+/RaHCDfatwbv2kg+iukn5Hc2h+kqP2wTz3IVPsoW5aTL25zw0nqLU/5rQ==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr18426081wrt.223.1608561913770; 
 Mon, 21 Dec 2020 06:45:13 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:13 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/55] meson: fix detection of curses with pkgconfig
Date: Mon, 21 Dec 2020 15:44:20 +0100
Message-Id: <20201221144447.26161-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 34ecb93b03..d5d08c8b6b 100644
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



