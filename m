Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5266B271
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:08:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5Xc-0003uK-UR; Sun, 15 Jan 2023 11:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XF-0003tZ-As
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 11:07:06 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XD-0002kt-1c
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 11:07:04 -0500
Received: by mail-pf1-x429.google.com with SMTP id i65so15892207pfc.0
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 08:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GZTFHxNlAhNRHDbBvjazOuY2CHtPtEz62uheZE/u1Xc=;
 b=EJcatYdOLfY+WlTy6Cmxm4tivhdP4s9IgPDXWZi7S89mmohLtbgEO1T4mXXse1llW6
 2tJR0DPvCEha7PDUSGRAztMGVAdx9lGsGL7Fjiu9kGL0g2vV83IeST49SndffxtyO2II
 G6FVQz4iYFnEa8YSldbaOr2fFagepzj0xUTvcHlEfQr8YcpdEgkUxrgpPZtd6e3nzgPW
 dbnZxDs4GniRq1WPa7xF9ToaOiqXQX8ge03Y6ukAJkSdQCH9Pma0JgRXoxlqWfuLCNvv
 +ae3Ju21UKwbmWAmInZ+xPeBbGnNNQjH6trGXcO0CZ+tJMGUJLR+By7ohdxtqKJ3//cN
 252A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZTFHxNlAhNRHDbBvjazOuY2CHtPtEz62uheZE/u1Xc=;
 b=a3qehwbOVpeR1lK4KqDTql5UCa6p5h2KZvS9dr+CTfBRy//B4xE+ToYmt/Hhm3SsFB
 l/KJl/L6O/EIBY63x0M7UrtX9EJpVyFw2OniBRByW5fizVrF7vfSjt6RiwRiuc9pNTny
 FHVMEyw5iSsBb9wcsqGZA7LXu6CO4q8AdOWVqu+P5zsf6kHnnd23uqGgc+qBzamAHR5j
 z2pwmxs1EgfFDcqycqOWmnvn/1WhCWfmj/bRY6cQDyacMINpysWCCnE+c1owzUeJsKqL
 DsbZ4JEgPqTsZozY5UgYV2b4cqvHM2fvcjsSk91Zagx7fY6tp/wd8rFj6+EpPNNR5TkB
 NVnQ==
X-Gm-Message-State: AFqh2kq2JKsXkuJ8iRkiAaGcylbZaCFxamNZyN21pwVadKNVd9AYea1Y
 Qn5GDGZJKMWVIyy4OG9hA+wApjEXr2siU6Y2
X-Google-Smtp-Source: AMrXdXt1JiQNS04IGj+F/FyZyK57Ko3hRxGIC3Hm/2aWvMrY+3ktQx5h8CWp8rEXSmRSYVRg0iesTA==
X-Received: by 2002:a05:6a00:1d95:b0:58d:aac3:a8cb with SMTP id
 z21-20020a056a001d9500b0058daac3a8cbmr633460pfw.0.1673798821246; 
 Sun, 15 Jan 2023 08:07:01 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c76-20020a624e4f000000b00589c467ed88sm11422735pfb.69.2023.01.15.08.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 08:07:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
Subject: [PATCH 0/2] target/riscv: Fix double calls to gen_set_rm [#1411]
Date: Sun, 15 Jan 2023 06:06:55 -1000
Message-Id: <20230115160657.3169274-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

These double calls tickle an assertion in decode_save_opc,
and isn't efficient anyway.  Introduce a new helper to do
exactly what was desired.


r~


Richard Henderson (2):
  target/arm: Introduce helper_set_rounding_mode_chkfrm
  target/riscv: Remove helper_set_rod_rounding_mode

 target/riscv/helper.h                   |  2 +-
 target/riscv/fpu_helper.c               | 36 +++++++++++++++++++++++--
 target/riscv/translate.c                | 21 ++++++++++++---
 target/riscv/insn_trans/trans_rvv.c.inc | 24 +++--------------
 4 files changed, 57 insertions(+), 26 deletions(-)

-- 
2.34.1


