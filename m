Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609584FA071
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:09:40 +0200 (CEST)
Received: from localhost ([::1]:33234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyfb-0002Yn-CF
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydm-00088S-Uo
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:46 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydl-0003PS-7I
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:07:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 nt14-20020a17090b248e00b001ca601046a4so13312526pjb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efcVigAnKX7p9IGBQV/mR+zwRePp2DOJ0O08PYshorU=;
 b=RMz0M1qNij9T72smGZrtPnrGAAWANBm8Z/4WTi7rhod4aXRrheGETcWaII7v6vX7Mf
 05kLscoTOnxUb+B0VqDV/ziLj/Xs1750zAI/ytLMgjVRtCkqGHLk0shHGC23GF5CgLE+
 4zbM4MCS1wYvmHktEMl7DoEDV0DxnmVUtDjMT/tAZq8JM/iIgHzkCY9QO6cHn9uf962/
 1ao0qMNrn9JHksxWwfeUC7Va9+DHG4K8VBiaVNDqs7EComFJo4+vT0HEI6GqxHJhXVPK
 j64w6Yg8WDkc+YmmdQsAnOguZl08Ct5eR0ViaZryMnvIPLuQ5mA9AYNVnUrhK01rLvi9
 yqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efcVigAnKX7p9IGBQV/mR+zwRePp2DOJ0O08PYshorU=;
 b=E4EaptUy+bYLNXPlTe72It2aohjDiWhB+kK8rriWHj21j1bTtkrws5FdKmDWcB+aih
 pTMiqLZ9TW/UTtQRSoSbE0Ojo3l+s4iC2UlZpvbbLTipI8ae51xyDE6q/8xM4gD6CDDg
 ty/nmnMAuKvl/VpjtCjrwZi8/LwMN75kxE1Lr7yVV4GOdSEFSh0fMl37Ny16HONQaxdu
 BJRd+B8rIVMaICkqpmBGEgVt+kFkKwomwKh28IBVUSWDduUxZksvsqhZNgjP+JZ2YL7j
 dmVipv7qb4vt4nWhZVbR6j0XJB5UVn6p6Y+tKOHN9S4WW+b7tvvB0ITFhqbAHLNHBe11
 jxFA==
X-Gm-Message-State: AOAM532b1SN3OY7aFPN/ptS66+1RLTIRilLz4MbdCFlK8WcU/qKFkcT8
 gHeWiF8uit2r5a93ud4EeAKsUpFzQfnV9A==
X-Google-Smtp-Source: ABdhPJy4hoRIXET7MXhtRmWprlOTRaulPKsTiAzmxoqPi5M63f5TJQR8jP+nMwtB+gMi7u+DOyup1w==
X-Received: by 2002:a17:902:854c:b0:158:35ce:9739 with SMTP id
 d12-20020a170902854c00b0015835ce9739mr982390plo.150.1649462863375; 
 Fri, 08 Apr 2022 17:07:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] target/arm: Implement features Debugv8p4, RAS, IESB
Date: Fri,  8 Apr 2022 17:07:26 -0700
Message-Id: <20220409000742.293691-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm implementing the non-JTAG portion of FEAT_Debugv8p2, which
is just making sure that CONTEXTIDR_EL2 is present, even if VHE
is not enabled.  Then Debugv8p4 is a trivial extension that only
touches the JTAG interface, so turn that on too.

I've got some cleanups to the setting of isar features for max.

I'm implementing a minimal version of FEAT_RAS, which has no source
of physical SErrors and thus no need for Error Records.  It does
implement virtual SErrors, which can be injected by the hypervisor.

Since we have no physical SErrors, FEAT_IESB is a nop.

Finally, I'll note that with Peter's GICv4 work, we have all of
the parts necessary to implement the cortex-a76.


r~


Richard Henderson (16):
  target/arm: Add isar predicates for FEAT_Debugv8p2
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out arm32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add isar_feature_{aa64,any}_ras
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max

 target/arm/cpu.h           |  33 +++++++
 target/arm/helper.h        |   1 +
 target/arm/internals.h     |  10 +++
 target/arm/syndrome.h      |   5 ++
 target/arm/a32.decode      |  16 ++--
 target/arm/t32.decode      |  18 ++--
 target/arm/cpu.c           |  61 ++++++++++---
 target/arm/cpu64.c         | 150 ++++++++++++--------------------
 target/arm/cpu_tcg.c       | 166 ++++++++++++++++++++++--------------
 target/arm/helper.c        | 170 +++++++++++++++++++++++++++++++++++--
 target/arm/op_helper.c     |  45 ++++++++++
 target/arm/translate-a64.c |   7 ++
 target/arm/translate.c     |  10 +++
 13 files changed, 504 insertions(+), 188 deletions(-)

-- 
2.25.1


