Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFCE3C6008
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:03:08 +0200 (CEST)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yOg-0003Lq-Qf
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:03:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL9-0000Nm-Cv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2yL4-000759-DD
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:59:27 -0400
Received: by mail-pg1-x52a.google.com with SMTP id v7so18725339pgl.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+H4xJOdclX41RzHCXkYk0QTpQSN2UXGitrvAjova9Y=;
 b=hv/W9EfLFSGRnP0eeXoPohDuSVF+lu4KQfqa26tKk3D++6X/Agq0XYWZpOQR9z8K2h
 7MNuwGmSg+j32u9twFPUx9Gef3NWq7xcTghvqdi+8M6S2OlB32Z7Jhc9DbOwzFc5EJfg
 oZ9fJJr+wObRQbA38iUqjxvflb63dMzklJZU4ISNdnDyqqw2Lt6h9APux8+Y1VUBKtZ6
 fnC1O2ciMMu+PClEz4DQiLmewDgfbSnhWf4gcTwNMzUaDxsFaGvDC65/NaPt6ANIjIkK
 xoYpHZiKtDIL3BJPqBBYDnhnK72N8iLv0GziUGaY9jC151zKZgaLudEcIe6xHQ6FKQ7O
 exbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+H4xJOdclX41RzHCXkYk0QTpQSN2UXGitrvAjova9Y=;
 b=taIVtmMathcFfJWQ7zkownBK0ztKq2IdvqD/xOp3PluusxB9Dky2kkeKkbayhv3iko
 GXwpnuNG7VKoCkrcXdWeahkcibXxceTOZK7xKzWWD7Fv5lKVJa0SqFm6xoC9OtRPxucT
 4lYXZFCvqrToiD2vYCElbjXPecB1r9FnYgLbd0KfXtc3AEWwFv9OnQ9s7UpLXYz1HPRi
 DcqBfDCoDmX/V7MwjOvWxztokcJRgw+6oheeBSHlN+Dap/zmw1uwAODPhdehdIZjFmiK
 pqVajkdRi3UhtKDdNTkPOpWBHX/B/aXjRsxC/Rbujd3R0S2rh29URp0lnoM/wYcb+sg4
 92UA==
X-Gm-Message-State: AOAM532piTX9l509FL0ZQwVUDFyPMdajBj5zn2/ITHDcRiMbsDHoKNxK
 KqV9K/5p6QXFU8BDXEoYWVlMpWswTZGfxg==
X-Google-Smtp-Source: ABdhPJzWF7UPegKb4XQALSNM6H7dI1JfDhkl1j62nu4utobAoxr5CQMVtPStbuYrl52tVTIz2xF6/Q==
X-Received: by 2002:a62:c501:0:b029:32a:dfe9:8648 with SMTP id
 j1-20020a62c5010000b029032adfe98648mr10123860pfg.28.1626105561184; 
 Mon, 12 Jul 2021 08:59:21 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j16sm16745021pfi.165.2021.07.12.08.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:59:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] configure: Conditionally disable clang-12
 -Watomic-alignment
Date: Mon, 12 Jul 2021 08:59:18 -0700
Message-Id: <20210712155918.1422519-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712155918.1422519-1-richard.henderson@linaro.org>
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The i386 abi does not align uint64_t (or double) in structures to 8
bytes, only to 4 bytes.  Furthermore, the hardware does not require
8 byte alignent for cmpxchg8b, so the warning is confusing and useless.

Retain the warning for hosts (notably x86_64) where the ABI is sane,
and one has to do something extraordinary to remove alignment.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/configure b/configure
index 95e0a08938..163b4edee2 100755
--- a/configure
+++ b/configure
@@ -3927,6 +3927,22 @@ if compile_prog "" "" ; then
   atomic64=yes
 fi
 
+# Test for clang atomic misalignment warning vs ABI structure misalignment.
+# E.g. i386 only aligns structures to 4 bytes by default.
+if test "$atomic64" = "yes" ; then
+cat > $TMPC << EOF
+#include <stdint.h>
+struct X { uint64_t x; };
+uint64_t foo(struct X *p) { return __atomic_exchange_n(&p->x, 0, 0); }
+EOF
+  if ! compile_prog "-Werror" "" ; then
+    if cc_has_warning_flag "-Wno-atomic-alignment" ; then
+      glib_cflags="-Wno-atomic-alignment $glib_cflags"
+      CONFIGURE_CFLAGS="$CONFIGURE_CFLAGS -Wno-atomic-alignment"
+    fi
+  fi
+fi
+
 #########################################
 # See if --dynamic-list is supported by the linker
 ld_dynamic_list="no"
-- 
2.25.1


