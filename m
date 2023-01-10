Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C82BA6645C3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6j-0003fz-6L; Tue, 10 Jan 2023 11:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6d-0003bW-Qy
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:04:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6c-000596-Dc
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RvLrvX68DfKN3YZTD7gEdtEA0Uk0Gjs9C6nZMEKq85E=;
 b=BpCoqePKkrLnJXDpp2mp4MGo2KjcpsZJcSKVeA/DoXWXHkBXvJuhereX0zv9avo3ujPk2w
 uzNMiJSC3X4mn32THY98BxzHMliQORa/CWfeL/X6ytHMVJRrn9fn5ZB+p/yChMNlrXuS57
 1O2eMp7BUu4RPazoQItKXuVqtHi+BJE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-3MBejfgUPlSBPETGv0I7wg-1; Tue, 10 Jan 2023 11:04:03 -0500
X-MC-Unique: 3MBejfgUPlSBPETGv0I7wg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l18-20020adfa392000000b002bbd5c680a3so1653254wrb.14
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RvLrvX68DfKN3YZTD7gEdtEA0Uk0Gjs9C6nZMEKq85E=;
 b=8DYmTw1sccuj+WAYj78JUzkVDxQmZXEkF/N8zt8wzEfjlODG6RcvdKyctbIUjipoet
 zxqWJCvt65M5XH+SJONsxF12Z/oyYOzIrwZ2y87nyGLc/DX0BBsMc0+nf/Yji4yjYXXC
 DeRiaGmoM+s1WxBNhM8DxqVKdBcNbREwNgpq9wSWyooOvhPDfL4sWLm+FrrIxtUCeA9x
 8O2b+TenoWtK+Oh//NplzEpep2MkarKk+o7CaFIueqXVUGdM4SwghtHPRfYzPlYa8ELN
 gsoCx+9q0JuZITQEwB2K8Wno5hkMHdI0M4VJjnh2Z5ysiCGg+ZqwumT7tuN73n5wZcAk
 LVAA==
X-Gm-Message-State: AFqh2kou4lFLC0BhCZGNUOJHsw8eGJqC5o9sx8p8wRNWk0LGeSkrSOo2
 JeQYZY3ofeq3XqO1Bj0l1P90Y6TZ9NuiObqmTZCyutvM/Ad/RxNBNyFftMsXPLSUh8Rh8X32mIn
 y1Ls4t2OeUwf1S6Js3tR9hVxlY7+ZA+dlg8dwnp8jt7Fu3pXDiJ10L5BiodOTuFsiNxQ=
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id
 t6-20020a7bc3c6000000b003d233766f37mr49092205wmj.10.1673366642211; 
 Tue, 10 Jan 2023 08:04:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhmtBdWVUR9414m2x4iow0ZgBN/Tdys7PlHq8IMzyGJnPp0Akrhq4qsVHm9r7D/0I+LKZM3w==
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id
 t6-20020a7bc3c6000000b003d233766f37mr49092174wmj.10.1673366641863; 
 Tue, 10 Jan 2023 08:04:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c4b0600b003d9e91cd08dsm10225332wmp.4.2023.01.10.08.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:04:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 29/29] configure: remove backwards-compatibility code
Date: Tue, 10 Jan 2023 17:02:33 +0100
Message-Id: <20230110160233.339771-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The cmd_line.txt mangling is only needed when rebuilding from very old
trees and is kept mostly as an example of how to extend it.  However,
Meson 0.63 introduces a deprecation mechanism for meson_options.txt
that can be used instead, so get rid of our home-grown hack.

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/configure b/configure
index 203b957a045f..77c77068c7d6 100755
--- a/configure
+++ b/configure
@@ -2569,16 +2569,6 @@ if test "$skip_meson" = no; then
   if test "$?" -ne 0 ; then
       error_exit "meson setup failed"
   fi
-else
-  if test -f meson-private/cmd_line.txt; then
-    # Adjust old command line options whose type was changed
-    # Avoids having to use "setup --wipe" when Meson is upgraded
-    perl -i -ne '
-      s/^gettext = true$/gettext = auto/;
-      s/^gettext = false$/gettext = disabled/;
-      /^b_staticpic/ && next;
-      print;' meson-private/cmd_line.txt
-  fi
 fi
 
 # Save the configure command line for later reuse.
-- 
2.38.1


