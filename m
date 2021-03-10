Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E628334546
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:39:35 +0100 (CET)
Received: from localhost ([::1]:49672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2o2-0003eh-90
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:39:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hm-0005VO-Ct
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hk-0000Bb-Mj
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j4UkoIyPvyQtBOyx7RE8awlWIoogi5VQBygbejCvWQI=;
 b=YM5Pr2uitXmr/eGveNeBD/geNoqtu7Cfljfm8KpXmx6Et7/7jO1SSV7dy1MPbMwVPnO7ju
 YgE9W8FIliNOxW9giElttY3dzFslVHTsTbwSUlVrwPdfThv6o+PmPOm+y6aG8bX5vt9Y6Z
 bU6sKE2z9xCr4JGHkWu67DnmjKlV7Fc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-oDlAH4iKNQG0jzRbS-Tepw-1; Wed, 10 Mar 2021 12:06:10 -0500
X-MC-Unique: oDlAH4iKNQG0jzRbS-Tepw-1
Received: by mail-ed1-f71.google.com with SMTP id o24so8673086edt.15
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j4UkoIyPvyQtBOyx7RE8awlWIoogi5VQBygbejCvWQI=;
 b=Ix0YDiwaXPB81cY2rzI3Jnx8waoTKoixTQN0CXCroqqTF/rg7lNb7ODTJoYr1mjlxE
 GdwEFNGladXXoH7G8PNwXd6e1mFNesXsjz2f7jD6GVqA9M951YbqFbmOMd9eVgDWCpG8
 jTi5YZTYl2fA+xwqRqUlVGNXVDB95PTEzYj1fZh50Nl6hbultbDtCw9iV9O1MduQimfc
 m/BCElCtLLxdK2s3XeVNcGhV3mUExZCkOfLUHJ1K2h3r1Xlwm4TO6ZEQkOlBkqBpqYd5
 +85fUWkzv2hNtVw7IvaMOLxorwBsuwiClsfRNkPzXVGZXEkURIiw4QyWJnylt2uY6GhE
 +iuw==
X-Gm-Message-State: AOAM531OWVfUjSmIy2nwlPG6RUdZeZ/ouSqAHNUly+Qq9D3TYfZHI0bl
 pnRAfussgwp408RTCqG9QDpBUThX2eBj1eSal+T6ub0bLLs/JRXEc19YaaMJXNLRaB+CbrFAnTZ
 qtTc2a8p0GvW4Z0Q47MeKgcP8h0DNOSfx2Qpb5qjX0d9cegJyuSbq1HX/DpSfKhq+
X-Received: by 2002:aa7:c496:: with SMTP id m22mr4386484edq.292.1615395968710; 
 Wed, 10 Mar 2021 09:06:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBMFp4IixcQQnl1T8fTttG0NATBcxqx5apjcFwGkQ4cWQaft/+OArUyp9e5D/N4ix337M64g==
X-Received: by 2002:aa7:c496:: with SMTP id m22mr4386456edq.292.1615395968513; 
 Wed, 10 Mar 2021 09:06:08 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g11sm6774582edt.35.2021.03.10.09.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:06:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] hw/block/pflash_cfi02: Factor out
 pflash_reset_state_machine()
Date: Wed, 10 Mar 2021 18:05:23 +0100
Message-Id: <20210310170528.1184868-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210310170528.1184868-1-philmd@redhat.com>
References: <20210310170528.1184868-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is multiple places resetting the internal state machine.
Factor the code out in a new pflash_reset_state_machine() method.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2ba77a0171b..aea47a99c61 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -184,11 +184,17 @@ static void pflash_setup_mappings(PFlashCFI02 *pfl)
     pfl->rom_mode = true;
 }
 
+static void pflash_reset_state_machine(PFlashCFI02 *pfl)
+{
+    trace_pflash_reset();
+    pfl->cmd = 0x00;
+    pfl->wcycle = 0;
+}
+
 static void pflash_mode_read_array(PFlashCFI02 *pfl)
 {
     trace_pflash_mode_read_array();
-    pfl->cmd = 0x00;
-    pfl->wcycle = 0;
+    pflash_reset_state_machine(pfl);
     pfl->rom_mode = true;
     memory_region_rom_device_set_romd(&pfl->orig_mem, true);
 }
@@ -330,8 +336,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     default:
         /* This should never happen : reset state & treat it as a read*/
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
-        pfl->wcycle = 0;
-        pfl->cmd = 0;
+        pflash_reset_state_machine(pfl);
         /* fall through to the read code */
     case 0x80: /* Erase (unlock) */
         /* We accept reads during second unlock sequence... */
@@ -669,8 +674,7 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
                 }
                 reset_dq3(pfl);
                 timer_del(&pfl->timer);
-                pfl->wcycle = 0;
-                pfl->cmd = 0;
+                pflash_reset_state_machine(pfl);
                 return;
             }
             /*
@@ -710,10 +714,8 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 
     /* Reset flash */
  reset_flash:
-    trace_pflash_reset();
     pfl->bypass = 0;
-    pfl->wcycle = 0;
-    pfl->cmd = 0;
+    pflash_reset_state_machine(pfl);
     return;
 
  do_bypass:
-- 
2.26.2


