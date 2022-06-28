Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2955C09C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:19:14 +0200 (CEST)
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69FR-0005Qi-GY
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DT-0003YA-Ku
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:11 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o69DS-0003Ak-4z
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:17:11 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so12286038pjj.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7qtUmJ0IGOTEz/7wI6bQYtLwkQT0MxDjcT9iw1MGnA=;
 b=hY+zVMivc9TXLR74UexNogtfN36ywjFSTTOqscQ5l3+2kCiMArLKwVDb2kaMmXkroT
 7sYhjqbwgKjhF7Kpvm/0PgW4gF07ijZZzQZBjCFhv34Sk9FLw6ttHQkLafgW7Z7GcBSp
 ih0ZcCdBM0BuTGU55hTuWZTCsLdXy2nQZrc6/oPOl18TELiFaYtudnEzrIVTj21+cz/C
 QZmIAEw+oBU/5/Tf/MsDw5qFIjXrC2nTFatrmZMfUv36T0EbQ0Y9IRhIYH34K5tW9oMx
 O9Nqvvm9wV9LyyH489PpXW6jhqOlJThGgPLSsX3JoCmUkDBcW2yWvxMbBlQovOUr19DJ
 R2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k7qtUmJ0IGOTEz/7wI6bQYtLwkQT0MxDjcT9iw1MGnA=;
 b=bIevVzx6QXaGWHBRq5dXkVbg4ehaGHAIVmAlR0fqtkAATb6TdGEFa2G8V2SLagOLOg
 5Nr4ble1RL7N5MmCd1gXFjGrK94kPoA5UB8LY5PNZ0y50/d5VGTdtcl2HtndXeQ7zCcT
 PhaJA7hhVNZGnSAriHoZ7cuiccBgcEVEeJP7ZGvutml6VwGkjFqqIXHiJf4vql6pdBQg
 Jiume2C5zlYHDaZkH/DyKxS4sielt2ftGfVX0xL/SrKIw7ZtyaoB9YbJrkugqXwyXqI2
 VTrzexzr0RgHmF8Dhg4r0SOjSB74PuHcCEF9uAQn3lTVAWSSV1zuA+bYBGgNGpyC9xZu
 Ax9A==
X-Gm-Message-State: AJIora8CZ/QiEmpfeRIRVcKX5LrybAHzchNb7O44SbkFXUwkTdME/NgD
 ltJSf/HIQjJYUVjjhegc5l2DnLRnxiov7g==
X-Google-Smtp-Source: AGRyM1sfuZjBseU/HL0KlzkNCwALm80ej53JI4px6iMJ9UdWvhthi037fa1VgUv3H/pFPSTKakc/Qg==
X-Received: by 2002:a17:90b:1210:b0:1ea:ee10:c823 with SMTP id
 gl16-20020a17090b121000b001eaee10c823mr26498610pjb.109.1656415028648; 
 Tue, 28 Jun 2022 04:17:08 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 a8-20020a654188000000b003fd4831e6fesm9079283pgq.70.2022.06.28.04.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:17:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, alex.bennee@linaro.org, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com
Subject: [PATCH v5 0/8] target/mips: semihosting cleanup
Date: Tue, 28 Jun 2022 16:46:53 +0530
Message-Id: <20220628111701.677216-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Changes for v5:
  * Rebase on master, which includes all prereq and patches 1-3.

Not changed: Existing behaviour for exceptional conditions is to
use abort().  During review, Phil suggested to change that, but
I think the exit status of WTERMSIG(SIGABRT) is better than
overloading exit(EXIT_FAILURE).


r~


Richard Henderson (8):
  target/mips: Create report_fault for semihosting
  target/mips: Drop link syscall from semihosting
  target/mips: Use semihosting/syscalls.h
  target/mips: Avoid qemu_semihosting_log_out for UHI_plog
  target/mips: Use error_report for UHI_assert
  semihosting: Remove qemu_semihosting_log_out
  target/mips: Simplify UHI_argnlen and UHI_argn
  target/mips: Remove GET_TARGET_STRING and FREE_TARGET_STRING

 include/semihosting/console.h      |  13 -
 semihosting/console.c              |   9 -
 target/mips/tcg/sysemu/mips-semi.c | 397 ++++++++++++++---------------
 3 files changed, 186 insertions(+), 233 deletions(-)

-- 
2.34.1


