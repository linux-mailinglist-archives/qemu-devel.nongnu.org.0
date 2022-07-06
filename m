Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAF45683B4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:38:58 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91Un-0005Dl-K8
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90MD-00070R-Al
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:01 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90MB-0000oT-OB
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:26:00 -0400
Received: by mail-pf1-x433.google.com with SMTP id t3so573515pfq.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xmxavNGvmm3BzQ45g11tA0Bzd0iytuo9+dpLfOmZxs=;
 b=jWghiZ+7o0TEwoTD0fSZC+qbOSj9nnXc9a0+3OAcCM0mlJDz5y61jheSJrrH0kJzkk
 k999XcrqxYzjb+08RjJdp4Qef8bKM6jpFvzJXoGqgJi4utjMvIejprfH1JJ4GLgkOctf
 meBDm7p61QXSSvdpM/UMCrZEX3KD7RWLUW5N/byzoy9g9E5jZFxP0mm2snB4t6z3JSI4
 J93PrmQcoJFxukBRotyI8FebM7fTRAuN776fzqbYDnnh3FdjAyn9ts1tXA6H8iQ+sWqo
 KtAguUgs7Q0I4RSwUpouHs7L+3eJJHOI5NmxrfdmyH/mCul1CSaBVj4N4easaog1HOmQ
 xQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xmxavNGvmm3BzQ45g11tA0Bzd0iytuo9+dpLfOmZxs=;
 b=UTceY9b3LyoEn2KFCqY7O/xw1gHskzrJmdSt/A0SwZdK+6Udl07oEpp7EGBhtaR8LI
 NgQZWMrSyXkzDpPydTnWG3GJLBrnNcfe/fKlzw0aIYzfALGwLMEw0CQWhHxiOi15DY/E
 tAnn9Uq7pUzr2nIwZGzTgvAX/Q8AKXxRKSvBOEZOiFe+SB69bysuNBiQ9E6K/GypKrpK
 GrVIVmvqjczqwlgfXmSwUr9jq4OPqsdRk/5Ec9xB3gL6gT8bFFjKoihnOjmyrSY+u6ux
 i0EZF8XlxiDkkuNsjoPK6SaPzzqr985o7YR/MxK1gAg3NtEf+V+nYCu94OoJpglH4KJG
 3JMg==
X-Gm-Message-State: AJIora+Jit3fA3V0wFGa49Y2aehb6R3vyVndOFHlIoYYSMOtsz4JW+/L
 sHbJ+r3QibbADe4M5xyTLf2Mm/ixW8wQzmNr
X-Google-Smtp-Source: AGRyM1uACqiHcooMD0BApPxWbP5AQK/SHDBzxlUs+FoSvehZdwhLG/mJtvMDeMsuqueMUJO3xF+rZA==
X-Received: by 2002:a05:6a00:1c88:b0:528:9fc9:533b with SMTP id
 y8-20020a056a001c8800b005289fc9533bmr4805742pfw.45.1657095958985; 
 Wed, 06 Jul 2022 01:25:58 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Wed,  6 Jul 2022 13:54:04 +0530
Message-Id: <20220706082411.1664825-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1


