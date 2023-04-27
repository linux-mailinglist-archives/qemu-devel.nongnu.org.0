Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C576F0D88
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 22:58:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps8g4-0002SU-OE; Thu, 27 Apr 2023 16:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g3-0002S8-3L
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:19 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1ps8g1-0002LG-FA
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 16:57:18 -0400
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-38e692c0930so4895755b6e.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1682629036; x=1685221036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kO0k5LSdWoZPT+FqERWzWtJIo942if97mBEDYjIGUyQ=;
 b=MU4ELkK/YUVb2ppNezxUG4jEfby5FyaOs4q+mRB8EvIol1PpYdEjeJRVNLWNjvVSak
 zn/ERJ6Y4FThA1FvvrndDr1MF7I11KF/Ag9yP5mRf3e5j2lr/Ol3+oaMTEZ5FOz/csXG
 GdJP/Zkfg9hKcFxhVfjZE01tLYqhh7S1vs0RpjLwm3B2tTiuBxK8uffIW2KDR1q39OJb
 CRq1SyUdnXT0ovnz053FXaW2sPrEUsXOD5dGp3WrmIJDzonkSBBRqNgKhzO3+p2i5Gh8
 qDI89WrUqwCGPrCGmv+FK30B1fTy9ioq1eo9K+0F6UCwis+FZIy8n5hIqarfASYdZaJZ
 vCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682629036; x=1685221036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kO0k5LSdWoZPT+FqERWzWtJIo942if97mBEDYjIGUyQ=;
 b=AjHuCSeIvFx3fOw9I8TQqGkjkm4ZPTtGBLodn9k1fq8/JbRLSaHrCEBWOKlCbm3jKz
 sIvFUtDaR4r6kEpIC9+Or3q8aWqlTKvWO/PZEqGl/1r5S9p02HE/QNtK0g7xzol6yqEn
 RexNBKiVrna+EexlFukipYQJZYZQTBMlsi2QlDZH6fNs55OyvRRjYxQO4OtcCxcaMoxV
 ROWwjPGFapk0Q6XW/4adcDIDQ4Ej5lb3FC0cHXWRDlm0loqe/BOPpVGsyXQzbQ5Y1//I
 vd7fayPOQXkTycnO+UfR0jxtCZuwNJxHFvmoMHZWkJtBbXYhQO23COSwGwfBQamEPHRD
 u4tQ==
X-Gm-Message-State: AC+VfDwO95em3B16+PJewCzA002Fvj0Z8aYu32jrWYOdssUEftCUnkpE
 y6dJCtTdyrgqlCg45wHK0dB+5zbLUZrBZgi6yRM=
X-Google-Smtp-Source: ACHHUZ4HCvU0lcZz+1kIB5ou1J/lclUlrHMbaKtDy2Nb7Krq7/A9RS/5xTEBJKJmy01CBLngHbx8AA==
X-Received: by 2002:a54:4199:0:b0:38d:f213:f97b with SMTP id
 25-20020a544199000000b0038df213f97bmr1453111oiy.2.1682629036173; 
 Thu, 27 Apr 2023 13:57:16 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 k205-20020acabad6000000b0038934c5b400sm4804225oif.25.2023.04.27.13.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:57:15 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/2] target/riscv: RVV 1-fill tail element changes
Date: Thu, 27 Apr 2023 17:57:06 -0300
Message-Id: <20230427205708.246679-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This series makes changes in vext_set_tail_elements_1s() to be a little
nicer to the emulation.

First patch makes the function a no-op when vta == 0. Aside from the
logic simplification we also have a little performance boost.

Second patch makes the function debug only. The logic is explained in
the commit message, but long story short: we don't have to implement any
tail-agnostic policy at all to be spec compliant, but this function has
its uses for debug purposes, so keeping it as a debug option allow users
to disable it on demand.

Patches are based on top of Alistair's riscv-to-apply.next.
 
Daniel Henrique Barboza (2):
  target/riscv/vector_helper.c: skip set tail when vta is zero
  target/riscv/vector_helper.c: make vext_set_tail_elems_1s() debug only

 target/riscv/vector_helper.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

-- 
2.40.0


