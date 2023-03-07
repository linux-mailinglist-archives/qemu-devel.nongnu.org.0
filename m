Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C1D6AF0D4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:37:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9f-0003e7-UM; Tue, 07 Mar 2023 13:35:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9d-0003dA-F1
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:17 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9b-0007l7-Tq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:17 -0500
Received: by mail-pl1-x62e.google.com with SMTP id a2so15135914plm.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yOlCe3APQzaMifrnuMKC34pNFHThuNfr2aJxx+z+UxQ=;
 b=EWUXePfF7Q/AQlF6njxH/4RDlMaUoSFzf+2boefMNUwL7h1ClMpcV/mnSedOvEhjCp
 5v6edqS0o1uGNLNbUGzCx2lTJmWtQinEeh4lysGDgqbLFJc0ORYGm0Ba0wYRt5EqzgVd
 3QSvJdkcd5pCEH8/2XJEOueh7XnrzkjDK7Sv3L8msmARnFjUcGpfnqK36UajMajPkxbs
 yZCtD49wI8tQVCtzqmUIgedtAafhQ06kXoojtkxuN3rHHXMbfNCuJLcoVbcsRCvbB1Qt
 I6AcmozBNj5AU3pY246QvhsuHm4l6XD89k1f58hKg3iYQHHWbwFE7zVvan4ZquNLPTyK
 XEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yOlCe3APQzaMifrnuMKC34pNFHThuNfr2aJxx+z+UxQ=;
 b=00SE5vWfe2BdZuZG09XJZW6ZBTgusi/QJrlTQV+Hhcn5hbkSi+F+1Q3LsvcLmWfuBM
 qDRrKlTlVOZLDoLC9Xnpt8vmOLOrsmMnPvCPJv2bQiK9V4g8b3Yv6hVkPHlr/sKBwQEL
 3OVo5JcGBvP4jeIa1niZdc5uaopG0WMb2ae0mZhtNVggHb9E+g0zB5xCEYDmlPMfmEET
 RAQLrE5MdKqYIKqod5/h9g+gCBpwV7P9H30ihfVtaAlsACAQQS3bnMf2NWB1FLsXluVs
 Dsq7+xv51sSO2uR9w7XXtZKyXeKl1RG5sNqQi53g940JsJpMHvScLrvzpd4bhxTgZeqQ
 GpEw==
X-Gm-Message-State: AO0yUKVvTOYavjV/RqR1RDzyOBQjTztU+fvcCASMG9oKFSt5YBZ5PrsI
 71SUcVb5uBslPrBWFNF6ygOjcYr9N5EVaZfy8fk=
X-Google-Smtp-Source: AK7set+K4PYdcl6tg3eEUszOiLiPK9D/6hb8u5p58udBXtaJfT/ySFo9IAJQseR9kAqayBslXaNStw==
X-Received: by 2002:a17:90a:fb0e:b0:234:13a3:6e67 with SMTP id
 it14-20020a17090afb0e00b0023413a36e67mr16396946pjb.12.1678214114618; 
 Tue, 07 Mar 2023 10:35:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 13/25] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Date: Tue,  7 Mar 2023 10:34:51 -0800
Message-Id: <20230307183503.2512684-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Return a constant for an immediate input.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index fc65dad190..e16c608ef8 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -920,7 +920,7 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
             default:
                 g_assert_not_reached();
             }
-            return tcg_const_i32(offset);
+            return tcg_constant_i32(offset);
         default:
             return NULL_QREG;
         }
-- 
2.34.1


