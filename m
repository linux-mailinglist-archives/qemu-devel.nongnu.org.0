Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD952992F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 07:54:51 +0200 (CEST)
Received: from localhost ([::1]:42790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqqAS-0003c5-Uv
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 01:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4l-0000T1-SX
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:56 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nqq4j-0007nI-Ks
 for qemu-devel@nongnu.org; Tue, 17 May 2022 01:48:55 -0400
Received: by mail-pl1-x62e.google.com with SMTP id c9so16450466plh.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 22:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3KBk6nkeNJQhadgHBeZE6aGoHWOgeb/U7VKNqTlDdI=;
 b=Ts6iRBlLOQ6bYD9I6ibXAYxFTpyPXJYj00TVzsCH9t1Qz5fLR10rplIrhNUQQ8Q3Zz
 Hk7WsC8sJL3vKztUOXUQFrJ3GutFkw0yYwTfgpzfWFORk6auym4rt46dhUEMMhGBeZi0
 aWfuzDj0ql2jwVkmnn8MArCUr2RrwHXXeEGnvqliDOCQjcBJW85h5OH5/dXpbEW72cuQ
 C3zmytSl0bAhCSjDUwUPnSETR8bvfI8CAPwe85Xt772LKBPwBjD7UF+r8klsE9vu1PC6
 jczrTsAMh27Sq98HzRbIk0q3TCnsqrkRlDVVYfu1OBjG5rR1a8hQ+MWnwfTmXMIkM9n+
 naKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e3KBk6nkeNJQhadgHBeZE6aGoHWOgeb/U7VKNqTlDdI=;
 b=rj/5GEbA6YoIGx0t55baJjfB8UzDkhj22nBJixsxb2X8F7p8GfzhhssPR+2wsc+E5f
 sF0vyc5KkkzyAzHoeH41AQk8z42OLB1dDlSUZjIrfI2NqOjvJCtibx0ExsYhOLT4R/0S
 RlLHJ9ULinB3MAQ5Njv/JZ0/S3bfTzPxgvjBCqGgrG0dpkH/kFxkTmfbJRPQ4PWWr24l
 GR7HpUj+C0HnTRan4PzEkAnWSltLzLse5srrlk3c3pHrIx/3fuPvu8mmfbXS86q8601l
 jomWb8I8LscyVeREdh2mEf5YEprzGgfDMjB2SW7gknimyu/HWFcORUjXie13UptCYLqM
 bgyw==
X-Gm-Message-State: AOAM532YoeXeCCFMj1HnsBcZg2S9K0hH1jAQPzX1JQm3ajQdVUFvnIpB
 2mR8M93pQF4kOXhHKrWWFwzYhU0tJODWdg==
X-Google-Smtp-Source: ABdhPJx1syDstvS627dgOjlQ1kAFqIjZTT2FYQOusGXmsRaanM/HSRj/Kl7pYfGeECKs1KuBtsfASg==
X-Received: by 2002:a17:902:cf4a:b0:161:64f4:52d8 with SMTP id
 e10-20020a170902cf4a00b0016164f452d8mr11138426plg.83.1652766531964; 
 Mon, 16 May 2022 22:48:51 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 b12-20020a170902d88c00b0015e8d4eb1fasm8146670plz.68.2022.05.16.22.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 22:48:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 0/7] target/arm: SME prep patches
Date: Mon, 16 May 2022 22:48:43 -0700
Message-Id: <20220517054850.177016-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

Changes for v2:
  * Fixed the errors PMM noticed in patch 2.
  * Cleanups for SVE vector length selection.
  * Cleanups for SVE exception el selection.
  * Add el_is_in_host -- I'm not sure this one will really help,
    but it's certainly appearing more and more in the pseudocode.


r~


Richard Henderson (7):
  target/arm: Enable FEAT_HCX for -cpu max
  target/arm: Use FIELD definitions for CPACR, CPTR_ELx
  target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
  target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
  target/arm: Use uint32_t instead of bitmap for sve vq's
  target/arm: Remove fp checks from sve_exception_el
  target/arm: Add el_is_in_host

 target/arm/cpu.h       |  70 +++++++++++++--
 target/arm/internals.h |  18 ++--
 target/arm/kvm_arm.h   |   7 +-
 hw/arm/boot.c          |   2 +-
 target/arm/cpu.c       |  14 +--
 target/arm/cpu64.c     | 118 ++++++++++++------------
 target/arm/helper.c    | 198 +++++++++++++++++++++++++----------------
 target/arm/kvm64.c     |  36 ++------
 8 files changed, 264 insertions(+), 199 deletions(-)

-- 
2.34.1


