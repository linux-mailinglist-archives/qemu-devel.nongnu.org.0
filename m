Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3731CDE3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:22:42 +0100 (CET)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC37Z-0004cE-ML
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32H-00071b-PM
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:15 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC329-0002Ma-Cy
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:17:13 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r21so13739793wrr.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N6RzNwKRNkNXeNEjKTeNz1uxxUp6u5ArdzgeljJclpc=;
 b=savQDzN/EaSX6fd4z31qAVrUFwI4l9TWh50jKk0lCJudSa2pRC5tqiOgY7IdgjsZoA
 NZXAxbJwOAE2ioV0gjf3IXOBRHsa8ckxtyEEYXLIY+D4HDmtrHZ0T8Hv1RU5uK1gLfCY
 xUCvsjTtJFV4NcptascvzFi2pZyH7LC9e5rZnZ596tm8pSwN3T1lFz7fi5DuQ8iqMjQG
 DizTfUu7HEPDVYujdjBH6UigdZYicQEMTGE9akA8v5Sgzf/Yx6RRVsqRG/ONWo004mzZ
 EadUSwH4pch8BxsflvENxkHYPlTXgGcIrcQA0KDJEvVzbDMnVG5R4SdxugtdB2u7zUi5
 7r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N6RzNwKRNkNXeNEjKTeNz1uxxUp6u5ArdzgeljJclpc=;
 b=VnCNauqGVoO4Mw3we3LRTp3OR4leQDLdXabOqWgGQP6ihuUx05QKahaJDcshl13PXN
 ETzNaGuP6LrqkUgdseYX/MbFXUUx9MlyqvA7FzTDMPfT1ZzgjTUfojJjDX9P6DLLSmuw
 RtxlGClykw5V5m6NyMh+hZo0CkB5VMk3jutrw6s0RDhC4aEsJZ/J2vcEC1Jtwc4sbThw
 5S6UWFXcTwhn7Fv8uWj9P3EUVTDVl8P6cchgAyOHtxaHeHWXhKrsXtjzPnALXXFH0bsx
 DaENuNpLu3Gea60rRRMic9TgLUhrjo5B4KvdRMlPKKDJ5UKm1hjsB0qOp2ic1XOU8p32
 4GNQ==
X-Gm-Message-State: AOAM5308h+02e7fHT1IOd2NmjvlGJLIReEw+1Szo0InDSwjQbn0phaqW
 57+a/C5frs7CbayfMCXDgl6FVZE5UZGSQA==
X-Google-Smtp-Source: ABdhPJwPNpnL5djIPhYKX7ioZ0WvLMCJhsf/J4M0FMNk3EuHoRa0kN7tfmF0JBhLB9Sn7NnSNIVQlQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr23963402wrd.329.1613492223877; 
 Tue, 16 Feb 2021 08:17:03 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/40] exec: Improve types for guest_addr_valid
Date: Tue, 16 Feb 2021 16:16:23 +0000
Message-Id: <20210216161658.29881-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Return bool not int; pass abi_ulong not 'unsigned long'.
All callers use abi_ulong already, so the change in type
has no effect.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210212184902.1251044-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 3f9063aaded..5e8878ee9b1 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -79,7 +79,7 @@ typedef uint64_t abi_ptr;
 #endif
 #define h2g_valid(x) guest_addr_valid((uintptr_t)(x) - guest_base)
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
     return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
 }
-- 
2.20.1


