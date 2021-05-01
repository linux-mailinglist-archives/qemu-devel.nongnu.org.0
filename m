Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01177370507
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 04:32:55 +0200 (CEST)
Received: from localhost ([::1]:58976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcfR8-0002aa-4V
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 22:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNp-0007NF-Lx
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:29 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:39437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcfNn-0007Jt-UG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 22:29:29 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 z6-20020a17090a1706b0290155e8a752d8so2692310pjd.4
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 19:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hOTWA/tFTLlMKu67EpJrBvQchd+S+cJ3BYc+t+q3xCQ=;
 b=RCS1PA1O3ElCR7MZ5XRDGTzOGqSChX7D83LmFJQ9sLOd2u8KQWCx0LGq+qmVgFIju9
 1gGWqnYCC+OuzTrdeevVDk2FFy+JoFLpJ9TIHWw3uYxqDa06OgROP4V5iGd6oZs/J/gl
 4cSjHvSUGajFY7A+oNGghOKtgtZkGjoOgfSbQ0cAXYSg9n15K2kwRyDf7aNNLe9SRbbL
 61muBq89I8q3Ob/BYxv8Azjc4F9/JAUx9FWUtAJMiMRkF8RxIFfroejzXGZ+fojtEWfv
 hxIbvI6KZd1R0D7EmRLY6Q8HpmNYguxcYBQskrzz+ebVQwYh0hhKpVDYEpRn0fZ8jyqH
 M4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hOTWA/tFTLlMKu67EpJrBvQchd+S+cJ3BYc+t+q3xCQ=;
 b=S8NufFSJlLxYp94oVie9tXWHpzp4w6dLiIVcQCb7ALXcPyEW7s+fJGkgYB0NvB1Am7
 Jw+IVVNp52UtmldMP+H7c3TFuG4MicGYWhppk6GLPKpMdQ4afa2gHNeFVcAG5JP+nAvO
 9LUUZKHpK5eBG3XTHQyRux0Mk7HJvvBqZNfCpn7If8+Kns5j/bCsYAihYKLyLe+wQrF7
 t63gZ5D2UXd2cgW71r8sME2qZX7bQjDfEL1hbcIsDQPmmjRa2JNMp5TrYx63H4xn6kLh
 zeXWhkWtlD7rB3gz0z85QZKBnAgzPLs9jEokp2kwQCFUQqCf4KGkaQW6HaTJGVlhngP0
 6frA==
X-Gm-Message-State: AOAM532x7mD7B+AYODt164C4Egs9RnvsnzBmUxkM+6bMPVT8Wlwz8/vU
 Xpvn+Npb1MOjG7kOAOeLMrpXR9KQBK320w==
X-Google-Smtp-Source: ABdhPJzkH8JFjc3vpANatrGc6D+9TLDThBkonbYhcwbfBIxBMj9u7bDXuCGMOzvvulbDxaMJJ52O7g==
X-Received: by 2002:a17:902:6a87:b029:e6:6a3d:29e8 with SMTP id
 n7-20020a1709026a87b02900e66a3d29e8mr8236696plk.10.1619836166712; 
 Fri, 30 Apr 2021 19:29:26 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id n6sm684905pgq.72.2021.04.30.19.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 19:29:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/ppc: Reduce the size of ppc_spr_t
Date: Fri, 30 Apr 2021 19:29:23 -0700
Message-Id: <20210501022923.1179736-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501022923.1179736-1-richard.henderson@linaro.org>
References: <20210501022923.1179736-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: qemu-ppc@nongnu.org, luis.pires@eldorado.org.br,
 matheus.ferst@eldorado.org.br, bruno.larsen@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We elide values when registering sprs, we might as well
save space in the array as well.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..b704261b49 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -192,17 +192,21 @@ typedef struct ppc_hash_pte64 ppc_hash_pte64_t;
 
 /* SPR access micro-ops generations callbacks */
 struct ppc_spr_t {
+    const char *name;
+    target_ulong default_value;
+#ifndef CONFIG_USER_ONLY
+    unsigned int gdb_id;
+#endif
+#ifdef CONFIG_TCG
     void (*uea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*uea_write)(DisasContext *ctx, int spr_num, int gpr_num);
-#if !defined(CONFIG_USER_ONLY)
+# ifndef CONFIG_USER_ONLY
     void (*oea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*oea_write)(DisasContext *ctx, int spr_num, int gpr_num);
     void (*hea_read)(DisasContext *ctx, int gpr_num, int spr_num);
     void (*hea_write)(DisasContext *ctx, int spr_num, int gpr_num);
-    unsigned int gdb_id;
+# endif
 #endif
-    const char *name;
-    target_ulong default_value;
 #ifdef CONFIG_KVM
     /*
      * We (ab)use the fact that all the SPRs will have ids for the
-- 
2.25.1


