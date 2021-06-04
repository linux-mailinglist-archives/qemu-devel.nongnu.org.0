Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3539BFC2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:37:18 +0200 (CEST)
Received: from localhost ([::1]:42422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEh3-0001Il-Gm
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf3-00073y-Fz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:13 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:35339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEey-0000vG-Pl
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:11 -0400
Received: by mail-pg1-x536.google.com with SMTP id o9so5727856pgd.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdUaco4sECfF9IUAX5NrMCB86rw92BNPZvWQqOKvyas=;
 b=Bga0f/A17eVlsm7gkf5292g0WXtr9pgDlmH7Ywq0Dt+B5L3qXA3QfvmMV+ASY9eGOH
 jFmge7WNhsSTaIBKE+UJCQaczL7Ty4v/7XhV39PMMfh/Tpz4on7eBekuJY+gxgCGhb8c
 hb38VAeOAj7Qp/2kQkYw/lM3LiYzYgTH2okOn5npStEGpHngCt/wLYlWTPJ7DrkoIlVu
 sWQUglP9Cnn8FIuhB1A8x/uxJmvV2iSzQEkB9OhL9l8TzVB0IsY0/x8KvkzP7z2UoO0J
 Rt3vv8rfpVf4LKtc1mz+82xG7OXVN7bW9qnXZXfRjg6ucmaCDxOnk0lJj/uiNFHTkd3h
 b1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdUaco4sECfF9IUAX5NrMCB86rw92BNPZvWQqOKvyas=;
 b=q+DpsOwS5AzGqEd4G///C+bhltMPHGSv9E4i6eg4LLrZ9yzT3NUhTZCrTHLrh1jjp4
 V4aIhnE1kyprSFOUBN/5gOEQSNhtPDhn8Tt3qphOqyl/emvP9EFitVYct+1RH+PhNoQr
 ANCuiiho4/zC7ANTS2CD9tg622Gsb2GWoM51DmiDIT7hKWizf8jr04GP0bjMT4ANF3pb
 jp5Z8HCC1EyN4LaeDnlGsvvcbxDs+3BnsTJ1axtSRXOdDc/kgRWvLD4GSoG5BGiEAUAW
 lNwNceU4Nr22MHVst1Z9ywcqbBaSxTP3gA+XbmhpVRRttwwcPeSOsOGA7CMTeeOWGFAX
 Jbug==
X-Gm-Message-State: AOAM531g6qxjy3VWaEg06Dc7iZL69eIn3mlfRo8Yh7U0xwrsh4j0kQDr
 dtgPIOWJ/gQChMFgdH0UFBHQq0jcoYLpgA==
X-Google-Smtp-Source: ABdhPJzlz7oKubsWVmyLtqdL0iAEvF8f4fL5XWu+6QBGA6DkhmHkYdx96OPfAToW9xXpfsO8DSc0xQ==
X-Received: by 2002:a63:5619:: with SMTP id k25mr6405747pgb.92.1622831707195; 
 Fri, 04 Jun 2021 11:35:07 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Decode fixes for aarch64
Date: Fri,  4 Jun 2021 11:35:03 -0700
Message-Id: <20210604183506.916654-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A couple of printfs left over from the beginning of time,
and asserts that are reachable because of lack of decode.


r~


Richard Henderson (3):
  target/arm: Diagnose UNALLOCATED in disas_simd_two_reg_misc_fp16
  target/arm: Remove fprintf from disas_simd_mod_imm
  target/arm: Diagnose UNALLOCATED in disas_simd_three_reg_same_fp16

 target/arm/translate-a64.c | 87 +++++++++++++++++++++++---------------
 1 file changed, 52 insertions(+), 35 deletions(-)

-- 
2.25.1


