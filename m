Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663103DA1FB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 13:20:36 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m945b-0000le-Dg
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 07:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-0008SV-Ez
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940T-0000tN-58
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:24 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso6595443wmq.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=hDH0OzfzKq/VoVFYYOvBUXnPy++Usa1W6fy+pMV0Imgoj78x9wg2A2Fi4GCoCSwipp
 8Vjmvpo+ph2j9j48N02yAKldrw+BsCtikUM5F4Y4oascaUMAvEmfUQgMvRXraRAVZgpw
 NQHcWbs7+EpSIs3g65sS9IpsYMypzmiBcnssFE/tBKZPEE6LhjGsWpkg2OSdZVC0SiJr
 6rhWV7psFd8iPy4/YxUwTmwtGc+mN1HnOthjWoinJk9Wvn1TfakKpO1oU5O7ptD6Pd+E
 4asIti0LvSVtlTzWDowu5Eqhcg6eR6r/uONnm46bxiiqTK3gK4RfhizhVRc3j0BRjiiZ
 NUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znndHHEoxoWMeYC4H5uF/7NDy7y5s/e+PfCtHxh/c/4=;
 b=m4GK0iXrh3zgqsaywr8nD2y8u/iviyj4uylU5wvEQ7pow/XQ/EpxGwot7ljC/3OFRe
 RSEEjcokLABQyWMsdLsE0Su33PGz44NGaxEDnLIY4WCJ0YhIBPJYG1aVd7Ui1y4p16go
 E/7Wj7+jI+ItlRs1Mr0MhLd0pHxjCZdcQgApy9PoVgCo42jMb4sAqJOuSC5O8GNNHw2W
 IltxIbSo1Ghks8oxOd7883CrHkYlh5Bd2MjxlkXtknzKo+385g61zOnN0K69iLl5UEU2
 ObQ9yZpQfiHs8KajMf0+B8hPQ1Hzt/G1LBNSR85p5BIznIzRifBtNgliXcV3DoujySLL
 vBhw==
X-Gm-Message-State: AOAM531594dENFQ1NvDywsuiJlhCSz0Oy9s3vlPCi96QwRPnKAQfPmDv
 gMXK1UsJMawQWnP57iWRq8WCmsXPg60vlA==
X-Google-Smtp-Source: ABdhPJz/vy1xTQWIEBDo9w2q4/zTk2DBF77C/C8lRt2suIMfUD97d+WLeTa81SRk+yiyaSiuPqKGYw==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr14015548wmc.111.1627557315734; 
 Thu, 29 Jul 2021 04:15:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/53] target/arm: Note that we handle VMOVL as a
 special case of VSHLL
Date: Thu, 29 Jul 2021 12:14:20 +0100
Message-Id: <20210729111512.16541-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Although the architecture doesn't define it as an alias, VMOVL
(vector move long) is encoded as a VSHLL with a zero shift.
Add a comment in the decode file noting that we handle VMOVL
as part of VSHLL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 595d97568eb..fa9d921f933 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -364,6 +364,8 @@ VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_h
 VRSHRI_U          111 1 1111 1 . ... ... ... 0 0010 0 1 . 1 ... 0 @2_shr_w
 
 # VSHLL T1 encoding; the T2 VSHLL encoding is elsewhere in this file
+# Note that VMOVL is encoded as "VSHLL with a zero shift count"; we
+# implement it that way rather than special-casing it in the decode.
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_b
 VSHLL_BS          111 0 1110 1 . 1 .. ... ... 0 1111 0 1 . 0 ... 0 @2_shll_h
 
-- 
2.20.1


