Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BF933453C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:35:54 +0100 (CET)
Received: from localhost ([::1]:40306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2kT-00080x-MT
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2He-00052s-8x
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Hb-00005a-Pd
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:06:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615395961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WcGfRNYJ0BsERVuaAzhPbzUUIPMEXjXUCFh4a0jlWNQ=;
 b=DiGiJrpqysM6TYv+SU32FtSQhXhsOMTrIV2EdnoIBz0HYlXHArPmw1OCZEmaRnybxUYbtj
 W4ltwgcogHfPChQnjsyaCnuhr1n3+0VHVyfy1R7wo480etp7tyG/6SHs7GPbw/S2xXN18A
 UBxcShYI2lBxQVP5m9Gf8Fxw8l1IQhc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-bCZ2LgtzO9-Lxb7qu2_rRQ-1; Wed, 10 Mar 2021 12:05:59 -0500
X-MC-Unique: bCZ2LgtzO9-Lxb7qu2_rRQ-1
Received: by mail-ej1-f69.google.com with SMTP id si4so7547316ejb.23
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:05:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WcGfRNYJ0BsERVuaAzhPbzUUIPMEXjXUCFh4a0jlWNQ=;
 b=K+HPBiNpvbkMTptbh0RUgsfAOYXrmy95a1WKCbFTcHtG3Goj/0YnFCAi9/wdGeY6/n
 vvl6Uwp3w2Hl3mvPGdheqlQFBdeVzI9s8+xoSbyDBVKHBZailxmIJlKo0oTVCq+yVh1H
 9B0l+VMZ/TbzSUrAaQ2e3yKtoNczBirHkOkYSLMN1IT1+ViVIAOuMWtpc7Qfjw2xx3g+
 3KcZm2o1/BNyMUuXwuIP4CSeVJks7CApue7dDonm0KggpdQl0J4oSEzg16OjXDlKyGAb
 GBn5eMHuSELbktXd57dk/B2GXJxaN97actsa337vMeQIvypaTj1/v9zL53vtaxiKfUOh
 Lkog==
X-Gm-Message-State: AOAM532XaEhqnzBLFHsf1AzifBYch/E5dGR2j1EX7iL81GPKq9aAYI06
 WYRjEZRSa3dw7G2K6EAQ4YjFvkDx/am/+Ln01FsKf8OTukswoI7VrKYvBnO9T6gGbM3com72kT2
 jXJm61jrL+eAtTls6+EWfhXSUQPHS5mzTK/4nun3QkraTBmAqqmFNWXkdZiM6g1GO
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr4526787edu.114.1615395957920; 
 Wed, 10 Mar 2021 09:05:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyvZ7K8yOFFJlQ6xMxkxrMQ34i1EbREce+mFhbUWaY5HpOF+n4yFRw+Keij723cXumQm4A4Sw==
X-Received: by 2002:aa7:dc4e:: with SMTP id g14mr4526755edu.114.1615395957691; 
 Wed, 10 Mar 2021 09:05:57 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u24sm34858ejr.34.2021.03.10.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 09:05:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] hw/block/pflash_cfi02: Open-code
 pflash_register_memory(rom=false)
Date: Wed, 10 Mar 2021 18:05:21 +0100
Message-Id: <20210310170528.1184868-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is only one call to pflash_register_memory() with
rom_mode == false. As we want to modify pflash_register_memory()
in the next patch, open-code this trivial function in place for
the 'rom_mode == false' case.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 0eb868ecd3d..897b7333222 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -467,8 +467,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
     switch (pfl->wcycle) {
     case 0:
         /* Set the device in I/O access mode if required */
-        if (pfl->rom_mode)
-            pflash_register_memory(pfl, 0);
+        if (pfl->rom_mode) {
+            pfl->rom_mode = false;
+            memory_region_rom_device_set_romd(&pfl->orig_mem, false);
+        }
         pfl->read_counter = 0;
         /* We're in read mode */
     check_unlock0:
-- 
2.26.2


