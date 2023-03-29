Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0F6CF41B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 22:11:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phc6W-0006F6-Fx; Wed, 29 Mar 2023 16:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6U-0006Eo-LV
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:06 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phc6T-0007nQ-3h
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 16:09:06 -0400
Received: by mail-oi1-x236.google.com with SMTP id b19so12542989oib.7
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 13:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680120543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YfNt9a+VvOzDqP6yjzhOP38izmUec3v90DzjLwl4ayI=;
 b=M5BIr0ibSPNnrvjc1iVmQbT7CssENik71DayqW+iqwznodbPFoSgHAdXoqu19M8xyw
 TFlKqk+BAgGqtw9csI0yjTRsAadAAjuMQcdll1MRngjjeWNj1tNQaaKgJsGEwCN66/QC
 Ble3JWiVnI8DK9PBTBOLJ3FgXcCk03JCVqRnLR1q+aD//eNF1qVfXFJJeeGPZ0cRDYQP
 Suw2hlcaLFoP+zjMHs2UCdMFC6elkgSNonvoEns4OHDv/up6y/SY9A0cxY4A4r1op3GI
 0OqpShRMncSCptMaCQdyV/ZiYi6U3tnitq9w7Zn+OMmtg9F7Yc81XxzSCZDKMHcUPdBB
 OuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680120543;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YfNt9a+VvOzDqP6yjzhOP38izmUec3v90DzjLwl4ayI=;
 b=TnOTSBbn/LR+WZrX2QH7QQRpRs6bf5aqvp+l+8RxmmhU32bIA1t5t8ehUQpBqnnXDD
 z6LPoU8ZJFGIwck3GTj51ySZrqsOvVnWIsYbeds4BDxBdncTlIgMRvIaddegJh3SeES/
 p0G21BU7I+bCkscK2j6E6a7TzaZUa0j5unMQVYpHALOyGoGAAbtOSyljOHIWbpQlYALX
 xDT8ioJRTpDmvZI0Dqhy3ktj8b64y1nZWu1btE3N3iByeJL30IOc9d0chqJJ654Wrcd3
 S6+iwoGWgsCa4mcQA3Bxudlc4g6RcMquIdACVlzaXOottzMdm2OsLr+YrT41pxggeEAt
 ZfUw==
X-Gm-Message-State: AO0yUKWq+OdvCAu1J1vWP8Px7fwYsWyPEgPEsHLSrwE67NB1Mb1kheZ5
 ywRGCvPvjoMKPs38TFx3SzT4JRNX0w8DIhhQMyI=
X-Google-Smtp-Source: AK7set/75eiKRFzFQU7+R4F6NsvbD7+rKJDGPewDUXpwHD64CjL/cKs6XN3cZOZ7AcrY105FVz5SEg==
X-Received: by 2002:a05:6808:3cd:b0:387:5e03:5b48 with SMTP id
 o13-20020a05680803cd00b003875e035b48mr7959790oie.55.1680120543476; 
 Wed, 29 Mar 2023 13:09:03 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 i206-20020acaead7000000b003874e6dfeefsm8195182oih.37.2023.03.29.13.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 13:09:01 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v6 0/9] target/riscv: rework CPU extensions validation
Date: Wed, 29 Mar 2023 17:08:47 -0300
Message-Id: <20230329200856.658733-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi,

This series contains changes proposed by Weiwei Li in v5.

All patches are acked.

Changes from v5:
- patch 9:
  - remove ext_ifencei setting from rv64_thead_c906_cpu_init()
- v5 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg06740.html

Daniel Henrique Barboza (9):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()

 target/riscv/cpu.c | 330 +++++++++++++++++++++++++++------------------
 target/riscv/cpu.h |   3 +
 target/riscv/csr.c |  47 +++----
 3 files changed, 221 insertions(+), 159 deletions(-)

-- 
2.39.2


