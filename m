Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CCF6B2E43
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMap-00065P-MT; Thu, 09 Mar 2023 15:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaO-0005Sr-0Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:10:03 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaM-0001dS-Hf
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:59 -0500
Received: by mail-pl1-x635.google.com with SMTP id v11so3201491plz.8
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBhN8QlUZ4nucIQSZUIgNxSQjC7OQ+YVg5SJgGHSvZs=;
 b=pG1Ds5Nd012FferFlcq0Qg26kuBbEGVCA8C85zj8vGKR8Hyw1DiOj7CNCl0WigHml6
 oODwc5q5RAMZ83RPQLJVX4cSZOtLXyRF3c0nJpVBn41T3+Gcqg4jXScc3RzUngw6FEc5
 MLAhSv+CZq2vriI31y3uUH1lXq5/B3vLenJgQjnoAxK/ce42iFCzvdzLQsE9Yms0ssFd
 yCtZkpe04wJS8cxuUL9pO2fWDxpc41ag5lz5J6UYxoZHuMvtn4pXKzwP+/hKQC6My5Re
 rjxdma46BihhO9TtDhQO94BANEcRFLneEjoMx/ADZmCfuddyrKCtgwFVDEgSwXMZZCr0
 +uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBhN8QlUZ4nucIQSZUIgNxSQjC7OQ+YVg5SJgGHSvZs=;
 b=0vxCqZE8sZDNASHxnt+qf/f+MdwcAwZpgN9rR+msnz7wER9gaJUopfJtt8+QKhKFZ7
 XYSU+gOaU18c/0IdXlBCQJ9gb7rjeOAB4RWkpeBWUz+PWsgJBxNQ81l53fPuOaLy7Jc7
 eIkr25/Lf6kc1wIud4unqAyA7zhVdi1YLfX2B3drK2wMUaH1FTi9pd/YZpsvjgLNsiX2
 0/Iv9Kq1iQy/YKYg2dfRboc8tMqX9R7QbWCCt56SN3qfXBfZUCaKlGxrvgrboGdVHxB+
 X4tfinLJ2CySYSSZGOXqPicpXcgdD6YROTQv9+b2hpgwfplHKwh1jBqFI2p/jnAMfOAm
 lpxg==
X-Gm-Message-State: AO0yUKXj4mD0B+GvNcVkn20H5ljwpM1Wn5eqevK6uEp6WeIqQk5KkH9f
 fnpSdCZ/uvXTRTEc6dKG9bbrbiPEj04KMRwdAis=
X-Google-Smtp-Source: AK7set9qT4V+qeKqbu2MSMqT8L3t4/S16QnhpjytL4dgFquZJ/+WdzKhuI2kRH7nzCbt4Nr3X4jvIg==
X-Received: by 2002:a17:902:e9c4:b0:19c:f7f2:6094 with SMTP id
 4-20020a170902e9c400b0019cf7f26094mr19967458plk.14.1678392597238; 
 Thu, 09 Mar 2023 12:09:57 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 74/91] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
Date: Thu,  9 Mar 2023 12:05:33 -0800
Message-Id: <20230309200550.3878088-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This hides the implicit initialization of a variable.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 3ca60fb36b..92ab290106 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4206,8 +4206,9 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
@@ -4284,8 +4285,9 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         }
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_ptr(0);
+        TCGv_ptr tp, i = tcg_temp_new_ptr();
 
+        tcg_gen_movi_ptr(i, 0);
         gen_set_label(loop);
 
         t0 = tcg_temp_new_i64();
-- 
2.34.1


