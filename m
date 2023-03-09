Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66986B2E8C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:22:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMaZ-0005Mw-GB; Thu, 09 Mar 2023 15:10:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaK-00052b-8n
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:56 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaI-0001bb-If
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:55 -0500
Received: by mail-pl1-x62a.google.com with SMTP id p6so3272406plf.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIghDNpSxJ6SxdMMppMACLdakWq5GNMtoSah4rU7gww=;
 b=pj1KNx90wAYf5Mw1ObQUz7dQYGB4s07tczb/UABrDyIqn2+gLjoOw0CmFl4QhJGiY2
 niaz31ahY+FtXJMe9HSbGOZ3Db9NBVHrmoW4k/2f3b1siqoROnfjU2VfFeU7n8K86Xsz
 OC9V1/U+TVGc7mORfHvvfzYqwct+Vf97wMzzxAFHdOOVnH07kiWJM2bY1DxWW6YhRpLn
 Nr/fKkyDLcUkj9uzsUkHvNW/nx4TzheSuANC5FfGFxvHYckW9zhcJDVH+TlFGphq9YkQ
 VR207dBYjgU42/n66Cg4Et6w/Ig/rYlHDZH2ygAhmRGUtp+elgJvtb+ihk692gZO7keP
 YJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392593;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIghDNpSxJ6SxdMMppMACLdakWq5GNMtoSah4rU7gww=;
 b=DXotkksTLGClJQmJtEiyVabF3IM8u2lhUFtdw+6UQU2KvxRw0W1MkKN7T/BNVsk5LD
 Q9vnjE6RUMeDrQQtmN0FqNKvzSX60JYdP5DMZTHM8W+T2WPS/5E+4b1Smdx58XqRfjMZ
 Pns3cqoMOg7ChCOQ6l5yKWAgYDeBbiddIe8ZBX6G9eeD4j8LPgnnta2afOmPmXyrRFZ3
 ntt7h1ONH0VSq+ZhqE8GWyLq84r6wkA4xfLkynJXaiiNjljdJ5mkBRBZTES9mhe2Ki1o
 vgMeUlFZUAbMbGk+gNw9O255M94gX5JGvCO5Ox/tlo3PzKeSNjRoeY57nlLsHkAyEUak
 LUGA==
X-Gm-Message-State: AO0yUKUszt7tQbRBwP8G7YaZbHxBVyX6d02O7KdRfuK9n7enm0ivJd6U
 PXLp7A75cq3VaBmcdr29ReT/8g6XQ5YicoJZgHA=
X-Google-Smtp-Source: AK7set/sW8/ySjzKD4ZmbUN3Wy5biItL3zevCkl9Hq7RmJjhm2eMz9qASZa24CjzEQoX5W7nPTlzsA==
X-Received: by 2002:a17:903:22c4:b0:19d:1897:8192 with SMTP id
 y4-20020a17090322c400b0019d18978192mr27629500plg.47.1678392593215; 
 Thu, 09 Mar 2023 12:09:53 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 69/91] target/arm: Handle FPROUNDING_ODD in arm_rmode_to_sf
Date: Thu,  9 Mar 2023 12:05:28 -0800
Message-Id: <20230309200550.3878088-70-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

While this enumerator has been present since the first commit,
it isn't ever used.  The first actual use of round-to-odd came
with SVE, which currently uses float_round_to_odd instead of
the arm-specific enumerator.

Amusingly, the comment about unhandled TIEAWAY has been
out of date since the initial commit of translate-a64.c.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp_helper.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 24e3d820a5..90cc324f71 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1111,10 +1111,8 @@ int arm_rmode_to_sf(int rmode)
         rmode = float_round_ties_away;
         break;
     case FPROUNDING_ODD:
-        /* FIXME: add support for TIEAWAY and ODD */
-        qemu_log_mask(LOG_UNIMP, "arm: unimplemented rounding mode: %d\n",
-                      rmode);
-        /* fall through for now */
+        rmode = float_round_to_odd;
+        break;
     case FPROUNDING_TIEEVEN:
     default:
         rmode = float_round_nearest_even;
-- 
2.34.1


