Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0811CDD9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 14:08:45 +0100 (CET)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifOCx-0003WD-NS
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 08:08:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyD-0003Fe-KG
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNyC-0006QK-9G
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:29 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNyC-0006Oo-1m
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:28 -0500
Received: by mail-wr1-x434.google.com with SMTP id j42so2572706wrj.12
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g4zEzo5NcSs7ChSRMHLU2CYO2jCxB5nfA8k+ievYaHo=;
 b=Ksdp0GvpDI6cpUu9Bq17GXw82sqGwnAaKNxuahEUX9oife2gT+YcEA2XTnDJAhYQF9
 aDoydGNOp+2uSYpMQ1u/X/sF7MSp7lafJAFoz/70EN5Q002yG461ebUG6/qc6WQ7KQxq
 IYi2f1iEny8lklr3rZKxqw4dWIO956Xj2OR4Jssg3NbPw7SNnpCWUPnk/jY/XdjEjt1R
 o5HMAIF2uBs/cADO+X0KzBmsHbxRsFsLRPuMcoYdNRUbJFzphsOrpCDwL/Abp9K/R0nq
 66SDvqzOEvjOSDpFv9O5W+/A4TjbahLJVkC460B+tONOD0RA5yougZV0uG6ag2hUiJrl
 tSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g4zEzo5NcSs7ChSRMHLU2CYO2jCxB5nfA8k+ievYaHo=;
 b=RFHY036iy6apznt7VjjOxv5i6dredIDLWHbX2GWtAEVR6r17SmMM1e7Hd/Cep/fXwQ
 phiabszjNbgW6Z1BkPQkyr+peI8g09QcAsnitsjX7c2ePyTYDRSJsggDfjgy7nDH8w88
 dVRFKoJ22RYUD+6ifpYfjsLYLVQu/KM/s06saJHqUnv6hDireWQ0kQ3TO3sM+2/X58+n
 iQjvUIOddbaXG/B4DmeQ61zbg2wsZzDgcwzMNI65pBI90BjhGjryIzLxkRUO9N4fM2cC
 hnhbFd2pPsLEHTHuU3fYtcDBCPlerkVQf1AAivUmTUjbfu99A8cHTed0ZMWREVYzKTn2
 ETtQ==
X-Gm-Message-State: APjAAAUDNf6xg2FiFFxsnnavW5kf8B76WifGteHz6tNU+Fp1g5ZIZyWU
 omOOHrbYT0NvQ9odzdnPpB87/fv0
X-Google-Smtp-Source: APXvYqxMUzRDYfGUxp3ZeYHXramC3JssWC7Lntu8Vo/SBtU+E3413qPUDXS3zXUz96zyoCb0wKFAlg==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr6524706wrx.304.1576155206901; 
 Thu, 12 Dec 2019 04:53:26 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:26 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 029/132] meson: generate shader headers
Date: Thu, 12 Dec 2019 13:51:13 +0100
Message-Id: <1576155176-2464-30-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile              | 18 ------------------
 meson.build           |  1 +
 ui/meson.build        |  2 ++
 ui/shader/meson.build | 15 +++++++++++++++
 4 files changed, 18 insertions(+), 18 deletions(-)
 create mode 100644 ui/shader/meson.build

diff --git a/Makefile b/Makefile
index 5d0be7b..472962d 100644
--- a/Makefile
+++ b/Makefile
@@ -582,24 +582,6 @@ cscope:
 	find "$(SRC_PATH)/" -name "*.[chsS]" -print | sed 's,^\./,,' > "$(SRC_PATH)/cscope.files"
 	cscope -b -i"$(SRC_PATH)/cscope.files"
 
-# opengl shader programs
-ui/shader/%-vert.h: $(SRC_PATH)/ui/shader/%.vert $(SRC_PATH)/scripts/shaderinclude.pl
-	@mkdir -p $(dir $@)
-	$(call quiet-command,\
-		perl $(SRC_PATH)/scripts/shaderinclude.pl $< > $@,\
-		"VERT","$@")
-
-ui/shader/%-frag.h: $(SRC_PATH)/ui/shader/%.frag $(SRC_PATH)/scripts/shaderinclude.pl
-	@mkdir -p $(dir $@)
-	$(call quiet-command,\
-		perl $(SRC_PATH)/scripts/shaderinclude.pl $< > $@,\
-		"FRAG","$@")
-
-ui/shader.o: $(SRC_PATH)/ui/shader.c \
-	ui/shader/texture-blit-vert.h \
-	ui/shader/texture-blit-flip-vert.h \
-	ui/shader/texture-blit-frag.h
-
 # documentation
 MAKEINFO=makeinfo
 MAKEINFOINCLUDES= -I docs -I $(<D) -I $(@D)
diff --git a/meson.build b/meson.build
index 6d4bf27..447a32c 100644
--- a/meson.build
+++ b/meson.build
@@ -113,6 +113,7 @@ have_block = have_system or have_tools
 
 # Generators
 
+shaderinclude = find_program('scripts/shaderinclude.pl')
 qapi_gen = find_program('scripts/qapi-gen.py')
 qapi_gen_depends = [ meson.source_root() / 'scripts/qapi/events.py',
                      meson.source_root() / 'scripts/qapi/introspect.py',
diff --git a/ui/meson.build b/ui/meson.build
index cad9763..8157754 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -32,3 +32,5 @@ foreach e : keymaps
                           '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
                           'code-map', '@INPUT0@', e[0], e[1]])
 endforeach
+
+subdir('shader')
diff --git a/ui/shader/meson.build b/ui/shader/meson.build
new file mode 100644
index 0000000..26c7a18
--- /dev/null
+++ b/ui/shader/meson.build
@@ -0,0 +1,15 @@
+shaders = [
+  ['texture-blit', 'frag'],
+  ['texture-blit', 'vert'],
+  ['texture-blit-flip', 'vert'],
+]
+
+foreach e : shaders
+  output = '@0@-@1@.h'.format(e[0], e[1])
+  custom_target(output,
+                output: output,
+                capture: true,
+                build_by_default: true, # to be removed when added to a target
+                input: files('@0@.@1@'.format(e[0], e[1])),
+                command: [shaderinclude, '@INPUT0@'])
+endforeach
-- 
1.8.3.1



