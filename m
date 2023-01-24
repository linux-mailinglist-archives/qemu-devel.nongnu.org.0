Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55267A0E7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNiC-0006WK-P4; Tue, 24 Jan 2023 13:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhO-0005BM-Us
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhI-00075o-PW
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id t18so1903254wro.1
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RBDzHQZqYrP1DcvcucqhZ7MZ+pIiIprtov8SIQRPHqs=;
 b=RU/pQA+wXpGF26W1f+Chp64hCSArdV7QdJQ4z7ariEUrkAuvtFq6vPL6ifBG46YsJq
 BDuaFI4dMkODcxa3VroUnUjBOPnamDGPAlidtpxY7wFeO+P5p7mz+Yxu41v0POUkL9it
 f4IGrMOQU59MM8xyk4QDUv1buiZPU2Ldlpuy8iV8abSoqO7xVaTgBQiFAziBN92qVfk5
 UKqA05rsK11oAXnU0P2dnn0Wb9wuxClmKCt9SyLKzsLqJDUnbmpjdOGxm2ZqFD3iLx/a
 7Us+T5016CgblpNBqgchBbzT0JeYB5dqQxSpLIS332ilCQ/4BtVvwI3mvgLOCpWiCGVP
 gKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RBDzHQZqYrP1DcvcucqhZ7MZ+pIiIprtov8SIQRPHqs=;
 b=JIkGGBR368R+hRXhflTbyhRj+EhUxSm6drvA4wmirchDuKMnpqFcmLY/tHX2haONkN
 r8LC1VFfmYxRu9c/a8tptlSk+JI16LZKDlwpBVp6EWogPm6FMBD8XTNeZI2QzAN0X+fb
 sC4q65UimnGit9/lkw9g37CIa0HZ8C2LdR5GkmncU1vOQ6YvRTMjcLUc3ZOTZqjSG+jb
 OcIN+jzub72olF6fLqKrU4gK+5TwW9rsA1IceWZ++nNbkdFhn8A0hOYFaqYUx4ZWeSXv
 BUcJ7jzJYwfI/EpB8hynHONlJHbx/peUqNtl1kIW9yLkob4vlfEq9+U0WydPCO6dY+Gt
 IVgQ==
X-Gm-Message-State: AFqh2krU+zS/Czz+Hrv2EbFZHoBCi0mCafMK1asCG+nuiulM3+QcxEAQ
 u2MV+wEMJCK6sSSo2Y2UF7w60g==
X-Google-Smtp-Source: AMrXdXuWNJz/4i1f3PCDekqyBrzoBbDT64rdY3XGjs4RxNP8SxYXNeMrfgFINOeh3y9sMyswHL6wpA==
X-Received: by 2002:a5d:5182:0:b0:242:4697:d826 with SMTP id
 k2-20020a5d5182000000b002424697d826mr24847215wrv.29.1674583623317; 
 Tue, 24 Jan 2023 10:07:03 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a5d5705000000b002bdbde1d3absm2334399wrv.78.2023.01.24.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 895FB1FFD3;
 Tue, 24 Jan 2023 18:01:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Emilio Cota <cota@braap.org>
Subject: [PATCH v2 33/35] tcg: exclude non-memory effecting helpers from
 instrumentation
Date: Tue, 24 Jan 2023 18:01:25 +0000
Message-Id: <20230124180127.1881110-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emilio Cota <cota@braap.org>

There are actually a whole bunch of helpers that don't affect memory
that we shouldn't instrument. They are helpfully identified by the
TCG_CALL_NO_SIDE_EFFECTS flag which marks out lookup_tb_ptr as well as
a lot of the maths helpers. To avoid the string compare we introduce a
new flag for plugin internals so we skip that too.

Related: #1381
Signed-off-by: Emilio Cota <cota@braap.org>
Message-Id: <20230108164731.61469-4-cota@braap.org>
[AJB: updated to skip all no SE plugins, add flag for plugin helper]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - use TCG_CALL_NO_SIDE_EFFECTS as suggested by rth
  - add flag for plugin specific helpers
---
 accel/tcg/plugin-helpers.h | 4 ++--
 include/tcg/tcg.h          | 2 ++
 tcg/tcg.c                  | 6 ++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/plugin-helpers.h b/accel/tcg/plugin-helpers.h
index 9829abe4a9..8e685e0654 100644
--- a/accel/tcg/plugin-helpers.h
+++ b/accel/tcg/plugin-helpers.h
@@ -1,4 +1,4 @@
 #ifdef CONFIG_PLUGIN
-DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG, void, i32, ptr)
-DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG, void, i32, i32, i64, ptr)
+DEF_HELPER_FLAGS_2(plugin_vcpu_udata_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, ptr)
+DEF_HELPER_FLAGS_4(plugin_vcpu_mem_cb, TCG_CALL_NO_RWG | TCG_CALL_PLUGIN, void, i32, i32, i64, ptr)
 #endif
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 6f497172f8..8dc291d030 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -405,6 +405,8 @@ typedef TCGv_ptr TCGv_env;
 #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
 /* Helper is G_NORETURN.  */
 #define TCG_CALL_NO_RETURN          0x0008
+/* Helper is part of Plugins.  */
+#define TCG_CALL_PLUGIN             0x0010
 
 /* convenience version of most used call flags */
 #define TCG_CALL_NO_RWG         TCG_CALL_NO_READ_GLOBALS
diff --git a/tcg/tcg.c b/tcg/tcg.c
index d502327be2..fd557d55d3 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1674,8 +1674,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* Flag helpers that may affect guest state */
+    if (tcg_ctx->plugin_insn &&
+        !(info->flags & TCG_CALL_PLUGIN) &&
+        !(info->flags & TCG_CALL_NO_SIDE_EFFECTS)) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1


