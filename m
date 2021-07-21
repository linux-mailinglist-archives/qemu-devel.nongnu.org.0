Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFD73D092D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:49:23 +0200 (CEST)
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m662k-0006Bz-Jp
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vh-00051k-FE
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:05 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vf-0005Nn-PB
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so3415270pjb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=nuC9N2CxCG37ZN6U7OJesz3x/uGry3HpgtHxrlnPHAsjrUm+SK7M4MJoSgEJaaKCb4
 yiGKfwG1DG3DeBmVSbZtXnhxcoCYnhpwifnQIh8AxrqFieQQ9hHi6Y+tBPghpr8qt7eH
 BGLby+VFgfD/CySda+vw/vk4To9nNBC6ofrop8gV+xEfopJAakpFvDng4srtab5iPOWk
 fEgYHhXvBC6pM8HtzM/2908AR/bvKbpvjQ79VTxr+oveyNPRTg1Nh/0iixJugQV+VAzO
 sA+Gus7UPADEb3kCpLHgaVdUk+Y0Bm1gzCFxGuWQds/UcpHY5TzIGM++SxU8MZTzPwlj
 hhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I0CzIZRWI2JoSPxoR4xs5SpApEcqlDWMcO9xYzu4ImA=;
 b=mbG9s4b8Qr8jiGuthAHilxhZKw2tFlkW0+/ZBIbLCc1S166ulqYODH10hjEPm7rXWv
 +QuiAUaZ+ZCyJNmnuQ8r/lS+7s9FHw1yAGLejyL2soemogz/aE+X/Bk7KGlr4F9BXH79
 4472osPGQE0fDcH8PR/2qjgGK0dhfbTGb0AxAltAlrsEy8l5SoBck8oft9liXp9aPbq7
 mNWJRJn4fZ97pSlInKXuGJdYKE9dohfbR7epE5B9g+NNtpiELrb7cHCjAZ1LKO+/gjQZ
 ZVsnlLWwxw72UlZGsHjnDd4igov4Q30eWcTkRO4VaSk3nhjplJzi9K12cjcySOit3SYo
 aVwA==
X-Gm-Message-State: AOAM532MXLbt1o05RK14JJm7z31gDj/CiwZNmpkPcT9a9ojF5el26QtG
 RsJl3bwHkL7sJq+6Dmy50SoeYbWpFotv0Q==
X-Google-Smtp-Source: ABdhPJycVcvFSMDR13a/r7pwmbimbGlN7ZdV3xvYOuVUA8uvIOqI1K/KrgYcCdKqIXV8faG7s6yrEQ==
X-Received: by 2002:a17:902:d395:b029:129:c8a4:2302 with SMTP id
 e21-20020a170902d395b0290129c8a42302mr26864817pld.2.1626849722590; 
 Tue, 20 Jul 2021 23:42:02 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 04/23] target/cris: Drop checks for singlestep_enabled
Date: Tue, 20 Jul 2021 20:41:36 -1000
Message-Id: <20210721064155.645508-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a84b753349..59325b388a 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3249,22 +3249,6 @@ static void cris_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         }
     }
 
-    if (unlikely(dc->base.singlestep_enabled)) {
-        switch (is_jmp) {
-        case DISAS_TOO_MANY:
-        case DISAS_UPDATE_NEXT:
-            tcg_gen_movi_tl(env_pc, npc);
-            /* fall through */
-        case DISAS_JUMP:
-        case DISAS_UPDATE:
-            t_gen_raise_exception(EXCP_DEBUG);
-            return;
-        default:
-            break;
-        }
-        g_assert_not_reached();
-    }
-
     switch (is_jmp) {
     case DISAS_TOO_MANY:
         gen_goto_tb(dc, 0, npc);
-- 
2.25.1


