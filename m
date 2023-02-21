Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E569D964
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 04:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUJXG-0005vp-IQ; Mon, 20 Feb 2023 22:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX6-0005qf-6w
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:36 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUJX3-0005nY-Ik
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 22:41:35 -0500
Received: by mail-pl1-x62d.google.com with SMTP id s5so3526420plg.0
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ew+CHHLXjvHcG2LrKoAORoLrhiuOCeSu8V53CSlLFcw=;
 b=wZ3Qr2ImMOSEdXM2ChIKcUTsDvPavvQwSfSxwcNlrLUYuXe6YxUhPPYyB7eJuNwpwr
 rqdGB48ZcHbLU6PmwBx+UW40JXVn6XybYvUfQuet7SGUoJXDGrJH7NUhzVxThxTV81ik
 rQlb5KUwJHNxIQkLwdNVF9034lzq5if36GDN/exDhMFF+E9pMzZ9J3sJOiJduU19Mv7c
 E8qG/KTumej0hyUAyhjBZB1JRP7S+2HxKxLDVZPDHuIT4MHIPstSZa/L09dMGeyedamC
 mlBcYsNydgxXCOVUq/6Qk7193jQ8fR2TH4BWgkUkLOC7Be8y0c54VHnWKOc2OYxVmTSo
 u6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ew+CHHLXjvHcG2LrKoAORoLrhiuOCeSu8V53CSlLFcw=;
 b=ms8oyK4Oj2bpaFhtKNyObZKTpD+AvTPJJgw5S4MOJKirjLQ+FnRjyx4BoQi2t2cCaI
 E3jD1fvBT5IRHyepsQ+HG8S104L99IBvTpkyDmAR833dOgJgMcb1hXuRtlIWs4M7brPr
 wOqn9zEzWsGCltVQmXUY2L1VoB02NgvNt7EI5NeF39TtWuLiueSsGcxsf1azXipI+0Rh
 uxNdn9zRJilxyHY6xXO8sc5/FN57qBaf9nlz2MQ+PQDHM7lP+f/eCNfkT4i2mgKFV1kM
 4FY0GtNSRvBSkITre0TVGOQO467dlHBRi7zU5+3b4ctD/JikMxU3viDPsYcHyHXMExH1
 E3Ag==
X-Gm-Message-State: AO0yUKXzYuZx2qmyVQHZdrf+nkUUVfpFONH4JqL4PRkB+rgeHElPj8b3
 iQULP0eXTDGJFhPGWAMthW+9m5TBKQKxvlgs4Fg=
X-Google-Smtp-Source: AK7set8+WqlYp+GQUmGwuC5yyH4WnRd5re7JbYoCJvsX2Z1Unl0M5ZOSJ1FFZC1uFoR0GUAVmRyhPw==
X-Received: by 2002:a17:902:f283:b0:19c:94ad:cbe8 with SMTP id
 k3-20020a170902f28300b0019c94adcbe8mr157128plc.36.1676950885850; 
 Mon, 20 Feb 2023 19:41:25 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a170902c1c400b0019a88c1cf63sm69851plc.180.2023.02.20.19.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 19:41:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Fix gdbstub for m-profile (#1421)
Date: Mon, 20 Feb 2023 17:41:20 -1000
Message-Id: <20230221034122.471707-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This will conflict with FEAT_RME patches; I'll fix that up later.


r~


Richard Henderson (2):
  Revert "target/arm: Merge regime_is_secure into get_phys_addr"
  target/arm: Fix arm_cpu_get_phys_page_attrs_debug for m-profile

 target/arm/ptw.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

-- 
2.34.1


