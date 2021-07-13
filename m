Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325E43C6AEE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 09:05:32 +0200 (CEST)
Received: from localhost ([::1]:56122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3CTz-0001tU-4k
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 03:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNo-0006l3-ES; Tue, 13 Jul 2021 02:59:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:42538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1m3CNm-0001vP-Ad; Tue, 13 Jul 2021 02:59:08 -0400
Received: by mail-pf1-x433.google.com with SMTP id y4so18665054pfi.9;
 Mon, 12 Jul 2021 23:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDs3bdfAQMPC9lkUzbAT0OAQiURncrmQf0DNcbcYf7w=;
 b=jqR43t/Z3IQNMI4x2BWgwN/LueCdX3aH6ovQF1gzecGy8bmliVe0+ImMSM1Pn1eBXJ
 gThkccXitAL0SlaFX/MvYtUiJqXvnaApQlResV1VSm16gVxczZ5FoMzMkNp/FqGYBGMD
 jFzIrB0wT3vB6pfsMhG8t7BkTKm5CF6BnpAmVu1hixs4jd9q8EHhRJNATQAadjFOMXEz
 7A1rqGd6MsDZrIVAR555D467gHSf5ujuiqwRF/zjlGbISSogK+jDES1huOWx0Rfhv4Qn
 FM+gmcD1GxjICBt5313YgQQy7qgpDzmdplP/U5PDVyjrEeLwM1/lP1M98plDtZUmRSfd
 3/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cDs3bdfAQMPC9lkUzbAT0OAQiURncrmQf0DNcbcYf7w=;
 b=LEWni2ZZU+jSiiolS+BtyKUYz22wvuk+avU5+mi2ZtsVok7wYXln+ltosAYgEIleVC
 zMCBnDqGcT8OCllibDVnppnX8quQYnicijAhC14ScFfwn8QmFKUnfi5hh3vBpAblmA3U
 iirhKWNWeFzV+21fC5uD4MH3fujk1yAI0ztwaeBQBtZtaV7sKXw5ZAo0JbC6AOGnePel
 V/iPd4EscKL6D1L226R3bOy+o3fssnhMNt7DP2tby3lKAmHY1QN1ZfJunJ/vLrIEGdIc
 ws2pHiURseBTz15RA/heN9//On78RsGD1KmhMvSamaW2LeYpAXmLlbyrvnuPeYavqU7D
 bI5w==
X-Gm-Message-State: AOAM531V6MBs+PurJwg+AgJsG/+A2P27H3w3jujtTJi4IKdUY0t/36k/
 Mu1ThuGI2lIrwm9rMrvkSIM=
X-Google-Smtp-Source: ABdhPJwXvbPULceSU3MjVHd8aRRkfREBzd0Z+03jqnN1yRPYKEVCh12WE4o9V2V1o1lEXA1EW8LiUg==
X-Received: by 2002:a62:2bc6:0:b029:2e7:a7c2:201 with SMTP id
 r189-20020a622bc60000b02902e7a7c20201mr3231560pfr.64.1626159544320; 
 Mon, 12 Jul 2021 23:59:04 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id o184sm20334846pga.18.2021.07.12.23.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 23:59:03 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 0/3] hw: aspeed_gpio: MMIO region fix and cleanups
Date: Tue, 13 Jul 2021 16:28:51 +0930
Message-Id: <20210713065854.134634-1-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=joel.stan@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes the MMIO region so that the rtc works again on the ast2600.
The two patches after that are cleanups.

Joel Stanley (3):
  hw: aspeed_gpio: Fix memory size
  hw: aspeed_gpio: Simplify 1.8V defines
  hw: aspeed_gpio: Clarify GPIO controller name

 hw/gpio/aspeed_gpio.c | 100 +++++++++++++++++++++---------------------
 1 file changed, 49 insertions(+), 51 deletions(-)

-- 
2.32.0


