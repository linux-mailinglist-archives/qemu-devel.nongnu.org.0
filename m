Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF28320B2A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:57:41 +0100 (CET)
Received: from localhost ([::1]:35420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqB2-0001iM-5Q
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDps1-00019P-Rq
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:05 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDps0-0003fq-ER
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:38:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id v14so16335218wro.7
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iKgI0jrs5rTnvBXYFkU8zRUhc3j4MNSCivde0C/yDfw=;
 b=AcdSuFuox/lRILb4b6y6yy2dVM8X3tuDetVz07i8Z3IsjxB4nHtN55gJWPpVPfDU5X
 x2ETz2+zWCxzf1mP6YbhOGtJ9fjdPQm0fyDkf3YtI/yGnY+GYbytPH+6asajSVyI8ipP
 gzF5zn65+8z3W6i9PXIXe17yiRAMpX2YLl3xBT8R1PKyBtzHYCKteOnXaBuJSCMcwhe8
 wpYhAhdWfQSp2kUUO1FNfntJEBiPrbrj+G+w0mcw5N++72Z+ymwBqWy7jPbsz1amTdbo
 DB9sKazAPNA1+/1xvv3rjZEjtJb1JSQRvlveFv5FqPIOmgKV8vQfNYZ7FgSorLHJCn2I
 ICMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iKgI0jrs5rTnvBXYFkU8zRUhc3j4MNSCivde0C/yDfw=;
 b=VfeKM4Iw8oxHaHbFo6wPyvXfWFu694T63log3DwniBfjQsBm/FzYustXkCezRgsVrD
 PzeMJv1Y0KmV6g7X/YkYMgRz0Q/z+Xl3yFASHbPtbh6w80dwLE6n8RiaBDMWlGIqiYr7
 m8RhC8udsMqCenDdvffS9/F5EmIOwxwUGJPxXs7nA8CHQIZMIAoWFVgNwgi5/DrZv5Xv
 YwVLX4UbwQSmePYyC6zqVwFZ2sVNMCiwvxG7lK2vVyY3OY1KAKldHNiKA+RoBC4fF+xi
 yhESszA9rHJSToTb91JFK2tFwDjiYf9+fn+F7LC2gE1XsdbF5DnyrvskaXG6M17STj84
 TphQ==
X-Gm-Message-State: AOAM531VgCnMDWTgKrY2QZ9FVK4zqkvplBYY8ODtG71iMNF/mnNb5l+j
 h+ChIfoPyTEdsxIxHfPtXmFfcqfZNmY=
X-Google-Smtp-Source: ABdhPJzlTlvNKnoZICXBF49A1R9AiN7EasKTAo4qalhMlmiRCoCIUyE6hliog5xcLgEwCFwwEbnRjA==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr15824718wrb.57.1613918278935; 
 Sun, 21 Feb 2021 06:37:58 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c9sm22540169wmb.33.2021.02.21.06.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:37:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/43] vt82c686: Simplify by returning earlier
Date: Sun, 21 Feb 2021 15:34:30 +0100
Message-Id: <20210221143432.2468220-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

By returning earlier we can remove the 'can_write' boolean variable.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <15b2968fd300a12d06b42368d084f6f80d3c3be5.1610223397.git.balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: Split original patch in 5, this is part 3/5]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/vt82c686.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 2f69b4d531f..2bd10d91013 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -258,7 +258,6 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
 {
     SuperIOConfig *sc = opaque;
     uint8_t idx = sc->regs[0];
-    bool can_write = true;
 
     if (addr == 0x3f0) { /* config index register */
         idx = data & 0xff;
@@ -276,15 +275,13 @@ static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
     case 0xf7:
     case 0xf9 ... 0xfb:
     case 0xfd ... 0xff:
-        can_write = false;
-        break;
+        /* ignore write to read only registers */
+        return;
     /* case 0xe6 ... 0xe8: Should set base port of parallel and serial */
     default:
         break;
     }
-    if (can_write) {
-        sc->regs[idx] = data & 0xff;
-    }
+    sc->regs[idx] = data & 0xff;
 }
 
 static uint64_t superio_cfg_read(void *opaque, hwaddr addr, unsigned size)
-- 
2.26.2


