Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761CE33321C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:56:33 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJmDI-0004RI-Ho
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:56:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm8C-0004Pw-A3
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm87-00018y-Vu
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=li90BbxJJcTIEYAnFQu9nBy4MfdtLcbjqZ4YJMARg+0=;
 b=fCcQCwiQCljwbqEX+W284do5YFPQomZfsjIsYGkusADYQSJVXsBkLH+fJel8tPNMBD9rKs
 on900MzfxoJ8sotY0ru3T0zd8j5V8syQc5UdgogXRU4p1Jva1HLGbfGxiEKfCKHdNplMS4
 RI+As3aKKsc3Y58VGTWirzF2C3XsUvI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-nwJ2yADSP0-kj1Ki_7xu7w-1; Tue, 09 Mar 2021 18:51:09 -0500
X-MC-Unique: nwJ2yADSP0-kj1Ki_7xu7w-1
Received: by mail-ej1-f70.google.com with SMTP id bg7so355494ejb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=li90BbxJJcTIEYAnFQu9nBy4MfdtLcbjqZ4YJMARg+0=;
 b=qgrd3bRgcx5Ge84kqGAvQ8/wpFVtEH2fdrO8eUpMaW2IAZ3LeVurxst+VFsrab2MUm
 SbHca3Uir5ywUDbTYahYsHDSNzd0aAFaLD0rKXpCCtleVeZU/gSAK/+n/bgP37UcAeUe
 Wr9+BsD2knKsKnvCmrXNP3V5gEieSnqGmLVfPHfI5AuLgizGx25PNQsNQ/74zGFd0uhB
 7YBFN2rV0FB4rfWSGDihnDj2dR/LQwWHc9V0IYZsITehtT2NChBGmU9cF0t9azllhbo9
 G3ksRnlqVqmu8wvtuOP58DnOd/p9eWuHCKLISvNRrvLGx5+r7lYxjmfOmOxR4H+GkbEq
 7fCw==
X-Gm-Message-State: AOAM531rT3psCAFenbFt+0CLkgJLHXcP+jTBUuubMgUElRRHOdMNtA2/
 wTvGfHqdnRI/HO1XsCA8fUj3b2fOg3+HhQWjIxqOZYQWMCKqWQwelIXTr6A/Tjk/n6hajbLO31/
 A2b+YEnGOV3OA07bQDA7Tlm21Vkdy8wmKYaYJwhBWPtxyqusOIul32vy7rUqdTvXf
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr587656ejr.516.1615333868384; 
 Tue, 09 Mar 2021 15:51:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+IyyQQ6BFlk+Lfg5FF1ErQB4WC2WQAbbYLXUgf/CvqTXs0y732CHx0GYeRUqy/0402RiVCw==
X-Received: by 2002:a17:906:565a:: with SMTP id
 v26mr587634ejr.516.1615333868203; 
 Tue, 09 Mar 2021 15:51:08 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v8sm265800edx.38.2021.03.09.15.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:51:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] hw/block/pflash_cfi02: Factor out DeviceReset method
Date: Wed, 10 Mar 2021 00:50:26 +0100
Message-Id: <20210309235028.912078-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309235028.912078-1-philmd@redhat.com>
References: <20210309235028.912078-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There is multiple places doing a device reset. Factor that
out in a common method which matches the DeviceReset prototype,
so we can also remove the reset code from the DeviceRealize()
handler. Explicit the device is set in "read array" mode on
reset.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 2ba77a0171b..484b056b898 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -193,6 +193,14 @@ static void pflash_mode_read_array(PFlashCFI02 *pfl)
     memory_region_rom_device_set_romd(&pfl->orig_mem, true);
 }
 
+static void pflash_cfi02_reset(DeviceState *dev)
+{
+    PFlashCFI02 *pfl = PFLASH_CFI02(dev);
+
+    trace_pflash_reset();
+    pflash_mode_read_array(pfl);
+}
+
 static size_t pflash_regions_count(PFlashCFI02 *pfl)
 {
     return pfl->cfi_table[0x2c];
@@ -330,8 +338,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
     default:
         /* This should never happen : reset state & treat it as a read*/
         DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
-        pfl->wcycle = 0;
-        pfl->cmd = 0;
+        pflash_cfi02_reset(DEVICE(pfl));
         /* fall through to the read code */
     case 0x80: /* Erase (unlock) */
         /* We accept reads during second unlock sequence... */
@@ -710,10 +717,8 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 
     /* Reset flash */
  reset_flash:
-    trace_pflash_reset();
     pfl->bypass = 0;
-    pfl->wcycle = 0;
-    pfl->cmd = 0;
+    pflash_cfi02_reset(DEVICE(pfl));
     return;
 
  do_bypass:
@@ -977,6 +982,7 @@ static void pflash_cfi02_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = pflash_cfi02_realize;
+    dc->reset = pflash_cfi02_reset;
     dc->unrealize = pflash_cfi02_unrealize;
     device_class_set_props(dc, pflash_cfi02_properties);
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
-- 
2.26.2


