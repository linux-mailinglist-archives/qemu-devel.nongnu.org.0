Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E6E4CBCE3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:39:59 +0100 (CET)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjoM-0005ow-VP
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:39:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmH-0002LE-U7
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: from [2a00:1450:4864:20::32a] (port=35448
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPjmE-0006VH-Pg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:37:49 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so5170300wmj.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mO1Zd1MidHNDt81S1MFFJvdc/ZgF3DzmlxETtyHGXY=;
 b=Ij0o33Cb9pDrd7faqK7mi+TeyTniZ9FoEkQeo85fC2xlrjBKb4tEqTFQ1WUDl33a/B
 1mv6qSBaB2lyvSGbweOxKx0+4+PiMJZXcCYZlQx01nJaXKfKE+rziGBhoEZWpRh1jHlG
 tRGiPXbUjphpCFP9120UHSSmcKh7z9zGCkvJCFAz3Q2XBImxMEk4KFAjk/sY8heWCXFZ
 kcP5Sqbx0got/6BvYiRLUyXXGB8U9rhvByWEerOflkHkf18vNeTez05+gGsf3LeOgWpB
 IqONMUaVyBW84OnKTrRq5+cSl9k5TS25PqtZ9r+EIcLNEYgROT+iaqzGzMUeV9nQCX2Z
 GlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4mO1Zd1MidHNDt81S1MFFJvdc/ZgF3DzmlxETtyHGXY=;
 b=Hj7MKDWXHocxPznZrSSHengwt7V/m34IU2SwUWKsrWLj4fPbHgoXv4Zhc3958G07mT
 UUauQIXjlL/k/jMIrFPep6urHkpf5AJ3QZRwpPL+AogzfiH1ZL671Gj8O0xxQeDvrhir
 Dq2Ldsq2zbrvjhLVGuCKKueovm2fmm/iCGJUgHzJHDddaa3RmrPvZBAe8j1c1AKm2Lbc
 eRdn1vmxqPbxRHLcfpKfLlRfpzG4yeIZqqyzvWtCwww+rB7JFjivoehorMte0G9cwmhG
 GcpEyyKvi3zc1Mz/OqFAugbaVXtwlm/Pl4rOutsgf+Zelqp4k9+oB2kcie1ZRfCWGTFr
 WzQQ==
X-Gm-Message-State: AOAM531XYx84B9P0SlcKSbqn5uOTKH3I1iqyQojh9GFmttvtjSP2P34S
 TmCL5Q9v1rt1zKOifsz8QW5NyQ==
X-Google-Smtp-Source: ABdhPJybuAh4gsCEcVU4OQa10jjVvebj+Fxq//NCngz89UNnZSxR3apyXfm/CSqsuVhbBUl7TIAb5Q==
X-Received: by 2002:a1c:ed0e:0:b0:380:fa8c:da99 with SMTP id
 l14-20020a1ced0e000000b00380fa8cda99mr3431422wmh.135.1646307464011; 
 Thu, 03 Mar 2022 03:37:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm10240093wmb.48.2022.03.03.03.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 03:37:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Check Neon VLD1/VST1 stride bits are zero
Date: Thu,  3 Mar 2022 11:37:39 +0000
Message-Id: <20220303113741.2156877-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the Neon VLD*/VST* "load/store single N-element structure to/from
one lane" instructions the encodings include bits to specify a
"stride" value, which specifies the separation between the Neon
registers which hold the different elements of the structure.  For
VLD1/VST1 there is only a single element and thus only one Neon
register is involved.  This means "stride" is not meaningful, and the
architecture requires that the bits that would encode it must be zero
(which is to say, must encode a stride value of 1).  We weren't
making this encoding check, so would incorrectly treat some
instruction patterns as being a VLD1/VST1 when they should UNDEF. 
(https://gitlab.com/qemu-project/qemu/-/issues/890)

Patch 1 fixes that bug.  Patch 2 is a minor cleanup of the align bits
check for VLD3/VST3 -- we had this logically correct (all the align
bits must be zero) but wrote it in a confusing way.

Richard: I tested this against your simple test case in the bug
report; if you could run it through your risu tests as well that
would be great.

thanks
-- PMM

Peter Maydell (2):
  target/arm/translate-neon: UNDEF if VLD1/VST1 stride bits are non-zero
  target/arm/translate-neon: Simplify align field check for VLD3

 target/arm/translate-neon.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.25.1


