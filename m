Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1996F4392
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:19:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptovA-00047p-BP; Tue, 02 May 2023 08:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptoui-0003oW-Tb
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:34 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouU-0003C9-ME
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:18 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f315735514so166131485e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029708; x=1685621708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sbqFrwuPbz1N2vfMZ5MaN8t68A8GmBRAFS33JGd8krI=;
 b=u3SqDxPZTSqNl7+tySiHX2tkE8rUtXodXyuoYxJSelvBpYrTe0R0m6NBzA7jsN9nPT
 ZbwUN5zAYuy2yiiQcsz+DN4Mv5COHBFFjwcZQO4SCG9GEyNhPts+Z+WcTQNgCFyKG3Lu
 uPWEHFJB0bXb9jTFlp8gYARxCfa/ZnUJ0Ki00OFncU6oVQBebZM8kxyhWgZBS0i3spVN
 1w/cvr29VQZurDR6csz7ZRw7ikqFu9tlXUgUDeJNd/155AkwrOVXHIOXhIj1BDBhsE6F
 QqxI/3JaiJV/ewgbcNNxt7IDbIFLYROxxm0g7NyTTJSlPYbzL6+x7Fzr3eEP5rQQiaeP
 wvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029708; x=1685621708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbqFrwuPbz1N2vfMZ5MaN8t68A8GmBRAFS33JGd8krI=;
 b=aAmbiHWr8RDd9Aegg5kj6/seGkyf/QVGQGo0IcNQyEDmYxHkl1iRQV5SJ9dAV9XQ3M
 kx/dDwkvnEhJwHW6vaO6X20JSsoXr3seqyEa8qbEnPnx4TADE2Tff4YeP1PtPb9PdB+P
 0jPSNLrQWhkY2LWet2Cwk0cRy2ZTHWYbDCF8+k6E++IDgcCDSEqetSWLk9mY5Powwz4d
 Nc81ffh6XwBH9Xd+zOQBMSYPAlC5Z+gpIJAwiMKuLTOeE4w/1tWVxsGjzn4JWGtcyoyI
 lYWeXvwalCOwIpR+vW6rTWCRyhc8/puk2JrKNxKWPXNQIIpv0E1qPgv9h5bg5l1Sqlnd
 4oLw==
X-Gm-Message-State: AC+VfDx540VRuDixpatSP7eBim128Su1ZLJCH4BQH9uqvqb25IizojjB
 PuwHuy1Z0k5k4Byq/0jGHKKZL2PDUR86VbchiXM=
X-Google-Smtp-Source: ACHHUZ6PYu7FCVroYQLYIDekC4guw5qzhnH5aEbSZL2F6kF6bx3fj0sAhZBA0j9oSwbO4o0FLF2qOQ==
X-Received: by 2002:a1c:7702:0:b0:3f1:731e:cdb1 with SMTP id
 t2-20020a1c7702000000b003f1731ecdb1mr12463935wmi.6.1683029708130; 
 Tue, 02 May 2023 05:15:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/35] hw/arm/bcm2835_property: Implement "get command line"
 message
Date: Tue,  2 May 2023 13:14:39 +0100
Message-Id: <20230502121459.2422303-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

From: Daniel Bertalan <dani@danielbertalan.dev>

This query copies the kernel command line into the message buffer. It
was previously stubbed out to return empty, this commit makes it reflect
the arguments specified with `-append`.

I observed the following peculiarities on my Pi 3B+:
- If the buffer is shorter than the string, the response header gives
  the full length, but no data is actually copied.
- No NUL terminator is added: even if the buffer is long enough to fit
  one, the buffer's original contents are preserved past the string's
  end.
- The VC firmware adds the following extra parameters beside the
  user-supplied ones (via /boot/cmdline.txt): `video`, `vc_mem.mem_base`
  and `vc_mem.mem_size`. This is currently not implemented in qemu.

Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>
Message-id: 20230425103250.56653-1-dani@danielbertalan.dev
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: added comment about NUL and short-buffer behaviour]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/bcm2835_property.h |  1 +
 hw/arm/bcm2835_peripherals.c       |  2 ++
 hw/arm/bcm2836.c                   |  2 ++
 hw/arm/raspi.c                     |  2 ++
 hw/misc/bcm2835_property.c         | 13 ++++++++++++-
 5 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/hw/misc/bcm2835_property.h b/include/hw/misc/bcm2835_property.h
index 712b76b7a32..ba8896610cc 100644
--- a/include/hw/misc/bcm2835_property.h
+++ b/include/hw/misc/bcm2835_property.h
@@ -30,6 +30,7 @@ struct BCM2835PropertyState {
     MACAddr macaddr;
     uint32_t board_rev;
     uint32_t addr;
+    char *command_line;
     bool pending;
 };
 
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 3c2a4160cd1..0233038b957 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -90,6 +90,8 @@ static void bcm2835_peripherals_init(Object *obj)
                             TYPE_BCM2835_PROPERTY);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
                               "board-rev");
+    object_property_add_alias(obj, "command-line", OBJECT(&s->property),
+                              "command-line");
 
     object_property_add_const_link(OBJECT(&s->property), "fb",
                                    OBJECT(&s->fb));
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index f894338fc6a..166dc896c09 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -55,6 +55,8 @@ static void bcm2836_init(Object *obj)
                             TYPE_BCM2835_PERIPHERALS);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
                               "board-rev");
+    object_property_add_alias(obj, "command-line", OBJECT(&s->peripherals),
+                              "command-line");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
 }
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 92d068d1f9d..7b9221c9244 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -280,6 +280,8 @@ static void raspi_machine_init(MachineState *machine)
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
+    object_property_set_str(OBJECT(&s->soc), "command-line",
+                            machine->kernel_cmdline, &error_abort);
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
     /* Create and plug in the SD cards */
diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
index de056ea2df8..251b3d865d7 100644
--- a/hw/misc/bcm2835_property.c
+++ b/hw/misc/bcm2835_property.c
@@ -282,7 +282,17 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
             break;
 
         case 0x00050001: /* Get command line */
-            resplen = 0;
+            /*
+             * We follow the firmware behaviour: no NUL terminator is
+             * written to the buffer, and if the buffer is too short
+             * we report the required length in the response header
+             * and copy nothing to the buffer.
+             */
+            resplen = strlen(s->command_line);
+            if (bufsize >= resplen)
+                address_space_write(&s->dma_as, value + 12,
+                                    MEMTXATTRS_UNSPECIFIED, s->command_line,
+                                    resplen);
             break;
 
         default:
@@ -420,6 +430,7 @@ static void bcm2835_property_realize(DeviceState *dev, Error **errp)
 
 static Property bcm2835_property_props[] = {
     DEFINE_PROP_UINT32("board-rev", BCM2835PropertyState, board_rev, 0),
+    DEFINE_PROP_STRING("command-line", BCM2835PropertyState, command_line),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.34.1


