Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E0579A60
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:15:30 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDm8P-0002jG-0W
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:15:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4M-0004vA-Dg
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:18 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDm4K-0001lQ-A8
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:11:18 -0400
Received: by mail-wr1-x430.google.com with SMTP id z12so21306405wrq.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9cayaFc8tQ7+xrReAxHB9jz1B9jTb17uFGh0FvMC508=;
 b=u5zDMWpldDwcRecedV1pWu+GkqLvWRSUaiWjV+TNkbQ1NLGBIbBHH4mq/42KWZNeB9
 neRKyclFbO4w94E9AwlgCJgjJrNTxiZgLgwQe+JS7FuSxdDxGOah5/rV78ag+KU2dpvT
 jrfaO2DWd/HoheVmGsbmKhvBun5L80PnsEV2nDTa5U8Zil8KUKhO3rKVlRe5xtQx0ljc
 /nSMdAgG9fo0E0BpJf3qKmSr50CmeekvSat8f7W0qIQQo2EOMOX1l0Zy3ICTRfovhNR+
 kj47YowsZdiKwWb9u8MmMpIDCuXD1ALoppCf0Cx8JfPP5zU3F/QqWKOu7UZnCxL5VzrQ
 cWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9cayaFc8tQ7+xrReAxHB9jz1B9jTb17uFGh0FvMC508=;
 b=ljY5GHizSwYXRJAqMVPwKs7teCDfzgU8TLdtQu7Ut8WNvB7F6Qk/L33hHJTQhIrgCB
 Ca7MFiAmAwW19twtI/7ArJ/pnGhJwwtvuQQrvISuTPbTs82GGseTy2SRqqObGeoI/shv
 6m3SIwH1spMfkXRjPmS/mLeojYnvPKkWnVuArSvNzp573bAG5JInRyMptZnf+JiamyIr
 vy00yn57iWe2nKAAf9Fsd7bVZuAp4/oVnFzhnx6Xq5leENjTvdUHKWZwc0Hsd5zw2oTq
 LZu30jrMtQFe3ib6djjn1lV8oLLpijHXX32ib0Ypx7MgnNODAcnKk3Zzp1kDlNTHYxi0
 AoFg==
X-Gm-Message-State: AJIora+InXpz4D81OcF8jpYQnZwMAow4qypgIPUDwtJkMM6/uDOj75Yk
 8gl/dvnQcR+XTdo8LRxPxKk0HmCLOiOulA==
X-Google-Smtp-Source: AGRyM1uMAAcVX40uAZuarENqR+rcgSOnO1Mxi34WMFeUCyweZVBbDUkpUJG7CaQ/mM5GPkRtk45zAQ==
X-Received: by 2002:a5d:6f19:0:b0:21e:2dab:83b with SMTP id
 ay25-20020a5d6f19000000b0021e2dab083bmr3279915wrb.139.1658232675022; 
 Tue, 19 Jul 2022 05:11:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0039c5ab7167dsm22111287wmq.48.2022.07.19.05.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:11:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] semihosting: Don't copy buffer after console_write()
Date: Tue, 19 Jul 2022 13:11:08 +0100
Message-Id: <20220719121110.225657-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719121110.225657-1-peter.maydell@linaro.org>
References: <20220719121110.225657-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The console_write() semihosting function outputs guest data from a
buffer; it doesn't update that buffer.  It therefore doesn't need to
pass a length value to unlock_user(), but can pass 0, meaning "do not
copy any data back to the guest memory".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 semihosting/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 4847f66c023..508a0ad88c6 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -627,7 +627,7 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = qemu_semihosting_console_write(ptr, len);
     complete(cs, ret ? ret : -1, ret ? 0 : EIO);
-    unlock_user(ptr, buf, ret);
+    unlock_user(ptr, buf, 0);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.25.1


