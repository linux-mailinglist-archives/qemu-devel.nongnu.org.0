Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922BD344D24
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:21:11 +0100 (CET)
Received: from localhost ([::1]:34636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOEo-0000VI-JC
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAF-00073a-2P; Mon, 22 Mar 2021 13:16:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOA8-00009d-2k; Mon, 22 Mar 2021 13:16:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id j7so17987114wrd.1;
 Mon, 22 Mar 2021 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8E3GnaRyznlGDwlFLypYasSTouiBJiHtygX/SKxe+b8=;
 b=sqju1Nwi8QDPw1ydpiI/Mb656v5SAbeXib8KvihotG5sY9veAvI0XfQvyKXUVrYWMM
 xYGM3nYta+h81qKuvt8RKycVsmUcWRfI2cpddWjKJwLB3vH+9S9/5rGN6/3fx1SFRIZx
 au1ZPItMV9J9pyJTjo7ljGRvzOgr3HugOM2zr/mty3nU2HcXa1wWHYVMI56g4UeAW+UP
 zIg1ACuwzRvGL6SuMaaGKJZnzq9iJ6t/FNecc/4cMDIAJZ6xa5MzUoPGYnVMGC5OB4nw
 l6lkqxsAexm1AQcWS9esqM1CwXOXh7oOb9dXYz/W/6QAn8Pp5v/KIgTPf6JBjO0aXvJG
 Tl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8E3GnaRyznlGDwlFLypYasSTouiBJiHtygX/SKxe+b8=;
 b=L+CNzbHMhYkuGrmaikHKI3ceB8iKK46ZjGKN/9G8T+z9hRCaO0LE7BdqYywnJ+F0b0
 LNowOZgAOECXK8XjfuXtSC+Y4asvwytyLaEX6NzpHTEqUFu5UJZPo7iw+nymQLk2ROh4
 9RKgMR2gn36IObPNNkL7bgOOHM0cA0LA55x9oddbYQgBoaN1n0nWqusqfPLjuP4Qpfpy
 4t/OPpUizhhPEigLm/LhD/qLSszwCD2wnFVFnwY5NzKnqE9MS+elpMa+L4J1A9iU8B3y
 P0ocw4xFaax2tON+sUhSPk2LgicwOUpIjJsw2zlGGqW3R6Pq29HDu5Qj4gOEviMZWmk1
 1PAA==
X-Gm-Message-State: AOAM531uTnaqIlghxVAZx6TmbgG+sXXHHKo812q9721TuINcnbTQRofR
 IjnORMaZ3l9OegRikiDzDH0Tw1JVTtTljA==
X-Google-Smtp-Source: ABdhPJy5ITa9ZN41kKVfG3RogYxFLGiymuvPXNCABf2IfRAC5CzcBWQ3oqoUlp/uy8x36qFaxha2RQ==
X-Received: by 2002:adf:c389:: with SMTP id p9mr572428wrf.410.1616433378173;
 Mon, 22 Mar 2021 10:16:18 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 21sm84835wme.6.2021.03.22.10.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] hw/sd: sd: Fix build error when DEBUG_SD is on
Date: Mon, 22 Mar 2021 18:16:04 +0100
Message-Id: <20210322171610.4183696-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Simon=20W=C3=B6rner?= <contact@simon-woerner.de>,
 Bin Meng <bin.meng@windriver.com>, Muhammad Alifa Ramdhan <info@starlabs.sg>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

"qemu-common.h" should be included to provide the forward declaration
of qemu_hexdump() when DEBUG_SD is on.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210228050609.24779-1-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 8b397effbcc..7b09ce9c2ef 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -47,6 +47,7 @@
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu-common.h"
 #include "sdmmc-internal.h"
 #include "trace.h"
 
-- 
2.26.2


