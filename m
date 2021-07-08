Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C183C1931
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:29:35 +0200 (CEST)
Received: from localhost ([::1]:58394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YmE-0004L1-U1
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiJ-00014r-UQ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:32 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1YiA-0007qp-Gf
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:25:30 -0400
Received: by mail-pf1-x431.google.com with SMTP id x3so2683425pfc.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VCr5jpWyokkUf3wEDI6lI1MA+2xhLhrhneqYN7kYD3k=;
 b=q1sLD02L8VtDAJcbsks/HzgWfTh2s8PdKfilRjucpMzbx7/btY5UWgTMAalmzv9kef
 XrJCocR6pK3ShdTjrc7SN7T7vrHHCrtsGv6I0Dj885HEN06L252fGpIw8t6LdxC6a5/i
 bhck/dgE6wyKTAWkvKO0nCr7XQ73FfMvBUItLXz6+B0X6ROH+S777YIHiOiDMv62usjY
 bMpSlTpkyiP4k3p+tIzbuLpVHj3vixc240wZzPO46U6uwurO/B/MnLTbp7u1J7vkQEvA
 PVDmIpt+TSBRpEWtbNhMqfeCJLrf0KY+tOSxmYM/itfkilwtpctFTPdbe+4i8byyU1as
 umpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VCr5jpWyokkUf3wEDI6lI1MA+2xhLhrhneqYN7kYD3k=;
 b=aye9UHrquaXusEplDQ/4HZTCdUAOlZ+xtMRiGIeYyc3HVgsd9/0pDe/PU/8nKLT3xh
 XTI+1DemSnZZ2SaJ0KKxqu1/RZxTiMoAI/tBLPiWGBdKrxQemlXpY2bzA26+RvQ+q819
 MH7Y3oTn8QoUJ3MCEkeGxus2v//qy0FYnrIsm7aWl1r7qKya3KKGFPK4ZKNg+MpqVdfi
 hb7gL0gWiw4q9dKbuzBh6s4mQ7pxUFqhRbxZBpcaY2CKIHHCiz7immlKYKESGU1gBsoi
 zEahSnenfEag8NcDQ/ZR49BiMjRO8onQcGuRfkCYpUde1jN2VC5lqac639quXjiydgvW
 oG/Q==
X-Gm-Message-State: AOAM533Sotrb2TTjo4cBvADyr6HVt/Hemnv2+2muoDeFBCkoJditmNM1
 k+CQAxZUQ9JqaZEeEHQxxdNjgTmaxxXTEA==
X-Google-Smtp-Source: ABdhPJzyKh0gRAWUkzVYJaYk7Z2cSXAP191HVCdo/5b31KzVtoj+Wbtgny/pA59MHZH0L8BtcBjIcg==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr33339637pgi.323.1625768720063; 
 Thu, 08 Jul 2021 11:25:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d67sm2751810pfd.81.2021.07.08.11.25.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 11:25:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] target/alpha: Use tcg_constant_*
Date: Thu,  8 Jul 2021 11:25:15 -0700
Message-Id: <20210708182519.750626-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace use of tcg_const_*, which makes a copy into a temp
which must be freed, with direct use of the constant.


r~


Richard Henderson (4):
  target/alpha: Store set into rx flag
  target/alpha: Use dest_sink for HW_RET temporary
  target/alpha: Use tcg_constant_i64 for zero and lit
  target/alpha: Use tcg_constant_* elsewhere

 target/alpha/translate.c | 70 +++++++++++-----------------------------
 1 file changed, 18 insertions(+), 52 deletions(-)

-- 
2.25.1


