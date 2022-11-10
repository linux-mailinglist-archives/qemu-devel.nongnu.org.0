Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30205623F81
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sk-0002wH-7X; Thu, 10 Nov 2022 05:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SK-0002su-Np
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:44 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4SJ-0006Sj-0C
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:06:44 -0500
Received: by mail-pg1-x52e.google.com with SMTP id s196so1348694pgs.3
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S71uA1qqGC/6TbeUsoWwC8+Ke/IgKE6MHXg9S63X/NM=;
 b=GO8WB5ka6tue1ww5t9EDi25pnB8BMHJzfN5Ib9bNU4FCiwYIQuZJy63ZzDqvmc+u+w
 4OowzgYlQxV/kHLv9AoLd38HfFV8bWESXF0RYyw1vq35/j/DaqNEMBT+C63zg4baRvqy
 FPJm6AS3v89MwbGwRWe+/LavDZFId/eG03Vwr+RAL5/VxjbtvVSbwRjqnnjdcz3Ofss8
 HWER7E9ImD/h2mb/+dTCZcpWCbfquKpFj63iYFgMD94C3rf+NZlziNIHVQUSpcPK5oZM
 odBb6AatY+CqaFbAuZhnksJC68RgRdPXakeCfQmXBnT++Nfip/Byz1YgpPX3aWj/w0Hh
 XyXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S71uA1qqGC/6TbeUsoWwC8+Ke/IgKE6MHXg9S63X/NM=;
 b=3iZ7svIeRv30OYde5GcuAfprZ1jud3hfnzM6IjEJCVRd3tZt1jHPkQOByp6eQoQKP2
 tFS852cyz05Rd8LVET79vtUQ0L1K05EHu+V/y6haKGq1nl7HFk5bCfCoW0hkfvTE0ywg
 d0bFueX17FhIBW45Yza2dHsTzmnU3NogFahlUS04RHMBJjtW0KBRK0AzYQCVjEnDmwpd
 dS5sVRpUVAde//+V1r3EW6vnvemDI6NQVaXTVUGXLCPHplPZvY+qJyeKzcorlWZftp0Z
 6Ic/gTlKDP4dnIkl+6PScA+ZaWihu17CehdNmVo2WPzS5okfg8VPr9H+la69zPPhpWM4
 woQw==
X-Gm-Message-State: ACrzQf2ld/Fkrles9Kig30mBOmhOnfB71G0UZizwQ3QtXgh5GWdtNAU+
 D4i9nl9u5DSPQ9xr//74eXK1iuoVr10FdVAj
X-Google-Smtp-Source: AMsMyM7SSJAfF/ZuaLKWWtabtMQhI6q32tc93XKuqPP9L4ykDCeo2f70l2GCbxFct+YIYNf4K+PbJw==
X-Received: by 2002:a05:6a00:1988:b0:56d:315d:e371 with SMTP id
 d8-20020a056a00198800b0056d315de371mr60017823pfl.20.1668074800147; 
 Thu, 10 Nov 2022 02:06:40 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:06:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 01/10] qga: Remove platform GUID definitions
Date: Thu, 10 Nov 2022 19:06:20 +0900
Message-Id: <20221110100629.61496-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

GUID_DEVINTERFACE_DISK and GUID_DEVINTERFACE_STORAGEPORT are already
defined by MinGW-w64. They are not only unnecessary, but can lead to
duplicate definition errors at link time with some unknown condition.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 qga/commands-win32.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index ec9f55b453..dde5d401bb 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -506,13 +506,6 @@ static GuestDiskBusType find_bus_type(STORAGE_BUS_TYPE bus)
     return win2qemu[(int)bus];
 }
 
-DEFINE_GUID(GUID_DEVINTERFACE_DISK,
-        0x53f56307L, 0xb6bf, 0x11d0, 0x94, 0xf2,
-        0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
-DEFINE_GUID(GUID_DEVINTERFACE_STORAGEPORT,
-        0x2accfe60L, 0xc130, 0x11d2, 0xb0, 0x82,
-        0x00, 0xa0, 0xc9, 0x1e, 0xfb, 0x8b);
-
 static void get_pci_address_for_device(GuestPCIAddress *pci,
                                        HDEVINFO dev_info)
 {
-- 
2.38.1


