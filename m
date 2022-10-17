Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3076017E5
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:41:44 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVzb-0006q5-IC
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfs-0002hg-D0; Mon, 17 Oct 2022 15:21:22 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30]:40952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVfp-0002xo-TU; Mon, 17 Oct 2022 15:21:19 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1364357a691so14385728fac.7; 
 Mon, 17 Oct 2022 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAG5aIZYO+c6tFUtYdaxQU9IDPUVOE446epr6tRiRRI=;
 b=D+ZKsscI2ayAksfIsK4/w7edLM/y7ttP812k84wD/qRYem+RBBet6D+rPMxhcjcKKv
 raGHP5/ZKFPawvfJc6dKXOzb2sJWqdHWpkO5zcOHhWcnAJpZzBBVeYWYNFywPOm38Yv9
 d9qYc2DpGKQFvOrh6MJbXHT/8Vq846ASWqHxBkQAUxpO7/XONMH/SljvlHrkKqa487TM
 6E9FR0j7ZsLMlATjue4dV5n9OMv7/FUmbl36vEkluGqNWl3dTwj9IL5P9YwhfK114p/t
 Gustnyezz34TuyMY6oQKMcnjAyXLDtGNVEozaHyA1UAKP37BVmPxBlkup4q9CDquL8or
 TohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAG5aIZYO+c6tFUtYdaxQU9IDPUVOE446epr6tRiRRI=;
 b=tO/yFDgcZHDKOXmeIsv97n1fXVyeOQArzuiELtwvxJjd+gLxT6gz/wVHiGDb1J9NBG
 XIQkw6PFF7/3fCR6Sf1LIm7jqu53v6Ci2zvyj9cFclcXAtE2Ru/IYJLH1jNPAJisqMLy
 z1raq9od9yeU/T7sGJX95Gu/ppRri3c0OoDKRbmRT1LxRb84ZzNaeMin0vWv1Bwi0H+W
 styuzgGujRf0eH8tM+ZX4YEC4gmB99SayirxyX9P+U5AULQOmeYGywYz8Vm7SoseGWtH
 rthvugjnRGTNzDh++vuBwVxWg4rYpTZLbaODi/K2ybdJpEmxYaxb+yESngZU+e4KtuXJ
 O7Pg==
X-Gm-Message-State: ACrzQf14xZDBPJSWNpIy0W9lRLKjxUsjZat+v/NCeyA1UFUqTIqeLLHQ
 mdMgCcXdDwt5e8kPw4oBTVMws6wbPig=
X-Google-Smtp-Source: AMsMyM7c5AeAXkHrRLkWkC8+H+mu0oFBKrU4oNy3a56u1bdCoefxEVHD3QdLsv56zxHGnyGtWtgCTA==
X-Received: by 2002:a05:6870:3388:b0:136:4f44:78a6 with SMTP id
 w8-20020a056870338800b001364f4478a6mr16768584oae.125.1666034475459; 
 Mon, 17 Oct 2022 12:21:15 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:21:15 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Bernhard Beschow <shentey@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 22/38] docs/system/ppc/ppce500: Add heading for networking
 chapter
Date: Mon, 17 Oct 2022 16:19:53 -0300
Message-Id: <20221017192009.92404-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x30.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

The sudden change of topics is slightly confusing and makes the
networking information less visible. So separate the networking chapter
to improve comprehensibility.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20221003203142.24355-4-shentey@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 docs/system/ppc/ppce500.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index 9beef39171..ba6bcb7314 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -146,6 +146,9 @@ You can specify a real world SoC device that QEMU has built-in support but all
 these SoCs are e500v2 based MPC85xx series, hence you cannot test anything
 built for P4080 (e500mc), P5020 (e5500) and T2080 (e6500).
 
+Networking
+----------
+
 By default a VirtIO standard PCI networking device is connected as an ethernet
 interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
 
-- 
2.37.3


