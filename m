Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70D4A6923
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:17:29 +0100 (CET)
Received: from localhost ([::1]:48412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3Ky-0004k6-63
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:17:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2m7-00013x-8v
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:41:27 -0500
Received: from [2607:f8b0:4864:20::1034] (port=52760
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF2m3-00072M-VQ
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:41:26 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o64so18630070pjo.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+5XdjNg70TIocugxsNaPfdnf0Gk0rr1vWNcS8gjZjA=;
 b=OqfOmGEqqmvub6usycfdzaumESSUac2B4WI2/eU6flg9sIDkRSXjWIsMFURyfvj95L
 qzLY490tPJXATg2EM8UIJDrOvgxb4pnw81NQD8sxWKgMPI6Q0JCBXMibKUfIXDC3wNRI
 3uXZmAA5JNBN1h+2EgiaxEhdjaLBS0ItTgCSEuBbYwKCA7GcxMkikK8lWcSwq4M6B4np
 Rq5f7l/Z1X5HtRUnqStTM7Y/697uabTIO48Mg48wh69hfdpWabgSKUnuefGw5FNiSWP/
 Y89byz4EEqL8nWi3TaXPLNg6RQclXe3seJs7rpLKlXb4ASMrUr9lkSis7ofp674InTaI
 JfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+5XdjNg70TIocugxsNaPfdnf0Gk0rr1vWNcS8gjZjA=;
 b=sGCKfqmt0EAmU3aLVyzSJ78JaMTZgGDH3wWj67ZEvns/JwR85OyHpbzmyl4qSZYb8Z
 sVbagVjbVQsscsKwZwRylA7SEm4YUGBLnhUrEKXioGebH1AUfllRh5+3AVPqaJ1uPzIY
 Bqyv+A95b11JxbRs5FlmaWouyfQ4h3XohIxCedMD7ohvJDp8FIow7gjzUUuRXOrzZQF7
 oPuLjSX2DOuNM8/OM3GEne6Jx5fvmP+kpdi++WKiv+1to8FMnsI+mfSiDx0d877Qow87
 tNISr4wk371AbKk/SjtwZoi86yMOddk/BGaPotBo3wyOFhlgmRLISGzOAHsaG6s1mw+e
 vlMg==
X-Gm-Message-State: AOAM533x/9xrtZcVch/oXF1cAuR3VIppQMSTUdXWAAdV9QaUQWx/RJ/+
 MiNlHUrFh7lFmlqcAIX3hiJxjjlxhzzqmz1N
X-Google-Smtp-Source: ABdhPJyVd3h4W2m5J0ZomEGX7b3G/cBKT2lKNwbKRek2v26CzBS5RqvYyLLMrqHNw2ngeSDgz0F86Q==
X-Received: by 2002:a17:90a:94cc:: with SMTP id
 j12mr5034135pjw.39.1643758873260; 
 Tue, 01 Feb 2022 15:41:13 -0800 (PST)
Received: from stoup.modem ([2001:8003:3a49:fd00:91e3:5d6a:70ac:f94c])
 by smtp.gmail.com with ESMTPSA id g9sm16495641pgi.84.2022.02.01.15.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:41:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] tcg/mips: Unaligned access support
Date: Wed,  2 Feb 2022 10:41:05 +1100
Message-Id: <20220201234107.316487-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20220104021543.396571-1-richard.henderson@linaro.org>
("[PATCH v4 0/7] Unaligned access for user only")

Changes from v4:
  * Rebase on master.
  * Drop other cleanup for now.

Changes from v3:
  * Rebase on master, which has some patches applied.


r~

Richard Henderson (2):
  tcg/mips: Support unaligned access for user-only
  tcg/mips: Support unaligned access for softmmu

 tcg/mips/tcg-target.h     |   2 -
 tcg/mips/tcg-target.c.inc | 387 +++++++++++++++++++++++++++++++++++---
 2 files changed, 360 insertions(+), 29 deletions(-)

-- 
2.25.1


