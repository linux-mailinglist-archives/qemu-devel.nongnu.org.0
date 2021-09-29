Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C107341C845
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 17:24:49 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVbRw-0003So-Jj
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 11:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVbMz-0006Hq-FV
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:19:41 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVbMy-0003tF-12
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 11:19:41 -0400
Received: by mail-ed1-x52b.google.com with SMTP id l8so10345542edw.2
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ibab/LaxM3bPcNJJORk6QVmH9LYNVhRV2D6hYEknGhA=;
 b=En5+0HiRRqKOQePFL1IFyoxJOD6BIDjZFVJIrbAdcAaw1kMHKBsi4PjRQDgnO/vDsD
 s1YqaVFGIPEMZ5UUayXzUAL+0GMCAm4NwY8pc8uEHjG94OhOAlWVUiaupM+dQ3OCF7dV
 0/Nd3cQbZzNlB7wMGXCIqZBxnyDSV4fNKhHNjI2XGF73b+kJvAN5VQaP/GkIjiXTgSYt
 1kQma8fa/QRRrcugQsEVd2mUqv2FYHHYXcT/Mv3bqWrPPm5QSQUq1w6JqrIO8q6xZ6Yq
 V1ggRqaz/tvbG65usGk79quxHqvIVze/NHJ1b7wE1tnIRWftCTUw11JRuzRfe8C8SquN
 EJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ibab/LaxM3bPcNJJORk6QVmH9LYNVhRV2D6hYEknGhA=;
 b=K6Rr+SKD+lDcx7EwOC/fdqpBtl6oCo3B92USrv7KWd+FPIFxurxVFaCkaaUvLprbkd
 dHbsuBse3UKF6H/rrXkONIen7tDzDun1OKPAtZwpxwbG03yYHdcoTY1lGAvqTlHdJSrV
 3AapiKYfdw0z63VygtPsSJlyH3xu3sWzCWAQ4ZEIGWzR6qkjA+FZkQLZO+t/JyDlLVPH
 DyUJL//1Himh0qjeMMmWuoQxQSgkVG4+NuZLC51uJ9qgjcUApElly7/dGJCradHxZFo/
 XKw1rCP/jxAS4B4dWCXc8s5xJQq701ptNn/lXs2wAZyWEoctlhT8WQKTbzf3o3k1tG2T
 mzog==
X-Gm-Message-State: AOAM532MWfxh+FfTGVF7MFMfTS5zJWgh/WPCTWwMoBGPQZZbtE75T1jH
 JqrehTiArUShKQpNDqnVhucShSxpHT4=
X-Google-Smtp-Source: ABdhPJznBE/Pdw8FcCYaO8bsWrm9oiQnzBl9kPSGAbzGamt7BvDCMh2FKyp21D5KsQG+yXYZ/R4yNQ==
X-Received: by 2002:a05:6402:1551:: with SMTP id
 p17mr519053edx.388.1632928732521; 
 Wed, 29 Sep 2021 08:18:52 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 k20sm105196ejd.33.2021.09.29.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 08:18:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure, meson: move CPU_CFLAGS out of QEMU_CFLAGS
Date: Wed, 29 Sep 2021 17:18:50 +0200
Message-Id: <20210929151850.65349-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: richard.henderson@linaro.org
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
index dd34ca8774..9fea643cb8 100755
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
@@ -1334,7 +1334,6 @@ esac
 
 eval "cross_cc_${cpu}=\$cc"
 cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
-QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
 # For user-mode emulation the host arch has to be one we explicitly
 # support, even if we're using TCI.
@@ -4132,9 +4131,9 @@ if test "$skip_meson" = no; then
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


