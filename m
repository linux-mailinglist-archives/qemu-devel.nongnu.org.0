Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F175E6B68
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:03:27 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRTp-0004ZO-3P
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBG-0002Dh-K2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPB9-0005Q7-Q2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so1703642wms.4
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=CiM/H1ZT11GJiU4qYe1Z3GEoKJxYHvPyHuyNl3EOOzE=;
 b=ddwaR6VDQECPz2gmSi5yAAHXToTFhBHAMy/tPGSSJw26vPzI6km/jielm7QwW++DL2
 wQi1+MEY/Lj/FxOSQQ45xr8s8zln+HaperzOee8QXbc31ZrRIYiGIfdc9kmWdSBJe69y
 2HwjNzuxkA12fM+MbRAnB9NPIFK8Tz53aab28mCBHzmhy86GUp6Nzg5593NhKCiCxy/n
 EsSPnEyKv21i1aTLQUz3Y5CRMaEtBXXdjfHKeY6VeOFMSccUj9Rki8JnwOi9+kf/+AwC
 XMpaHaor/Ls4kkjT7QYSnFtM4ODxhCL09p0RcInw96fPaoNg1ax3aKpwfpJp/a7Rdw+r
 fOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=CiM/H1ZT11GJiU4qYe1Z3GEoKJxYHvPyHuyNl3EOOzE=;
 b=4jKhjYPbqyiyTllqvwSmlLxafOTxsV9139jPdF3uBfeAFfvREYcEXVtBKsgdu5Yyra
 GWQ45l0bHVlP7bwkPCGKY7vzR7EVej1VfecsFkM1tY1vVj2PAK6WJx7os4Ffw8Sgxezp
 eNzoXO+Elq6mKP+fiSQrcR+KJRcx0VE+dKTCrZf0BOwl+uZQahscrpPYQ3kQA2ZMBhak
 D/pvfNRjFTKsGNVeJehkW08BhsSNtOiYPg8xAhdi1RJh9uUGXip1ve3nL1fHbAEh0KGe
 Hil/S7WzEMgMNQPZbwKPEu4bdLSDuy1rbVCUv/mJTFjBZElr7tUFa6C6/X6VNtIbMKne
 UQzQ==
X-Gm-Message-State: ACrzQf1ycKfNTVg/yRvFueSxNJNct2P/lt0Jml84cHvEG69rU9PDRtXI
 8HgBT0VLnKaJpZs2cdWTcSDF0cV98uCC+g==
X-Google-Smtp-Source: AMsMyM5qC55yDvJeE51EuWHzlLk034F04xdWGdVlBoiCYiShtke2Eu3oyjfujF+2TZryvfePTzrJKA==
X-Received: by 2002:a05:600c:3c8a:b0:3b4:eff4:a94f with SMTP id
 bg10-20020a05600c3c8a00b003b4eff4a94fmr9553825wmb.105.1663864555423; 
 Thu, 22 Sep 2022 09:35:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/39] hw/net/e1000e_core: Use definition to avoid dynamic
 stack allocation
Date: Thu, 22 Sep 2022 17:35:23 +0100
Message-Id: <20220922163536.1096175-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The compiler isn't clever enough to figure 'min_buf_size'
is a constant, so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220819153931.3147384-6-peter.maydell@linaro.org
---
 hw/net/e1000e_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 208e3e0d798..82aa61fedcd 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1622,15 +1622,16 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
     }
 }
 
+/* Min. octets in an ethernet frame sans FCS */
+#define MIN_BUF_SIZE 60
+
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
     static const int maximum_ethernet_hdr_len = (14 + 4);
-    /* Min. octets in an ethernet frame sans FCS */
-    static const int min_buf_size = 60;
 
     uint32_t n = 0;
-    uint8_t min_buf[min_buf_size];
+    uint8_t min_buf[MIN_BUF_SIZE];
     struct iovec min_iov;
     uint8_t *filter_buf;
     size_t size, orig_size;
-- 
2.25.1


