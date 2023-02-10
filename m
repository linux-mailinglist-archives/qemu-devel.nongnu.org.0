Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE21691FDC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTa8-0005Ln-LD; Fri, 10 Feb 2023 08:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa7-0005LF-3l
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:51 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pQTa4-0007Uv-M8
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:36:50 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-16aaa20f516so6706172fac.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BzjLMWk/zg5NIqlCYu8cQDO+fUx9cI+83L50z7P17cQ=;
 b=cNnhkcIFCuGHxL6bw8t3E8k8HS8HShH4D74l6t/aDvj1ckVtE1T11p2BeCybgnLl+R
 wcxixTn+lvReJCb6wL8UorjS6lD5f9UIMd00UXONbpsSo3vbPUDcus9KkT3g0zJEBTsT
 p35pOEsWGIXe+TQTokKMt43BqNkkbWeXAcHdQ6BWDYAtNsMjPp7fLmBGdl5Mv3BsL2mF
 i+5wxNJeVXrpNQrqHBB5noFtBNn3xDlkJkBUuy/iojqdwhHBMZALdmoPVzI2TJ+43/dq
 R18Ghq1SHZm2oy7kfl6VpFydNpf4p9fXiznMD4tLNvIGIvgshttz1QvJZIY6QdkDYvCF
 Htpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BzjLMWk/zg5NIqlCYu8cQDO+fUx9cI+83L50z7P17cQ=;
 b=Pl3HuRmOsGmWLwk7mY9g+FJnqHLJTdqwg8Mah9VX+/a2Uyl4I5MzTfBMwusIA94hsk
 JsCK5fyVG2cTj+jivn43Jpg1PXbGxyNOkK8MMviCMW7sfnJSCb11LENFX71dm8jlDMuc
 SyotB0vcPZeCVzcTXVPblgaVqffTqy15uEs6r8Gl2TWzBrvY1lybmA/wgqgmrUIJPA7A
 mB/KW6V0HMKIrz06hr5mDscrQL8Ikb8u6RqV6lXHSBor/o8nqK7qW8FxZJHSbbnQsjbh
 aJQkrPvdBlz0fw6eY2yic1zYpxF+/DS4CWc4k+WRa0InYGPZpxRfqL8w3zfEf0vmupQi
 GTXA==
X-Gm-Message-State: AO0yUKUPxpPcPkFCOasxLv3i8I2Lpc4XwoHNWpqqtkJXtKckeHE5jf9W
 oLzwKq6qRJceJ3Zzrea7YFrJHicGEWgD5dbO
X-Google-Smtp-Source: AK7set/pZZ3Dc05O/812dfl+LZ6S2t6AcwYHUVEwQMeGSv8YXeA0Xg/pXsXmnSjJpiBv1epeFIlIGw==
X-Received: by 2002:a05:6870:20b:b0:16a:839d:fe51 with SMTP id
 j11-20020a056870020b00b0016a839dfe51mr7972144oad.58.1676036207243; 
 Fri, 10 Feb 2023 05:36:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.125.138])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a05687050e400b0014474019e50sm1890570oaf.24.2023.02.10.05.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 05:36:46 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 03/11] target/riscv: remove RISCV_FEATURE_MISA
Date: Fri, 10 Feb 2023 10:36:27 -0300
Message-Id: <20230210133635.589647-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210133635.589647-1-dbarboza@ventanamicro.com>
References: <20230210133635.589647-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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

This enum is no longer used after write_misa() started reading the value
from cpu->cfg.misa_w.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 103963b386..6509ffa951 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -89,7 +89,6 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA,
     RISCV_FEATURE_DEBUG
 };
 
-- 
2.39.1


