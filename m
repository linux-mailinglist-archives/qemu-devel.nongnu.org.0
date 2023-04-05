Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E416D794D
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:09:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk04V-0000hm-VE; Wed, 05 Apr 2023 06:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04U-0000hX-Ul
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:08:54 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04T-0004OL-9j
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:08:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id r11so35600404wrr.12
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HI3xN1Xw0CC8DrBzNb0i+wLUvlK4SEej1IdIipPh7tY=;
 b=M3wXPW8CEHaaU/SeIwgurVpmjXnpmz0FsbXMGeB0ADgrI78Mmg1BzVsGsrbHXEu9FH
 iAnGHA/wzFBnABSYu1PTgyVZ6t9O92c9zVYwz0UE9Gqp1kWBpVHcf60/SzNjx5GOOjDZ
 +NDJPZjbZKCSqwNKf0v7JTQa6pl3jx60P0zUyRzbQ6ufK8IJeHYnM+J3RF3076HF5Eiu
 jhs3ryW7nFl27iDtRxZsoxLcIReYHp9GEKTw6P0r4yJV3E9gnJJJnKtQkK1N5H31LCV7
 QKG2qmknPkZufFp7SbuoWZRoxPAW/CXxNbJaQZ2plPXa65PuysHeZMwoSOMd0j4YmfYm
 164w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HI3xN1Xw0CC8DrBzNb0i+wLUvlK4SEej1IdIipPh7tY=;
 b=TfWy/h3mrfZvvYCs5c0cpVPPLxwxxohr3oXEttskF1OOKVc+jTK+wIvlWD/sg9r2G2
 8zsozr0341ko2w2w259R9ZKfmIt2gz/fOnPDSpeRR3v1xIC1Evt6I0vHuw1ohE0hzF8e
 AE/uUDzM0Nkob0R3WtRudwwDpy3RZbY58ALUVN8l4eDAydsOwQT1GGXNCS4+3TAhBUAc
 BnXMPu82qDAX7W0Kbx2cSPGlvP8WV3N3YEHdfuk1u1STmlrmMdOOqh6EL5ym3PrNfxct
 Kr200X4iXFKpDiTFoGSVGFTiTXzDrPdkMuNnjJSFiIeTWCTolZuxVoDocXCUb5oqLNbt
 PksA==
X-Gm-Message-State: AAQBX9f+x3mwza+6Lw/4Hi+xXdH2wzvzsa71UF3m74sSuRWUn0i4UpCg
 c41vCiN4eXvwJL0L0S0ida6P7Dlwy8gkxrZbsUo=
X-Google-Smtp-Source: AKy350YTMitKz+YkGE/b7aGjKk7ltxCbj29oXbGEQgyyI89jT6BypREEABdgQmipAwrQPTmnEPKJDw==
X-Received: by 2002:a5d:4884:0:b0:2c7:a55:bef5 with SMTP id
 g4-20020a5d4884000000b002c70a55bef5mr3784813wrq.23.1680689331740; 
 Wed, 05 Apr 2023 03:08:51 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a5d4f8e000000b002d1bfe3269esm14604073wru.59.2023.04.05.03.08.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:08:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/arm: KVM Aarch32 spring cleaning
Date: Wed,  5 Apr 2023 12:08:46 +0200
Message-Id: <20230405100848.76145-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

Remove unused KVM/Aarch32 definitions.

Philippe Mathieu-Daudé (2):
  target/arm: Remove KVM AArch32 CPU definitions
  hw/arm/virt: Restrict Cortex-A7 check to TCG

 target/arm/kvm-consts.h | 9 +++------
 hw/arm/virt.c           | 2 ++
 target/arm/cpu_tcg.c    | 2 --
 3 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.38.1


