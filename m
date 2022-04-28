Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A84C513847
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:25:39 +0200 (CEST)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk61S-0004C4-1H
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5KA-0005iA-IG
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:54 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5K7-0006W1-6R
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w4so7052008wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=MEaAGj6iLt4yIsAQHiKka3KAShoMnar6cQ+6N2QNY84=;
 b=uYiDoCZ4EBSYY2jpGfrW1jMCXgF4XMZrJxiNPD/F5Au4F0qrFwv10dGQZMn/Dop68M
 wuJ6sP9tjpHxmBPjPgC2ObdyJVwvLGb7W0bqxReFrnewl5iYXVPeC487QNQeuU8vegmt
 zrM2Q9pL1UdIPOp67gfeec6xPGRIF2c+tM3wzQ8cKj5v4W57eGFXOAFkBGhh5t67hID0
 n4PgBAGtyL7kdb3OVCgLFJPkieSka6kZ6lR0dEBa3wi3RFjtcCciH5kZfzxSA91/Qt1/
 z6JLm4AY+n8PsCNr1ms42DqL4sl74kkQieL1p9ebMKKf2KLKTjDjxmOLHnYQyyhrdbsD
 +03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MEaAGj6iLt4yIsAQHiKka3KAShoMnar6cQ+6N2QNY84=;
 b=Ta9Ti7uWNjFV9yM+3bLGLwRTmEEhViGq1fdZeWCFqRYsJ0//oU/EWqa8nqj2JlYpDk
 vfKZWGj55sngYa6iEkkIypq6Si/IwRjZQBrwZmWx/N3lzWBxUsv7Vf2Y3Z7jxETdgZGm
 gGKQ5PhWJeQy/4vdV6m7iPR6t/WamcR7doV4dhdXMoVCBgegjqssz7dPGODM7RJxNA4h
 tFIdCha/HylAK92Aj88MyRRc+HJZnhIX3cli5JQ/1eoiQ32uvCTZTKtcvbJw64LBvPqj
 rSz4LEjZORcJvMweKEKkaGCicf+ISWL7dWV4lGih8/G4L6dJ9Ka9y/tt51M3w51A5N1X
 lUgQ==
X-Gm-Message-State: AOAM532osLVLa50NnPaFA5v/c4gGSFl+V9Z62ob7ZSy3TG2QP+21mjTy
 Bto8X6ugz1/o1eB5yIGaTWyKA9RprXwQsA==
X-Google-Smtp-Source: ABdhPJx0PW9VEhhAvgxNyJSXWSFaN1t5XBg+q5+nhQQ8Km8LRPdDjKSwbYDfjGufGmop2ccV9KmMLw==
X-Received: by 2002:a5d:6949:0:b0:20a:e021:f8e0 with SMTP id
 r9-20020a5d6949000000b0020ae021f8e0mr14516635wrw.231.1651156849757; 
 Thu, 28 Apr 2022 07:40:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/54] target/arm: Advertise support for FEAT_TTL
Date: Thu, 28 Apr 2022 15:39:56 +0100
Message-Id: <20220428143958.2451229-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Arm FEAT_TTL architectural feature allows the guest to provide an
optional hint in an AArch64 TLB invalidate operation about which
translation table level holds the leaf entry for the address being
invalidated.  QEMU's TLB implementation doesn't need that hint, and
we correctly ignore the (previously RES0) bits in TLB invalidate
operation values that are now used for the TTL field.  So we can
simply advertise support for it in our 'max' CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220426160422.2353158-2-peter.maydell@linaro.org
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 520fd39071e..6ed2417f6fc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -54,6 +54,7 @@ the following architecture extensions:
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
 - FEAT_TLBIRANGE (TLB invalidate range instructions)
 - FEAT_TTCNP (Translation table Common not private translations)
+- FEAT_TTL (Translation Table Level)
 - FEAT_TTST (Small translation tables)
 - FEAT_UAO (Unprivileged Access Override control)
 - FEAT_VHE (Virtualization Host Extensions)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index eb44c05822c..ec2d159163f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -839,6 +839,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.25.1


