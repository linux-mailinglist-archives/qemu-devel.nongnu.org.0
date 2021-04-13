Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F7C35E3A8
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:18:34 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLkH-0001Od-1o
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLaF-0005uK-Fs
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLa7-0006iH-Et
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:08:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so11010482wma.3
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eehut9njYUJhZs3VA5YPKk4D7FBfwY7KZh7zADPd1iw=;
 b=SOUbXIGkmG8xqhI0DdOkNCYzs5OSi0h4yi1EQdJKPQg4M1g0VOwgZ+nrnOD3znzC0s
 xgTGDPg+Ll6XwjGFmJpO3063wnvEK7lHRdHnccVP81kJHJxduHcBP9cdrqJm+T2GomdR
 EQrIc7eamg/JOKqMcVjejcUYXXP53tuPxPoXPNCrFWYuhAoA8c+xOMt2U4JfeIdXIc66
 ZEZTQPlW2mNLy38e40WIrf24IujKZQNO8X6P9Kk1pjU//CQei9J5HzkeJ40Yh50IUQXD
 RJWShe8HZynCp8MUMixUMQsPCV1mf7x/afPTtPEEbkKgyP3fjCtQNzXh2JOA/sl9J2oL
 NF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eehut9njYUJhZs3VA5YPKk4D7FBfwY7KZh7zADPd1iw=;
 b=OPWTf+rOLvJMPVqaEA5aC2wvDLk6xQ2h868mcuISofzuB9AXcm0O8RTzxvfT4X7EDb
 41TVKNfixcRGXtRwu2Ad+WjmiWae2wtP5QofdAOliCN1lfSdjdg3fOXMcSL8LvJQ/NrP
 r4vSkCUnsWsAmMpgdf+t4KMtxU8oq3UKsm2JqMtGE51iwA2KfLEoVJFPtmJPn/h+L7/u
 YMwcGgZpYy9TLz8rAAuA1SMdkr+rct885i+M7ucwquvfTd1nCWeUluXiVt4ur2N8GgY6
 reNk4nOGiF2b6KJE7WfdOmlx/twLOMQxSyLRwCWoZA9gbWcimF7LJeqYcev5r/Lywe+9
 3I9g==
X-Gm-Message-State: AOAM530q885BCZztC/rkqfGUnSHfR4uDz8IVKMIXQ6/B3hrCMnaJBqHn
 M6Ox2+gPy1qEsu6pTotOyu3Z+g==
X-Google-Smtp-Source: ABdhPJwRwKQdooP2LR3jAfMzmxt3WtjJsQtnkeGnvI4jN+JAd5Z3OYBsorStrWzlx+A8xhLtrFKZlA==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr752129wmi.136.1618330081375;
 Tue, 13 Apr 2021 09:08:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b1sm20810888wru.90.2021.04.13.09.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 09:08:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/13] target/arm: Split translate-*.c.inc into separate
 compilation units
Date: Tue, 13 Apr 2021 17:07:46 +0100
Message-Id: <20210413160759.5917-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we first converted the A32/T32 frontends to use decodetree,
we put the trans* functions for VFP and Neon into their own
separate files, but used the preprocessor to just #include those
files into translate.c. This was a pragmatic arrangement to avoid
having to also rearrange translate.c which had a lot of utility
functions shared between the main integer decode and the VFP/Neon.

However, having translate.c effectively one enormous file with
all of the integer, Neon and VFP decode in it means it can
push the limits of what some compilers can handle (especially
on 32-bit hosts if the compiler has bugs where it uses too much
memory either during optimisation or while generating debug info).

This series breaks out all the translate-*.c.inc into separate
compilation units.

(My other motivation for this series is that I'm due to start
working on MVE soon. I want that to be its own compilation unit,
the same way translate-sve.c is, and having the various "load
bits of neon vector register" helpers available as globals will
be necessary for that.)

thanks
-- PMM

Peter Maydell (13):
  target/arm: Move constant expanders to translate.h
  target/arm: Share unallocated_encoding() and gen_exception_insn()
  target/arm: Make functions used by m-nocp global
  target/arm: Split m-nocp trans functions into their own file
  target/arm: Move gen_aa32 functions to translate-a32.h
  target/arm: Move vfp_{load,store}_reg{32,64} to translate-vfp.c.inc
  target/arm: Make functions used by translate-vfp global
  target/arm: Make translate-vfp.c.inc its own compilation unit
  target/arm: Move vfp_reg_ptr() to translate-neon.c.inc
  target/arm: Delete unused typedef
  target/arm: Move NeonGenThreeOpEnvFn typedef to translate.h
  target/arm: Make functions used by translate-neon global
  target/arm: Make translate-neon.c.inc its own compilation unit

 target/arm/translate-a32.h                    | 149 ++++++++++++
 target/arm/translate-a64.h                    |   2 -
 target/arm/translate.h                        |  29 +++
 target/arm/translate-a64.c                    |  15 --
 target/arm/translate-m-nocp.c                 | 221 +++++++++++++++++
 ...{translate-neon.c.inc => translate-neon.c} |  19 +-
 .../{translate-vfp.c.inc => translate-vfp.c}  | 230 +++---------------
 target/arm/translate.c                        | 210 +++-------------
 target/arm/meson.build                        |  15 +-
 9 files changed, 482 insertions(+), 408 deletions(-)
 create mode 100644 target/arm/translate-a32.h
 create mode 100644 target/arm/translate-m-nocp.c
 rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)
 rename target/arm/{translate-vfp.c.inc => translate-vfp.c} (94%)

-- 
2.20.1


