Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CB6A5033
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 01:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWnzd-0006QJ-E2; Mon, 27 Feb 2023 19:37:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnzc-0006Pt-3j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:20 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWnza-0001X4-C3
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 19:37:19 -0500
Received: by mail-pl1-x634.google.com with SMTP id ky4so8737778plb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SUw5tKNKA3gdfrarIo1MlgfvkBD2LyJpBRWpBCe20YM=;
 b=nz/KbHgxQb/jBr1iFSnuv5PzKMS1oNf/zjYObR+c/ua/ksgjhgSoO/BML9Zgigbay+
 BfJ8UQzt5uC+WOUXB3cAxAkuhOCWwKBBETfbB9Z4rZhHkyKWpYsMVqeRreOtuhq/8MeF
 qP7RVAlB0twASm4KYxNltAt5OrVyW7PZqKRS54DVGl1xoDDUbyAE2/E+643zr/VfTV5W
 9edq1zBgux1kEGe77TsbV7OQ5lsEHJnuwo4jZqZ26g3MmVDJOhq/BwPt9pD/KhINM6MP
 R19g+L4ZJuNOkN82smWXYEvIMMqgUcxkhRQkW3CDgpWQCBRxenyaLQrYQbUOSOoFH5FI
 YOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SUw5tKNKA3gdfrarIo1MlgfvkBD2LyJpBRWpBCe20YM=;
 b=NnNK69USBzCJHdcKrj0vP87g2tljkzHRY0WbXFVGib00nJL5Z96ZW4JbtKSA5ej+7Y
 SN8pu/1Lla24+ohSLgajqBvEJ001ZPXfLUwPqdftdNgKKz7hH2DPPFsMxz1mtdj4glQD
 tnC7DSBvy8eli1+3IFsqXnzPAf9aXirq59ccLKURTS2825feCHQWAx9x0BK2ePRshHKz
 fwU4zp9Sph+XTQAXFnxJ/GotOYps/y7++91zbbdq3GdDgLuW8FocJsrglfDkEAoBvNWK
 uZ3ZNhmzS55Jzi7MEbfiaMgS6cQK+VbS/YH8wYKjR+RiSm/k/NJ65BRbw0l/w2BJkjP7
 R8jQ==
X-Gm-Message-State: AO0yUKUhpBiIMhWxHtTOsLA6hKqxB3jDdnVsFGdzkIrHRCmVND+d4yox
 vOZRQAQCxxZMu2TrFSapfcxdbwZZji8UgCpy0y4=
X-Google-Smtp-Source: AK7set+Wgc/81tHAf5kCfAg+p0tIS6Z4LHZn89S0NDjeeSJ62lQIJY1Chv4tzAorusXeCNgRcnCplg==
X-Received: by 2002:a17:902:eb90:b0:19b:fed:2258 with SMTP id
 q16-20020a170902eb9000b0019b0fed2258mr651747plg.41.1677544636395; 
 Mon, 27 Feb 2023 16:37:16 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b0019cec7d88c3sm5192651plo.236.2023.02.27.16.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 16:37:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 0/3] target/arm: dump and gdbstub support for ZA[]
Date: Mon, 27 Feb 2023 14:37:10 -1000
Message-Id: <20230228003713.861168-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Based-on: 20230227213329.793795-1-richard.henderson@linaro.org
("[PATCH v3 00/14] target/arm: gdbstub cleanups and additions")

Support SME by the same method as currently used by SVE.  While I'm
sure proper gdb support for dynamically sizing SME will require changes,
this is good enough to examine contents of the ZA matrix.


r~


Richard Henderson (3):
  target/arm: Avoid splitting Zregs across lines in dump
  target/arm: Dump ZA[] when active
  target/arm: Support reading ZA[] from gdbstub

 target/arm/cpu.h       |  1 +
 target/arm/internals.h |  3 ++
 target/arm/cpu.c       | 54 +++++++++++++++-----------
 target/arm/gdbstub.c   |  8 ++++
 target/arm/gdbstub64.c | 88 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 132 insertions(+), 22 deletions(-)

-- 
2.34.1


