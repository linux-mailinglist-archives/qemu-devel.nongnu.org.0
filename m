Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1F3C7157
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 15:40:42 +0200 (CEST)
Received: from localhost ([::1]:57302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3IeP-0003dk-Ve
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 09:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0008HP-5i
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:37 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbL-0003Zn-4w
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 09:37:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t5so16679962wrw.12
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IO7/29GWk0k3evo7LsylmUNRHzg1sxgFY9MGve3JcNo=;
 b=mUyuD/V2jkicKo1/LxEiH+iZ4awbNitPRzx1VbRdP3WxlPU8Ql8fNjHuJ4U73UbOoE
 9Y+UYrCVkuV/FpKOV2UVjO/ETyF+WVq7S8MZLGuMukm1V+1soZr//bQOieoKjc0USBI9
 ydO2zkUZ5SekPVgC7lcOsPNxM5gcRXnk7m4TPuemAIfHuimPa9YEmyCbir2deUSWH8jS
 SZcFDBby+zpWlH+cir5QH9SP9hH9e2xoRIPaoiJSiVm/368uH3l1ChkDNdx9zhX9xvN9
 2goY3uL0v128mDtJVlDFYRJW9qC/3YtXi/JG2Z0zTpv/O2paBq7Y8BZugB8b1yOq3Sqa
 xkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IO7/29GWk0k3evo7LsylmUNRHzg1sxgFY9MGve3JcNo=;
 b=CTGbvkKntw/wyOsa9fTneU9bPxZgtErB+27qQXCwXl/aa4OYlfitZ/G7bmWZNSO33y
 D1k0s+ua2LLFdONugUR4vRBJP//LDLVPdS5OicoyeDPJJX55pqGw+JC6jXCoC9JWYIFY
 pxOoC8qfYR8spXPmJ0lJeN07U/49Ja12UnjS0xSB0mT2FlqLzbXROLKpDWeQ5OskmStG
 1EyL9ZROFFFkJExGPgy4ive+6vXws0DpWnftKNdmGzEipGbLytUEAfzpVjIQ0MJELT4o
 DjYS/Kg8OwGoeWdIZiHCB4HlLlIPtyjMCavTHLsEm+f8p0tvTsa2MDRM9idYfZdKfV0Y
 XzUg==
X-Gm-Message-State: AOAM532Yss4ZbGBjNb9Bh51wNKKpxnr7KH27P/5Y9S/bgEQQWLAuy6rF
 2Islys2AHPTlvz04uMnlLSEq8A==
X-Google-Smtp-Source: ABdhPJz2KCPLv4yRj4oHgb0R7v1SWBXZzFx0LcZcbZ20CIWERvyqsp00rn6q9ZcTq2K/waH0Z/jtcw==
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr5836732wrn.304.1626183449775; 
 Tue, 13 Jul 2021 06:37:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 01/34] target/arm: Note that we handle VMOVL as a
 special case of VSHLL
Date: Tue, 13 Jul 2021 14:36:53 +0100
Message-Id: <20210713133726.26842-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


