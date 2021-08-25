Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F093F73AA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:51:00 +0200 (CEST)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqUl-0002qN-LW
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGE-0003iy-5o
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:58 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIqGC-0005Sc-Cr
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:35:57 -0400
Received: by mail-wm1-x334.google.com with SMTP id f10so14671396wml.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=Ux3FSliY4jA6iWLCnxeTPf34D0JvEiFs5tLpQnFcLq+dKRaYMhLG0ySqDk/ilZAx3u
 7kcWwCg3pka1JqBFE42ifJVQKjtHQZ9kGkMG6YIxT6Sb/zOZeQiBaMV3uSBPYAYyqpiL
 b501Uvkvygo4nHp6kQBk+bq1cwUcleQmo/VIIatgwoudDhie9+ezPYc1JFgnG1W7I8Xa
 AYl4l9yM1QAMR2PTttzvn2VdTCy0Ai9NJ90hADfa6gXwHRbFBdkkC/1uvZxPEuJtdZcm
 hty4lM4MvhSiVFgQt0QkRjjv5Q4S0R2UFvG/ReTvFs8GT9wQZDWXZSSJw+YDoVCgtD0S
 WbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=KA5yaYcTVFkSmJaGfcsXVmd4DSPvUAL8zYy1PYCWd74FYXy6PibHs5pLC7CP6dTNCa
 KswRGCd6JdHS04nua6NUyjIPTnWgM0BypMxXzQgkGLC+IHknarQOwvfhQJLmEOOxHOSB
 oBORy6EHJEce2jmnwBrTm5XDh+EQfSeSckrZ3z7aS5TR4tYesm+ikAgbPpwliEqEMkyS
 2CYJCUafKgjs+TdUf9tX2tJGHhJ19giDpQ0gMFZRXvtWcrPJYh53sEtBNjntnHFfwjA5
 To44ckDhGGoM4cSd3EaR/DMeoVhmYVbm+SlfyqN5YIM8qYdzV2tiLWbiVhItw2w/3JUm
 WQbg==
X-Gm-Message-State: AOAM531aQyt+S+FGIMpa9NmNnzlFYM7fHiXruAo6Xs68iiKsOzanje1U
 BGmmCTORaegjaK/uiPf/swYV4XUCx/UqPg==
X-Google-Smtp-Source: ABdhPJzFRnx0xzF2h3AvILo2O7YyTbjdGgkq0o0IRGZyfVI/nfqc8wW9a2tQ7kQGKlvqsCckRUsa6w==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr8625110wmc.3.1629887754925;
 Wed, 25 Aug 2021 03:35:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m4sm5075931wml.28.2021.08.25.03.35.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 03:35:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/44] target/arm: Move 'x' and 'a' bit definitions into
 vmlaldav formats
Date: Wed, 25 Aug 2021 11:35:10 +0100
Message-Id: <20210825103534.6936-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210825103534.6936-1-peter.maydell@linaro.org>
References: <20210825103534.6936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

All the users of the vmlaldav formats have an 'x bit in bit 12 and an
'a' bit in bit 5; move these to the format rather than specifying them
in each insn pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index eb26b103d12..bdcd660aaf4 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -305,19 +305,19 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 &vmlaldav rdahi rdalo size qn qm x a
 
-@vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
-@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
-VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
 # Scalar operations
 
-- 
2.20.1


