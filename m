Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2256515FC5
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 20:08:40 +0200 (CEST)
Received: from localhost ([::1]:36910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrWK-0000hb-42
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 14:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrIA-0004kN-0b
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:02 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrI8-00084J-IK
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:54:01 -0400
Received: by mail-pg1-x533.google.com with SMTP id g3so8815582pgg.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gj8aT9K8/vY1AA3/2X3YXf7zoSHmmenH8vDdjGXjcZ8=;
 b=v7QxhdWavQc5V53/n0lNekd+E1YHuu31xygHQGV/NfindONWJi6Rme6ZKfdFQzgyk7
 6UtkGvI6Op1bMQyAfIOSDtVLvhf/mZanirSK/exY8MH2J31Q+OOnzrCt8rkwBIXmHDGr
 +rHfkcRGqEKv6VSImqHsZz2Cu5IK1mHcfkWSa3Ajy0Nl8hXUDhzbC+vvvmpp98tJPM7F
 qqmVG7sqmmoATlWJcYpXOMmXu5/6H/j65A2vA1m2xPwo778Pmu3t5FXFahNkeGdxF6ce
 wLnrjxyh/8FYk/fcQcIVGQFIntuDmdbRXK8jiYcRZi4YTJ3tZrJ+C2yVAF7h+dYYyqM1
 IMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gj8aT9K8/vY1AA3/2X3YXf7zoSHmmenH8vDdjGXjcZ8=;
 b=H2bGY6tq0snjAJtAzj96dYmw6OxzHQ2p8L8pGXe5d01r1Eib+tj3k6yTsaCPGGvmwP
 eLtp/i6pSnHeFuZVZP/sARJgW4kfgTietjRtGGeaLJqgPP8V8Mw4LVM+f8GFZe8rrT4i
 xLFlVnYgQdIGPuHsu0IP3NEbm0kbH9uE+8Aim43sJE3aHGCDkiAsuPHsquLcuAVRUnia
 A2+D8mSYM791OW2OFCZR8TFtXZDjI4TG5JjM9gl8k6opoPeGN1/hfpHmNL2qv+IpPDu0
 gw+Cte/vInleAVcDcYt+uGu9OeUUVHPicfLaTGjcqE6JsirRwrp3oQhBOIUXwELwRkTA
 6PSA==
X-Gm-Message-State: AOAM533vsA7YYiFwySoguOpy06/Tju8EQWQj9DmSYYPkyeYNw1VTo/Hv
 P7Pl7ikubZmlntewMSDedT8M43HOOgniLA==
X-Google-Smtp-Source: ABdhPJygyJ3zlYytmGtUKhAP8UhRR1ZFaaCk1vWVB0PV7fA8IylgVMGIFSR2QV9Am1YS1XpIxnYlmQ==
X-Received: by 2002:a63:1117:0:b0:399:2df0:7fb9 with SMTP id
 g23-20020a631117000000b003992df07fb9mr3987408pgl.40.1651341238681; 
 Sat, 30 Apr 2022 10:53:58 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/17] linux-user/strace: Adjust get_thread_area for m68k
Date: Sat, 30 Apr 2022 10:53:41 -0700
Message-Id: <20220430175342.370628-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unlike i386, m68k get_thread_area has no arguments.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/strace.list | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 278596acd1..72e17b1acf 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -384,8 +384,13 @@
 { TARGET_NR_getsockopt, "getsockopt" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_get_thread_area
+#if defined(TARGET_I386) && defined(TARGET_ABI32)
 { TARGET_NR_get_thread_area, "get_thread_area", "%s(0x"TARGET_ABI_FMT_lx")",
   NULL, NULL },
+#elif defined(TARGET_M68K)
+{ TARGET_NR_get_thread_area, "get_thread_area" , "%s()",
+  NULL, print_syscall_ret_addr },
+#endif
 #endif
 #ifdef TARGET_NR_gettid
 { TARGET_NR_gettid, "gettid" , "%s()", NULL, NULL },
-- 
2.34.1


