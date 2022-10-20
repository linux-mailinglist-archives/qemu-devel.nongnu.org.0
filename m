Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BB460643E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:22:41 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXNX-0000UG-Uf
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:22:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olXG8-0007kM-6U
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYf-0001Dl-O1
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:22:00 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olUYe-0000xk-5t
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:21:57 -0400
Received: by mail-wr1-x432.google.com with SMTP id w18so34118653wro.7
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nosYOQKfkjgUajEUXQZ4ETNzVq4tByHgwt2bGYf7lxU=;
 b=eqPSsN7TgmQgPEDFFwly087kql9PJhxQjDWfPCZZkjklthPush9z2nJDHmQHAPiXWm
 zJ7/SUIpwjBcBqfmedc0NmAq3rxJVMn3Ds9JlN/B9dQWYLNsXMo9ke/aLsVnOatfxFzh
 ZaSwvtpAJXGNakHI1MbnehsDSxgRkyMzmSNeA5wl/YWje7oS5O77fyky3pHQaI4m+Y7E
 XhLdHpgmBnHXYiodNgGIxkNjBgEaksi0lWkRayPi6amLkF8+I4h8KbNtimNceNTtNbJe
 Yjc04F8i6xEfg8LTD4vJWE6Ab25XD+ZMx8+qU5qogK4lopmAd3Npmb+UvgNP9lbDkv1d
 /7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nosYOQKfkjgUajEUXQZ4ETNzVq4tByHgwt2bGYf7lxU=;
 b=Oj537kXD85flo6Vx/Lir+kqwxcsjUYYde/qywgwdHgvcaGngJy58xX3Rf/DPMbpvVq
 1w/hgFrRNp6nRtG1JfeCAw418h4gM3/GlHBTMaW2X+Z5YJ1KVliqEIcyL+cgqZYGbFGa
 OHmK649MIBysUIr8fyP/KvMEafvpu2wbdcsLlL7CWKXHZ0d7BGhUSvgvCzwyno1XJyUl
 vw7VRw4ksBH4kkQNPrsCOp1HmVvx3nCAgzERhTKOoAkXy5YePldUqZYn0Fae5BM1SAY6
 k1fv5GDjTis3tkn8qyfuBTiWMdWGKoHLwZ06rmPxUKOzaeLMkA0F53/RPtSJkgEFEAU9
 R0Xw==
X-Gm-Message-State: ACrzQf3kNGq5sO9jceexHnoEYhgEr4VqTb2ddS+srFmE/YH9pC0PRh9C
 rXmlQtlnqNZ5W1RwcJMcpyaCpN1iT9ADww==
X-Google-Smtp-Source: AMsMyM4Ux8UWkK678v/CHS4POyOMsO+Wz7XluAEBQTZSPB8k0O8xH1f01chWwkwgp6tjgra80x1tTA==
X-Received: by 2002:a05:6000:809:b0:22e:66a9:1212 with SMTP id
 bt9-20020a056000080900b0022e66a91212mr8931182wrb.710.1666268510122; 
 Thu, 20 Oct 2022 05:21:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t15-20020a5d49cf000000b00230c9d427f9sm16520192wrs.53.2022.10.20.05.21.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:21:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/24] hw/char/pl011: fix baud rate calculation
Date: Thu, 20 Oct 2022 13:21:23 +0100
Message-Id: <20221020122146.3177980-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020122146.3177980-1-peter.maydell@linaro.org>
References: <20221020122146.3177980-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Baruch Siach <baruch@tkos.co.il>

The PL011 TRM says that "UARTIBRD = 0 is invalid and UARTFBRD is ignored
when this is the case". But the code looks at FBRD for the invalid case.
Fix this.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Message-id: 1408f62a2e45665816527d4845ffde650957d5ab.1665051588.git.baruchs-c@neureality.ai
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 6e2d7f75095..c076813423f 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -176,7 +176,7 @@ static unsigned int pl011_get_baudrate(const PL011State *s)
 {
     uint64_t clk;
 
-    if (s->fbrd == 0) {
+    if (s->ibrd == 0) {
         return 0;
     }
 
-- 
2.25.1


