Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D73AE0C5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:52:46 +0200 (CEST)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5My-00074S-MR
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Kk-0005Ed-Sn
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:26 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5Kj-0002FI-9m
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:50:26 -0400
Received: by mail-pg1-x52d.google.com with SMTP id y14so1118142pgs.12
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xvehaxmptG7eECcujxt+ovd111puoZ9sQXJAFj3AgEY=;
 b=WDddC0Goi0ryMVmsKWleHGrahR6nfUi7W3JP7GebDE8uJxohjQDD+zjCrpg4qAGa+D
 Vg3WTlTCUTMxeMozZP7bA9DP9JPwuo5Rzqf29VBys5PuxxCGYqNtk5nBda8Xntd8JJUD
 8t7C/pRarBekwkISSQ18k+oOLkKbQkkbsu+lGAjDznY/C0E5/fiBVEFP+RdRR2OVnO2F
 Ka+Xyqh0OiB+HbaERJrd1AbvzkvLopaNy5rHa4uAQvGG4IsFdeM2BMimmAoNIExcWC9U
 PFn/wLjB04ftlAH94CpM9+JgXb+9y9lPOAvVwBA/DuWR0plHOe7aIV2FVZb9macaB444
 9g2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xvehaxmptG7eECcujxt+ovd111puoZ9sQXJAFj3AgEY=;
 b=mDGnNWc6r/1kOIBkWZPRGqBbBjPtwI/nIQwRdRxBchFDlv7rDETdDSxWAtqjSEYwOE
 oXZ+veWuZ0jXbLjGPzYMw2XLC2se0vWOkd19tcG/YUFnBWQ2S/ARXEtHFkkuvT0Z9vLe
 r0KLTdcnzn9pVv2hd1ygPSyn8ayvtCcq61hIb/BVTXehVyHVZDD/LU+nzRpujbYtAV+B
 aJnsls4N4vtmgl9SDuYBD8ALp0vxXfHWOk1Z4vYnUCEpI6ALA41C8TCY/GllWlHgvhnS
 7N90xh0FDxdi5jpBaSJoFMbyKn1ydIbAaaClQdPbrIz48vKtGlJw9CjgBcan9teLw8wP
 iHTQ==
X-Gm-Message-State: AOAM533zmGN7itMVAjS9lz882u5MUxvEjd9qodwVIKpdZLtGBheQeKXC
 Wo1TBvrCbFEumA0ecrckEZGEBZKgTOaCuw==
X-Google-Smtp-Source: ABdhPJwqaNftPdxnfDNQXEGVH5yiSlyE+F6uJilqiBlA28LJ4BwmgE5BBzVdFXfHjgcFKGXoSRoeYA==
X-Received: by 2002:aa7:8a5a:0:b029:2ec:7134:7540 with SMTP id
 n26-20020aa78a5a0000b02902ec71347540mr15781940pfa.66.1624225823603; 
 Sun, 20 Jun 2021 14:50:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 76sm13212625pfy.82.2021.06.20.14.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 14:50:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/avr: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 14:50:19 -0700
Message-Id: <20210620215022.1510617-1-richard.henderson@linaro.org>
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
Cc: mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  

Changes for v2:
  * Fix (drop) singlestep check for max_insns.
    We already do that generically.
  * Fully initialize DisasContext.

It was that last that caused the check-acceptance regression for v1.
I simply got lucky the first time (with optimization) and the
uninitialized struct members happened to have some zeros.


r~


Richard Henderson (3):
  target/avr: Add DisasContextBase to DisasContext
  target/avr: Change ctx to DisasContext* in gen_intermediate_code
  target/avr: Convert to TranslatorOps

 target/avr/translate.c | 284 ++++++++++++++++++++++-------------------
 1 file changed, 154 insertions(+), 130 deletions(-)

-- 
2.25.1


