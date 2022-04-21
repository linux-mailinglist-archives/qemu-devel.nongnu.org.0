Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B8850AAE1
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 23:41:35 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nheYQ-00082b-7c
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 17:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWS-0005fe-P5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:32 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1nheWR-00072j-Ct
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 17:39:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q3so6614571plg.3
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 14:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yoanYhwNfceZNw0Fb1oIDddrOGBDHIe08Ataxo0Y9o=;
 b=pDrWUKddMPbSDV+8uMFWy3yBpm6gN8wm+3zU6P5OK1A5PbLZWk1NuVw8rpKrqUi7hV
 R4HsDs3vL2DaOjMhCxsRVvFPOOrzF1E+wXmJxlKx/NsMGvOfa0x1dqIwX7A76eU12BKU
 ZStFocHko/lvQhllRMo34DO0IzgUc1ygLIM+KvDuSu4dwjGIwcKF3a3+ewYOD7UYGYWZ
 kcRKtTGq/KXRBJ6FE3xf8K02XkBJmCgcgNoJYC1SBBiQVkTliZofgjU+yMKvqbqT+n7Z
 yxuGqTn4QHfGdCijCGyLorBeLhoHPaywuiR8BxVnhjMB6IZdZCDBkBJK+YuTWe9JY+ou
 rxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0yoanYhwNfceZNw0Fb1oIDddrOGBDHIe08Ataxo0Y9o=;
 b=uAjNXo/uZnvwzwLYUwZKQyMrTTACO6boRxQD06nNpUdGz+YlYmxzO/gcAjwdHBeqdK
 31fqCEKf1sygREXkO2aNEAowebWUQfNiozPR5NFs513Q93IAQCPBId+EZktSUP9L/sbc
 SIEqOAByTL+biO2SpSpu8UJtvR+BCn6D8JcLwTS9APq8Mswjqfsu1kZHkThkflGpM7EJ
 +CWhRc3tGEK5/luQVgv+tBjBgGMISinnFRLhSG2rrqb6icLFFb4/wwRiuL8TYhyhhR7B
 yZW+8hmZDiw3g1F3AtoKxmKtU30C+2ja2HwTUcCjlX1tvsymUX+6SUJs/DICYx1ZzGoV
 TJNQ==
X-Gm-Message-State: AOAM533u0AHDlxkgFGzucDeOQz4UEhNNZeIbmRu4I3tvQ6gY5wxzlAR3
 nk+hRcgvV0EG5pwVIOT4rVFmYCqJpkEcuw==
X-Google-Smtp-Source: ABdhPJwYFlLe0L2AiGVk6Qx/87tAtcpv4NsNBnUo9YIngcg6xfPACnQTWGivg+Yb1lgf0nsZHqmfnA==
X-Received: by 2002:a17:902:778a:b0:158:da0f:f299 with SMTP id
 o10-20020a170902778a00b00158da0ff299mr1396079pll.29.1650577169663; 
 Thu, 21 Apr 2022 14:39:29 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:df13:3d47:8c92:6576])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056a00190400b004fac0896e35sm73977pfi.42.2022.04.21.14.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 14:39:28 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] target/xtensa: use tcg_constant_* where possible
Date: Thu, 21 Apr 2022 14:39:11 -0700
Message-Id: <20220421213917.368830-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

this series replaces tcg_const_* with tcg_constant_* in the xtensa front
end.

Max Filippov (6):
  target/xtensa: use tcg_contatnt_* for numeric literals
  target/xtensa: use tcg_constant_* for exceptions
  target/xtensa: use tcg_constant_* for TLB opcodes
  target/xtensa: use tcg_constant_* for numbered special registers
  target/xtensa: use tcg_constant_* for FPU conversion opcodes
  target/xtensa: use tcg_constant_* for remaining opcodes

 target/xtensa/translate.c | 130 ++++++++++++--------------------------
 1 file changed, 39 insertions(+), 91 deletions(-)

-- 
2.30.2


