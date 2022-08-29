Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7895A40FC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 04:13:25 +0200 (CEST)
Received: from localhost ([::1]:38858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSUHF-0000fD-0O
	for lists+qemu-devel@lfdr.de; Sun, 28 Aug 2022 22:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEC-0003UE-EN
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:16 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:46867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oSUEA-0001be-Qk
 for qemu-devel@nongnu.org; Sun, 28 Aug 2022 22:10:16 -0400
Received: by mail-pf1-x42c.google.com with SMTP id p185so6819115pfb.13
 for <qemu-devel@nongnu.org>; Sun, 28 Aug 2022 19:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vuOgmHjKOfypW7fKTz7cNS4k/xnt5yEqi5+DGy9oOvU=;
 b=jh21QBT1S2S+J4/UbtQkKpU4GBeu2kzAqeSmnsiY7CW2T0XJlGCsOFgXf4arS+OLpE
 BYEpR1skBfPzb+6NvSK/eoG1y0+cR6gk9M6xyEQOBQfQpUXA404NlIPXp1FEVdRltODK
 Y4hYJaiuxtKsggW1lht+8Kov+I/zz1OG7QVYeJM+HOOpL43ungSgthSBO2uNMzM6QBus
 iWHdHvRshiqBtQ6lc+8kD9dPAmTW5+P05VhCKecuxEPk7dM7tDuqvBYuto1m/EWp9RL2
 XafuEFVBpOGIWRSksW3HhnFLErv929kjoXujWnlxCczqPt4RgvbNuKjJy4SFG+u51iwe
 l5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vuOgmHjKOfypW7fKTz7cNS4k/xnt5yEqi5+DGy9oOvU=;
 b=yH4YW9hCqDSv0yQf1ddIx2+uZ0B0ommDrCuf9e7EA0n9D4fHBZMK9mMNTaVm+47nCF
 ppHka3XYBRcJBcKI9A2MpIRY5/mfEGvJcd4Jzc+wW3BLzxHBYj5UcbUzhz4RdaOaBTw7
 b490ZVS0Jj1mGKo7EsAffHCOxRuhzhFcXP6jTMsAJWnFIq00BXO1sCwxK53E+x1v6i9K
 pDhWkNJUB/fgfR1RvVWRGgqwz/UueAxTRhGiLcR7ueFm1HRodRqbS/Eu4DwtlW+ZBcJF
 Wc3VgTvIts3ad4ChK5Qs7MrFFU+ahqiGiEmoBFPlBVdQYTi6Kw0OyN5UKpJc1UyLkAMr
 2fKQ==
X-Gm-Message-State: ACgBeo18PJt3KwIkKzEx+gQbK/Bm8dA7q/VY2qckCNMsfzaxgGUhVI+4
 UP0Oq88i2hkJCq8Csdo4mzjRU6oJYv56dQ==
X-Google-Smtp-Source: AA6agR7JqmcPsCAjEeMS93uBNdbJuOgLO9oatLb3+2vwLRPJN0HC+DaFfNdQaZ9WwzhHPVZJ+uRHrA==
X-Received: by 2002:a65:6d0f:0:b0:42b:42f8:efe0 with SMTP id
 bf15-20020a656d0f000000b0042b42f8efe0mr12485952pgb.197.1661739013317; 
 Sun, 28 Aug 2022 19:10:13 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:2fa6:2ab5:a96e:2a35])
 by smtp.gmail.com with ESMTPSA id
 ik30-20020a170902ab1e00b0016bdc98730bsm6035139plb.151.2022.08.28.19.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 19:10:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH 4/8] linux-user: Convert signal number for FUTEX_FD
Date: Sun, 28 Aug 2022 19:10:02 -0700
Message-Id: <20220829021006.67305-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220829021006.67305-1-richard.henderson@linaro.org>
References: <20220829021006.67305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

The val argument to FUTEX_FD is a signal number.  Convert to match
the host, as it will be converted back when the signal is delivered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8bf4b79a9e..f50cc70f1a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7778,6 +7778,7 @@ static int do_futex(CPUState *cpu, bool time64, target_ulong uaddr,
         timeout = 0;
         break;
     case FUTEX_FD:
+        val = target_to_host_signal(val);
         timeout = 0;
         break;
     case FUTEX_CMP_REQUEUE:
-- 
2.34.1


