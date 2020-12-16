Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9702DC401
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:24:39 +0100 (CET)
Received: from localhost ([::1]:51780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZbT-0006be-1A
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXD-0002DF-Eq
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:16 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXB-0006Uv-Vd
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:15 -0500
Received: by mail-ej1-x636.google.com with SMTP id ce23so33566955ejb.8
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2rZGYORyv9W21igfeV17FlgKIscLvsjmR+GC11LOjM4=;
 b=fkzgLJpgjufYxW5xY223vyP9kgSAA6BBEelqKNIz5jNuxUB/JEHXRoFoKBDAfAnqF9
 OVPlo8ZyAqTR2jt0kGIm/4FoRjnSqRpNMjt07WGfIGb1hyV9QFnNbnVX7HQf8XkXcfGX
 ANKoryeArArEZhUXLHK6+K9tVMEGOjewASKk3DXthgYSeiEmR9YPuMLQH7kTBPq41y3s
 eXdlgGGrygzjsPzfCkwzPd5sJFCQo2X7CoFEZrXTV4eWYpaqrcXUG2lhGkZmMXtei8fA
 Pg9SYUb09oG8bAwT6dy2OYFGTNJCsAO6Be18cgwhekxLOUHFvLoE57bd1ujw9ASMweRH
 KU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2rZGYORyv9W21igfeV17FlgKIscLvsjmR+GC11LOjM4=;
 b=axC6eOyGIXvtHJhaAhVLkd1FbrhZ0HCmMDAn52CTHcl9IERRvigg1kOGzGfuJAw9fU
 ygTCMg4Ys8u7LVnMxDYzZ/Feoi4HafVyjG49g7xlXwtsOLlvmP9JSjJjQccXIsovri4G
 /PMj2eYh8zzFTm1xxcI7wHr+TWUVoTaHDTwtJueE9F4gINsFMG+6fcWFX7Zfo5W2IH8h
 Ch6Ex2xIAhrpbRAhkvep8+ZzXuP+GJ+u2bxqPzD0HQbr6pIyOOpDGNX0yi4ICTBRKYXJ
 FURDEUqgSvi1QhoajfkAAc6diR6VycIalf0r0W1clWrulgn+qDhj1Ytq0NLMiU5qpko2
 XZXQ==
X-Gm-Message-State: AOAM530qCsrAOqHTE3Y/46VRV9Ohrv9dTp1K9s+L5d1aXLpWDUls5yFk
 mmufiP5aCxx3vETO0WpWBbxkPtEMbro=
X-Google-Smtp-Source: ABdhPJzkYuHRXGAOJpR5rofZC0S0Qtkjj9R6FUu5KqkK9wjIAE+lp+/SzKe6V//ER+h3DCw48V9RRQ==
X-Received: by 2002:a17:906:4e45:: with SMTP id
 g5mr8150712ejw.391.1608135612145; 
 Wed, 16 Dec 2020 08:20:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] meson: fix detection of curses with pkgconfig
Date: Wed, 16 Dec 2020 17:20:03 +0100
Message-Id: <20201216162006.433850-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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



