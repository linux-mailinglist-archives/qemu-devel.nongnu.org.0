Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB56F51F2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:40:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6rD-00040E-Af; Wed, 03 May 2023 03:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qL-0002sk-Hq
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6qH-0001Nf-Vo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:24:04 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2f40b891420so4592326f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098641; x=1685690641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pETdULDQ5wVmC1hpPClhoopHjiyEI8tGTGOipI84kxM=;
 b=qdNw+Bl66wyt/s8wwMi3ccCPIfALuCOyDu+Wb/fGG/m5/ooEDXxS8Qn5pq4Rf1po/m
 2q4Nf0Gg/CWcFxrMpkP+uqXzrrCXUewGBX+QmKaj+weLEfVONmGnH/Fl/n6oj+FHrSYr
 d5tfSFGzVI1VIAJ+bFlGWxqB6FawYT3u240FEz4Iv+m+D10oHqZDGlkIbnhsIJOZRHyC
 TPFxRVaVMLlpK/9a/swiX0ZGc/NlVVN7ZIgtjIbX7KJbOv/TOrpwRBeBLItIsADky/el
 r0V3zCwYdtL9OgSQaRbUhtVGy0JGLpyocKjc8jS/Qwlfn9a6iXEtWBNtmBmNfV1FFR3c
 D/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098641; x=1685690641;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pETdULDQ5wVmC1hpPClhoopHjiyEI8tGTGOipI84kxM=;
 b=jUIduQhE5J3F00D/i69qGgFe2/4Fz8xv15G14pnLjzcewkx5PDJdfEqjdNZLGktPz/
 JlUbBEtQ3QsQysk+NDD5k8Od120IG2G62Ljv+7XRAgdpBgO0edvnxtNu2k01gX0yYfWj
 FnpAAKPlF6/fJANCCbSJ2iBdbhbOME4vmgV6/HGnObSUdFchTqsyIuKNkB1ZDl9QFGph
 P9uU49f9/S9idT2hw0duohQSmK018dZbpEzf1rcVcIrzY5Ndo+vALhGoDJQqD4BHWgTf
 f3kOa7F4zDzRMSTvAJwBmCJIWfrud3JP71bBCugVDPEpyn5qim12sXWnxCKHI7tvzvf9
 H5FQ==
X-Gm-Message-State: AC+VfDyMwRrj0RJ6ve/3bn9HlXL0PZnHD8JunB3uRemZ7t2USci5O+Gw
 YhLM4JVeTGCy+Jal9VjuD7CWaAGQKKnST26pELmpmA==
X-Google-Smtp-Source: ACHHUZ42rC9rBswVzJ9HBjIfchJcluXEg50DsuDjWDd7Dghnf+8ooE5FeehpC0yHl8jgHerD80lKvA==
X-Received: by 2002:a5d:42c6:0:b0:2f2:7a0e:5cc9 with SMTP id
 t6-20020a5d42c6000000b002f27a0e5cc9mr13171051wrr.19.1683098641150; 
 Wed, 03 May 2023 00:24:01 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:24:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 37/84] *: Add missing includes of qemu/error-report.h
Date: Wed,  3 May 2023 08:22:44 +0100
Message-Id: <20230503072331.1747057-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This had been pulled in from tcg/tcg.h, via exec/cpu_ldst.h,
via exec/exec-all.h, but the include of tcg.h will be removed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/avr/helper.c b/target/avr/helper.c
index 156dde4e92..2bad242a66 100644
--- a/target/avr/helper.c
+++ b/target/avr/helper.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/error-report.h"
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
 #include "exec/exec-all.h"
-- 
2.34.1


