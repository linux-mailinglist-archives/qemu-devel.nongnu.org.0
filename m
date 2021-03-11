Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC33368C1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:34:07 +0100 (CET)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9HC-0002Jj-FT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95v-0004sR-E0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:27 -0500
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:42820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95i-0001Lk-54
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:25 -0500
Received: by mail-ot1-x32a.google.com with SMTP id e45so18297009ote.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgGOj1mKX0zUa4zVxq+r8+U6Zz9nmH1oETSGiDkN5eQ=;
 b=lFDxN9ZmvddZkEBf3u1Lrf6YMzS3x+LvtwQwB5rMnDfEED6Aq1aAj6KGkzNAPussYd
 dmtatXfXD1ci514uNmwfokpN2XbKMHwUw/hJjs3q7+8R5OhXkNQHFbmDgFP3GiFvdoaZ
 73yJmEvIRN7fdcVhqBE/Ky+oYQpdHWA8TQZmkoZ7FNYn1mpLjQHO2nghKPbNj/IFzEDN
 E5ne8MNBFFGQ/42NhoyaaIpbm8A4660ANxgcpEzlDrCvh2/A4+VlK+e5OnI2HqSpQk+R
 nafYMFn48lvNKeQe+qkiGpsha+ZEkLeF0oIV7fgnV42PJkD8gP6ra+dAeIZmrBgMxgcF
 ryQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgGOj1mKX0zUa4zVxq+r8+U6Zz9nmH1oETSGiDkN5eQ=;
 b=sNYEs45YL8s8vfxTw40VlK8GGKhRUvz3v/GojFKLxZpEbIXyhB/DXEsMhXsyMwV4ae
 AaSxpeubCUs+2eg8jYizQSd32zeSgoUoQkunR3/WhjpSbZjAdMqAlB3ptrzLCouODlXz
 L1+2vHeuodDbo4nRkn2JSBe8lcbBFv6x2WU/WppAh/zn1n5M69JS214yMEOXduPjtdbG
 Ks21EM/IRSwLxmkp4DPrXhTOvEF2Xf26OJ2E4c5GoY4U67ftghYxH4aHduyqBVvO9YxU
 lCFpXwKvFOl9ZbI9ZLCqT8/vBPHSuiMF8v78XFI6bBJCdxWKsnrXy7H08TrPMSCLtKmO
 18uA==
X-Gm-Message-State: AOAM533MV8QqYSO83IIOXh7F2iRrtf3D//VWK8MmllHK7cxQguVpNVbn
 4NSqQyKtvioxtPeg1/RWZmApIwc7sOMPOArU
X-Google-Smtp-Source: ABdhPJw2QYt/imtdHVdQMW3rObGtVDm7W9iZpYRkwseZ8ynHG4EVv4q/ZjmCRv0WiOtEvRpqbgkigg==
X-Received: by 2002:a05:6830:22c5:: with SMTP id
 q5mr4866801otc.359.1615422133103; 
 Wed, 10 Mar 2021 16:22:13 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/26] accel/tcg: Rename tcg_init to tcg_init_machine
Date: Wed, 10 Mar 2021 18:21:41 -0600
Message-Id: <20210311002156.253711-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shortly want to use tcg_init for something else.
Since the hook is called init_machine, match that.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index f132033999..30d81ff7f5 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -105,7 +105,7 @@ static void tcg_accel_instance_init(Object *obj)
 
 bool mttcg_enabled;
 
-static int tcg_init(MachineState *ms)
+static int tcg_init_machine(MachineState *ms)
 {
     TCGState *s = TCG_STATE(current_accel());
 
@@ -189,7 +189,7 @@ static void tcg_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "tcg";
-    ac->init_machine = tcg_init;
+    ac->init_machine = tcg_init_machine;
     ac->allowed = &tcg_allowed;
 
     object_class_property_add_str(oc, "thread",
-- 
2.25.1


