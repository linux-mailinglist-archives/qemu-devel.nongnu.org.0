Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE048822D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 08:29:59 +0100 (CET)
Received: from localhost ([::1]:47988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n66Ao-0007QR-Im
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 02:29:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65I3-0001Lq-Ie
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:30 -0500
Received: from [2607:f8b0:4864:20::1031] (port=43530
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n65Hx-0003bI-7g
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 01:33:19 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 r14-20020a17090b050e00b001b3548a4250so5996710pjz.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLfWmlZFXOoT5dihZa4iXIF8m3lVimMNIuvziw16Pts=;
 b=lxfMYWNvM+p/D+kfbnn+92DAWMXpfmRhrfKtZ9zdty4F9nNGdtT5+eHDSzWTKEwUkA
 OERBJEpZBMuCZMkKzbDiT2ZsS2ogk54I5rZqUb2bEsWM4q00RuamceQeV4C1HRnF1Ifz
 03nCk6ADVVbT+5YNv1aW/W8het22l9ssFRwbnmsP+j37131wSO/u9Mn2Jq+IlRQvOpcV
 ZJMsf3goQlbBGgatGn1y2/yfEfDOH/ar3xHAXdHCRNhhHrZZdQc19QAcLMnmnGfVG9jh
 U2YvzEIqyFJsVcS3sl4mRch8DwmbppIWOKIDI3KfebCttSQcM83GnUvxRPjYNuWg5IwZ
 S1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NLfWmlZFXOoT5dihZa4iXIF8m3lVimMNIuvziw16Pts=;
 b=qa/vc5JOtnhwy8TW2uQ+ANWIrKfMRvGbuj+XGJDRcG47xysh4U4LcTP+tHF+A3CrGd
 KT9UbaDzm6mCi8shK6egU9fnRR/+F4idvVHXYaOiuaeCgvtzq5cvC8CdZlHCBBue0K7M
 RmCniUc8Y+gA3T+sq9dj+0t93VMD3VKI05dRFyqg0AHukNBFGSfP2p+ruzG+SJ2dcZfW
 cQ6TiYcGp0MAYFj7nVp5zqrLICiis2jUD3EE744ULY7zEGwTSR56FXAeaEzZKq8lZvu8
 HTErGsE4KRYL1PK6HohHL8SsVuEUf47CInbCxzHMQz4fJdC26rIU32LX2y0h2N9tu7dO
 jIxQ==
X-Gm-Message-State: AOAM532kieLBaw5BZh7ZPVRIncBRYe/LiBmeU6vVmQBFuND3gqNUgKpK
 Yy5dE8pls9yravthIWU7LD7TEizPA90pcw==
X-Google-Smtp-Source: ABdhPJx4Py9gxZb0EOOkMs0VvCjgGPr7lViILQEfeMplCW89vzzhKLsJqmgu3hobMz1aUr5WX9XhCg==
X-Received: by 2002:a17:902:7102:b0:149:af86:c1f4 with SMTP id
 a2-20020a170902710200b00149af86c1f4mr32351429pll.19.1641623595691; 
 Fri, 07 Jan 2022 22:33:15 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s7sm834760pfu.133.2022.01.07.22.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 22:33:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] tcg/arm: Unaligned access and other cleanup
Date: Fri,  7 Jan 2022 22:33:06 -0800
Message-Id: <20220108063313.477784-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>
("[PATCH v4 0/7] Unaligned access for user only")

Changes from v3:
  * Rebase on master, which has some patches applied.
  * Drop support for armv4 and armv5.
  * Drop code to emit ldm/stm for aligned trapping insns.

Previously, I added quite a lot of code to support armv4, and
added more code to downgrade the detection of the host cpu,
but all that seems mostly pointless in retrospect.

The oldest reasonable system is probably the rpi, with armv6.
Stuff older than than probably doesn't have enough memory to
actually run qemu.  Armv6 is an interesting cutoff, because
that is the minimum that supports unaligned accesses in hw.


r~


Richard Henderson (7):
  tcg/arm: Drop support for armv4 and armv5 hosts
  tcg/arm: Remove use_armv5t_instructions
  tcg/arm: Remove use_armv6_instructions
  tcg/arm: Check alignment for ldrd and strd
  tcg/arm: Support unaligned access for softmmu
  tcg/arm: Reserve a register for guest_base
  tcg/arm: Support raising sigbus for user-only

 tcg/arm/tcg-target.h     |   6 +-
 tcg/arm/tcg-target.c.inc | 407 ++++++++++++++++-----------------------
 2 files changed, 170 insertions(+), 243 deletions(-)

-- 
2.25.1


