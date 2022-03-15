Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1E64D9B26
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:27:38 +0100 (CET)
Received: from localhost ([::1]:47810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6H3-0003JP-Mi
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:27:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62w-0005uU-BI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:02 -0400
Received: from [2a00:1450:4864:20::636] (port=40763
 helo=mail-ej1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62s-0000Zv-RY
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:01 -0400
Received: by mail-ej1-x636.google.com with SMTP id p15so40810699ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tD8IAl7BOvpXp/PNf1EXMNzGWS3hw5xVYsSN61BgM9Q=;
 b=pIHVvepbo9AO2g7mVnHATsEq7YiKS9C4WSt/c6rFHBzezu5dvP1KyF56JQPIumxMHL
 fV1G44YYdYQ19rZrOgX43fyyw5x5t7u18iz3Z/J0Cu2BiGtTqhZut5ZQvEANsXf/Nzfy
 8BBDNxlFkuXDIDLYSzTdFBVe7rkTYQpHQecrF1k6Y7K326LXU9mrJLv2JTjUXofYjweb
 WWQfKr6Dm7QUwPS9lbHDS8EmwJ4+CukUJnoyVKk87Ukmmtx1Nr5t9sy2fUUBCQJvmEa1
 23jgLrVRa4DhzhBrOSuHO8nR3nhbt1XCgR3UctIjaX5mLLpJXbJqu16LFs53s5FS9s3/
 PDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tD8IAl7BOvpXp/PNf1EXMNzGWS3hw5xVYsSN61BgM9Q=;
 b=IwsLrEytuCETsmGl5tejj9KUtiA3gKr/gcZUPvSVubFVIkR0Rs6nt24teWfHOkjKJE
 IH8Ux8KDziy964c/QzkBAZGlsV51E3zIsZ/u1h+MgRq0/0wRkQ65zEm87ZMGrE1lSMxd
 cZ07+LYplhlAv9r+kLsQRaPtYU9jWJWZXC7Nvrhvt8CvzJoTa4/Z1aAalO1sxYxDj5R1
 0u8VjC5HELuDbzAsfb5AEWpbRkjgtU8OOtGq+guPzsingPJ6OSrbRpykyzaty61ff7I8
 onWahHbK7Fgo63eY+A5YFlKvRMFnG1zq59NcTbAcgD6Nh1dDFD1+SL1MPHXzzyFiR3hn
 +Fww==
X-Gm-Message-State: AOAM530XpLGfX2pWcMWX5c8mYeqpg12l5jhkbrd0/AuQJoURYzQlarx0
 +MPDqWgLIHdEzCV01XNoqUsx4A==
X-Google-Smtp-Source: ABdhPJyZvAVwKjZZ9xBoeh6eK7QXEWGf/4XvXEKD0iVKqGZGs1Z5h8xskTnrLxSkB9lwR76YZwdsgw==
X-Received: by 2002:a17:907:d90:b0:6db:a372:e61c with SMTP id
 go16-20020a1709070d9000b006dba372e61cmr16591336ejc.276.1647346377355; 
 Tue, 15 Mar 2022 05:12:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05640206cf00b0041655b577f1sm9718271edy.25.2022.03.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3E0B81FFBB;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/8] target/i386: force maximum rounding precision for
 fildl[l]
Date: Tue, 15 Mar 2022 12:12:46 +0000
Message-Id: <20220315121251.2280317-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::636
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Eduardo Habkost <eduardo@habkost.net>, berrange@redhat.com,
 sw@weilnetz.de, richard.henderson@linaro.org, f4bug@amsat.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The instruction description says "It is loaded without rounding
errors." which implies we should have the widest rounding mode
possible.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/888
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/fpu_helper.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index cdd8e9f947..ebf5e73df9 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -237,24 +237,37 @@ void helper_fldl_ST0(CPUX86State *env, uint64_t val)
     merge_exception_flags(env, old_flags);
 }
 
+static FloatX80RoundPrec tmp_maximise_precision(float_status *st)
+{
+    FloatX80RoundPrec old = get_floatx80_rounding_precision(st);
+    set_floatx80_rounding_precision(floatx80_precision_x, st);
+    return old;
+}
+
 void helper_fildl_ST0(CPUX86State *env, int32_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int32_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 void helper_fildll_ST0(CPUX86State *env, int64_t val)
 {
     int new_fpstt;
+    FloatX80RoundPrec old = tmp_maximise_precision(&env->fp_status);
 
     new_fpstt = (env->fpstt - 1) & 7;
     env->fpregs[new_fpstt].d = int64_to_floatx80(val, &env->fp_status);
     env->fpstt = new_fpstt;
     env->fptags[new_fpstt] = 0; /* validate stack entry */
+
+    set_floatx80_rounding_precision(old, &env->fp_status);
 }
 
 uint32_t helper_fsts_ST0(CPUX86State *env)
-- 
2.30.2


