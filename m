Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9D3AE0D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 00:13:39 +0200 (CEST)
Received: from localhost ([::1]:55990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv5hB-00043Z-U0
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 18:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eV-0001VE-0o
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lv5eT-0007qI-7l
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 18:10:50 -0400
Received: by mail-pl1-x634.google.com with SMTP id m17so4303700plx.7
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PU9j/e41F1faQ7IW+/ERtibjTJ1YJgFGnULpjjf1WRg=;
 b=Y2ZTwRVCf14BHSZXpHc0Aec0MAcVMdxBHLZ2wLxSM8CMFnWN2hdxeEgmSvI4ncxd82
 foy29PD/RCWwnbiAjbHF7qqzg8qf6TEs6fqMx6oJcRYPOwqAUvj3YDb6omBjg8yJQJYC
 lnO3qVzepkvCWbJg6JUAAKYe6mtQOD1yTZj3RJBfvgmjeTPn68+SFntzztSQoObBDfGs
 eaHP1Bf94bNZkxnhI1jJBVxvvibtNYIvf5fvFtvEaP+FcRHWBW1m6+lItJouCyM60jdy
 GjokfCXTaNtTMxgO/C/bIEXONekZKsxvM57tps5aQCS8H/NfEZhet03BCOZIj3V06hXp
 v3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PU9j/e41F1faQ7IW+/ERtibjTJ1YJgFGnULpjjf1WRg=;
 b=qkDeHt9Np4ygih5ecrQSktXJIznGNaVgeQ9llptYqwDc/u8KpOxuXtngf8PzNxHqIo
 tFdZTe0XbveoxhO1cVFMcmWCBPcgNIEMm8zZ0EvVIiwwntzFaXyJH13zeu2sil55Fi5x
 /VHGrjtWdN8FIzTExTafr7BRZsJ9W1z46fgBpD3Y/7ha9/Fmsog/Tld+BAqO2NGFsZOK
 qwKOn1onB3GnJQSpFQril++FFduW1tHYD6tKGsqaox3KpVTNM3ADqcTp9R3IBzFJmGfk
 IlWM4pqmt7o/Db1zHpJzrZGvn8smhjMchbQIqijN/6Fp87LWbvdFOYs1nRjjK5Xk7hgA
 frpQ==
X-Gm-Message-State: AOAM533squtrObrqWoDBDSskdKp0PrfUZRTUaysXRr0TmY1hAqut/fLM
 jd/nHKn6xI0Q0r9l3jloYaZvI9Scuu9qrg==
X-Google-Smtp-Source: ABdhPJyEw8ucZXew4LcG67Jy751RdjXkPLy830VVyXomjE4XYFXHKkWsDTo06rJYLaVo9WDOwud9vQ==
X-Received: by 2002:a17:90a:db8a:: with SMTP id
 h10mr13059836pjv.50.1624227047604; 
 Sun, 20 Jun 2021 15:10:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 135sm11122961pgf.20.2021.06.20.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 15:10:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] target/nios2: Convert to TranslatorOps
Date: Sun, 20 Jun 2021 15:10:39 -0700
Message-Id: <20210620221046.1526418-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've reached a point where *all* targets must use the translator loop.  
Do that, plus some other obvious cleanups.

Changes for v2:
  * Fix (drop) singlestep check for max_insns.
    We already do that generically.


r~


Richard Henderson (7):
  target/nios2: Replace DISAS_TB_JUMP with DISAS_NORETURN
  target/nios2: Use global cpu_env
  target/nios2: Use global cpu_R
  target/nios2: Add DisasContextBase to DisasContext
  target/nios2: Convert to TranslatorOps
  target/nios2: Remove assignment to env in handle_instruction
  target/nios2: Clean up goto in handle_instruction

 target/nios2/translate.c | 259 +++++++++++++++++++--------------------
 1 file changed, 127 insertions(+), 132 deletions(-)

-- 
2.25.1


