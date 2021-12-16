Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8E47696B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 06:23:42 +0100 (CET)
Received: from localhost ([::1]:58794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxjEz-0001LB-0I
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 00:23:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mxjAK-0007rU-5X
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:18:52 -0500
Received: from [2607:f8b0:4864:20::436] (port=37851
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vineetg@rivosinc.com>)
 id 1mxjAH-0002cn-Ll
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:18:51 -0500
Received: by mail-pf1-x436.google.com with SMTP id 8so22652948pfo.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 21:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/3ih0jQP3bVdDSUp6/JrmQ/9EepiccfZebbj0OoY6T0=;
 b=JEv/j0LOdoGKeQTM0dIYOSP88BKwoPLmLW7ffSgy4DoT6W+IAlBLEsRwk/ixjVYVpR
 9q+5DlSpWG+f8BCtdvoxT0lKOk9McNfCvcns4MSEYIfpLb6eQVD5IE0dfjsJqmp3KqZ5
 zZR+0wm0wR8/a4ii80u2XQWW8eblV6nlj91agrLYNZQ1HeIvzPdjl9nyOTtd9lbmkyAe
 y57KEgEKyEKCLCfuBwXXT2Yl/Wx+PI7fzerbBREbMkSE7bLDObV12TSSnBi763qNHiv7
 dPO87zIgJKhah6MtQuMYPpj8ixHUVrDrY69US6JdizIC3PeshfMR7scik2oy9AuTpDn6
 RNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/3ih0jQP3bVdDSUp6/JrmQ/9EepiccfZebbj0OoY6T0=;
 b=KynZOuB91mVegpYoHVSWeBWoBpA2P2RsI3P2ZCRHBxOnKMjYGEArtp0CLMeauAy9JI
 kMr0lrXBcurQPmiQXR3xvWCXirmXz//iytcvVknIL7YBXR7XmA177zrRfCWHEpBUf05n
 vmcvQrYCGxj/KNGYGbcZFn7CJdr8DRJFUPm6DYFlWfrWQAWoAAm/CMaVsiekSevsh6VD
 evNuFNSi4GdAqE3rm0Nz4HUM/scI9ISWtM64fwlFyZbQ2/QtVgMd8gzyiZ79174dfP1q
 khOG3J36ti2YpbQi6FEEdMf0XKLllYCOiSETINFkwj/eoKHka+DQI5j1Js/hhmx7/WpX
 pBAg==
X-Gm-Message-State: AOAM531dZx+NQwFoLpT7Lq8RRAZ2g2+/I0y1G0e65P04s+I6jjkIB10B
 bnO0d9avITLRWDjLUJXUTBf7oCi1tQ5RXNIE
X-Google-Smtp-Source: ABdhPJznXifEgc1J9fFnvBpwHpyrzgvH+BvMB/R1oZufiTh3P6BMaZWF8uHqB7sDbBiTjJ074WZu8A==
X-Received: by 2002:a05:6a00:2134:b0:4b0:bf74:a64d with SMTP id
 n20-20020a056a00213400b004b0bf74a64dmr12625486pfj.56.1639631927469; 
 Wed, 15 Dec 2021 21:18:47 -0800 (PST)
Received: from vineetg-ThinkPad-X1-Carbon-Gen-9.ba.rivosinc.com
 (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id n15sm3961785pgs.59.2021.12.15.21.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 21:18:47 -0800 (PST)
From: Vineet Gupta <vineetg@rivosinc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Enable bitmanip Zb[abcs] instructions
Date: Wed, 15 Dec 2021 21:18:44 -0800
Message-Id: <20211216051844.3921088-1-vineetg@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=vineetg@rivosinc.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vineetg@rivosinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bitmanip extension has now been ratified [1] and upstream tooling
(gcc/binutils) support it too, so move them out of experimental and also
enable by default (for better test exposure/coverage)

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
---
 target/riscv/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f81299812350..c00d59cd04b5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -635,10 +635,10 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
 
     /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
-    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
-    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
-    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
+    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
+    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
+    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
-- 
2.30.2


