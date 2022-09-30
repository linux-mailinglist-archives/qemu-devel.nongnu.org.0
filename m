Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F005F150B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 23:40:15 +0200 (CEST)
Received: from localhost ([::1]:38498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeNjy-00080N-3b
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 17:40:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWz-0006Ye-OJ
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:49 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeNWy-0005PB-7X
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 17:26:49 -0400
Received: by mail-qk1-x731.google.com with SMTP id o7so3611241qkj.10
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 14:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=prbHZS2FnkFrvu/FG/97FvMy2MOeK9IFnU5C4synr+hbKxZApVc4z8OncYHCIdBwfU
 /JMqWmAAVvbw+qHT8XFXXvl7SMmBPl7RI+O586GtjYiRBI08FUy63djdzqANeS1ObTyf
 8yYzE1s3MmlUvuya13D/7umNshpNAgvJ2r7NtiIUXe4Wu9Isz5iPu3Z8z8Tcw/+K7smv
 8XtbkO8e/Gqra/OTHthUfQxr4UkScKIOmh0+onGSbqFb+TtTkE0i6/EIvuUFThxCewfR
 +J2LxsFsWGyutOLuBBxiXkxZfGrpjbOBjDd7AAvGZ5BBEEDv3/R1Q6EsJfbnAnk9yYCT
 klnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=lBYeX9ho1fyA5qf/IcKrM4dg5+K9sN39kQAULxzITWM5766/aq6EK59sD0TNnhTWe6
 78k/eiY+RNgMQyoTOl5uUPZ48+jOcC5weu0TPFqLqzge/4NBUtgFYCsYUaiLBlqSSmZP
 XGD6Pz31ILk4VYoMowGAEdXDBAKG7GRSMLPqpX7w+QIG74hsY0ueWpYmYHmFUsZHkJ1G
 vaF5nCaX7Fr3FoBY7sqvj7jQ6zuY8om5MMH0E/3oGifNvkRw/BzGE/ILrF1DzaFDZHNg
 SyFtFwh7kJjbbe/jGdnnhwAEq9uy8lyQ+A4GHG4/FYcYHzGUnlDF0EHq/NcqyEQeb01H
 KG7w==
X-Gm-Message-State: ACrzQf2FGKfKtMdTMvZlvP9Ueq2VoOAkvJ6JfIjP1uPxc8zq3WZVFxdi
 LvFsop5KHZMYHiq14y+YQqLG+EGprnBRgw==
X-Google-Smtp-Source: AMsMyM7KIR9bWx8lrKZBnDOBPS+GUpG6dzGcUGRj354+gqoFQBeBi9UfwGGGqi9iqM+BLfdYZFEnAw==
X-Received: by 2002:a05:620a:2605:b0:6ce:1509:e9f7 with SMTP id
 z5-20020a05620a260500b006ce1509e9f7mr7628039qko.379.1664573207329; 
 Fri, 30 Sep 2022 14:26:47 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a05620a28d200b006ce813bb306sm3696370qkp.125.2022.09.30.14.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 14:26:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linux.org, alex.bennee@linux.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 09/18] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Fri, 30 Sep 2022 14:26:13 -0700
Message-Id: <20220930212622.108363-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930212622.108363-1-richard.henderson@linaro.org>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the target to cache items from the guest page tables.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


