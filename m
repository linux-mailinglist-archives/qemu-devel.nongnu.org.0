Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A5698C5E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:49:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSX7l-0003tO-9m; Thu, 16 Feb 2023 00:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7i-0003nX-7p
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:02 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSX7g-0005Mc-MB
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:48:01 -0500
Received: by mail-pl1-x62b.google.com with SMTP id r8so1006092pls.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnhKbJ5br8XBikjOI16wWyZO1yPpX72pZ9Y4QBl2Phg=;
 b=bLxZiQwSNWAxa45jXE8pdoRN3rA+2psit6BO9G9fukKSvOD+7AKTc7HRIG4Rv03Fk7
 LtwXGQuMujEuFt6ypp3nl7COeUD9mQIuPquBK5VGRgQUf/SvU4oHnOxokzloE5FAvfiq
 Gqf59CwM1Setrr7YI7y7KCyE761F/1+hAOY3CkOS43QfVpagIKbqlFiib1FUrEeBf+B7
 JwSdA9xhHTDD/bAHUzbm5HRRmpImpFUJtjrhbUvl/CBGBd5oAC3jK0NA0hDrcO731NR5
 ncxJwwBsjsYw9oaWnu/k5OeGU+sj80lRLwcl7EsWoEIhL0zz/H21RZFkElTCCCwDaYyk
 ai0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vnhKbJ5br8XBikjOI16wWyZO1yPpX72pZ9Y4QBl2Phg=;
 b=J/MVNPpynYutN0iRyd0/E4FZb8GUB1E6PpyRFdpOgUYjWu12BH47FeUQucV1AtX/1A
 rhEdRTnyA+9poLzaxzpCVYw9PnhXxPxVACzYKitRUD1CcGtJ++7UOV++2+RgNqU+YC6g
 cUyCyOzCxCwwO43yCdWHcT3l3XQJFtrya/Zq731x7wO4i8jwia2wxeailnq4BE70rXUN
 JNt/4NAtpqaEZ75DfBul3mlI00PQVzFh/TNNmcllTvi+ezeYFqicoM+V5SpgQvvbEsXp
 3wyAGh6w4Pb/WAYZ7TWqL8KTiHrc/u2vBJNOE9NMD1epmYovuOutTdPbHROx1hg8ox1O
 zSuA==
X-Gm-Message-State: AO0yUKVd4ZpbrKp25CyrX4p2h5M6yv0sx8TVGCQ/WSn042OKUJLdkfUT
 LxG+to+mxpoGougNDm3MgqapJ9MyKTe9Ev/sAao=
X-Google-Smtp-Source: AK7set9vx/OBtc6MzNvUsrbQiCN4h6yRId5WHv8uAMcwQ+yp7J8oDz/ojWYCHS3+SPC3bmPRc95T1g==
X-Received: by 2002:a05:6a20:a10b:b0:bc:d4cf:d647 with SMTP id
 q11-20020a056a20a10b00b000bcd4cfd647mr4801289pzk.6.1676526479049; 
 Wed, 15 Feb 2023 21:47:59 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 j184-20020a6380c1000000b0047917991e83sm358034pgd.48.2023.02.15.21.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 21:47:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v2 04/15] linux-user/sparc: Use TT_TRAP for flush windows
Date: Wed, 15 Feb 2023 19:45:05 -1000
Message-Id: <20230216054516.1267305-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216054516.1267305-1-richard.henderson@linaro.org>
References: <20230216054516.1267305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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

The v9 and pre-v9 code can be unified with this macro.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 051a292ce5..e1d08ff204 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -196,15 +196,14 @@ void cpu_loop (CPUSPARCState *env)
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
-        case 0x83: /* flush windows */
-#ifdef TARGET_ABI32
-        case 0x103:
-#endif
+
+        case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
             env->pc = env->npc;
             env->npc = env->npc + 4;
             break;
+
 #ifndef TARGET_SPARC64
         case TT_WIN_OVF: /* window overflow */
             save_window(env);
-- 
2.34.1


