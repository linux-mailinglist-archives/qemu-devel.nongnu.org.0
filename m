Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED55A8DAF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 07:53:24 +0200 (CEST)
Received: from localhost ([::1]:57242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTd8k-0002nt-U1
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 01:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4L-00073S-5A
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:49 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTd4J-0002Sd-AN
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 01:48:48 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so720956wme.1
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 22:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=5T0LEWvQb6sC5Wxzx6nYF+W4479bRzvnG2ZDO8HgQPQ=;
 b=wQUldpecoq2/EEA9WmDMkmq9zykzGJbXM2bo9cASNw0/1t66MWVpQnfA/OC6z0bMNr
 Uj4BMbfAIkwegcKoyy/5pjMxbcQQViLXEDJOxORDcgWN1QdczDFEBgphcZosju507fZE
 zcwcTJsbalSFV3BV0C/Uf4UN14xuzvVmpCWEZ8vACnYN55wlNCZoJ8pqzoWBgfsmydKW
 ewZs7/WNdT0fMQdxmDZQV0nNdCGRLJUiBb+Tg+hUlY7lgeaX+narti7lnfg6Zx8ndGDQ
 iBsK/1h5jIvF40daNeB+lkUrlhxUhFJI2BnidGb52cqBf7Aqj5tr6RpUhZQmHu4Gd/Yu
 mMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=5T0LEWvQb6sC5Wxzx6nYF+W4479bRzvnG2ZDO8HgQPQ=;
 b=v/ppfuCMxvsFi1rPslfZwp6odnd7uvFGJTIdmz7Mxj5F4uPrpCDq67lzm40c1cqTbE
 68I3sUBH3xWwpiL02TTA7CaNB2pacdVzKOaxcsNOYD3JaccWJOrHcu5w/jSIAcO+9BC2
 NkuSaqjIO5UEBfUnxmaZZom+WMk/k4QT6pLxruK3nF2ecCrAcLC99BKwXFDSHT6Q7lt0
 PcVg+9Naa1T23OjKg+HjaMwjfUV4QNZ4ip3vCGCC/k9taT33sWrX0DRIRWmWVWC6WYOh
 xP2m2ZDdU3Wmdp6KAOEs1ftzlmZAQvnwrnn9Lj2+iCxUleklqV8oO3KXYz/YhbujwIys
 SbKQ==
X-Gm-Message-State: ACgBeo2WC0GtBPBEef8NfTbUHAqoNcUwRzTWIwzc2UCAEFPW8meE/AEj
 X6htlNaaZWBnoGRQRr0LRKFbyDokvbQSK0O20jI=
X-Google-Smtp-Source: AA6agR58Q6Oe/TOI71LR7DnnqYodSRyWOBePdR+qg1BKm/aRSUINbRRtcGjghO11BRa7+fzMGd5cFg==
X-Received: by 2002:a1c:4b01:0:b0:3a5:94e8:948e with SMTP id
 y1-20020a1c4b01000000b003a594e8948emr3907205wma.197.1662011325495; 
 Wed, 31 Aug 2022 22:48:45 -0700 (PDT)
Received: from localhost.localdomain ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 q13-20020adff78d000000b0022533c4fa48sm13429938wrp.55.2022.08.31.22.48.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 22:48:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] target/avr patch queue
Date: Thu,  1 Sep 2022 06:48:39 +0100
Message-Id: <20220901054843.31646-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

The following changes since commit e93ded1bf6c94ab95015b33e188bc8b0b0c32670:

  Merge tag 'testing-pull-request-2022-08-30' of https://gitlab.com/thuth/qemu into staging (2022-08-31 18:19:03 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-avr-20220901

for you to fetch changes up to 36027c70974fef1392e6c73dfb94c3f94f0930bc:

  target/avr: Disable interrupts when env->skip set (2022-09-01 06:42:21 +0100)

----------------------------------------------------------------
Fix avr_cpu_tlb_fill use of probe argument
Fix skip instructions being separated from the next insn (#1118)

----------------------------------------------------------------
Richard Henderson (4):
      target/avr: Support probe argument to tlb_fill
      target/avr: Call avr_cpu_do_interrupt directly
      target/avr: Only execute one interrupt at a time
      target/avr: Disable interrupts when env->skip set

 target/avr/helper.c    | 69 +++++++++++++++++++++++++++++++-------------------
 target/avr/translate.c | 26 ++++++++++++++++---
 2 files changed, 65 insertions(+), 30 deletions(-)

