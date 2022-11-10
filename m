Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2A623BD2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 07:27:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot10F-0001cy-Pe; Thu, 10 Nov 2022 01:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10E-0001b9-45
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:30 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot10C-0008BK-Fe
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 01:25:29 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 130so1010513pfu.8
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 22:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S71uA1qqGC/6TbeUsoWwC8+Ke/IgKE6MHXg9S63X/NM=;
 b=SvdcrHY2llLs4WZ3DvA/ncziaTqbJB351OtwHnPQwOYmURQ8NlIRyreRtXb/DesUKz
 PdCHpes9TJ23o6WK6f/3o7tpq3e6NK1B9FM5nrdRbDhGOf+VvkFH5ZRAtH0HL5I8amaz
 OWuN8NeilWMFejjIupDvX4e6kyHQj9vS2Kjdu7u7VMC7PbOF7UbMUn7Y0aOeul9+oRcg
 HcjzOHQoOJJe5S6Ld0XRHyP2V4qeP6hfj04Q6ub0Zv+ge5R5uEl9DCP8bwgbji+dH+0h
 DZ+CqHbtgVrxDZDCwLKzimc6BUCC62u9+4r9wUuifusx8LO1kvdNzeMfBL50A7pUHhj1
 i99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S71uA1qqGC/6TbeUsoWwC8+Ke/IgKE6MHXg9S63X/NM=;
 b=EgwORPiO9NNrb/jBdaORG1xM9Ps4jea6ebEnKYoHg4ju0hpM8Ax6+i4c5eCJ/3f+W0
 vSoc72aAH6mQHRDTHNw3SyvFT52Q6DUiwvxRW5o8FD50xM/e4twiEZRYLUqR2gI/YScK
 DM2/GB11i40viGe3VB/4d4V7ClM96YL6qsSAkSajP7N/7KM9baA5frzHH+6cHjfOtfal
 4vhv539PYXsxke5F6FkHhdkxlfxpb3TF2qhd0uVhJnScwR60ZlwhhTECtbonW/Xj51dr
 WemodSPUpv+oRGnz4sfnEkaroVjw9/R74rK1FH98sVSKcsEsWgSFoOsxLf+8UzHhyoUA
 pzGg==
X-Gm-Message-State: ACrzQf27kLyJewgz6oCbwr8qOjETJQ3GUFiIDu6fLxBLMjAt40YiLXpG
 tW7OrsASVrNIvANbxc7kO/0XDGrOT0I/CVPF
X-Google-Smtp-Source: AMsMyM6JikEmRZQunYdpsOQwSF3vlcb2gC6ojlu0XzZCSxGcUG9fvpeiWNS66sanZjs3z05wwSomJA==
X-Received: by 2002:a62:1544:0:b0:56d:6af0:c131 with SMTP id
 65-20020a621544000000b0056d6af0c131mr54779410pfv.51.1668061525873; 
 Wed, 09 Nov 2022 22:25:25 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a17090ade0400b002108cabbe31sm2289003pjv.9.2022.11.09.22.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 22:25:07 -0800 (PST)
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
Subject: [PATCH 01/10] qga: Remove platform GUID definitions
Date: Thu, 10 Nov 2022 15:23:20 +0900
Message-Id: <20221110062329.13363-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110062329.13363-1-akihiko.odaki@daynix.com>
References: <20221110062329.13363-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


