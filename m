Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188453C181C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:28:52 +0200 (CEST)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XpT-0003o2-2l
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5Q-00025R-S3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:18 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:36440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5I-0008GK-3o
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:16 -0400
Received: by mail-pl1-x62f.google.com with SMTP id x16so2419786plg.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqL8ixXnHLBIypnyWYXJ3pbFSn+qRlXr9cZUpIRddvA=;
 b=hVn3+LrNnFh+4IEfAFhCu/UiXZDloeqgkTz7HWRu77Q8i3IpB2KgwDsqtNp9S7Kpg/
 kLVkSFs2u+va7yzPjHAMCD61uagkvuXpH0SRgv5Buua6wdltKSy2SmNQRzwVaKTp8Aiu
 w75gAtFmo/TqGZ9h5LwYfxWSCKguCucPVnmjNJWCSn0zDAgV1AgePkolmB22FmCAPROD
 MIM97Zdc4nlB3lU8UuNS7d9QIdR1cVIIgyJs7WeHzauD7apBBw7tTkJLNWHL5upc/E8O
 UoPhHXvPLOTNgeU+Juq21gC0rUA4634spjmBO++2v9sffrg/qLHIRTQbgDlhIGqBlaNl
 1kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqL8ixXnHLBIypnyWYXJ3pbFSn+qRlXr9cZUpIRddvA=;
 b=irJrkGMZwZGW0hXxFsSB1fI7cmenm5tqBi+YKFDP9y6/A6jqmT9VfVraRszQu1I1Tm
 3YRjckcCQCqUSbA+ijSf1hiFblpAKPiX9sFXCk1l/DgJQK+gJoGRVMlgu7n0OCoRopSn
 ezyc1Q601ELtg6imhNxCzgm+XZX2ouU9L5+Rro42FGMBgs4P/UrJWYvELxR7PjieCwif
 woarZe5WwS3vRzf3/8ySNFHkaPUtUr7UTzruf4a4Pq2rH57Gg6GsU8SsffddoKJaLdQl
 gUJhvjX9LuUnWnTkcX3JjuCqsFAD0kJXSB405u6iSBHQtXC63OlIhsk3G8YASZVs0Tcw
 KwPA==
X-Gm-Message-State: AOAM5319xJvwjhmoysJkeoRmlPo1W5Gb8610EQ6oG6jHYKaEG5WVx/cY
 y/bNId4UM0t/FohWlZvwzNbwhpnLXVhUNg==
X-Google-Smtp-Source: ABdhPJwVvctNDfmty+18gOsRkNB9bSxYF6R53njY3Pa6bicOd7QQM9ZSpkRDD0gx0w1FDCq4ICB55g==
X-Received: by 2002:a17:90a:4d04:: with SMTP id
 c4mr5620505pjg.148.1625762466822; 
 Thu, 08 Jul 2021 09:41:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:41:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 28/28] target/xtensa: Use translator_use_goto_tb
Date: Thu,  8 Jul 2021 09:40:50 -0700
Message-Id: <20210708164050.711967-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d..ac42f5efdc 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -406,11 +406,7 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 
 static int adjust_jump_slot(DisasContext *dc, uint32_t dest, int slot)
 {
-    if (((dc->base.pc_first ^ dest) & TARGET_PAGE_MASK) != 0) {
-        return -1;
-    } else {
-        return slot;
-    }
+    return translator_use_goto_tb(&dc->base, dest) ? slot : -1;
 }
 
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
-- 
2.25.1


