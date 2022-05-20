Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4C052F211
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:08:34 +0200 (CEST)
Received: from localhost ([::1]:38898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns73B-0005Ju-Vs
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:08:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wc-0003zI-Ao; Fri, 20 May 2022 14:01:46 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:44998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wZ-0004HV-Pd; Fri, 20 May 2022 14:01:46 -0400
Received: by mail-ed1-x533.google.com with SMTP id eg11so11702852edb.11;
 Fri, 20 May 2022 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWDcRVdXYE3sAImE1usB8tpS7epBj9zKDdsVsgZYncc=;
 b=SAUbQxsLROwyQy6el6duq/Fnqh7JhaFXnUZN3OoAvI4tTBVujoiI19FkqAMLugPoBg
 5YAWL2sy7cyeXrOoe2Yd/J7i4AhzbnO7wths7pat2gHkOpL0fbjqp1+/Ya+6YhV1C0G0
 F2iaDPvCwAD2hD5NTMXWwiQ3aysVrD3eNm92B3SfzJyOUonIdWGAMY9jqJYsspjWYwuW
 rTi89oRjg502/OUMBWd3HW+kP2RJYE2gawj9nWnkzt6Ld366L1qVVkhM0aX+M6UXVO5c
 TG8YglBdY9COJ2pHKrxy/xFnvLMnAquvNn2LPorHtPitx0vE/RIqrn3RjPD3TM1I8Rt9
 XXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWDcRVdXYE3sAImE1usB8tpS7epBj9zKDdsVsgZYncc=;
 b=Ku7t+EY+HIwZCO3oQyxoiXb1YWFUNwF1MX2Zxsb9hF2LVhUvqwJyX/b6fOaAEva9Z7
 byNZ0zhQW1ByyKoi/ObNRvTGPP+4Z6M5tJxZr7kN2QmbTv6nqpVoktOzmrNPTbtR+K4I
 7/8EafYkDcy4Hx5JOjYK3euT3zMTLAXvYiEgUSsyX7HrSSqvxJJLde1HmGm6SfIu+CWW
 pVdSjFuDDkW4hbA+oWkRnFm01uuzpNWzIJULxPgG1Bh96YX3WC2ACmntyDqYjiUzsfCU
 5qMYxP6nz+Rof09PtjbJhPlFb0c/B2wH0zwENnQYMoermkBZArjxQeflsC79iO+3dQnk
 0xBQ==
X-Gm-Message-State: AOAM532YtGWm2ZW6wwBdYR2UMtIjBBMviB85Lgnqg88PVtHf4+xHsdW9
 +dLUd8PFeKzU4LC6KduZ+VGgi/x5jiw=
X-Google-Smtp-Source: ABdhPJyKcKi+bdgxYUWrYZtRfaWsbTuoA2WP9ZeMl1K6UyGu+yIikZ3Fom02HOEmE3/olpalfrFkzQ==
X-Received: by 2002:a50:fa8e:0:b0:42a:b1f4:91c7 with SMTP id
 w14-20020a50fa8e000000b0042ab1f491c7mr12105620edr.140.1653069701586; 
 Fri, 20 May 2022 11:01:41 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:41 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org (open list:e500)
Subject: [PATCH v2 06/10] hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
Date: Fri, 20 May 2022 20:01:05 +0200
Message-Id: <20220520180109.8224-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Commit 28290f37e20cda27574f15be9e9499493e3d0fe8 'PPC: E500: Generate
device tree on reset' improved device tree generation and made
BINARY_DEVICE_TREE_FILE obsolete.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 2bc3dce1fb..7f7f5b3452 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -47,7 +47,6 @@
 #include "hw/irq.h"
 
 #define EPAPR_MAGIC                (0x45504150)
-#define BINARY_DEVICE_TREE_FILE    "mpc8544ds.dtb"
 #define DTC_LOAD_PAD               0x1800000
 #define DTC_PAD_MASK               0xFFFFF
 #define DTB_MAX_SIZE               (8 * MiB)
-- 
2.36.1


