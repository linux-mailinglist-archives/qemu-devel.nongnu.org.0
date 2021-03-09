Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A099A333216
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 00:53:04 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJm9v-0006tY-N4
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 18:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm80-00046r-3Y
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJm7x-0000z8-Px
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 18:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615333861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q/qFh6Xk9X0lvLpKMyB8xS7GnadqS9EROoiuzpTd3qo=;
 b=RkHOEoHvoHVEpwfqa/oST5ELIKlqQX0aXAgVzuhL2HHWhjuKtY5OAxvx53LWbemebj8MSu
 ffKISPVvsaFSn3vAmXBx9dBp9FS0F6H5kEx8cZPzufYy5u0HEO8EH44f5Kaz1ou8iRpg0N
 HVJiRgSqkgeLBqLRRzvJTuEGW3BXxhY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-8MYiIg7-MHKnLHqWYJ8Myw-1; Tue, 09 Mar 2021 18:50:59 -0500
X-MC-Unique: 8MYiIg7-MHKnLHqWYJ8Myw-1
Received: by mail-ej1-f72.google.com with SMTP id rl7so6387951ejb.16
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 15:50:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/qFh6Xk9X0lvLpKMyB8xS7GnadqS9EROoiuzpTd3qo=;
 b=a/KIiOxQ6LYyAT6eUzoBMmFvtIzbdXr8wnVop0ad1ukN/pJfYNUnRc87DiujIpoRiI
 /eyjP0lWC7cudOOP2LCqbYTln+nzwt5c3yZq9gnAr+JT4bc54VAzcopRNUVkVHTNPCBe
 DENW4Qig1SIJUdoJPPw1xUtjiWeGyEOmnyM+arnvgvVWNE+khEIgcAgGlR5sYiYk74z4
 1nDmdmTf16oz8HTf1g9yKaGiC/eRTnlhoTPK4CLVaX/V0h3zXYf4rZnSGnWDdpvMrWgP
 nBh5WotbNEV+MC3U5OXipotruQoDdmiojCMedmvuy+epbM+3yXXsEqmw207qb3qjhxRn
 luJg==
X-Gm-Message-State: AOAM53374y0c/cPIyAMB4XdFzgLVQ5dlsjI1rgcHdPZlEn0M3TntRlIe
 DF499kUlmkZHMZmB1yxRCtPItSD4vNllM3My8Rr92Nw2Ap6SvpcI1cp4K4jrm87T5yFhTie21D9
 LzdFtCMwsTuq3KWZqFOf8UiZQe8JK9FFpk/a2V3KWhmvnSTGot/xvYWjykV4VzWQW
X-Received: by 2002:a17:906:add7:: with SMTP id
 lb23mr547342ejb.273.1615333857939; 
 Tue, 09 Mar 2021 15:50:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbxQqKkXc9vnwzMUQF/ITk6sOkSsFWeMVQ11Gg30iVDpo58qrs9xT1vJQQJ0oBBG3z4C7PSg==
X-Received: by 2002:a17:906:add7:: with SMTP id
 lb23mr547324ejb.273.1615333857719; 
 Tue, 09 Mar 2021 15:50:57 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id gt37sm1632919ejc.12.2021.03.09.15.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 15:50:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/9] hw/block/pflash_cfi02: Open-code
 pflash_register_memory(rom=false)
Date: Wed, 10 Mar 2021 00:50:24 +0100
Message-Id: <20210309235028.912078-6-philmd@redhat.com>
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

There is only one call to pflash_register_memory() with
rom_mode == false. As we want to modify pflash_register_memory()
in the next patch, open-code this trivial function in place for
the 'rom_mode == false' case.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 5f949b4c792..4efbae2f0c9 100644
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


