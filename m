Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B73AD342E78
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:59:23 +0100 (CET)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNewc-0005Qk-Pk
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeuo-0004Xx-QK
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:31 -0400
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32]:34405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNeui-00037t-GC
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:57:30 -0400
Received: by mail-oo1-xc32.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so3094747oor.1
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ymhRzlRNogRgnY5VhOwqtok6y502erb84zagUqOEckQ=;
 b=yAnFEvkFdnTxMrArYr8d6djzPm8HwqGr3bHveyoDdKapAXahHW+v3W9ji3Qa/iWxu+
 Lxgh07AC+w/NYdSH3FIMpW3niOquJMqHirf758319t/GF48tUuTsfv9MoTrGE8IEE19h
 0a7Td0unRV9KjA+K2vQVH6jA9D/5iVX3onWqlMx/WufDZbAhaAlUiORR7GmMghVQgfGG
 fb87mqlB0Mv1NsZzpb5fwr6nWzVE0802Zim99Xk+nzC1xvxz6zd3P99TAqHTVnEqi4+p
 PResor4KH4RkYwiaZnpNjZBbL7ZT45FZyk7P5P+4dlNuvoNPF2AOI67LNWCOZFPXNsG4
 SXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ymhRzlRNogRgnY5VhOwqtok6y502erb84zagUqOEckQ=;
 b=pYoWU5/hxurJX6N79DU81/kQb1fesvhVdTgQn4mKlyE7mqC4Ui4+tw/HdMV9dyRlD5
 pOygBX4ubbINDp7Y745R/yCtruArUFu0SnBIjcJtOrSeDjyKdP8himd5jwN5ihL0BeS0
 kfYPKPwb8z29+mcd3eef6PjTtktxy8b1s1HRyZzvdVpsXJAdSxkyZFRZPCbhMX9Ks8aP
 Pz2Qp30U5/w3ObvCk3AoTeGA4dY0P+dEEx1VMOvvYUdpGNQeTFn8m72dOlLDZh1iOPcN
 W+3Ecdihg7L6mNkGpKY/9aNFu8Y7niJi8gh34RV5Wa+pwLAr7dyhjUX4lh6bknYFzdrB
 oOBw==
X-Gm-Message-State: AOAM531bojPBgvoqhSGAZtO3FvsQC+oVF4G1YjqjeW0Zx5tr5909YItD
 ffcCaCUR+yc2V7370JiQ76dl1tL92/z++9Dq
X-Google-Smtp-Source: ABdhPJwAIthJiX/f5OyK0K36YP3SjMtSFNBhdKoJIX9fLqpGQErhQvwyu4Hs8AahrpLu8TzCX5+WbQ==
X-Received: by 2002:a4a:eb8a:: with SMTP id d10mr5692546ooj.32.1616259442782; 
 Sat, 20 Mar 2021 09:57:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm1953966otp.76.2021.03.20.09.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 09:57:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 for-6.0 0/2] tcg: Workaround macOS 11.2 mprotect bug
Date: Sat, 20 Mar 2021 10:57:18 -0600
Message-Id: <20210320165720.1813545-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc32.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My 29 patch series cleaning up buffer allocation really came
a week too late for 6.0.  Let me do something quite minimal
instead -- simply ignore the failure to create the guard pages.


r~


Richard Henderson (2):
  tcg: Do not set guard pages on the rx portion of code_gen_buffer
  tcg: Workaround macOS 11.2 mprotect bug

 tcg/tcg.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.25.1


