Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D395344D35
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 18:25:54 +0100 (CET)
Received: from localhost ([::1]:53226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOOJN-0008HN-4O
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 13:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAU-0007I0-5E; Mon, 22 Mar 2021 13:16:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOOAS-0000OW-C1; Mon, 22 Mar 2021 13:16:41 -0400
Received: by mail-wr1-x431.google.com with SMTP id e9so17967945wrw.10;
 Mon, 22 Mar 2021 10:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4TrH0YlHvVigHvwxkcJ/B0YohntEhHzwVsdqcia4dU=;
 b=plXtfhyZkC5+/FzyE0QyYpcQT0SU9h9gSp9U2s0gOkSjNkQNPL7PRWErS8r7/RDje3
 qiZx9oTnNqJV2TlhZeM+1sy/IOso9I7QtrFouunaqzQFnU8vGdOHXUdFHba/zM0nmASw
 XB8z9OGRsUDgxiNxdKO5kfU4Faibaw+AtOYv/GQDAydKsrbIs74UCjfrB/okT/ib5htP
 MiF9qLTRG5SJtmLWISFlK4QqNaKp4Rkwv+VvDf5Uyk3xC/MaqB46aCqy3xtf6DDsEYdQ
 1KOYiL6QIrCMxnE6Vrem1sMC+ANlcwfRYm2NXtPqvOIafYQDoKYNI+Js6uit9aBNaAgU
 FKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n4TrH0YlHvVigHvwxkcJ/B0YohntEhHzwVsdqcia4dU=;
 b=TBUlFkglgiBBrG8cu6jHC/voojpwHEIaqeBsG6Sthvai8e5jujrH7iQIfpmqmZ99X9
 ZUi0VpAqBKHfgvyl+urou7o1ClUlz1xOMi14lV+XzHSLNSn+c4ay1TzLmG0wAgpPGQcU
 PSmFHsN0+SmgFEULHeJRxvs9u/fr/3GgDXHfNg2D+GKikarkv8Zu0oG8p1uV69u19JkX
 dQp2giSAzzVdbU4MJgNe4mfpkEuQ9Qlv2bCkOGyweJnNsR0wFjfFrKgMwGgBcwRQUBWY
 BzUCI4iL08mHhdDBwesbJa0ORMszc7FYVu40w6/XOnZv9zEgPqUONo5lau3GfQj0kmkK
 BKIw==
X-Gm-Message-State: AOAM531rwMmcwNZW4icCnY0VNBWHgo9N6vaDmNbDGeyL+gTe9ujrpD5r
 2RNJFmxhGIpck2qoP1HZPkebDBO7ULp0qQ==
X-Google-Smtp-Source: ABdhPJxx27VeTVJ+Fy2q9lpIjvF1fN3XD4TAm6c9ME6g2Evgshcx2RbjmmMHLxu4k9z777Qv1w9lSQ==
X-Received: by 2002:adf:d217:: with SMTP id j23mr570031wrh.113.1616433398136; 
 Mon, 22 Mar 2021 10:16:38 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u17sm80121wmq.3.2021.03.22.10.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 10:16:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/sd: sdhci: Correctly set the controller status for ADMA
Date: Mon, 22 Mar 2021 18:16:08 +0100
Message-Id: <20210322171610.4183696-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322171610.4183696-1-f4bug@amsat.org>
References: <20210322171610.4183696-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Cornelius Aschermann <cornelius.aschermann@rub.de>,
 Bin Meng <bmeng.cn@gmail.com>, Sergej Schumilo <sergej@schumilo.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bmeng.cn@gmail.com>

When an ADMA transfer is started, the codes forget to set the
controller status to indicate a transfer is in progress.

With this fix, the following 2 reproducers:

https://paste.debian.net/plain/1185136
https://paste.debian.net/plain/1185141

cannot be reproduced with the following QEMU command line:

$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
      -nodefaults -device sdhci-pci,sd-spec-version=3 \
      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
      -device sd-card,drive=mydrive -qtest stdio

Cc: qemu-stable@nongnu.org
Fixes: CVE-2020-17380
Fixes: CVE-2020-25085
Fixes: CVE-2021-3409
Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
Reported-by: Simon Wörner (Ruhr-Universität Bochum)
Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
Tested-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 3feb6c3a1fe..7a2003b28b3 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -768,7 +768,9 @@ static void sdhci_do_adma(SDHCIState *s)
 
         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
+            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
             if (s->trnmod & SDHC_TRNS_READ) {
+                s->prnsts |= SDHC_DOING_READ;
                 while (length) {
                     if (s->data_count == 0) {
                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
                     }
                 }
             } else {
+                s->prnsts |= SDHC_DOING_WRITE;
                 while (length) {
                     begin = s->data_count;
                     if ((length + begin) < block_size) {
-- 
2.26.2


