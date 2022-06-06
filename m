Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12E53F2C7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:51:51 +0200 (CEST)
Received: from localhost ([::1]:40566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMVi-0000YX-OV
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwX-0001li-H4
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:33 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:53229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwV-000447-6J
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:28 -0400
Received: by mail-pj1-x1034.google.com with SMTP id gd1so14090160pjb.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yszfsMGCxq62CFp+IuNJi0VUsTY6h3zOtZ6pNIbgh1s=;
 b=EhgXDpCpwoQJ7TQMei7ACzYjJbKzD8OXUePX5DTft4Q8KxTF9F1mXPD8cEJHORodH/
 EA6+9cPBfSk4pzWEtABJ82WgAozCEkab854FaOqmihHiMdhkkaThfAazr03TXjtYNaRX
 S0VBoMpXgOfVJFQ8eyJUQNBLGNcepu+XDEH+LZkqvbUe07fpE3qE+eXRJTfRAtks1b3w
 3n+wyWm2HUec+Y21wJSmLLlpgXI941yWzCKhAk2thyo1otmeyJWnQxwbBl+nNptP2ZqX
 6KrkyxgCmLGVsGXwInyqsSeyjRNjdB+d3AwxKmtYLr+mJ6sotTlmPIwssMBfgjOkIjRW
 xKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yszfsMGCxq62CFp+IuNJi0VUsTY6h3zOtZ6pNIbgh1s=;
 b=t37c0LJSxPz8If8mySiPiDiGf8GPJN/L32B7nd9+PcrlaZ4PoKPAYRgMM+QRSUE+q8
 V98BSlntThxCHN2qylkwm3kZ1MkMy/tqr8z6/UCxecPolf48Q3dIq+jxpIYAQlbPy2Q9
 mE1dTkfVDEKNsvlpYNyQdZ28b4To4ZJrBGzeUhlux50u41gJtE1ViLaazw8Rx6e7LYct
 CN3JXtXdSZaBqBLptvktRtcUTi1843nDALGWPC/ivHH9JNI0R3UrJUIHnR8vHW/QdDMp
 iZWhjWPn07gVnRz/Kare+c3XDDLTu0VSXdfTuGvPd+Kd9Eio4VENQzSKsGlnoF26JCAj
 vDwQ==
X-Gm-Message-State: AOAM530YEDQj9wcLmQsIKHdv3Ygw/JHNpBTIQzZRLCYjn81Z44LgjnNZ
 ooLSyZsbMTDEERYq6QrZqLqoMvEE8UqUug==
X-Google-Smtp-Source: ABdhPJwUm3INfY30I1wQZdbL/J9YUciPiRYYOc7wZd5aNyeLh7FgZOCYqNI+L3U1Y1TcR2cxhAtgrA==
X-Received: by 2002:a17:902:9a07:b0:161:fdc3:3b9d with SMTP id
 v7-20020a1709029a0700b00161fdc33b9dmr26217608plp.94.1654557325891; 
 Mon, 06 Jun 2022 16:15:25 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 36/43] Enable common virtio pci support for LoongArch
Date: Mon,  6 Jun 2022 16:14:43 -0700
Message-Id: <20220606231450.448443-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-37-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/qdev-monitor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 12fe60c467..bb5897fc76 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -60,7 +60,8 @@ typedef struct QDevAlias
                               QEMU_ARCH_HPPA | QEMU_ARCH_I386 | \
                               QEMU_ARCH_MIPS | QEMU_ARCH_PPC |  \
                               QEMU_ARCH_RISCV | QEMU_ARCH_SH4 | \
-                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA)
+                              QEMU_ARCH_SPARC | QEMU_ARCH_XTENSA | \
+                              QEMU_ARCH_LOONGARCH)
 #define QEMU_ARCH_VIRTIO_CCW (QEMU_ARCH_S390X)
 #define QEMU_ARCH_VIRTIO_MMIO (QEMU_ARCH_M68K)
 
-- 
2.34.1


