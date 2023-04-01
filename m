Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FD6D2E38
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 06:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTCs-0003qZ-9v; Sat, 01 Apr 2023 00:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCq-0003qB-3C
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:12 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCn-0003Nx-Kl
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:11 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso23604742pjz.5
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 21:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680324668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OKYGj0CILdVypMpE1TvWg7hEY02mOHrKtGLfYKO7UY8=;
 b=LOLfmjE2RmcyMRXORNXdGkfEtyMlAimAvtj2S3kRwv6HIkISlHn2rfK2kp/vkVN/om
 +3XYhUSInWTz/3mSG/1UBtH0UoPKx+rOncjxjM8brCv4U5DGV1dOzHfW7XyfwaHivAOT
 Q7jBhYdpHtnSOqIiJ6j8h7w1IQlVWucOZ4L3u9KxHa/ohKVd99r2A4BdFH5TjEcg/2J7
 iYChl912c3KzQ/3rTV7ZqU6uJVsYewD4fTeio9uxMVMniI7Go0L3VJOFAXvtlQMroLyo
 9fpJEQvTSjSy9wBIf/w9HpQGAKbqzxfCiTY3uORaYmGGLBGCLsqwwyfKl+ysWzQwvehL
 4s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680324668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OKYGj0CILdVypMpE1TvWg7hEY02mOHrKtGLfYKO7UY8=;
 b=WRUvPFpTwjP11F4U0NZdRTsxQK1w0Pir80dlF928c9xWDy2FKZvyGMeKlGW2IOUQKJ
 e/1FCVEdGWmZpBKaqQ58ouV1oOiHeRryQc2Z3bkBexXgjG6Ez7/7GgguTaoVWJKW7aIp
 YZB41rPXQdkGfn44Y2OKC263OQunIF4CWbSfP8/S2JnAqX8xxLbKZ/tIFw1J/W9zWpmB
 7bwWztCmTlSw/URBNtpHc1h8YBzy44smrYQq+c41Wdc/maHEVyLmDkWuqlR5V494ALnt
 CWwQUUT3tqykYxGNgkFDnSomWAhEYyeBVJLtGm6TeGF8byDTZUSKxJPHS3PDHmefHuxz
 0STQ==
X-Gm-Message-State: AAQBX9dyY9Nv7/Al1zHKijZtoSNKjDp8dGbKElOzzNu4GZGD736udJQK
 EAr4ikurQf4TuznTrPK2wARrSkfWgtp1p0zxOGA=
X-Google-Smtp-Source: AKy350YMp4quQpj8rizc7qJ2VlRATS7S30QR44vuNjPAKIv5ju4Uj1wPZuDn+PBeT7EbeZEcHNkOlw==
X-Received: by 2002:a17:902:d505:b0:1a1:e39c:d4d1 with SMTP id
 b5-20020a170902d50500b001a1e39cd4d1mr35254027plg.67.1680324667732; 
 Fri, 31 Mar 2023 21:51:07 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001a24cded097sm2360122pld.236.2023.03.31.21.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 21:51:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH for-8.0 0/3] last minute tcg fixes
Date: Fri, 31 Mar 2023 21:51:03 -0700
Message-Id: <20230401045106.3885562-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a bug just exposed concerning qemu-arm commpage, leading to an
immediate crash on any 64k page host.  Fix two bugs regressing
pc-relative tb generation, found by Weiwei Li.


r~


Richard Henderson (2):
  Revert "linux-user/arm: Take more care allocating commpage"
  accel/tcg: Fix jump cache set in cpu_exec_loop

Weiwei Li (1):
  accel/tcg: Fix overwrite problems of tcg_cflags

 accel/tcg/cpu-exec.c      | 17 +++++++++++++----
 accel/tcg/tcg-accel-ops.c |  2 +-
 linux-user/elfload.c      | 37 ++++++++++---------------------------
 3 files changed, 24 insertions(+), 32 deletions(-)

-- 
2.34.1


