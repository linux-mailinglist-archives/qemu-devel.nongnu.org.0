Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28E1479B87
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:13:26 +0100 (CET)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybOn-0003i2-9x
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMU-0001rS-9Y
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMR-0003LL-CD
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639840257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h0En5r2SnvecrsZJHKtKgqpIObNe+nJjSF5MpDLEH14=;
 b=TVHdhmw69H18twgUgl1YbzkAssu0lbnkIhr/o5XdmQaDy6qlQldJzOQAaZO8GrUdjopDeQ
 dWV0PgOfvIQCIF4YQfSrDy0zBj/OM9k5VampC32kcYKbYkYlondY0lO8uYanj4AAq+cwvw
 TeWlmz00+RgIfiT763KgvqdDnSEL6L4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-JG_4UcCyPLeKjB9SSrBZIg-1; Sat, 18 Dec 2021 10:10:56 -0500
X-MC-Unique: JG_4UcCyPLeKjB9SSrBZIg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so2478536wmq.9
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 07:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rGve00IMPfNWRLyY0P9hVTYhdrpCCBSYQ1Z9AG4zW3M=;
 b=2Bs0tv0w8dE9soyfukrLqPSrM/a3uWRi+YQ72zscmhcVxmVa6WMPZWeoF4kaqhZqaK
 FBNioIuC6QM1nqiWBjNfUoEGhkWFvILHvqLi4TDzgifvzCy4KEaCj3DaFrdMdxflVJfe
 ld7hy+pLYWdtlBar41WH3DGb2kAJROlKIFBPqXYwqGhWTs2JleSJANsZPtJ+nsuEuYTA
 7Tir1mlpfWlXVuTRzsEWlFNGkhKHVy070zX/ozjuTS+/GOozAOKQbGVlbdJte1H7+t/y
 aAyLJk6kzwdCxVYvDUv3A/qgONLk11zQsPi4cJn22cFPWlKT4mLJ1ceaY7w/e+/UoGpG
 ZHgg==
X-Gm-Message-State: AOAM531L3XSkmymarp56U8gDlBieapswhRTtJeECvJBhLGXXd90mp/pw
 ldZxvkK90wTqW1l3OpyrEcawjPeZptK5qgvoOicRdq/0hQld3km6XYuK+QcSMb5pagZ5sbqppG3
 n0ZKlPGW1XnSbl726feb9hmts5Z2kXB021FFc7nMVf1Llt36+IZg9sMLczd3P0Et2
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr11823125wme.58.1639840255453; 
 Sat, 18 Dec 2021 07:10:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysFrUOe0KRnRs14DBGVoCcNpbiGZRJWIVxW7qeDfTGc7zeNV68/uJzwpvJ+MtPOxIpvJbXxQ==
X-Received: by 2002:a1c:9d55:: with SMTP id g82mr11823095wme.58.1639840255029; 
 Sat, 18 Dec 2021 07:10:55 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d2sm10268683wra.61.2021.12.18.07.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:10:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] hw: Have DMA API take MemTxAttrs arg & propagate
 MemTxResult (part 4)
Date: Sat, 18 Dec 2021 16:10:48 +0100
Message-Id: <20211218151053.1545962-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After updating the dma_buf API (part 2) and the ld/st DMA API=0D
(part 3), we now update the ld/st PCI DMA API to:=0D
- take a MemTxAttrs argument,=0D
- propagate a MemTxResult.=0D
=0D
Based-on: <20211218145111.1540114-1-philmd@redhat.com>=0D
"Have DMA API take MemTxAttrs arg & propagate MemTxResult (part 3)"=0D
https://lore.kernel.org/all/20211218145111.1540114-1-philmd@redhat.com/=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  hw/scsi/megasas: Use uint32_t for reply queue head/tail values=0D
  dma: Let st*_pci_dma() take MemTxAttrs argument=0D
  dma: Let ld*_pci_dma() take MemTxAttrs argument=0D
  dma: Let st*_pci_dma() propagate MemTxResult=0D
  dma: Let ld*_pci_dma() propagate MemTxResult=0D
=0D
 include/hw/pci/pci.h | 28 ++++++++++++-------------=0D
 hw/audio/intel-hda.c | 12 ++++++-----=0D
 hw/net/eepro100.c    | 49 ++++++++++++++++++++++++++------------------=0D
 hw/net/tulip.c       | 36 +++++++++++++++++---------------=0D
 hw/scsi/megasas.c    | 38 ++++++++++++++++++++++------------=0D
 hw/scsi/mptsas.c     | 16 +++++++++++----=0D
 hw/scsi/vmw_pvscsi.c | 20 +++++++++++-------=0D
 hw/usb/hcd-xhci.c    |  1 +=0D
 hw/scsi/trace-events |  8 ++++----=0D
 9 files changed, 125 insertions(+), 83 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


