Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474495ADA28
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 22:27:07 +0200 (CEST)
Received: from localhost ([::1]:56268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVIgU-0005CE-Bz
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 16:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIck-0007Ez-VQ
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:15 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVIcg-0004ZN-Tg
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 16:23:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id az27so12626588wrb.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=JoXyapuA2sOqdU7HqTp/qhFiVhAbSCT0vMPIZcZwJtUAU0dkCrZq3Ju+v7jAt4YCev
 E4x3Hh4CJujgjCy8pBZlFuGoGMwqe4WAhcoq0upcshS28OfCS76VXLQiyMsu93UrIpmN
 ZPlvJkUgzjIY7SIBKgskvJ6hBBN6p69tKezsBZycbVKxvC6wYom6HxgSk4nY1lsFMwLZ
 ZN21alsarhmSBc7CgjWjdDjG/Wj/hXyFs6o5+BStvuRWeD9cblICCYJbORP0FmughMLs
 wM2vCiyRLdBLsdff9BvpNesuxEwljmuqbH3N0HjkgfUg0ORSf7hU7SFMFuB/FQK9oWD7
 H20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=L7q2sisR9jXPO2g1tObtbxm8Q6qrnHqWQnHO8ESVRzQ=;
 b=KtI72QhEU9TFvNnGoha6NDg7+vxuewtRqtpDFE6xG3k+mGzCdcoUNZ52SJClCqNLip
 Qn/Sw62RhJksrKHRAF81FLiVuTQOJoCz7Cr1AZ6rlxtE9Y5SVjYhpRuSTpPMyiWcI9Vr
 /6jqMJbirfRZS3WIlCfU9Lx9DE+0h12njtkJecGvx63LYOAzPlCJDS1UaOzn21/CjP4R
 jGWAcYPy7mU1J6aMqpasO7a+2JnmR8IraGw+eJ1GkM8oCWUAwYs6YCj795G4ZABMedwd
 xMmbRCXLskCBa9asBcdmqDW6Cf9sIjdgeJ+45SvCv+o5Y6+fm5XsF/+k0Gule8cxcWJw
 hr9w==
X-Gm-Message-State: ACgBeo16ZLiON4sI5aMcKTcrJUKefHyZdfxbsAfa99S1CER/JoEv17At
 tyjXUnQjxhsZODYvCTmf+tQ06uAla/0pwtj4
X-Google-Smtp-Source: AA6agR42vX1E7Ajc/Q6xgoqRAFmPoFlm6L1EuBh/wQBKBOcrA0H8BCkctI8l0SdQ2Ge76e0LaS7XQA==
X-Received: by 2002:a5d:4d12:0:b0:226:d878:e096 with SMTP id
 z18-20020a5d4d12000000b00226d878e096mr23055546wrt.377.1662409389551; 
 Mon, 05 Sep 2022 13:23:09 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:d0ad:82b5:d7a4:c0a9])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a5d56ce000000b00226d238be98sm9472404wrw.82.2022.09.05.13.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 13:23:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v3 6/6] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Mon,  5 Sep 2022 21:22:59 +0100
Message-Id: <20220905202259.189852-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905202259.189852-1-richard.henderson@linaro.org>
References: <20220905202259.189852-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

Allow the target to cache items from the guest page tables.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1


