Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02DF33E152
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:24:18 +0100 (CET)
Received: from localhost ([::1]:56306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMI6r-0007mf-Q6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqp-0005gP-LG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:43 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMHqo-0002cK-3t
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:07:43 -0400
Received: by mail-qt1-x834.google.com with SMTP id g24so27587qts.6
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iXb9BKT3Yzc//BOI+yvFmKmzMLx3jVzBVYijM2bLOWU=;
 b=FzWY50mQOZBIIayR3Rhco0DlF8EumFmVTCw+PA2z0rMMMa0Q6LmVpbQl7eWOs9PRLc
 vtDy4bGaEnds0NCkE+iKa07rzfFJGH5bPtC1de2F+X2M8IGDI2lKvEhHAnF9rDSZLYR/
 zgT1kVnAGzmEghYdJP03NUolyzSLnhs3H7YIgbvomv9oxCSxDDaCzKmrr2Axuulp22zr
 ThtASCVjBWwYxO65dLsvGLgrTtU72IrUW1meCsylCyz1Du9Ji1BR6StupqernjwDNDCa
 xUXb0IG9/1RguzcZTAb5yW0F7P/2M4Op4U4DqDhrFtSmS2UkFLB7le1hSWi6mzgoLtOl
 LssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iXb9BKT3Yzc//BOI+yvFmKmzMLx3jVzBVYijM2bLOWU=;
 b=iiSQJFZ17b4O1bJV7kka7lTg6wlWiakcnmXpg687xM23SdSTwpuSz3u8tApJLd9ocv
 27kGCIaRe/ULOLrmwjEzjsd3SyIMBFLOlMJOjRrsdjKNzF97n8P5Mv9WWP/aMjHV5UPo
 UaIhbwwg2S6Q6xRohIbhn5thUP8dx7vp/flNOL7w8E6IKI9KTBoExFYgX6bJSGFrunEQ
 A7k81I+2OyGX19U6p5mQZPqszJYsOWs8c/1NyyJMk6MzfmwGiIA3zxMSwD9E6tVN4/nJ
 9Vg7FqeZurvnATluHd89J1RiygNFV/gWy2vGKZa3VCF37Vawkm8kAiezpRMR7yXSAzkg
 zdCA==
X-Gm-Message-State: AOAM532e/4b8CeSDSgZLfWOzxksX38EreFb8byr0xlrNLR4bWuqD3q07
 fUjCjYF1Y+SlnG4DxeTQhG/2pJTHNz0UQUQ3
X-Google-Smtp-Source: ABdhPJxbvuKPs4EH6FY2No9EqqnOiBNJgwrphHNH3+6ze1HDhYn6tmKLvJmInQzCI2x8Of37dQtSEw==
X-Received: by 2002:ac8:5951:: with SMTP id 17mr1037298qtz.62.1615932461253;
 Tue, 16 Mar 2021 15:07:41 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n77sm16546918qkn.128.2021.03.16.15.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 15:07:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] tcg: Elide memory barriers implied by the host memory
 model
Date: Tue, 16 Mar 2021 16:07:33 -0600
Message-Id: <20210316220735.2048137-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316220735.2048137-1-richard.henderson@linaro.org>
References: <20210316220735.2048137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reduce the set of required barriers to those needed by
the host right from the beginning.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-op.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 76dc7d8dc5..c8501508c2 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -102,8 +102,13 @@ void tcg_gen_mb(TCGBar mb_type)
      * (i.e. !(tb_cflags & CF_PARALLEL)), however, even with a single cpu
      * we have i/o threads running in parallel, and lack of memory order
      * can result in e.g. virtio queue entries being read incorrectly.
+     *
+     * That said, we can elide anything which the host provides for free.
      */
-    tcg_gen_op1(INDEX_op_mb, mb_type);
+    mb_type &= ~TCG_TARGET_DEFAULT_MO;
+    if (mb_type & TCG_MO_ALL) {
+        tcg_gen_op1(INDEX_op_mb, mb_type);
+    }
 }
 
 /* 32 bit ops */
-- 
2.25.1


