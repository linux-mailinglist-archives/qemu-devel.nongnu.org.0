Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF2C50AAE2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:41:40 +0200 (CEST)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheYV-0008DK-TO
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWU-0005jn-QQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:34 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:36357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWT-00072t-AS
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:34 -0400
Received: by mail-pl1-x632.google.com with SMTP id q3so6614722plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QtJWgG8v92YkV/RDj3IEQM6swhApoLGHsqChmQQq0cc=;
 b=OBKiG4uK9rAMl7Ot9Cx6jWnS0Tml/ftLCvVv4r0wXA9jO1ues6LUDZHt5vxfP2oM1f
 V8RLSaEc5hE0qNtMtssnvZOCV9nuVBYrl18hU1lbE8oisr8N3jAGsSXPZk3x9UViQH1E
 JSMZoXj3wYAL7xp467aIOY7rC/IbU+YhDWvdBhDOop99c7R2ILbFPtgZCxut4NDjXR9d
 +YCSn4OtDJT3WupEF9MaHy5z5Mfw/3/52CcmibgTfDTskRJYc7Sq+ZdCA8LE+mZiNepL
 0N7rUbe92XQo8+OfEBVOxDuB7tiKlIyZSm5X0XJ0FmSsr/qRY/NEn0Wd5u5hruHOIpAd
 QEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QtJWgG8v92YkV/RDj3IEQM6swhApoLGHsqChmQQq0cc=;
 b=Mx96h3w/xV3rn8ksBwiFVdEH4hibVlGIphKULD2JJ3nPJFM/Uvb3u/3AgX6UK/Q7Ro
 +BF/9UBrGVx8ckmkrc+cW3S36Y8erj16aKEpOkc6YxwZfMBVIK/x1hBXqEjSYO5Dwqub
 B6m52DZep52j3jevHYHQxsFiB84X8Y2HVuUY0oNSHCjq4zkRDINt7qa4XYkz5YDWV8k+
 TvriiqacRAb+Ox8OfIri+NaaWbY/eyFymzXKy+tvCL/IcYEhnw10OOr5S/WzBugvUXzN
 MMK0dSH+X+sWivioaNlkvc7ZbOHgUzj4pxbG1+9Q8oOd8X1T9/O6rPrbythDrI84HShB
 ZAHQ==
X-Gm-Message-State: AOAM5315rilsoHwE2YQ3BMFW8BPwSFvxFVoA6CFfyD2c5CiOU2aqqpE4
 MXfQeCU4UpC//0F1wyB3jGbKxdii01nB8w==
X-Google-Smtp-Source: ABdhPJwYzVUkRqreuOaft1aF+10vYO70dkvyHhWzwF6ICw/nbKqxaWhOngU/YlDsviZ6vU2hXOE5jg==
X-Received: by 2002:a17:90b:390f:b0:1d2:853c:5b99 with SMTP id
 ob15-20020a17090b390f00b001d2853c5b99mr1775803pjb.8.1650577171926; 
 Thu, 21 Apr 2022 14:39:31 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:31 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] target/xtensa: use tcg_constant_* for exceptions
Date: Thu, 21 Apr 2022 14:39:13 -0700
Message-Id: <20220421213917.368830-3-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421213917.368830-1-jcmvbkbc@gmail.com>
References: <20220421213917.368830-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exception number, exception cause and debug cause codes are small
numbers, use tcg_contant_* for them.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/translate.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 3379fc1fc774..77d2e1303746 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -318,18 +318,14 @@ static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 
 static void gen_exception(DisasContext *dc, int excp)
 {
-    TCGv_i32 tmp = tcg_const_i32(excp);
-    gen_helper_exception(cpu_env, tmp);
-    tcg_temp_free(tmp);
+    gen_helper_exception(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
 {
     TCGv_i32 tpc = tcg_const_i32(dc->pc);
-    TCGv_i32 tcause = tcg_const_i32(cause);
-    gen_helper_exception_cause(cpu_env, tpc, tcause);
+    gen_helper_exception_cause(cpu_env, tpc, tcg_constant_i32(cause));
     tcg_temp_free(tpc);
-    tcg_temp_free(tcause);
     if (cause == ILLEGAL_INSTRUCTION_CAUSE ||
             cause == SYSCALL_CAUSE) {
         dc->base.is_jmp = DISAS_NORETURN;
@@ -339,10 +335,8 @@ static void gen_exception_cause(DisasContext *dc, uint32_t cause)
 static void gen_debug_exception(DisasContext *dc, uint32_t cause)
 {
     TCGv_i32 tpc = tcg_const_i32(dc->pc);
-    TCGv_i32 tcause = tcg_const_i32(cause);
-    gen_helper_debug_exception(cpu_env, tpc, tcause);
+    gen_helper_debug_exception(cpu_env, tpc, tcg_constant_i32(cause));
     tcg_temp_free(tpc);
-    tcg_temp_free(tcause);
     if (cause & (DEBUGCAUSE_IB | DEBUGCAUSE_BI | DEBUGCAUSE_BN)) {
         dc->base.is_jmp = DISAS_NORETURN;
     }
-- 
2.30.2


