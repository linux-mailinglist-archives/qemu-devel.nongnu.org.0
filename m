Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FDD700C02
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:37:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmx-0003Ht-6g; Fri, 12 May 2023 11:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmq-0003GX-Mv
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:28 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmp-000607-87
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315735514so326651445e9.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1wWqh8IT42QINOpOQyrk9a9lOGocpzOir9ypVgBKs+U=;
 b=f56DXCmQ5D7WZq7GDUhGKpbsbBqnBQCh1HTfi5cvsT9eq0pT4IoF1O03laUL6AMvDv
 bPNzglitzdiseu0AbQ3cQr2oiEfFXTzS2KWmiNCIdNybO427DkV6hWzMoMoKkgC9Dt7y
 nNG2lhd3iB8UpK+B/GB0eYzIo+0S20jIb9F1xyU+go8s5yt7yEs5Akf54HayVogT8l1+
 +cQV2HQFQJd63ZllkFN5gpFPCOFqZunS2aU7MW1HqvpyQyrGbrFOxXJ8d0/fZ2g4hyOP
 QQyH33QMWAVCxySF4z8IfiUJ0fQpCNrCdyGug4n0NzjnbYdIX11SsOdzXccHucVI8DPd
 xo9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905666; x=1686497666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wWqh8IT42QINOpOQyrk9a9lOGocpzOir9ypVgBKs+U=;
 b=CgKegz4OaqhJEv/DCF50IS65I2wqbVeuOvuNKWHi8TbUl4kQ29F5+Zc+gurewsQdkD
 p3jymXAfOxz+XrPAL8DIGyqoUGIetmhV029b14aTwAQFXjyuNBsV+oRCar+Ttw5oJeEM
 kzTrJlJGqroHFrB8v/WdbU0k2QbK68F4P1Uzf7b9DG0BuWv7WFk3L1yoWxYRRUySL/Qy
 5qQPbRkFKefGguNo5sUNyLoziTCvZpgNcLsrsAd8omsixGedyyIOZB6FYflxOEe/3Uzv
 /o87m/vmUEMo7XiXf4Oa1JP7X6b6CJmWwGaE3aG6LBRjnimwzJb8E5PQcH9UoKMUY4Sp
 yMGA==
X-Gm-Message-State: AC+VfDyNHP2x0vcEjaKqlR6AlCru77S44hOX6dsa5xDMWV6hfPcorj39
 LAxB9tsl8zsj9kuon2fa1W5H5D88fN0DUnSO5d8=
X-Google-Smtp-Source: ACHHUZ4wnZhNQi3yerNPr/bYDDngGiTwi7tlNuhJoTWpKTUCAfkIbAZ5oab5g12ehW23HZFQDOz/sA==
X-Received: by 2002:a5d:4ac1:0:b0:307:869c:99ce with SMTP id
 y1-20020a5d4ac1000000b00307869c99cemr15784776wrs.21.1683905665702; 
 Fri, 12 May 2023 08:34:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] target/arm: Move translate-a32.h, arm_ldst.h,
 sve_ldst_internal.h to tcg/
Date: Fri, 12 May 2023 16:34:12 +0100
Message-Id: <20230512153423.3704893-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

These files got missed when populating tcg/.
Because they are included with "", no change to the users required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230504110412.1892411-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/{ => tcg}/arm_ldst.h          | 0
 target/arm/{ => tcg}/sve_ldst_internal.h | 0
 target/arm/{ => tcg}/translate-a32.h     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

diff --git a/target/arm/arm_ldst.h b/target/arm/tcg/arm_ldst.h
similarity index 100%
rename from target/arm/arm_ldst.h
rename to target/arm/tcg/arm_ldst.h
diff --git a/target/arm/sve_ldst_internal.h b/target/arm/tcg/sve_ldst_internal.h
similarity index 100%
rename from target/arm/sve_ldst_internal.h
rename to target/arm/tcg/sve_ldst_internal.h
diff --git a/target/arm/translate-a32.h b/target/arm/tcg/translate-a32.h
similarity index 100%
rename from target/arm/translate-a32.h
rename to target/arm/tcg/translate-a32.h
-- 
2.34.1


