Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C49555BE79
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:41:08 +0200 (CEST)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63yF-0000A8-3s
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kZ-0002sL-DL
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:56 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62kX-0003nj-Jh
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:22:54 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i64so10876758pfc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=KkzG5unNDbsqkQe32WPx+Gpnue9qZLtJai7j2WrSPKNJ2nlKuCS95wbB8M+ALIHdKx
 a2nFrEu2ltHiulHhzk9ihToBp9JyvOA8E8uNFKCL9ptwbzaVHcDjOw1vHG2vGIU1tHVS
 LqUsuqxqMCGu9DdsGBJPOOMtY/dPDDwDm3OKP3ikETCmXqbHcpLh3Q/Bmu4a6VaDzDWH
 FKue1db7oxu7UK/1PK9/wPSkxbK8EsLt7Wh+h7/x+7YZeD+PaMm8TW655yURXAPiibC2
 jr3Di67r8SscoiAHM5Pw8kASzSJ4sdnidW+PY4+rFq9AxKUsJ+6De0Y/CzIf7bk9xJlj
 FVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=UwdzmVOQJcd4hirm01Mq1Uowdzuxzrip91hlYY3bZHsTsEblanfLYMDOBi3uVgTmaX
 V6j0Us88A7wxV+e7LWVYtOxh4FZ+jhSzn6jXUjG1/kVJl89cYO85NLqj93fdqgPue3dX
 1zV9t+TG9g4HcFd+5Ye4QYiob0LgxAPv91F4gxKALeNFSeKoxCWq7y1AMonej7m7H0Fz
 /fqNO25NApISMuX7JD5zQddVCxKOr39v3LIQmlm/cg0ZX3hLuUnGMDsE2LVebYMxgWQP
 koiRwTBu1ws12siq7AHmPx9FSZwYu4z61tUo2Ytq/IXU/p94UgW8cCzqBt5UttaVKxc3
 xtdA==
X-Gm-Message-State: AJIora8oqllczRLJYPeRItLpQifPz8iqGOO3FaJBNM0dHIboIQ42rqvC
 ZZ8vDJTxR2jMv59oGKVx1aiPxOrkKYIm9A==
X-Google-Smtp-Source: AGRyM1swggxPvtu1V0SgEWLP7512rRrUhjkoCMktdftvWJJYD9PE2NN3BWCmGIMw1UtRnfYyiUGNzA==
X-Received: by 2002:a63:149:0:b0:40c:f753:2fb0 with SMTP id
 70-20020a630149000000b0040cf7532fb0mr15687906pgb.172.1656390172716; 
 Mon, 27 Jun 2022 21:22:52 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:22:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 38/45] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Tue, 28 Jun 2022 09:51:10 +0530
Message-Id: <20220628042117.368549-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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


