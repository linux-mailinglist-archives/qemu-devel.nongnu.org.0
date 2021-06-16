Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBAC3A9AA0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 14:41:35 +0200 (CEST)
Received: from localhost ([::1]:40242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltUrO-0005ce-PR
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 08:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp7-0003bR-UF
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:13 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laramglazier@gmail.com>)
 id 1ltUp6-00068b-9m
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 08:39:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a11so2495736wrt.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yw+7KdkzLLTeR8d5Ao6H2sYkTqC/b9EjKAx5tR0qMTQ=;
 b=bXcbdi/q0nyBAumAjTTgZ2G6Tbv5HU+JpECYW+uwhKgeYOUlc0eeF0B+tyJ6kLTKMn
 cL6mbE5bI7cKCzreci9OpOEFKePhIy1e4PvIRQBbi6W9qVaAhK6h6rwt7OT0HoCudIQH
 r7Jahpgq660RM5CM8IWGfdmoBdQecrNxzuvTAzugc0ZERmXO5oKBp/Bw5hTOFg4nVfwa
 ImdZDxum82AJHmN1QCPoj07VF48Ny3IntwCL60blUsyZIbQ2jk0/fEZS5oxCzY97+kc6
 lo7tJfTWHeLih6zPNZaRKwg8dfyVT4wkZeamX1sQrZvOWAWJyPOlIxNf1C7qTLjmubop
 DhAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yw+7KdkzLLTeR8d5Ao6H2sYkTqC/b9EjKAx5tR0qMTQ=;
 b=D7MF7LWksEedkADxOPcg9wqZf1HAghDVBW028Lnz/J/smJ7IHybpiolZJzrLB0UHNl
 7xyVHEv2xKizzVGo4tXnPKHSfDIndpnvW6+VLYTpZ3CkE25XNVs5j0IYchayQmuArAdp
 5RMVZjozahCgcdICGWRueQwlAfhGw4jntxWmbViO/bOZGcPemuMPzz9gxBA4sOA2jfV5
 S0uLeZH6ZVSaoDtIhTohRsiwPrScr1PhJjVWUQOoNe9yWttfDciaznGOcRd8TXr8FIEG
 tRPIDxYpAKbPBfsPMWfl0tud3Jg101LVvG0M29Q542jUn0pwZX6xdTSsP56PrHi2kBAo
 z4bQ==
X-Gm-Message-State: AOAM531vA3hFxo/uJ0l5KMYryv4ldAtuSPfLDOigNT16t57rrbAULy/c
 FyYGusLDF8dxbYaQycrPqDiAg0+VYlXJTA==
X-Google-Smtp-Source: ABdhPJyEv6KgZBBS4dZ1OcN32KeIZkkAF3hNF0KtP+T3KJ0lyw8n3rYfP3ch6nX8tR21px+eD5ys+A==
X-Received: by 2002:adf:e445:: with SMTP id t5mr4079305wrm.191.1623847149727; 
 Wed, 16 Jun 2021 05:39:09 -0700 (PDT)
Received: from localhost.localdomain ([82.197.173.73])
 by smtp.gmail.com with ESMTPSA id c12sm2330273wrr.90.2021.06.16.05.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 05:39:09 -0700 (PDT)
From: Lara Lazier <laramglazier@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/i386: Start fixing kvm-unit-tests for svm
Date: Wed, 16 Jun 2021 14:39:03 +0200
Message-Id: <20210616123907.17765-1-laramglazier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=laramglazier@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the APM2 I added some checks to 
resolve the following tests in kvm-unit-tests for svm:

  * vmrun_intercept_check
  * asid_zero
  * sel_cr0_bug
  * CR0 CD=0,NW=1: a0010011
  * CR0 63:32: 180010011
  * CR0 63:32: 1080010011
  * CR0 63:32: 10080010011
  * CR0 63:32: 100080010011
  * CR0 63:32: 1000080010011
  * CR0 63:32: 10000080010011
  * CR0 63:32: 100000080010011
  * CR0 63:32: 1000000080010011

v1->v2: introduced cpu_svm_has_intercept to avoid defining bitmasks for 
        intercepts

Lara Lazier (4):
  target/i386: Refactored intercept checks into cpu_svm_has_intercept
  target/i386: Added consistency checks for VMRUN intercept and ASID
  target/i386: Added consistency checks for CR0
  target/i386: Added Intercept CR0 writes check

 target/i386/cpu.h                    |   5 ++
 target/i386/svm.h                    |   2 +
 target/i386/tcg/sysemu/misc_helper.c |   9 ++
 target/i386/tcg/sysemu/svm_helper.c  | 127 ++++++++++++++++-----------
 4 files changed, 93 insertions(+), 50 deletions(-)

-- 
2.25.1


