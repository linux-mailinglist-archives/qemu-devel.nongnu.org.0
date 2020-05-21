Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9CC1DD3A7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 19:01:37 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jboZc-0002eD-BS
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 13:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboId-0003OB-F0
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:03 -0400
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:38348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <robert.foley@linaro.org>)
 id 1jboIc-0006a1-I6
 for qemu-devel@nongnu.org; Thu, 21 May 2020 12:44:03 -0400
Received: by mail-qt1-x842.google.com with SMTP id i68so6007140qtb.5
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 09:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0agZvpWq+VTT3lSSfcqtTtVkY6vnYs4TCtFCyM1LZ9U=;
 b=Vu7TfWhYT7YpBM4pDqpNjE3JWqId2aVu7IwM5hWvBpFC+CvBIQdAkzs71KoR51Q3st
 4uUIwR1alwOgrL2rPTE2puKSH5SnB/fwyPu+DmZr9FP1LXl5tGm43viE1uRg5It76ixO
 qwJjw9DZ0MoIiuEdGPP78lO3lTKGqHL+i40Yjh8+OMcEQH2NZMPidJGMXTGXwSaOPn2N
 OPjv4DLFC2gha2NrVdl0XO75RNqxANob/kST3NSgSkVGWi9sb9qqPfqj8dceJRy02J6V
 t6qgszSm/XPU5PTTsHw+U1GXnJZZb4arWhP2YChGftIFGGjwrxou+6Iy4Jy4e59i1oZt
 wcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0agZvpWq+VTT3lSSfcqtTtVkY6vnYs4TCtFCyM1LZ9U=;
 b=DBB8I/tCNG7yIAP5LEoGK5SeCaa8tFcN8h8TGDjXf1nqIMvXH/umvhVlU8+t5zJnO4
 dJrUjm5kWjvdoB6uuzjabZB/w9/INgG18+RFrGjKWEG8w6IfQGGFUl6To86UouOxjCJm
 Ll879bjWPQsy80bcZq0dV0Squ7/FwJ6PAZuZUYn+Bq5e1WYwiMNpJOExAuXkCDmNJAyu
 ABpc8CQ3j9TR/p/JQcqlEMM9jcuDhCpKRHYIVag0VHXEh0lLSRWSiyuOElikjAHw36NY
 xixeXXM/9q6ZtIjtA9Na7cGimxSvnC36EwwgmvN1HRDvsjcKTTYj15SMoW1q0Ns9/V3X
 oj2A==
X-Gm-Message-State: AOAM533JRfgRz9LXEYs5C6KGNkaCL3pSzH8VORvRk654LQu9XfFX/VTC
 HOnM3/xOOhsTi5QGNPTHVUTTvKBI3SyIyQ==
X-Google-Smtp-Source: ABdhPJwPQ7aTqhvtmmyLSpCGIq4Y9efLmXNVnFIndK/3ba+9rtjTl0EC6tqNpRnwJgAaSCvVznvqAg==
X-Received: by 2002:aed:2c41:: with SMTP id f59mr11618064qtd.123.1590079441493; 
 Thu, 21 May 2020 09:44:01 -0700 (PDT)
Received: from Rfoley-MA01.hsd1.ma.comcast.net
 ([2601:199:4480:60c0:1944:c530:655c:5583])
 by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:44:00 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 35/74] exec: use cpu_reset_interrupt
Date: Thu, 21 May 2020 12:39:32 -0400
Message-Id: <20200521164011.638-36-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::842;
 envelope-from=robert.foley@linaro.org; helo=mail-qt1-x842.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, cota@braap.org, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 5162f0d12f..37e039de06 100644
--- a/exec.c
+++ b/exec.c
@@ -752,7 +752,7 @@ static int cpu_common_post_load(void *opaque, int version_id)
 
     /* 0x01 was CPU_INTERRUPT_EXIT. This line can be removed when the
        version_id is increased. */
-    cpu->interrupt_request &= ~0x01;
+    cpu_reset_interrupt(cpu, 1);
     tlb_flush(cpu);
 
     /* loadvm has just updated the content of RAM, bypassing the
-- 
2.17.1


