Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5453DCE6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 18:14:20 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxstO-0006Aq-Sg
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 12:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqE-0004WH-Q7
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:02 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqD-0000TR-0B
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 12:11:02 -0400
Received: by mail-pf1-x435.google.com with SMTP id j6so10904717pfe.13
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 09:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNnGXwfgRry1IQ1wXfMDKr0/OaNnfmlorJs2ZdMw3E=;
 b=faWhplnxhQLXhTnyhtTRvCx/d/+U9bkBAk7pZhqpTVR/T7giEFJPvCSne1WWbHkkn4
 WzKAjcZLxcrx50oU9u1cLRX+CMuesp8Vd1Ndkz0uUPwtw36zDMW5C7mcGXXH37uz4i0I
 kA9fJmqRIT7NO2/U/p1EX+uQGb5ZPsTc2rKiBNhIxSqV7mjl5DNJljSZLSaq+8q3/IVW
 LyZFq6LB1CsZHqnMXO0ln99WS0egY23yeC4DarCDM1Ir4hch5cLvkRlzXaSxQZDIL/uJ
 POzxQw6Ji50E7kbJru0WgxErMrQxTB732rRotz2yzZ0ItAWmryWt+/rR4ndpp23GS8XU
 n3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNnGXwfgRry1IQ1wXfMDKr0/OaNnfmlorJs2ZdMw3E=;
 b=NylUbfYZwyeN+HLsHHS5LBd6SXstDmYY/4hJFMzG/lTVlVJfCEuUWvvUWTw3Pacu+O
 prq6AnRqDPwn+tJWXO4q8mKGpDa2vEfwYi2L9VBp4MlfRcxDxyhvWYNv86u+f4TDzXoq
 PxEvi+NCK6G4ICH5geZTNFYo5LmY027NOCcITlB51K7DTIoUHttM0gUO3Kp+rd+k1Yko
 w8HjKL28QmjfHbkXMhgucEhbAQClemHMEt3FRDknPD62qoCbSdf3yE5nLEeHqnxFPbYK
 oxsGkyVZ7hZL0zc84MEPV71ETZN1QVRpJHqhvlgg6Yo4Bs4DUHW58FyQeQo+/J2sb/DH
 76Iw==
X-Gm-Message-State: AOAM5315aFUm2Usc6cP2GhBIsJjIdELoDTFW9HXkKHHD88vaC7SfoMnE
 2lEjwkET2zzs9ChBH6mvLYR4qiyyrqw1pg==
X-Google-Smtp-Source: ABdhPJyK2X2wK8REDAWfTXLVMpiSl+jo1+ktPm1ACTFA5LmYsy3kDMQJyK93iZPcKjkDvOHjAMQppA==
X-Received: by 2002:a05:6a00:2395:b0:51c:122e:3237 with SMTP id
 f21-20020a056a00239500b0051c122e3237mr2544343pfc.21.1654445459237; 
 Sun, 05 Jun 2022 09:10:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 q133-20020a632a8b000000b003c14af505fesm8932165pgq.22.2022.06.05.09.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:10:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/2] target/arm: SCR_EL3 RES0, RAO/WI tweaks
Date: Sun,  5 Jun 2022 09:10:54 -0700
Message-Id: <20220605161056.293920-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

Adjust RW, fixing #1062, and adjusting bits [4:2].

r~

Richard Henderson (2):
  target/arm: SCR_EL3 bits 4,5 are always res0
  target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]

 target/arm/cpu.h    |  5 +++++
 target/arm/helper.c | 11 ++++++-----
 2 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.34.1


