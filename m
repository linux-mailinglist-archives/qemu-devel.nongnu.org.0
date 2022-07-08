Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4065756BE6D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 19:15:09 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9rZL-00027R-Q6
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 13:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDd-00072v-2Z
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:37 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9qDb-0002d6-G7
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 11:48:36 -0400
Received: by mail-pl1-x62a.google.com with SMTP id m2so16684030plx.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 08:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tDlq7Gwmx8RjkvitHJnXFST75wSJBtl/6C34V4BWgAA=;
 b=G7+mIjoXub1NheYWmd06XLVXHaJz5wicH2cKKE3fyO49E2kltVlkfxZSk44pgDXa/u
 RFRwnmnPq2KB32DgvCx1bi4urniouKay2rqJCv77Kd/ILWff16d3subaDknaMjJM6o8q
 byJD6mrSIw1ZgXT4QsBG52TgIlqCHLWzmVOuaj4sYA0cod6/eh3h0CIh0JZRsX59q5jP
 oB5e7HPXjkk+vqnfs/hjmeZX7I4lnYkCyJJlGE5obU8HC4Gd6y4BTRJcENLqM1UHH+Oy
 hCkB5jgfCDXXMBxTiijzjecy66CdCguugfWL4jzxta5qgeUR9NZLnObMj2NJN/WMjblf
 ydQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tDlq7Gwmx8RjkvitHJnXFST75wSJBtl/6C34V4BWgAA=;
 b=PtBcDj2n4u2D3r7mezQ5SV9i431s70axVuYsNXTOrRYqh09lsRo7mFVbJDJh3kV5Zb
 8/sfWceqWmbcghc8da24WHCC/3uSPG/hEvPz+2JzSzpy3VmYGycIzXTzgyRELyBxBGWj
 pL49rfmDg4SS9Jq34dB0Lx7YvydD/Njf78Xr/qJGCTiODrDszwIkK+TDMBgAebyREubV
 OpcdjGfqn2lg7E7TL6kZInNbITny7x4GPFf28ynBureOjYg+2cxN8D9XOreRaP71HQoe
 S4AiR+x5vOk0EBx5405y2pNyh4as8uFUrXd0KuN4Ubhel75QMXe5esM+QKVNgZ+HCC9c
 EbSQ==
X-Gm-Message-State: AJIora8i8LFobKIT6rmdmfdj9PuUpynijdwOuZW4n4wNTP+B6uKwQpWQ
 WV4tUVYVPBaVJy6yn4OC0oBZm6lo6HnBMyIx
X-Google-Smtp-Source: AGRyM1vrGlEr90v8ZPOYN6w9xF5QRwTvQXsc93MSL3Xwo1TwiLQu2EOacwuPZg/GQh/2X2kf9VpcTw==
X-Received: by 2002:a17:902:d707:b0:16b:e35e:abd4 with SMTP id
 w7-20020a170902d70700b0016be35eabd4mr4275451ply.111.1657295314262; 
 Fri, 08 Jul 2022 08:48:34 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm1782089pjb.42.2022.07.08.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:48:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [RISU PATCH v4 29/29] aarch64: Trivial SME test
Date: Fri,  8 Jul 2022 21:17:00 +0530
Message-Id: <20220708154700.18682-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708154700.18682-1-richard.henderson@linaro.org>
References: <20220708154700.18682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 test_sme_aarch64.s | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 test_sme_aarch64.s

diff --git a/test_sme_aarch64.s b/test_sme_aarch64.s
new file mode 100644
index 0000000..a5ef909
--- /dev/null
+++ b/test_sme_aarch64.s
@@ -0,0 +1,55 @@
+	.arch_extension sme
+
+	mov	w0, #0
+	mov	w1, #0
+	mov	w2, #0
+	mov	w3, #0
+	mov	w4, #0
+	mov	w5, #0
+	mov	w6, #0
+	mov	w7, #0
+	mov	w8, #0
+	mov	w9, #0
+	mov	w10, #0
+	mov	w11, #0
+	mov	w12, #0
+	mov	w13, #0
+	mov	w14, #0
+	mov	w15, #0
+	mov	w16, #0
+	mov	w17, #0
+	mov	w18, #0
+	mov	w19, #0
+	mov	w20, #0
+	mov	w21, #0
+	mov	w22, #0
+	mov	w23, #0
+	mov	w24, #0
+	mov	w25, #0
+	mov	w26, #0
+	mov	w27, #0
+	mov	w28, #0
+	mov	w29, #0
+	mov	w30, #0
+
+	smstart
+
+	ptrue	p0.b
+	rdsvl	x12, #1
+
+0:	subs	w12, w12, #1
+	lsl	w13, w12, #4
+	index	z0.b, w13, #1
+	mova	za0h.b[w12, #0], p0/m, z0.b
+	b.ne	0b
+
+	.inst 0x00005af0		/* compare */
+
+	rdsvl	x12, #1
+0:	subs	w12, w12, #1
+	lsl	w13, w12, #4
+	index	z0.b, w13, #1
+	mova	za0v.b[w12, #0], p0/m, z0.b
+	b.ne	0b
+
+	.inst 0x00005af1		/* exit */
-- 
2.34.1


