Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFC42A985
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:36:21 +0200 (CEST)
Received: from localhost ([::1]:54490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKlI-0005Gk-Pe
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXg-0006Tl-PT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:16 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:37556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXd-00047X-VZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:15 -0400
Received: by mail-pf1-x42e.google.com with SMTP id q19so7391pfl.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Jym3b2uwL2PhBIHK4zVSTvoSJnlM3mgPVmGSpK6sCOA=;
 b=qLeSCTviBV4Et66OEA2Oyw7Wi8plulYBhQHz+JhNJpEvN+zLfMnNNgV0dtpdrDP1lk
 9YkVkSPt2g9gUaRlOeXph+233vILZ5vNJrFaEZjXpeXFa9b72QMf6FNOww6k9Ci4rWqU
 A4jhScwe9RzL6G6foOc9pJU0EPniOxCKPsDeHqb7EQVtOvRQsateakzSM1ilFJnpgg9G
 g9Zomp9hQSb27Fww8d0AQWXyrmkoZECadPc75/26JDZ8xigtD2Vlk+8/cBfCD595EbGx
 PqsofYOqUm22OXS24SVCF8TD8rPz/LeFOMIw53zwzBvt8OazGxLPEO/6Lal+mtaVMHv5
 r7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jym3b2uwL2PhBIHK4zVSTvoSJnlM3mgPVmGSpK6sCOA=;
 b=MoQDIhFHMRRlWH80TsbVXSff0q+Md+hT2eIZa1eaF6AVuTxI+DO5w8Ximtlq2DJ1LX
 0WqfrOjgSWQiYWpB7OgKbu6nY331/uDMnE2YUEdVsR+9dHjbqJyn6TW1OSsdKV+gPDdl
 vKnjRbKIH2PlV9b+GH/qiYN7OVrX3r7E4bVxrwTAa8OPK16Vslb8xcUrCSZe6dnP1Scx
 n+V5dZawf/DT9ihYWy6foCSK0vzQqqX+6QPQTRAw1X0L0NJ89TvZ0DTR5yW6D5GhYT36
 dS+OA3cAY+3svxZW34N8zGvcvSW/DlL6dch8Bbo+pyT1SHNE620jfPSxcKZw4Ebbd3+K
 jZRA==
X-Gm-Message-State: AOAM533QjNXKexcLUwAiBhfEQFw6VRabq0TpVt74qTHqAYYqEOXvvM9Y
 BAu6MCE5d8cChy6TC+ZpJ7OQqlTkvMH+0Q==
X-Google-Smtp-Source: ABdhPJzVw8zM3ggMEzA6iiIAzK4bQw0j0iWoCWN3n9p2XGxHI78J/e1NxTcCFpUyCEssuhqWagWQ6Q==
X-Received: by 2002:a05:6a00:c1:b0:44c:ec40:b47 with SMTP id
 e1-20020a056a0000c100b0044cec400b47mr22126103pfj.76.1634055732512; 
 Tue, 12 Oct 2021 09:22:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/23] target/openrisc: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:51 -0700
Message-Id: <20211012162159.471406-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/openrisc/translate.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 5f3d430245..ca79e609da 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1659,11 +1659,7 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             /* The jump destination is indirect/computed; use jmp_pc.  */
             tcg_gen_mov_tl(cpu_pc, jmp_pc);
             tcg_gen_discard_tl(jmp_pc);
-            if (unlikely(dc->base.singlestep_enabled)) {
-                gen_exception(dc, EXCP_DEBUG);
-            } else {
-                tcg_gen_lookup_and_goto_ptr();
-            }
+            tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* The jump destination is direct; use jmp_pc_imm.
@@ -1680,19 +1676,11 @@ static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
             break;
         }
         tcg_gen_movi_tl(cpu_pc, jmp_dest);
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         break;
 
     case DISAS_EXIT:
-        if (unlikely(dc->base.singlestep_enabled)) {
-            gen_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_exit_tb(NULL, 0);
-        }
+        tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
-- 
2.25.1


