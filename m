Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1216341AFD8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:18:59 +0200 (CEST)
Received: from localhost ([::1]:59760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD0b-0001Hy-Ij
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaI-0006gN-RH
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:46 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaG-0001UU-Do
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:46 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s17so64110345edd.8
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cz69+LB8vyHglkWeQaZaWYrHPHHMp6AioMXJRYKgxG0=;
 b=E5IQLxfRVy0wpjxMXq8Ci9s4IRmu3xrHEqOUu+aqmsnXHXeJyv+Dhm/hhd542iVU/T
 krA2Z1HIJhqw5xOhwErUl7rScSuYq+RQKu8eSHnLATgQnlzFgMz0sEXt6r1nE96r+jlx
 L3PQCACS9jxhi8kgXOaZvStop3Co7fv852HLnAgdxdR421MM7DGBR6g/UD4oFdjt+FEY
 OKiCKnS9t3W8z5vRPtg0gomnTZcGHJQHQwLwpnUN93L/PS9MgFiOaZVFf7KnOU3+9ABb
 47KBZ6/Wa72ceoNh36WJc0tfWDq/0XKcsmxkX9Z0tE3yPO9Qne7FAox0nb9XYVC4H/Ci
 uZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Cz69+LB8vyHglkWeQaZaWYrHPHHMp6AioMXJRYKgxG0=;
 b=OyVVkpSNh6JzEaqu3FUn1Zy4dkBtFl0rUd/lqtC+rtlVOa+0qE2/rFBBWopY4cHhk7
 TiSpcH49HshzlZ2OOifKfLSDOWm4yoiVLpkLCIctXOHwELi4mLNgD50yOk2oeT1ZraMI
 XD06GuPZ0eYMR12wTPwgMFFVfnsNV/29WniD2fKLQPmApzca0DbBmJtYQhb7exPpZNuI
 vSFLhCia05k8ItrOocds5YwHO1EppwKTIfyZ50E5OBOa8zoosJTrF2FI5bneGyI6LXdz
 PCsBkRr5NeFcWZ4S+lvr8L3/64erQV1iC5/n0k0v0LPx+qD15igP9wabJDhZvMvToxoq
 Hw7g==
X-Gm-Message-State: AOAM533cIv+f3lTA1B7XhipLHaNBlAdHxxBF8LyrqFZQlUT2lCdm6teH
 LH3xm8shccVlkEzPqHqs/UvcsxqIxHE=
X-Google-Smtp-Source: ABdhPJzjnCR7dixdxGqEd8fOAXDaa0oEfe7MTL85sy+Ge7nX6OKaU13XgJYUDLvyecTpebfUudbO/g==
X-Received: by 2002:aa7:d303:: with SMTP id p3mr7542062edq.174.1632833499700; 
 Tue, 28 Sep 2021 05:51:39 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/33] meson: unpack edk2 firmware even if --disable-blobs
Date: Tue, 28 Sep 2021 14:51:10 +0200
Message-Id: <20210928125116.183620-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

The edk2 firmware blobs are needed to run bios-tables-test.  Unpack
them if any UEFI-enabled target is selected, so that the test can run.
This is a bit more than is actually necessary, since bios-tables-test
does not run for all UEFI-enabled targets, but it is the easiest
way to write this logic.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210923105529.3845741-1-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                     | 16 ++++++++--------
 pc-bios/descriptors/meson.build |  4 ++--
 pc-bios/meson.build             |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meson.build b/meson.build
index 15ef4d3c41..978e8329f7 100644
--- a/meson.build
+++ b/meson.build
@@ -106,14 +106,14 @@ if targetos != 'darwin'
 endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
-install_edk2_blobs = false
-if get_option('install_blobs')
-  foreach target : target_dirs
-    install_edk2_blobs = install_edk2_blobs or target in edk2_targets
-  endforeach
-endif
-
-bzip2 = find_program('bzip2', required: install_edk2_blobs)
+unpack_edk2_blobs = false
+foreach target : edk2_targets
+  if target in target_dirs
+    bzip2 = find_program('bzip2', required: get_option('install_blobs'))
+    unpack_edk2_blobs = bzip2.found()
+    break
+  endif
+endforeach
 
 ##################
 # Compiler flags #
diff --git a/pc-bios/descriptors/meson.build b/pc-bios/descriptors/meson.build
index 29efa16d99..66f85d01c4 100644
--- a/pc-bios/descriptors/meson.build
+++ b/pc-bios/descriptors/meson.build
@@ -1,4 +1,4 @@
-if install_edk2_blobs
+if unpack_edk2_blobs and get_option('install_blobs')
   foreach f: [
     '50-edk2-i386-secure.json',
     '50-edk2-x86_64-secure.json',
@@ -10,7 +10,7 @@ if install_edk2_blobs
     configure_file(input: files(f),
                    output: f,
                    configuration: {'DATADIR': get_option('prefix') / qemu_datadir},
-                   install: get_option('install_blobs'),
+                   install: true,
                    install_dir: qemu_datadir / 'firmware')
   endforeach
 endif
diff --git a/pc-bios/meson.build b/pc-bios/meson.build
index f2b32598af..a3b3d87891 100644
--- a/pc-bios/meson.build
+++ b/pc-bios/meson.build
@@ -1,4 +1,4 @@
-if install_edk2_blobs
+if unpack_edk2_blobs
   fds = [
     'edk2-aarch64-code.fd',
     'edk2-arm-code.fd',
-- 
2.31.1



