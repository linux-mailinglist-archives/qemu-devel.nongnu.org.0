Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A591422F36
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:29:02 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoFR-0000z8-A8
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYC-0007pg-CN
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:20 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY9-0003vo-So
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:20 -0400
Received: by mail-ed1-x535.google.com with SMTP id b8so1222815edk.2
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DY6lnefGoP73LgVopoja66JUkhUBsN2m6jSvYb4UO64=;
 b=NQId0Vf6AgdLopvTphB2lgER6kJbdn2DyaHJ01TLBtwf/ZPbUJJAhnfjowgYyBNgKA
 HMKj5QImPGlGsw+nUcZWfW0+hllSs9yCZhwQkGkR3XUs63HeSp5dmNZofZ2w2W/w+jhU
 7OuLlGiFshHAY+D/xypr1ds5DyybDQYAWCZm9P1oT20f2f7qzIE1VcTOwO9J+0R7ZyQ1
 ESRJ3Ej3yYmAIKl6sZkADu6ERWLWE77g51CVuNhhLGz9yUEzyZeQGJhyoEYf6McfDAzq
 L8gst/QcROXQAFkTovSjP2AxFujExrb/rHlgpuWIQn4dSHbHhcu67D7BHsRuCWOMiqEt
 +4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DY6lnefGoP73LgVopoja66JUkhUBsN2m6jSvYb4UO64=;
 b=zSc82p47gLKxVvwOPq6MP1vsI8Ea1NfjPL0JDSn4NqqKELCGrEU5NwY6B/qwfjUBuY
 psOB4AYeBI9Nq30oQTf/KDZ81bMriUM429V1Le1ZiKCiS3lU/TkK/xgLzP5/9CPDVeoI
 I+40s7hpziBimyvBXqvV0nIoMMFTH4IkwF/ElOUGyTf2lsI8EfviAChxFm/UF64V+vGH
 ufZYKog63k47QuT1MSjaBlQzd/S+MXeOLyS/KHjPI3rIx6P64K3Kn+NYs6TrS5CT+qE/
 3voPq2WuwH8XAS4ZtDaI5iK2+EW+BeYgHPnpa4qS3E1bK78iLvnHXBz6K88sZf9ccoFw
 d08w==
X-Gm-Message-State: AOAM533g8JmExYtRvOoD5kOumHnlXPUDm3kxQzoHgqBJ/1IqshEwzA8e
 0r0sRlC7pLjwZ9gaH89imovLKNqj7ZQ=
X-Google-Smtp-Source: ABdhPJwcm2eq1WkFJcXWJsuFsd8g7Xd/PVxRbRknGAtumZAx9fB4SapzB90AD3pmSw22wNxELUFqMg==
X-Received: by 2002:a17:906:36d6:: with SMTP id
 b22mr25371924ejc.387.1633452256344; 
 Tue, 05 Oct 2021 09:44:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] configure, meson: move CPU_CFLAGS out of QEMU_CFLAGS
Date: Tue,  5 Oct 2021 18:44:01 +0200
Message-Id: <20211005164408.288128-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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

Flags that choose the target architecture, such as -m32 on x86, affect
all invocations of the compiler driver, for example including options
such as --print-search-dirs.  To ensure that they are treated as such,
place them in the cross file in the [binaries] section instead of
including them in QEMU_CFLAGS.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/configure b/configure
index b0b1a1cc25..1d3f099498 100755
--- a/configure
+++ b/configure
@@ -142,11 +142,11 @@ lines: ${BASH_LINENO[*]}"
 }
 
 do_cc() {
-    do_compiler "$cc" "$@"
+    do_compiler "$cc" $CPU_CFLAGS "$@"
 }
 
 do_cxx() {
-    do_compiler "$cxx" "$@"
+    do_compiler "$cxx" $CPU_CFLAGS "$@"
 }
 
 # Append $2 to the variable named $1, with space separation
@@ -1688,7 +1688,6 @@ esac
 
 eval "cross_cc_${cpu}=\$cc"
 cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
-QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
 # For user-mode emulation the host arch has to be one we explicitly
 # support, even if we're using TCI.
@@ -5114,9 +5113,9 @@ if test "$skip_meson" = no; then
   echo "c_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
   echo "cpp_link_args = [${LDFLAGS:+$(meson_quote $LDFLAGS)}]" >> $cross
   echo "[binaries]" >> $cross
-  echo "c = [$(meson_quote $cc)]" >> $cross
-  test -n "$cxx" && echo "cpp = [$(meson_quote $cxx)]" >> $cross
-  test -n "$objcc" && echo "objc = [$(meson_quote $objcc)]" >> $cross
+  echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
+  test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
+  test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
   echo "ar = [$(meson_quote $ar)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
   echo "pkgconfig = [$(meson_quote $pkg_config_exe)]" >> $cross
-- 
2.31.1



