Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A26906B2E1A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWk-0004QN-CI; Thu, 09 Mar 2023 15:06:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWi-0004PN-0Q
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:12 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWg-0000gj-G5
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:11 -0500
Received: by mail-pl1-x62d.google.com with SMTP id u5so3197859plq.7
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJ3SE0hUOlTaGIEJB/X6qUV9nAuHvx3xjZMEhLGlcbg=;
 b=NdmJXZzSfRSid2fbh8oSBMwtd8Sg3bObUOzv/I2V4OTi4+dYtCdnJMfpd30/5+oMYl
 WdvjmNqtW4uTL4jNTtcyH4iA/CLOKnsYxLCkj98hdoApKBho9MlPsDsDIwhqWTYygrr3
 FBACyLzWwXZ9hzgEdkJv2K8mvz30hqbjRwy0isvnPKfaq9kPDorgT3bN8ldPIz8bo0Wa
 QJPVTAchaNZ8XMI9ZNWiexHhPOLFAlHxZ6QjCIWwi3g6ZMJDvIRBajwMP4xvqYDhkT49
 ZtTVTQDQfDwXp+TjhzQLJ6QGiDUmD+lg36/FTj627q59dC8a8J3xkQOjYYPF7PNR831l
 rEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJ3SE0hUOlTaGIEJB/X6qUV9nAuHvx3xjZMEhLGlcbg=;
 b=8PM6vSVRsDo7q4640REScCG6R3wAKcsAPd2FtHGTH69jCqmrwWHogONDy5OIYVpBL3
 q6ZG6fjhUSV/VZyjmIAnFcITRwD6J1agLibr8aLWYQ2JIR2LOjb0T7ElQHHiFAO26jJK
 j4GXAWayJitm4CzZ68gznJmqXyXgOrMWnK+x9nxm0bbgSSewlTx6KxCexv9/K+L+SqBB
 8v+P39RZyQO0nXON/nHTG2wHgHhzBmjuBzxVoNsQefXmurFe5BhCizGbuf0gpZKnKAaj
 zAHUQmwBeNWXsmHld830N0+CfM2KIKsX5X4gNr8RBL5jxfd8RYUvuA5F/hGAQu0M4sHe
 ReyQ==
X-Gm-Message-State: AO0yUKUvp9IIYNFHLUxVVep8zgmk69Ne4W+v2hUlaINk53L3Y3rh6EGu
 2yclR/+IZ+FcfUW7WAskgrbC7RUuOoMEEWFHodg=
X-Google-Smtp-Source: AK7set8gFHJtycB+ORVHJhNZx1CfaL63xwhC5wF7iyXaicmZyQJ7HIe20BTk2Cjgi4nUNKPCYwMyEg==
X-Received: by 2002:a17:90a:e7ca:b0:234:f77:d6d2 with SMTP id
 kb10-20020a17090ae7ca00b002340f77d6d2mr23788451pjb.45.1678392369729; 
 Thu, 09 Mar 2023 12:06:09 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 20/91] target/cris: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:39 -0800
Message-Id: <20230309200550.3878088-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-6-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/cris/cpu-param.h b/target/cris/cpu-param.h
index 12ec22d8df..b31b742c0d 100644
--- a/target/cris/cpu-param.h
+++ b/target/cris/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 13
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


