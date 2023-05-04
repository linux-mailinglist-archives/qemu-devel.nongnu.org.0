Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8916F6980
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 13:05:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puWlE-0005hj-1G; Thu, 04 May 2023 07:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWlB-0005hR-UR
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:29 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWky-0003aA-Ej
 for qemu-devel@nongnu.org; Thu, 04 May 2023 07:04:29 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9659443fb56so47741066b.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198255; x=1685790255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEb8PpHn49AMMlxPL+20BITsNaLIqwdHTBTJ6O58xYU=;
 b=e/qlDT/TM1LLxO7OEkmY0QDEvkLijegh/DpsgOHX1tmAUWQKqi2Iv+z8tEGjurrG58
 lOMQArkjc+LjBGl/85UT8NM5uDsbfEcughqdCjq1FHubfhScpV9gzCsj5YzeH6qQS82o
 fd7aKH27ig9IGJ0n5E4nfvtqqNzvLfn3jeN8NXN2WiO/iS3x9kM3n3MDcqHfyPlt/+aG
 s69/fMz/qTdSJNy+A2FnRcyqPFOqlMtpfZvabUZqUqLggn82NBljZdGELYtUKYYc3ae3
 xPRY3oRAKnuepcpwv+7OEx0bH9v+qB6GGU2DWhhv5RNwvCtkrEdrvciYnJKO0ct+pRyJ
 oNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198255; x=1685790255;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEb8PpHn49AMMlxPL+20BITsNaLIqwdHTBTJ6O58xYU=;
 b=k1K2zzhYTX79rel2CI50wU9Nj6kCxGEAr9Lvr1xLXrZonBDNC2QlSX94oJMbTS2yay
 SfNO3B+p4OeiVgSiI/G7Pfvuiii2T6uL5/me7NRZGtisUtknO0pjvd+piT3ZjjWNxK4e
 o+0eYleMdmBrBK1ORu1GmmA14RDH/bi6rZFwGjI0FUsRgsRCEd1cUTQH4PLlel/Bt6YF
 QM5AcqGcy0GRkQ0WfvvkrqnbVl61LCBMflmKqTiZgzKeWgb07ZXovDS3XMAqBQQBA7AK
 94/YizGTeGY+fqn1+Kb+J5Vk9j6/vD9lJBewTyeTpTe3kk+aqOlzUq5ctJLYhHvL5fyT
 o2lQ==
X-Gm-Message-State: AC+VfDxuddrqGo6iMa5gvY5fz9xAtJ59eviChMnu0ec5uXyto1jb1niV
 mvem+7nQpEEoVNhhr4/r4yHobKUgu+cpdkD/zYSPog==
X-Google-Smtp-Source: ACHHUZ5VoNxvH8HHIOPSR1oERZErB6zfWkEMesjYhGNCcSSgroPs4QCNxAAmBQAIzykh6KlDJAdaaA==
X-Received: by 2002:a17:907:6d1f:b0:962:582d:89c8 with SMTP id
 sa31-20020a1709076d1f00b00962582d89c8mr6023461ejc.45.1683198254714; 
 Thu, 04 May 2023 04:04:14 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: Move more files to tcg/
Date: Thu,  4 May 2023 12:04:10 +0100
Message-Id: <20230504110412.1892411-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Move 7 files to tcg/.

r~


Richard Henderson (2):
  target/arm: Move translate-a32.h, arm_ldst.h, sve_ldst_internal.h to
    tcg/
  target/arm: Move helper-{a64,mve,sme,sve}.h to tcg/

 target/arm/helper.h                      | 8 ++++----
 target/arm/{ => tcg}/arm_ldst.h          | 0
 target/arm/{ => tcg}/helper-a64.h        | 0
 target/arm/{ => tcg}/helper-mve.h        | 0
 target/arm/{ => tcg}/helper-sme.h        | 0
 target/arm/{ => tcg}/helper-sve.h        | 0
 target/arm/{ => tcg}/sve_ldst_internal.h | 0
 target/arm/{ => tcg}/translate-a32.h     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/helper-a64.h (100%)
 rename target/arm/{ => tcg}/helper-mve.h (100%)
 rename target/arm/{ => tcg}/helper-sme.h (100%)
 rename target/arm/{ => tcg}/helper-sve.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

-- 
2.34.1


