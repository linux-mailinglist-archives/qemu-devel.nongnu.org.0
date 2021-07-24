Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949353D47F6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 15:50:27 +0200 (CEST)
Received: from localhost ([::1]:34422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7I2s-0005k8-D5
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 09:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1c-00053H-Nl
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:08 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7I1a-0000kR-Uq
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 09:49:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 x14-20020a7bc20e0000b0290249f2904453so5512960wmi.1
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oRtyD4hVV0rYdFu0HyxaiThszoBDr8yJOmgvO3La10=;
 b=EkcOONt2FNWfTPLkV5vib5QjEjq7mx7Fi66HDWtUD+6n9FfBjoYlhZE1lJ2N4INEhg
 zfs//WNJuAGf4fOLB4nf1C6r6XDRqgqodRAK12h4TdID6mKk3VjFDniQg62BrbPa0vhf
 gCrZvFNZmD1bHL1dqUYCy2IffSQo5Wke0MnUre19RCADpnzECEZPdxGe+VQPy9mslaRG
 2ePzR2BRCWFcJi7JP+IsPu02z3jV7NGVHK/a48qjb8fRuP6DCV9pfgunlwkN/h85B/oN
 yMwT0Y+M+j9ebdnu+VoryNCOnD1K4tBxFO7N534bic2N20T7epRYLd5yEK5ny8Ul4o7s
 kw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/oRtyD4hVV0rYdFu0HyxaiThszoBDr8yJOmgvO3La10=;
 b=GejCI1QynkX1TknKThxyrWKKMaU/5yTivZRJooXuBwSc1N3j5Wz3ikfSR1wcHRZuA4
 O8O+O11GjjnNWvFnbj4YO+APtCHs4PP6Kqer2oaHI0Xl6EIzPt3SJvRVYPidJFU2STXi
 kOUHAkNn0zZa0YekljlAd14GZm0fmdqnBYjrAOgpcqnMgTPEtOnSAzneHMZugrr+dyZL
 3NjBqHViy5/abyuSDUpmJ9liILO+z0GFW6zrQyBocwLGeivUU9wlCL5QuRQGXznmrghc
 1eRX3TamKMCK8SSMxrcghrGcTCj6nrVobkQHz2aF3W6ZRyFNS3xuhrHFrjxWey1GL8Jl
 r4hg==
X-Gm-Message-State: AOAM532WRI0iuSJmadQ1itSzuRJnGxy9V1qP53t+UiPiUnRRpd9bJytR
 8/NSrdNtXOdI7RcyhpCWN0kj3Dx7IANn1A==
X-Google-Smtp-Source: ABdhPJzwfIcv29zqmHCxFHwfZGH3w7/0Wuv2JcKTTTFaXAnp/wjR8D6ER5COUZuBXAfvjwwsEMPylA==
X-Received: by 2002:a1c:7c05:: with SMTP id x5mr18862305wmc.123.1627134544751; 
 Sat, 24 Jul 2021 06:49:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n5sm34690344wri.31.2021.07.24.06.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 06:49:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 0/2] target/sparc: Drop use of gen_io_end()
Date: Sat, 24 Jul 2021 14:49:00 +0100
Message-Id: <20210724134902.7785-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sparc frontend is now the only user of the obsolete gen_io_end()
function (used for icount support). This patchset removes the
use from sparc as well, and then tidies up the generic icount
infrastructure to remove the function altogether.

This is for-6.2 material because it's just cleanup.

There is a slight difficulty here with testing this: icount
doesn't seem to work for sparc Linux guests in master at the
moment. For instance if you get the advent calendar image from
  https://www.qemu-advent-calendar.org/2018/download/day11.tar.xz
it will boot without icount with a command line like
  qemu-system-sparc -display none -vga none -machine SS-20 -serial stdio -kernel /tmp/day11/zImage.elf
But if you add '-icount auto' it will get as far as
"bootconsole [earlyprom0] disabled" and then apparently hang.
I'm not sure what's going on here :-(
(I filed this as https://gitlab.com/qemu-project/qemu/-/issues/499)

Anyway, these patches don't make the situation any worse...

-- PMM


Peter Maydell (2):
  target/sparc: Drop use of gen_io_end()
  tcg: Drop gen_io_end()

 docs/devel/tcg-icount.rst |  3 ---
 include/exec/gen-icount.h | 27 ++++++++++-----------------
 target/sparc/translate.c  | 25 ++++++++++---------------
 3 files changed, 20 insertions(+), 35 deletions(-)

-- 
2.20.1

