Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6406F4816
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:11:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYt-0002od-Ia; Tue, 02 May 2023 12:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYg-0002ln-A9
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYd-0000aX-64
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so25384705e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043728; x=1685635728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNUcAaiIsith4A3MmMU6YaHlVSgymDmwyA221woU1dE=;
 b=iDdmT96SWk3haDdxJlL0Ke1VnzrEoNl/eQtyRPXexjJ5r4cz/FXwRj7Cl3HbD5PSUk
 50bDp8ADXN7EHMgEB6yVwP3xcrurE2aOoem8Fd6VDyAo9X298m9YLSG5Be2ceKa22shQ
 fkw38ITOcUxxgCHNnh0LVydUhk44/BqkXC1I/BmHSEHsToBCUqIOdVHiXWGHhyNkxDuy
 ZHsMq4v1z11PjmeOBo+OKyq3JF6CJMVGQXP+sRpL3Uoc9O/PQ0HfW9XwlBrT7oxt6Unt
 HWus2wZSxkLfdUdfOQMTrwx4w56C2v1TEh2NfMIyxGQqDiZNDyL+FUrdDE0rSbIBpQjm
 rkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043728; x=1685635728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNUcAaiIsith4A3MmMU6YaHlVSgymDmwyA221woU1dE=;
 b=e9gkYRiNlFChmfrlgeOn8MUJeSHeimX+Cp+Ob6RIFQnhU+UZOZeOzNSRYSKPikal2g
 4KgW3u3bOY9w6EP/IVrlfvM3+vU4rDx3TZk1I/A+2/uKj4DDcZpth1gZauDFpkkDpI1G
 1/i9zqH4lvNEbVa9Ph+J5m0DkG89G9twQ+OFnik2o058FkppgVqmHpybBF7NJThPTW/5
 HRktCo0zGS/7lAwLQXApxo9JBXVrAb7zpliLzJJS8USMIXNdwmFVGFfd4F907qbSutb1
 yIXcdCVuOwoLck5FRZPoP3M/HpxRQS//HYsJ6RPgASzYwYIENnJuVRKYGR0ZnlBc+Jji
 vKHQ==
X-Gm-Message-State: AC+VfDx/27rYaSYzKF9PRnxLHUNkeec6gXHUDUUCa63UbtbS/81hvQNK
 NRTfgqnNtMdJdnvP+kPbBufg+zjXexOdb5h8EfFBww==
X-Google-Smtp-Source: ACHHUZ5sEINpTgsVYOXwELkhuUSuRZvQULr6OGB6ZCTBJJNsejX/lGAS1gIFQCAC+nnwY4XITzc5Ww==
X-Received: by 2002:a7b:c8cc:0:b0:3f1:98e1:c902 with SMTP id
 f12-20020a7bc8cc000000b003f198e1c902mr11865985wml.4.1683043728286; 
 Tue, 02 May 2023 09:08:48 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 01/16] target/alpha: Use MO_ALIGN for system UNALIGN()
Date: Tue,  2 May 2023 17:08:31 +0100
Message-Id: <20230502160846.1289975-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 9d25e21164..ffbac1c114 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -72,7 +72,7 @@ struct DisasContext {
 #ifdef CONFIG_USER_ONLY
 #define UNALIGN(C)  (C)->unalign
 #else
-#define UNALIGN(C)  0
+#define UNALIGN(C)  MO_ALIGN
 #endif
 
 /* Target-specific return values from translate_one, indicating the
-- 
2.34.1


