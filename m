Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90A480F0E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:53:41 +0100 (CET)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2P5w-0005pi-Aa
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Onj-0005X5-Jr
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:51 -0500
Received: from [2607:f8b0:4864:20::531] (port=35723
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2Onh-0004i3-0P
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:34:51 -0500
Received: by mail-pg1-x531.google.com with SMTP id v25so17328164pge.2
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a/1SK78VzpiOsgr0EBerUPE1kdvcozJbIunlylc+UAk=;
 b=bCs+CeJbVHGEho0BUU7WG63NFsmGGn00dX3t9gtlAhXHE4Fa780nRISC3ahAYXQ54r
 Y2yoGCN4XOSXsgyd9wBOOJC6SCiOCD8sNhD3t3qH4uo/ft5LpPxHz3m7Qg+jWPaRWKgF
 zjvICLC1KA3btAzxffGJMSFELh5/sH5+bCYh6yPkHUiDsoYm3+lB6atGZ8B3DlEtBJXV
 dN8e59+cBzb3JoajbDD6EXjnPDi7fFtNMvXdlcXTVal1Fb5f94RBAyw+R30PbuMYYYW/
 AZqKWUu0E8STmKe++x0r5P8uraPxxhL9xi9bydvZBTjaeFqS7ip63+AvpUdicFXFlLHi
 gEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a/1SK78VzpiOsgr0EBerUPE1kdvcozJbIunlylc+UAk=;
 b=hNxAoG4PkdI9z6B7gpFR9ndgFNXAYs53pgXIGBxjwhs/sFUdkHpY/skWS9rs0oJxTk
 Kt6HROktzhIyWHduudEjApNdwcbH2IvLk4mbwwzH5DeiactcR1uATmzptJx+VXanC3T5
 L3ehVdbf5yPN48LNKxUTw0jDSgUp7QGPR6Rlyn9KhVnlSBhI0tRmB0STWR1PrcLgswa6
 bPkocnKYInL1IuEgriUIbOUUHFCmV3iKvmXueCKOtwT4kCKwNpYAvk8Fv/h/PK3B4ZSh
 ChJOKFSQ9coGQjl6KGt+3J6bUiJc9MupWHFLTg4YAd0LRj7sxRSIdjN3/LF9V6TfBPzl
 8vww==
X-Gm-Message-State: AOAM530A4OCvnKjj5DsPllH/6CJCNitL2sJuBn6hPQ0+qHezrmk/8ATk
 aKeP3eSusZGJBwiNgun1xT9wtbaYXB1D2DEX
X-Google-Smtp-Source: ABdhPJxE0ll9A/q8pfh+diU7JBk/vtbtZPvydJwfrY4yS5rUHb2uIZggWOI/uphw2ljKmjVoUWWmeA==
X-Received: by 2002:a65:6716:: with SMTP id u22mr21557056pgf.414.1640745287585; 
 Tue, 28 Dec 2021 18:34:47 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id m3sm22613635pjz.10.2021.12.28.18.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:34:47 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
Date: Wed, 29 Dec 2021 10:33:44 +0800
Message-Id: <20211229023348.12606-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229023348.12606-1-frank.chang@sifive.com>
References: <20211229023348.12606-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5e98860a09..2b54c64f56 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-- 
2.31.1


