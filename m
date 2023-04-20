Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036636E8F3A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:07:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAF-0000dX-Hf; Thu, 20 Apr 2023 06:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0000YC-N7
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0003kh-Jk
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so5537315e9.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985103; x=1684577103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4z8lBbo4cNMOCR3wyC7AQJyYBl4UvmsiUQL0/yuq4gI=;
 b=HRhMK0k1xnHyD2cTj5JII1fdiiTahuSTktXL2f7erft2Qdj7MX+pxKgX/1N7jZSCl5
 0oCw7QNwszaHAjY3gNBFj01c9uXpl/EE1bJWlyA6REHiGesF0FahPc8yf5tEvtBZ0GyY
 P0Ouo+MnzL4isxc6RL8twvWWytzW0aXi9hq9xezbX98HR3oOKS1xeYDERD8bis6AqpyC
 0MzvXzdz93qez4rDVv0FuSeRs2Bj353+nG8/dxlvsVcdZz0PPv5c201IRghR9NG/oLn6
 box8cgEypNmIOKLcOUCHv8jwcMihR7IkfNM6ALUcRyRSS92lPYwe12cs7/yfTN7bRmKN
 H93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985103; x=1684577103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4z8lBbo4cNMOCR3wyC7AQJyYBl4UvmsiUQL0/yuq4gI=;
 b=fHgu1Vd97CtpNYnv9TqJFhazwqmYb0m1AewY8luthiCYBZf9lkJh7WKdnVYmDy0g8P
 r5HlsVEVEEERBNvCvt6+bdearCUiucLdLQRDwx+LW3SExY6YuKrlLjAhWdwqxvkRTlBn
 6HB6VFhKEycQ1wknwNUOZ0V4JQipSnFG2538ByOo5marxS/Ky1HJfc9pyVW6IwEzPPQ+
 7fEtyeoRzrnFFjSPpz+WTcY2gAim2sP2U1m4Z3rBjejqn3rtl/wPEH0Mh0/nnyXSQtHS
 DBAwcNFoOBT5l0OI4Xl+XXdj3/8ym08MPx5LIgdgxIFsVpRdQmDaKFErnSV1GSFYLBHB
 VEig==
X-Gm-Message-State: AAQBX9dr5VzR9Bx33x8u0KhR0q9X7FTwdwe5WuUUgR5izIi0DsoKH0jz
 LOtBD5qkrx232BuxnikPoxbnGVLw7qvCeGnUCKI=
X-Google-Smtp-Source: AKy350b0TigE1W9vFXqEnE1eQDpnOSz13sAaArfJcwm2k6Uh05kgpCV5+AgxzuFJT028K+NtPgYhYg==
X-Received: by 2002:a5d:69d2:0:b0:2f9:2fb0:c46 with SMTP id
 s18-20020a5d69d2000000b002f92fb00c46mr683694wrw.68.1681985103038; 
 Thu, 20 Apr 2023 03:05:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/21] hw/timer/imx_epit: don't shadow variable
Date: Thu, 20 Apr 2023 11:04:42 +0100
Message-Id: <20230420100456.944969-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Axel Heider <axel.heider@hensoldt.net>

Fix issue reported by Coverity.

Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
Message-id: 168070611775.20412.2883242077302841473-1@git.sr.ht
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/imx_epit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/imx_epit.c b/hw/timer/imx_epit.c
index 3a869782bcd..0821c62cd1c 100644
--- a/hw/timer/imx_epit.c
+++ b/hw/timer/imx_epit.c
@@ -179,7 +179,7 @@ static void imx_epit_update_compare_timer(IMXEPITState *s)
          * the compare value. Otherwise it may fire at most once in the
          * current round.
          */
-        bool is_oneshot = (limit >= s->cmp);
+        is_oneshot = (limit >= s->cmp);
         if (counter >= s->cmp) {
             /* The compare timer fires in the current round. */
             counter -= s->cmp;
-- 
2.34.1


