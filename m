Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94CE5E6B14
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 20:37:56 +0200 (CEST)
Received: from localhost ([::1]:60504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obR59-0007gX-Pi
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 14:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBI-0002E1-FK
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:10 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBA-0005SY-5K
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id t14so16403378wrx.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=l8BTHv6Rvs1T1FBsTL+iOTvROMJj6hLiW9QKgE0n3iY=;
 b=Xtay/0AzdvwMSS0PNMAgFX0sIiAtRArBM3KyVj+y55enF4CzRDUDCcwQIrdUMcgxgj
 4766Wr65fSPA/crGFm7tQVNijhQeiuu3LITrbyDach33GL+S3VOAZ3Lz0h8WYmw6CpOQ
 JlaXuLGnlRFnH5TWuugESW3Pm7SbpzG2ddl4as9adpau0+zmet58f8WzgyWjz3A4CgKJ
 R7xVAhzunfc0zx0bYzjoPjxgEi//tAjuL8Jcwi/jgKHHtR91HgbkDA5If0+49SOIAAwv
 EOYHQe2XWB8N0f/AhvitHsoCmSPxXzkKCRykiHaa05M1naGt3xmavNmZPJpfLb0ex79e
 Um8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=l8BTHv6Rvs1T1FBsTL+iOTvROMJj6hLiW9QKgE0n3iY=;
 b=D+inlN+M1IeCLhu6VHPNbpMRfn7xx8zRrnnoLbP4pJ6f7n2rZUT3aBlMFYeb1J1pxt
 iK0YHCLWZ66t6nfuRSUEE++YtCgWvgy4CGxZH54j6tBICcKOPU2ubli3w0vb0w75oiNj
 ElZyCUN9lOR2PiSHOuETo0xBr5rXtnJP+EsssDSILNYPKjbEr38a6TEEXmPmM0SdsOBo
 2Hf3VV9rCcWdSL3A8dxnmO+8MTHJ7DollDe8F6DuvdCB6TuveWjZ3b9kN1L8w3ZiDuCM
 4X0WPCPMTwVFzN8+S0U1V2hubJl6koa/FkSgjZdlczaTLhznTdNws1C/jj3Cg2e98On6
 PhSw==
X-Gm-Message-State: ACrzQf0guIW0WRVlmcXO2Luzhs/QVilz4/IiXR6uGnaiwaQdKXlYDW4d
 ETM3lgGoDbGBSgvf5acpOFI3KXJdMOp4Kw==
X-Google-Smtp-Source: AMsMyM51FUn4CIi1D4Jtc0Jl4myTPR5jRlxJqJluIibY7GsCpqs/DWxCHixZ06oe0diB5wKMNBpimg==
X-Received: by 2002:a5d:6c63:0:b0:22a:4247:1e7c with SMTP id
 r3-20020a5d6c63000000b0022a42471e7cmr2657868wrz.625.1663864558413; 
 Thu, 22 Sep 2022 09:35:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/39] ui/curses: Avoid dynamic stack allocation
Date: Thu, 22 Sep 2022 17:35:28 +0100
Message-Id: <20220922163536.1096175-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-11-peter.maydell@linaro.org
---
 ui/curses.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/curses.c b/ui/curses.c
index 861d63244c7..de962faa7cd 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -69,7 +69,7 @@ static void curses_update(DisplayChangeListener *dcl,
                           int x, int y, int w, int h)
 {
     console_ch_t *line;
-    cchar_t curses_line[width];
+    g_autofree cchar_t *curses_line = g_new(cchar_t, width);
     wchar_t wch[CCHARW_MAX];
     attr_t attrs;
     short colors;
-- 
2.25.1


