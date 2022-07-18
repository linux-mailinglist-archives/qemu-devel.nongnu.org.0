Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C032B578559
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:28:05 +0200 (CEST)
Received: from localhost ([::1]:39636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRjA-0006ho-RF
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHb-00027e-Sr
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHX-0003Ar-EQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:34 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 az2-20020a05600c600200b003a301c985fcso7149135wmb.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qz69hyjKtHbhmrlIIKDKTwJRVIu5vyxEpPp07fk0Aeo=;
 b=r87jyJe4Pwn90SUTszwh466HY4Kw52FlKh/k1MoVBR7TtZQgNMBJ4fhmX9gdEA1aBW
 cL7I7IS0Lbza3fTsNl72aQX9gk95Y0qV/Ih0nouOAH0sBwVRiwAR4sn/yQpMbH8e5N0c
 r6E3zMn7f7EehjETS0R8EpuIVKC3n4PHN4vh8/eUVtqdsZBYvbNdO6Y8rGVUbMUKLoPX
 HOsW+Wuni6W46vXrIvbftDRSn7PR37HXX9I3dZRcdMcJK70ZW1ybZQ2AW8C/tvb87KPN
 fFJKFy+eXOUsPq4bFhpU7f3cyfWg6wt3r84MtGXfUL9yO4GO0WhwdAIPYT6SERR4Fvzy
 +uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qz69hyjKtHbhmrlIIKDKTwJRVIu5vyxEpPp07fk0Aeo=;
 b=77gxa5FQi8ZiuqEiSAmokGmDd0ySN2w88l4WamNo/bXS7SftXbxvq3KGA13LQ/FEoN
 rb8m8+w+01tNIWme5RlKVVws/0zTBJDjIsahMLv6HZwQMF+y3bqhN2MtcQNv66pYVWr0
 6LlEw2XJagJ/TjiIWu7r74+dAXqDNgc7U0PUKjSTqAk7DjhiiVIWNWeFFoYqbtl5KjQE
 HKErjeXyrqQPZa2fQcyPHxYstJ7krGRA9LwYYd5xmoImzkzgqsLprNzPYQLN082cEbKX
 aITaBsprecL8aMyPT01sfWXATuTyE4aoUqcXjqhaJTLw5qH+Oa/PNQthXx00coovbejg
 AxLg==
X-Gm-Message-State: AJIora8T4WUR+lks67gjfcbgM80YeQEiqq5R+H0iitSurzfD3+wsitHH
 IN9cixlYDG18/glvd9J6tiCbtkVjiov/ag==
X-Google-Smtp-Source: AGRyM1tj6DSp0glLHAU7grVLvU8JqXE8GHJBJWJTOVJw02v+eD10qh/3xN9yJZRPZ9G7sHAvIpWFaQ==
X-Received: by 2002:a05:600c:1da8:b0:3a3:1969:b0d with SMTP id
 p40-20020a05600c1da800b003a319690b0dmr6090834wms.172.1658152769790; 
 Mon, 18 Jul 2022 06:59:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] target/arm: Fix big-endian host handling of VTCR
Date: Mon, 18 Jul 2022 14:59:13 +0100
Message-Id: <20220718135920.13667-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

We have a bug in our handling of accesses to the AArch32 VTCR
register on big-endian hosts: we were not adjusting the part of the
uint64_t field within TCR that the generated code would access.  That
can be done with offsetoflow32(), by using an ARM_CP_STATE_BOTH cpreg
struct, or by defining a full set of read/write/reset functions --
the various other TCR cpreg structs used one or another of those
strategies, but for VTCR we did not, so on a big-endian host VTCR
accesses would touch the wrong half of the register.

Use offsetoflow32() in the VTCR register struct.  This works even
though the field in the CPU struct is currently a struct TCR, because
the first field in that struct is the uint64_t raw_tcr.

None of the other TCR registers have this bug -- either they are
AArch64 only, or else they define resetfn, writefn, etc, and
expect to be passed the full struct pointer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220714132303.1287193-5-peter.maydell@linaro.org
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8847f5b90ad..7461d4091ef 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5409,7 +5409,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .type = ARM_CP_ALIAS,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
-      .fieldoffset = offsetof(CPUARMState, cp15.vtcr_el2) },
+      .fieldoffset = offsetoflow32(CPUARMState, cp15.vtcr_el2) },
     { .name = "VTCR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
       .access = PL2_RW,
-- 
2.25.1


