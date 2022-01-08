Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384864881F1
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:58:32 +0100 (CET)
Received: from localhost ([::1]:43812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65gN-0007VA-3O
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LP-0005Zh-BO
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:51 -0500
Received: from [2607:f8b0:4864:20::42b] (port=42932
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65LN-00046c-Py
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:36:51 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t19so7060202pfg.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdtd/O3qAXM7EgaVvAntE1cV7Q+bNnIagxhvJPW1tws=;
 b=qEUjTawEy4mAqHc9wWpROVuPMIDVTezsyDGgwN+dK+wAbtXsgCLzFQkmiHU09qGtjk
 UPZQYLRgIrG7Mzf2HRP9vzTB6Rbox1yU2J0la7/IqAcy5cpNyKHxohn1q5zZlY8rmXEX
 E9ZRYapja7Hew/jAFUAWAZNwLJteHvDP0PDYfpqRKPhwd7XAEnVRE4ISXZqh5geUNvjM
 ODpxatuXnOYjQgk0YW++Yu/sHrqYrV8ghAtBFbhDceN8TSQhRrKDrgN44PoJSwCA6qim
 2F9mA9dvE91Fl7muV2/FF6u1AZj3kySaFYgy2Bo6+42CzeFA0vssaCzs5PUMF9UXD/tn
 ZDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fdtd/O3qAXM7EgaVvAntE1cV7Q+bNnIagxhvJPW1tws=;
 b=xt+MwPXqKUBkdBm4oPA3ORL/lJd0zfjC+qqnm8syXi4IY4vTEkXmpEiMZMZTaNPfUw
 esdOJqTifQUlIoxANy1jfPkhnbLatYfMx7ZA5coWsTGtDWLEZe4Fujc+PrRxtiNQeLL4
 XtjuTTtsC0UvGLzl2zrbgFlWUA5mZ/NPd9msM8R0LhnIqjYwSfxVl2ChlVWoOJLEDkPl
 /SHLqh33W3mKfOgk2HKl0TiJtO4v+sD5w3/nbmLfWnN6V5FSuwdreYUXku80A2XnuOQm
 clnsxyCN+Bokz8iHntDVVd5+IWVBN3S3kiczF/Qwej/j+G9/NkPa+x9o9Ti7KUZty4t1
 75GA==
X-Gm-Message-State: AOAM531sDZNwG2r5jJG8UOFzuLUV4CUtt7VoWlY2LvOIDM0Kd/PZZg77
 C29Js9q/VKq17XdwardoWcQVnJKaC/5vbA==
X-Google-Smtp-Source: ABdhPJww8gi+eWbDbqpitXoRFb4DllqDkVRo9A+LhdwNOMQbKu4W8k93QWGDwd3KCxUdSvw2+dRblg==
X-Received: by 2002:a63:7a41:: with SMTP id j1mr235775pgn.20.1641623807420;
 Fri, 07 Jan 2022 22:36:47 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z4sm840954pfh.215.2022.01.07.22.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:36:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/12] tcg/mips: Unaligned access and other cleanup
Date: Fri,  7 Jan 2022 22:36:32 -0800
Message-Id: <20220108063644.478043-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>
("[PATCH v4 0/7] Unaligned access for user only")

Changes from v3:
  * Rebase on master, which has some patches applied.


r~


Richard Henderson (12):
  tcg/mips: Support unaligned access for user-only
  tcg/mips: Support unaligned access for softmmu
  tcg/mips: Move TCG_AREG0 to S8
  tcg/mips: Move TCG_GUEST_BASE_REG to S7
  tcg/mips: Unify TCG_GUEST_BASE_REG tests
  tcg/mips: Create and use TCG_REG_TB
  tcg/mips: Split out tcg_out_movi_one
  tcg/mips: Split out tcg_out_movi_two
  tcg/mips: Use the constant pool for 64-bit constants
  tcg/mips: Aggressively use the constant pool for n64 calls
  tcg/mips: Try tb-relative addresses in tcg_out_movi
  tcg/mips: Try three insns with shift and add in tcg_out_movi

 tcg/mips/tcg-target.h     |   5 +-
 tcg/mips/tcg-target.c.inc | 647 +++++++++++++++++++++++++++++++++-----
 2 files changed, 579 insertions(+), 73 deletions(-)

-- 
2.25.1


