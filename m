Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C48697AC0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFy4-0003JH-HR; Wed, 15 Feb 2023 06:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxj-0002wP-Sb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:44 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxi-0003io-Bm
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:35 -0500
Received: by mail-wr1-x435.google.com with SMTP id h16so18770381wrz.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=himCXWtvMBCOM0cvJ1xkT+Q6h790A02ukedCl0Ioy3s=;
 b=W/nXYmt1UXXefnldIcEwT+nWSb4MSeC+Yaod4BGMHYUUzwj0RuxdXI5EbaubNsdUyG
 a6uevPEI0bCWKjvR0p7VLADrRqFHYp/5i9RXPZ0FDNTHkrg2S0B+O/fgLweRsbVTUUlr
 +LBjMy2+3c7hgBZE8dppr3dVlVq8NJevAvdTOYcYdQ8CxzOyMZOVV1aGeNaOel5hpgpl
 twM5caxyB6NHXffGQoRJrYgo3nwvIbXEKJDGwvKqO/IRS9mzHkYHoog95wuQWG15MLi/
 IUz99mSF+vfUljoF5qZjQCJOWBhsRxYr8Yv+AHTj+K75V/rEFU8sb986vqdxdl+oRbcj
 wWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=himCXWtvMBCOM0cvJ1xkT+Q6h790A02ukedCl0Ioy3s=;
 b=uG0U7NjiWbJgn2F7YE19S8mSP977mPKpfWiPA5pMae00e5xT+j2wwMT7KgZkaNWblP
 5y12azgsSN5WpHSJnDA7t13tEubtKO+1GwaqExruJOv8nOMtXhJJwbKv9Bd7Y4FIlTGq
 Ch9yyzb070V4DlkHvKmZfwjRCX74t/8B+CUl8QDVSWVe4kDo/G9zIGfoc9Ma3+LVEc1u
 YEFSawKVYLLNQQpJMsg/pNhdGJuyAQXXTW5nu1pVAV51+H36qZKrD0NgYZzGasCWnrda
 hyuUF5y/9CRQs48hk6QabYt9GhB9XOXqVQA5gPcRzN5lRlJ5XWP9RzfYrCban2vst9uj
 FzbQ==
X-Gm-Message-State: AO0yUKWzT1dVHZaU/KJAvgfSfUY9GtmNyL6XrjfveiezabXfVvDIn1VE
 obAEsGBWqOrvk3+r2HS7/IW91SeTQz7yPB93
X-Google-Smtp-Source: AK7set8B+rrv1NYuvJhFH9vpAyMO91n8DM2pNAdP8aIksMeQ9VWzCWu2ARhU5rkmBw24PlG7bHPmAg==
X-Received: by 2002:a5d:6845:0:b0:2bf:d0a4:3e63 with SMTP id
 o5-20020a5d6845000000b002bfd0a43e63mr1367933wrw.44.1676460512565; 
 Wed, 15 Feb 2023 03:28:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a5d5258000000b002c54c9bd71fsm12194243wrc.93.2023.02.15.03.28.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/20] hw/ide/ioport: Remove unnecessary includes
Date: Wed, 15 Feb 2023 12:27:08 +0100
Message-Id: <20230215112712.23110-17-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e6caa537fa..e2ecc6230c 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,16 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
-#include "qemu/error-report.h"
-#include "qemu/timer.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-#include "hw/block/block.h"
-#include "sysemu/block-backend.h"
-#include "qapi/error.h"
-#include "qemu/cutils.h"
-#include "sysemu/replay.h"
-
 #include "hw/ide/internal.h"
 #include "trace.h"
 
-- 
2.38.1


