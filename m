Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E76A13F3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:46:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLGj-0003Hx-Tj; Thu, 23 Feb 2023 18:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGe-0002xb-1M
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:53 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pVLGb-0001KY-3T
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:44:50 -0500
Received: by mail-oi1-x22d.google.com with SMTP id q15so6372781oiw.11
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8I3/loqCXLPJq7Ot2kL3eJ1UPZjr/7NB5ZYHvYcxs4=;
 b=imujGTV38KanAbz+1syHxNbF7Vn546Ubi4yOTuN9p25GAxwMzcZUkuVUc2x9Vtx4Q4
 A2ZIiDseVxZaK8mB3ZGBDB9UKh0cQfoJGZuKSzU0/sLccPbyj6YSz3un2RFpeZlx96aa
 330GnM3rhcON7Wl+WfVpeXjnNc+gtysvIioUbxLscqcUGNLwKkw1qv9KJ8dJwBZEKpUq
 K2/DVO09KnVZXEhewnrq/FqmD0tSKmYfRsnnaUd9JqMZhiUxxGYKwYIvNxGtE4LGJooN
 UoyF3QdfwNOpQGaZL8S049rfEXR9gXjIw8pMjXE8fNzeY+II9L/4jSkrPnEEp2EWDB+T
 aSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8I3/loqCXLPJq7Ot2kL3eJ1UPZjr/7NB5ZYHvYcxs4=;
 b=nHngbZhTxcjpEf82Hp+5OYl8l27CJN+kzPsK/9EtRk71TzayEbRXIzV9HtKpORXejt
 MSZIeIZripUWdN2IUPwfxLwdAv/VOqVhKtwtwQYly1v/7+sJQdT7iFP4BrPw3lieUTGn
 bNvWWSYLR/5HwZAr5KzdUJfqTKZSoCHdjAXbuO81Y7lPqx35T24EJztLG1wga9pQAe+q
 OOo7IuoXSu7tPw9hCZzm6a1ZvWfNsjWJY0zBAFXkvC8MBqeULnzMtmNdcNWYp663p067
 +G8i2/ZJazciX59dEwDvNPA541d+aewzS68a2/9UXMEZvZEVz+eo+ChKoOhF9rz3IK4a
 AWZg==
X-Gm-Message-State: AO0yUKWIcQnwYScW6wX5fJKn4NlUUXiU1xeVUogRz1tS5Ny4WHpPS1uR
 DuqRKE0F7WzT8GBW9LRLCagmpVii0oRvuNmy
X-Google-Smtp-Source: AK7set88f6pzFSx0pk4VL/FFSoXGpCHrk0NAlGC+mBUzJ4RalCNjgoZYMuW67wBAnB+VBHT1HeAL6g==
X-Received: by 2002:a05:6808:4089:b0:37b:2977:4889 with SMTP id
 db9-20020a056808408900b0037b29774889mr3102154oib.52.1677195887601; 
 Thu, 23 Feb 2023 15:44:47 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 v6-20020acaac06000000b0037facb2c5fasm2415037oie.1.2023.02.23.15.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 15:44:47 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v7 4/4] target/riscv: add Zicbop cbo.prefetch{i, r,
 m} placeholder
Date: Thu, 23 Feb 2023 20:44:27 -0300
Message-Id: <20230223234427.521114-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223234427.521114-1-dbarboza@ventanamicro.com>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22d.google.com
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

From: Christoph Muellner <cmuellner@linux.com>

The cmo.prefetch instructions are nops for QEMU (no emulation of the
memory hierarchy, no illegal instructions, no permission faults, no
traps).

Add a comment noting where they would be decoded in case cbo.prefetch
instructions become relevant in the future.

Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Signed-off-by: Christoph Muellner <cmuellner@linux.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32.decode | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 3788f86528..1aebd37572 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -134,6 +134,7 @@ addi     ............     ..... 000 ..... 0010011 @i
 slti     ............     ..... 010 ..... 0010011 @i
 sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
+# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
 slli     00000. ......    ..... 001 ..... 0010011 @sh
-- 
2.39.2


