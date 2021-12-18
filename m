Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B8479B77
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 15:53:49 +0100 (CET)
Received: from localhost ([::1]:52846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myb5o-0007Ox-15
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 09:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3U-0005Nj-0E
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myb3Q-00018K-Nd
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 09:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639839078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pjx7rppd/jsRIWhc/SHB4wwV2A3BgaHq7TEstZ4HxPc=;
 b=WKcl54LdRm6VoYf/R9fh5rKhhQonJx2mcukJlUfZPKO5FiJypZqhGEK4YIcP817zmLifnP
 7HMyNyadain+OgPoES9Jax5/CWNgRmQJ/WfDixMiJy8se/XJQLQjCII7m82reKONao5uie
 F3DdRwUXTFY70lbbXO71zgWMQd1qNKQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-yLdSe44BOra9mU9y4ot-Gg-1; Sat, 18 Dec 2021 09:51:15 -0500
X-MC-Unique: yLdSe44BOra9mU9y4ot-Gg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j26-20020adfb31a000000b001a2356afd4fso1481351wrd.21
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 06:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GPuvlTcdSKoA0EL2bnyXPpJZqy/jDs21gtyi8DNVO+U=;
 b=rZ0oSTMwtHMK1T6M5xDsLj2qX/emGBmTKMlPyiwYDVpn01FyL3DC+OdjNRgqCrzsZP
 sQQvhhQSENixTV4BAQMNcQxwvduP1w+uXb4hIlyjk7mWsqYZygJr9obJiqz/5RzBBioo
 9NiLQOvYbCDYvmhFoXg/P9ERDHNnHTY5fTVhJdraZrbzfLX3Mr7wJhaoEqDA31A4WuK4
 lxgdBPNbCfFceQG/yyVsIj+Yg+6Wq3Ht6wBKYSmsNJHwivdcl2oUjZIMWS7qoXsmeSLd
 ZvXSc2kHZVqsyvDI4wX7g+jKpSQASyMsXP8E/BF/ojJtAcYXPFMDchvNCUTbB+cihT/Y
 iVDQ==
X-Gm-Message-State: AOAM532n/r/TILrUODoiJzxP57S2d+NsbNgx6Vcq4jjqBVhyJfT+w79x
 Eg8AgpAWGqkb0udg5H9aQ/k0m4FN2u/tKr8gbZQmtkLuVeBFZFGD/Yrfc0ibsrnnBmgxtB5mUWt
 ZA1+/5zkmJR+M2kSonQ87ZSIb9WcweeHta9K/rAgu0h8gvYwY8WbKdl+ArNrfbwfL
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr6499715wrv.694.1639839074308; 
 Sat, 18 Dec 2021 06:51:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMpGV+VzGMXxkJUKDUSDouhAZEIOF51gd82dNgdjhA/aWi+Ex7Te34n6ruJrUClsORLCQarg==
X-Received: by 2002:a5d:51c9:: with SMTP id n9mr6499682wrv.694.1639839073915; 
 Sat, 18 Dec 2021 06:51:13 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id l5sm12216356wrs.59.2021.12.18.06.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 06:51:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw: Have DMA API take MemTxAttrs arg & propagate
 MemTxResult (part 3)
Date: Sat, 18 Dec 2021 15:51:07 +0100
Message-Id: <20211218145111.1540114-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After updating the dma_buf API in part 3, we now update the ld/st API=0D
to:=0D
- take a MemTxAttrs argument,=0D
- propagate a MemTxResult.=0D
=0D
Based-on: <20211216123558.799425-1-philmd@redhat.com>=0D
"Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 2)"=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg856860.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  dma: Let st*_dma() take MemTxAttrs argument=0D
  dma: Let ld*_dma() take MemTxAttrs argument=0D
  dma: Let st*_dma() propagate MemTxResult=0D
  dma: Let ld*_dma() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h       |  8 ++++++--=0D
 include/hw/ppc/spapr_vio.h | 19 ++++++++++++-----=0D
 include/sysemu/dma.h       | 42 ++++++++++++++++++++------------------=0D
 hw/intc/pnv_xive.c         |  7 ++++---=0D
 hw/nvram/fw_cfg.c          |  4 ++--=0D
 hw/usb/hcd-xhci.c          |  7 ++++---=0D
 6 files changed, 52 insertions(+), 35 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


