Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823E35C41D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 12:36:23 +0200 (CEST)
Received: from localhost ([::1]:54368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVtva-0001gW-Lw
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 06:36:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrM-0006df-UD
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:32:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lVtrK-0000HW-A1
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 06:32:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x7so12343231wrw.10
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oWU1kygVLo7ldjo0ixVCnQHyf6wt0Q/JBWtp1dEHIcY=;
 b=M0zUzmlrVzdDo6LFgoTlKyQosEUwF8epA6BoRuWX6dC2RkefqzpkFDyDd0z6/Gvyl+
 UL4KGmbMvkTwxh5omIkvJgY3tMq+Eo0BOhR6tnEPcabhckBfvEYYEI9TicoDvQAlY5Hp
 j2vAU4TFWZv5RPYzUUKzC3OiX8GL51MoFMM/DGXPP8Qr/a5X+y13k2AuXdaea1E+ftI3
 TeUIGCvFuPxyFkikHoY2bEBT6fVaLSKxDsSboxpr+Z017NSx/iZI8JFa0uDpQufTA/5O
 lpmO5aehGgL0Y8jT+Ic/3uVkuvi4sOeGPYOykirXqFP/yoc37CbVwqUsDfP2aPbduh9c
 +IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWU1kygVLo7ldjo0ixVCnQHyf6wt0Q/JBWtp1dEHIcY=;
 b=MFcpWBHRb60/JwDhA3Lu2DxcwJn9emtZp5pkOi7As8LpZf7owmApufouUcd2XWIEv+
 4KC7aMFB4l18kE5XnS8QbQun3Sa+4rpkzA0CSvmi+Qqic9JWbOm3GTe2/UTkU7E0xjSH
 +vwR1aJdEtT5gxmsJiEVruaWsHM0LmmxgTFJSG/lycIxcQtuoFE/ZRJgbfbQQOJAZ2GX
 o+loIoQ/Jspxs5hctln240MxsNsnzaynv/fNhZoskhi29u8+52Vo4VL9tHWVObENrLfY
 6Wd2w32s2OVp0OnrepQ8zs6MEHRmP3emnVYWOHj9ayeyLC+CjzXRtVy2p2KNba4gUeIT
 2VGA==
X-Gm-Message-State: AOAM531XH9IpQFwu9pGQoZMHkB4gj4Og3jEzIHL/qo8MflNlSlGUByGi
 Iq6F4MWRX0KVlfEaO0UkAIn2Yc08OI3riaX6
X-Google-Smtp-Source: ABdhPJwgg+YFaMA2IZsd5fWHPoK2GaySQCKshuw++By2xy2m8AjBt1RDL1ZQudNJ/n6SYutYUWgcXg==
X-Received: by 2002:adf:ea48:: with SMTP id j8mr22772623wrn.365.1618223516980; 
 Mon, 12 Apr 2021 03:31:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d2sm16878651wrq.26.2021.04.12.03.31.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 03:31:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/5] exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
Date: Mon, 12 Apr 2021 11:31:52 +0100
Message-Id: <20210412103152.28433-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210412103152.28433-1-peter.maydell@linaro.org>
References: <20210412103152.28433-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Unfortuately, the elements of PAGE_* were not in numerical
order and so PAGE_ANON was added to an "unused" bit.
As an arbitrary choice, move PAGE_TARGET_{1,2} together.

Cc: Laurent Vivier <laurent@vivier.eu>
Fixes: 26bab757d41b ("linux-user: Introduce PAGE_ANON")
Buglink: https://bugs.launchpad.net/bugs/1922617
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Laurent Vivier <laurent@vivier.eu>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu-all.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index d76b0b9e02d..32cfb634c6a 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -268,8 +268,8 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_RESERVED  0x0100
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
-#define PAGE_TARGET_1  0x0080
-#define PAGE_TARGET_2  0x0200
+#define PAGE_TARGET_1  0x0200
+#define PAGE_TARGET_2  0x0400
 
 #if defined(CONFIG_USER_ONLY)
 void page_dump(FILE *f);
-- 
2.20.1


