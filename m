Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CD52F6B8
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:21:34 +0200 (CEST)
Received: from localhost ([::1]:35786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCs9-000120-7K
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbi-00086l-4l
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:35 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:35817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbT-0003zf-3f
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:33 -0400
Received: by mail-pf1-x434.google.com with SMTP id c14so8985287pfn.2
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CwJJmiinTbs3pTu81N0JRGdiNyaikTYskuQZDhXBbfU=;
 b=MwCIJoExiFT0E+mxTP4UhEmXRjrt3CM9wAs+IeKQInA3MasXzaggODnMn3ZOEDxN4U
 FjBlQUTk3c1FdSkubWKoLFaB7JnuFlp3doZLxcFXBI0Zt+SvccrVn00EkPxUqKDuvy0C
 ry5EFj8GRsE+9aLUAW4eugbKOR2kI+W0qFJ518CdHUtn8HXXlR+zYg6b1QHx2yVUaYxv
 Rjx8TBpwEDUOM+W/s5tCjEG7U6rzhJ8W+gBnje+vGAED9WsXiJavKak+wspkY6NdNaS/
 aJt3mRQ5Zd3aW7ouRC5nmUH0KLalzJVJ2FSzQyhAJ9AWbBkfYwsnw6QTHuqGj/ZMZAyi
 m7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CwJJmiinTbs3pTu81N0JRGdiNyaikTYskuQZDhXBbfU=;
 b=YfbtVo/GDRYRn3/32jMbtY/R48ye488r2Z+ssF+L3Hrt4/Lt4c8vinCu0dwaN93JiB
 AY43Aztt20uXVOhqBROpirR2Y5FyTUiJivYDQvTXSbZoWgE3INKM5drNVAVVTDqdELy4
 y7kh6vSNhfOxBvil+s/49g8GrpPpydCD2VVZSYT2trmKVt1WTDwdvz3yRGMGl3VEcigT
 9FRRbGkCGFfe9w/tsGXz0YQgoiS9OuJt/zwIVWbs1PRlfBuE+0EcTffhWYGbOsJFSntd
 /rv/q8ey2ng5OzQvHakbdSuPKiM1e78UaCqS18baxGCVVvgz59WOiU+5f45sJGKkfIsl
 t7Ew==
X-Gm-Message-State: AOAM530bfcGTNxaRgvsp+YabMzbsh5K00+r0mFgCuUDhpRgr8yB/4RU3
 uexLeHhZdxwC1zbspMv5CCfznrwjlcP4CA==
X-Google-Smtp-Source: ABdhPJw4E6pzejTUh8f6F2NZRwGlD8iiXUxQnM82htqtlF9dJ6qGH/LNqarV/FxnZdN330xbz1Vrpg==
X-Received: by 2002:a63:4d02:0:b0:3f5:db92:60b7 with SMTP id
 a2-20020a634d02000000b003f5db9260b7mr10817807pgb.580.1653091455938; 
 Fri, 20 May 2022 17:04:15 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 11/49] semihosting: Clean up common_semi_open_cb
Date: Fri, 20 May 2022 17:03:22 -0700
Message-Id: <20220521000400.454525-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Use common_semi_cb to return results instead of calling
set_swi_errno and common_semi_set_ret directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 8792180974..1f1c5b4c9e 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -364,15 +364,13 @@ static int common_semi_open_guestfd;
 static void
 common_semi_open_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
-        errno = err;
-        set_swi_errno(cs, -1);
+    if (err) {
         dealloc_guestfd(common_semi_open_guestfd);
     } else {
         associate_guestfd(common_semi_open_guestfd, ret);
         ret = common_semi_open_guestfd;
     }
-    common_semi_set_ret(cs, ret);
+    common_semi_cb(cs, ret, err);
 }
 
 static target_ulong
-- 
2.34.1


