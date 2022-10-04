Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD1C5F4660
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 17:17:40 +0200 (CEST)
Received: from localhost ([::1]:54992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjfu-0006nA-Mv
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 11:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidd-0002kN-H3
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:13 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:54187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidb-0004Mw-TI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:11:13 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fw14so5933877pjb.3
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=lLww2+diVPN7SicEKKbBpiNR06sABNlmBKfI92TdDl7sbTjgMLrE9W9LFPOK5D2d/+
 7Rm0iCJLuTJca0FrA/kYad+t4W5ZTFlJawFFSwHAxx99Qpq2n3u+bgwcNWPggyRqcHJl
 rnYl50xQi3s/S0WJu9txTHyI0CpaeERP/uMYryo1fi1qQrY8nn96ZnWkbQV6h08rTlW7
 EaSz4ucuqu44t3Uq5lP+SoMaNGBjD+f55bKyfO2RxpaB3U5RFOss1cwnlXS0NXWyYJLa
 StVJSCf36zXk8ZHVkX9JmfT017KiXPa8TXA6vgKV7w7xXsOs+5dQM0aq1Mazoyl3AbLo
 G53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pPZ5BGim//7jDbDR7RtfT/BbVdLxSz70QtZLu4dhW0s=;
 b=KP16B+6pWRMpYeg0r4FS+A/9uQbzr0APrALHofmYT/iDFrKEfLRei0xAn/lTkXpT3d
 qtt+vqg/HpWLiwX3jteThaxduPmRtddZJCPh/B3bYRmRrbQaDmHdXSkzyy2Qym7RdcE7
 cLo3a3uN9X9+eV4190jxsk/VbN2fp2Ze7MIy8NRyw5BqgF3/nIcUh709/4g6Z9Q7U/te
 FWkGplA/srXiXTi23REQY5scga7x9MjbtRfgCgn4JMFFXxjGEL0qbfGkrNFkvRO8IX8p
 3y61mZDUahOWK3rNh6mElyt7N6lqbou5chT5bKT2TioenF2HChzCzLd4IoZMCZw26Vkk
 Eg4g==
X-Gm-Message-State: ACrzQf3dsLY01/+8u19/0vfM7lMjwtY5GMjGeX6nYW66x9a8aHfAkdbT
 Q1Dh7GKaJ0D8BS5hBsVyCIV6CvWkbSPU8g==
X-Google-Smtp-Source: AMsMyM7OKdvswUa/glEmSGhdAICaaTLNd5hG7qSlFpx/ShITgBgh5AvW8Nvi/SlgWE7SBDb5vDQuAg==
X-Received: by 2002:a17:90b:3ec6:b0:205:eaa9:c79d with SMTP id
 rm6-20020a17090b3ec600b00205eaa9c79dmr17890987pjb.118.1664892670391; 
 Tue, 04 Oct 2022 07:11:10 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:11:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v7 09/18] include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
Date: Tue,  4 Oct 2022 07:10:42 -0700
Message-Id: <20221004141051.110653-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004141051.110653-1-richard.henderson@linaro.org>
References: <20221004141051.110653-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the target to cache items from the guest page tables.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-defs.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 5e12cc1854..67239b4e5e 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -163,6 +163,15 @@ typedef struct CPUTLBEntryFull {
 
     /* @lg_page_size contains the log2 of the page size. */
     uint8_t lg_page_size;
+
+    /*
+     * Allow target-specific additions to this structure.
+     * This may be used to cache items from the guest cpu
+     * page tables for later use by the implementation.
+     */
+#ifdef TARGET_PAGE_ENTRY_EXTRA
+    TARGET_PAGE_ENTRY_EXTRA
+#endif
 } CPUTLBEntryFull;
 
 /*
-- 
2.34.1


