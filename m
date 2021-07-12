Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF433C5F9B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:44:22 +0200 (CEST)
Received: from localhost ([::1]:43606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y6X-0003If-U3
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2d-0003zf-VD
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2S-0000uY-OG
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:16 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso220303pjp.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXN13A+EVZfIbPM/1TIJvsr4KsfxBAPJnkVnda2aJXw=;
 b=n+wppY5leLz4nK2f+4e4tKJFIwD+DcFF4kZ58g488gEEh8rScuvhwfpD4wMxQOHAg+
 LRVuCbYJvtunb0AgVA6wOTBSwIW3Pl5eFTfSUSgzVrTcGxqOc2eHfLpSEMElYK4g/5Ut
 F6L7SoTsb6j4sflRKtM4HzHShFEkZNFS9hkSAw4eiLTh5GkgxtaRPotkK4lxgyl6iGv7
 +JSS0awY16VjGfsU7rtWcgL8pBlR1Q39f9yO7ZGiwfLvPSKJHtNePe11MZzUUMDHJq+f
 0CcSAolZXTVKtgcqKVByzMoZ/JwCREiCFM5alCBaCPo6La3S46GwpLD7cgCwGdyZ5YGH
 1+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXN13A+EVZfIbPM/1TIJvsr4KsfxBAPJnkVnda2aJXw=;
 b=VifruAn8vefmY7PBPrECR+cSAdjxpt8JMf0XL5vtoYKF8xMovINwYIaMp6psxtyqzF
 /w9IU1gv3tdMsQTHJojrQ4omNSYbG9FVv2o8UdlCSWqYmRQUxrNE2IlNKjNLVKG8EGSK
 KTZYvuAqN974SicEFFTfhcoDbFLv7pfOoh+6YgN3XqCgYc/ife8DgZGupoRaHkqZ9JJC
 slL2Kv7oJlt4Cq4ord+drOR0xuLJ866JlN+QITNq7/Lk9gRPo/1B17sOjdRmJvbYsAfW
 SvTj4XKpMTuIk4JfvWh+62PJGJDP2af7apTU03zCAnfl4dDdZ3/myNtoao8301muwZxV
 dlpw==
X-Gm-Message-State: AOAM533nY5kt8RhojuGhklCeVH7URgw4C12iBJl7zxjbbnQQNjzS1kqy
 xHhyM/MVPGpnVFaMwkn3i3naj8bgcxeU8w==
X-Google-Smtp-Source: ABdhPJxU89mwi2pP7PdV/+qNsMMXknXaDE/IDGOHzkVtNNwXgacbP1dopWbNpO0TLLQonKTNtM/PHg==
X-Received: by 2002:a17:90a:17ad:: with SMTP id
 q42mr14861669pja.181.1626104407370; 
 Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/10] accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
Date: Mon, 12 Jul 2021 08:39:58 -0700
Message-Id: <20210712154004.1410832-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of suppressing goto_ptr from -d nochain had been
to return to the main loop so that -d cpu would be recognized.
But we now include -d cpu logging in helper_lookup_tb_ptr so
there is no need to exclude goto_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d3232d5764..70ea3c7d68 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -150,7 +150,7 @@ uint32_t curr_cflags(CPUState *cpu)
     uint32_t cflags = cpu->tcg_cflags;
 
     if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR;
+        cflags |= CF_NO_GOTO_TB;
     }
 
     return cflags;
-- 
2.25.1


