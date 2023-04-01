Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7791C6D2E39
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Apr 2023 06:52:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piTCu-0003r9-7k; Sat, 01 Apr 2023 00:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCr-0003qQ-2o
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:13 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piTCo-0003O7-Rh
 for qemu-devel@nongnu.org; Sat, 01 Apr 2023 00:51:12 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so25608113pjz.1
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 21:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680324669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EH536+i2nk5iE4kCFR7uLvByCyKiD9xDAloG6x5h4Xs=;
 b=XfOQwyPq6UAPn29ky+taPVmxqZeIW0yAqk+0/ho5bXOKn2FtGZcPFB29VCvvvq3mm6
 hFm/bIc7CIg1rEDPMEBQx/VR2NH4J2Ji8S34/ISPveNRI0Gx/Zd57qH8ePAya+79sJqD
 LhoMv1jKwlgq2QnK2i6w7PnV0sKt9yPyPQY13vrwizvLDmRH3boRW+me+WiWFwqGaF7/
 m7SfB+Oz0ZuPVgFSs1jA4IAuC8VXpXWIGN0Onhf0xRuzbNVFt3dQOen/SgcyiH0o5zJC
 309KafILezBuVt2arNfcDyUQdg5aRR17Qw5vX/EGiwwUkoVuNpD8l9sMCs0Ld1J+6o9E
 8dKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680324669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EH536+i2nk5iE4kCFR7uLvByCyKiD9xDAloG6x5h4Xs=;
 b=HgbdF4SAyJGf6RDCKscyHq2jPLn5JigZywoW77csjaJ//ekBB6Jq8DJswVHYm/JSRw
 iBb33EfPeEDQAmpGj4l+dts232ZuEor24HeSsS9Ok9P1EfRFs629AmeL4UADKkmw0zbS
 3JBP6rcTPuCKSJzeoLKMjHqOos2ezxKGEIMQRg65QLK4RPRSVYvWApwhwaCins05MUWD
 nw0hvx1bW3QdFLxl4oQlwqYvvqoqj3qy4SZV+vsMAQwxHI/VNgd5jC8q9o0olZY0h64K
 Gv0mDH4+tiOCXXHJoKpY5P6zT6pCo8v2xMq4OVe9NTm8ToF2AxVHHZfYjkFbsU4HuxXX
 k80w==
X-Gm-Message-State: AAQBX9c2EvsZ2XFgFR3jVq1wFE4jTUDqqKmuqqZXEnJ/FsWH6wGO9APt
 5dQi7UZN+LOO89WBmtwgWnuQyBHAN9OCIi1yZ5I=
X-Google-Smtp-Source: AKy350Y/8Tqj4sd70nckM/eunkK6rc9laNO3qaLbxd4NBxXMqm/B3kBqZy/pyk0F9HqRynond1FwHg==
X-Received: by 2002:a17:90b:3b4a:b0:23f:1868:94fa with SMTP id
 ot10-20020a17090b3b4a00b0023f186894famr32745919pjb.36.1680324669445; 
 Fri, 31 Mar 2023 21:51:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a170902ee9100b001a24cded097sm2360122pld.236.2023.03.31.21.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 21:51:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>
Subject: [PATCH 2/3] accel/tcg: Fix overwrite problems of tcg_cflags
Date: Fri, 31 Mar 2023 21:51:05 -0700
Message-Id: <20230401045106.3885562-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230401045106.3885562-1-richard.henderson@linaro.org>
References: <20230401045106.3885562-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

CPUs often set CF_PCREL in tcg_cflags before qemu_init_vcpu(), in which
tcg_cflags will be overwrited by tcg_cpu_init_cflags().

Fixes: 4be790263ffc ("accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Message-Id: <20230331150609.114401-6-liweiwei@iscas.ac.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index af35e0d092..58c8e64096 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -59,7 +59,7 @@ void tcg_cpu_init_cflags(CPUState *cpu, bool parallel)
 
     cflags |= parallel ? CF_PARALLEL : 0;
     cflags |= icount_enabled() ? CF_USE_ICOUNT : 0;
-    cpu->tcg_cflags = cflags;
+    cpu->tcg_cflags |= cflags;
 }
 
 void tcg_cpus_destroy(CPUState *cpu)
-- 
2.34.1


