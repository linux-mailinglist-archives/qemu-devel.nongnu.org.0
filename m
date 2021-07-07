Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C4E3BF210
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 00:26:26 +0200 (CEST)
Received: from localhost ([::1]:54510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Fzt-00038j-VU
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 18:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FyT-0001JC-3p
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:24:57 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1FyR-00059i-FS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 18:24:56 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s18so3821727pgg.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 15:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TSVwgHUTXEusW1C2/jT1H6rf0iL5bWqdSD/LZMZCb7s=;
 b=nL/2+mNF1RsDuByIzh6S7WKjoBOEhbKYKHGZAwQKIVNIs7xNKidylOQVjp2dYsFDtB
 aiIyVulQ1vVbqAc2HAIkgNKFAnT+0vq0NAhK6DkwI1n5hxQUfKs6usNvlxXRVVKR1wbm
 A0KFK6bLWiP/dvNGAqdnMKYr4CMg2oF4dQtFRdyjDLN7zNKTe+1aGn8b9iOoIKUKUVXt
 HdZOPLjBDoGtqzDk+Ez5SSLomG9M6QdkK9jVv0Bfc2z9Bc0kA3hFiNlsljhsN2IiysN5
 +uXXkAfcmN+AvhYcio/i+LzKJvVuyxaTlF5/Rox8jHUfE+vB4vbrsWZ1xlWF6DMtCa+A
 EhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TSVwgHUTXEusW1C2/jT1H6rf0iL5bWqdSD/LZMZCb7s=;
 b=dEn7PmJCOfjerLfjRUWoJYHsWw3BDddszzKnxwXDghVhR3WJGbGR9Tlus8P3lA5DJ5
 /8hxXv/650pEVC+HrQTEtN2d66SpJr9TxaurphXZ5lsNOz0Dk+Vh+Q+iBPSi1vVI5Mie
 AUQg98HOcMyCnqB01TszbtvALHSei8z68/m1aUPVc74Qv48KoL+nwoywBiT5CaeP3R+z
 yS5ZV9mvp4tvFM2fRyzw+TaE/nonE2O2CDK3x5E1S6OtkkSz6GulhQWLqzsbMWWy2U8M
 YEt/apcpRZ+z2DNEkrDFCOVBQMxVlP4C8RJ1eiz9jlBFKqdzOHLHeFuXMteYFKI666oQ
 Un+A==
X-Gm-Message-State: AOAM532Az81xWDDfVpPqTVWyv8ytELKpwfwAk9y0crZbA4jIfssowZuh
 zzZJkVTlcPadTd9Bhk+chLoTCCu2Hi2ZrA==
X-Google-Smtp-Source: ABdhPJxWPpn9ZLmAAoioTjLtYAFaYCaZrumjNJnJ8P5kcM+vCzZO7l7bRg/c/np3NCysW/XWV77fFw==
X-Received: by 2002:a63:471b:: with SMTP id u27mr28933451pga.301.1625696693791; 
 Wed, 07 Jul 2021 15:24:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x19sm214404pfp.115.2021.07.07.15.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 15:24:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/3] target/i386: Implement FCS:FIP, FDS:FDP
Date: Wed,  7 Jul 2021 15:24:49 -0700
Message-Id: <20210707222452.591810-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: pbonzini@redhat.com, ziqiaokong@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is Ziqiao Kong's patch set with a few fixes.


r~


Richard Henderson (1):
  target/i386: Split out do_fninit

Ziqiao Kong (2):
  target/i386: Trivial code motion and code style fix
  target/i386: Correct implementation for FCS, FIP, FDS and FDP

 target/i386/cpu.h            |   2 +
 target/i386/tcg/fpu_helper.c |  42 +-
 target/i386/tcg/translate.c  | 970 ++++++++++++++++++-----------------
 3 files changed, 533 insertions(+), 481 deletions(-)

-- 
2.25.1


