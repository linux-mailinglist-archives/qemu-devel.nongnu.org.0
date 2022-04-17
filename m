Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B450492B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:07:25 +0200 (CEST)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAF2-00060G-Vt
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fP-0000R0-Lj
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:45891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0001ln-JT
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:35 -0400
Received: by mail-pg1-x533.google.com with SMTP id k29so15048831pgm.12
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t3O4FwVAwERrxw7kJMIjPWB5C/y+bt8i7O4EoSr3dFM=;
 b=BGy/zThqsHNB4U/IchcNkR4tdcGjTnzzCCv4J7WPowzg7kESRwkFYMZhh08PG3IV3A
 FsgrIKmI2Hs81xtePVIcwSCr1mtzyymps10F8pMdNndVU7XxRmhHcIWG3Tl/VtrgRSHc
 YoDH74SUwjOFW3qw67oxgUFAdUIaWIjzeioxcDLq38uY9HmRQYvmv+HIKYP2MgtyJ2dM
 y3ZPS5Ki7OpzmlQ3ug7OJYlPDMJBfujMJRNPQ0mUEWdLBjXhU+u71+nCTQtdvYuEhDI3
 roWHQTHWmwmk43Zzp3z8xAw41Xbtv9lFK7L3sdfkka8Zya6QIFVxg/MQKVaYy/m+jtiG
 Of5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t3O4FwVAwERrxw7kJMIjPWB5C/y+bt8i7O4EoSr3dFM=;
 b=qLHc5CQU8yhdHKHNnEz2x0zROYtdEcETbuka9sSSbBuxVu45vwv/QFkaATAja4nWLl
 jLwJPaNvIYI2J0pHdZoiOzGwlR14zKtZTbdn98N0y4dU6pz99+xXmEKSh2wi2YFlpdxG
 hxV1EtOM3ZA+abV7Fn8qJCdOa0bmtkxK6RfVca01ETn4x37IO68ByBy7oj8RFwpjcsu7
 DZlNWF6RoXGC1pRNdPIdoG1AfFKx1WJeNdXQ/U4TPQbuvYKO++y7KPFMuSo5Qpx7vife
 bYlcalYqDUgNaEGc7ueRUijOdXXX/xk6ai/ay6u1U7JKyRAlJgBfsof63I3Ziy9yQhe6
 rGZg==
X-Gm-Message-State: AOAM531/4wU7BA3ls+dKv0LS8SaE8m25eVuh0kLbyQ68KaxrLKmIufLs
 R/iCc+sNZUBnZj5J2eIQmzxPblwYIlRpvw==
X-Google-Smtp-Source: ABdhPJy7mQvCWtaF85ySTp244zQsv4xxDznGuciIjoTpiZ4+CVQjdlgago7hGm/0jrIKIBb9X7FPfw==
X-Received: by 2002:a63:2263:0:b0:399:561e:810b with SMTP id
 t35-20020a632263000000b00399561e810bmr7032342pgm.615.1650220232294; 
 Sun, 17 Apr 2022 11:30:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/39] accel/tcg: Use cpu_dump_state between
 qemu_log_trylock/unlock
Date: Sun, 17 Apr 2022 11:29:54 -0700
Message-Id: <20220417183019.755276-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Inside log_cpu_state, we perform qemu_log_trylock/unlock, which need
not be done if we have already performed the lock beforehand.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8a896e772d..931643a510 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -225,7 +225,7 @@ static inline void log_cpu_exec(target_ulong pc, CPUState *cpu,
 #if defined(TARGET_I386)
                 flags |= CPU_DUMP_CCOP;
 #endif
-                log_cpu_state(cpu, flags);
+                cpu_dump_state(cpu, logfile, flags);
                 qemu_log_unlock(logfile);
             }
         }
-- 
2.25.1


