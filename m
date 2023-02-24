Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C575A6A20B1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:47:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVc8X-0001lk-4S; Fri, 24 Feb 2023 12:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8Q-0001h2-0W
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:45:30 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVc8O-0003b3-9A
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 12:45:29 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-17227cba608so311236fac.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+OnNfeuiwGlnJ89jbTWsgHWPA0/Mf8xBENtahjo6Y8=;
 b=Iu6I7EN5TvKrlFAygxxe7K4USXeVB7eTmp8ydQ59eLxcYs+rfN8fYA/6Vna/+AHrHM
 Iw/PO21aBuKcl3dPFtNuWsAcaiTBGLZ2Dh0RoqNfJ2AJ8Q56ibSKevayNaoyYwmUAf9c
 6vNZz0pj52Pwj1bOP4xaXNHA/1I/bZE7VZYFUCCQAnbPyYLCW8NqConomaHZOsMjggkX
 qoiqIjS0xiQXYUw+W7ZpZ/hRoeSsAvtyDK+6aRQH7VROqA0rxnIp89P038eBk80GhSLH
 nWxa/5UY2b25EcRV1s/vFeUc/rKrwSSYJkqw2OM3+KZbGRknPRNPIyt+sdmW6CvUjmdi
 yJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+OnNfeuiwGlnJ89jbTWsgHWPA0/Mf8xBENtahjo6Y8=;
 b=VO5fneXMamVd0JaZvs1fT9AntWYTxLNyBt28KlmZ2Mdh8SbdKEASUw+L/nMD/ruzIx
 AXNWLaV6AwZFauI/QzbTxmd+rVOzBdmjIunhVn81X4j2YBRwCE8NEiHmxkOeRRJkOW5L
 j8CazSzlwYUE8T34WCNznmv+M/FvlJdsr3nkgwPTBI9cOcupHbUgXc7isVLcn16WomTW
 8/W/RBf2Uw/BQPqywzsChGAxSZO0LuDVgh3+tHSy2u+vg7WR0DOA3ZIPWZNOhqqJ3eEN
 Ag6XiBMGbA+hIdN2R3IsqAAzJB7QZs/P7Q4mPiUMMAQJJIZWxwf04k1zAsZvAmma9t5b
 MRTQ==
X-Gm-Message-State: AO0yUKWoqAIJNncLxurD7CInL54M7OOYISBftEzaQiou6Xy9fOmrTW+A
 4DQY36g83IWuImPd7Q4uyTy/fppeDtJWtQA1
X-Google-Smtp-Source: AK7set+DBMaP/6oM1C1dXrojg6XgD1VA+qDv/gAUvqu2oERUUVuZ8EVYQcI6FgJ0d6aEHysSCgLuBw==
X-Received: by 2002:a05:6870:912a:b0:169:cbcc:25c0 with SMTP id
 o42-20020a056870912a00b00169cbcc25c0mr261177oae.14.1677260726618; 
 Fri, 24 Feb 2023 09:45:26 -0800 (PST)
Received: from grind.. ([189.110.112.117]) by smtp.gmail.com with ESMTPSA id
 zf48-20020a0568716ab000b001722c5625e2sm3604123oab.7.2023.02.24.09.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 09:45:26 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/4] RISCVCPUConfig related cleanups
Date: Fri, 24 Feb 2023 14:45:16 -0300
Message-Id: <20230224174520.92490-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
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

Hi,

These cleanups were suggested by LIU Zhiwei during the review of the
RISCV_FEATURE_* cleanups, currently on version 7 [1].

These are dependent on the patch "[PATCH v7 01/10] target/riscv: introduce
riscv_cpu_cfg()" from [1] because we use the riscv_cpu_cfg() API.


[1] https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg06467.html

Daniel Henrique Barboza (4):
  target/riscv/csr.c: use env_archcpu() in ctr()
  target/riscv/csr.c: simplify mctr()
  target/riscv/csr.c: use riscv_cpu_cfg() to avoid env_cpu() pointers
  target/riscv/csr.c: avoid env_archcpu() usages when reading
    RISCVCPUConfig

 target/riscv/csr.c | 90 +++++++++++++---------------------------------
 1 file changed, 24 insertions(+), 66 deletions(-)

-- 
2.39.2


