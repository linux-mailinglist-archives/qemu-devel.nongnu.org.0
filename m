Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB58B4763D7
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:59:45 +0100 (CET)
Received: from localhost ([::1]:46906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbNI-0003sm-NY
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:59:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKq-0000rV-4b
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbKo-000585-4k
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:57:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=igvxfb/aYusWeyarBvd8wYyevdEAGBlY9RFgRJHtZK8=;
 b=Gc3i0WSlZrq1g8bbbzdtXPuDBGAuijWnWlX7MMulDqQX103WV4UIiQV30XGjxO3Cq625H4
 SYsoRUbGtVKxmqZsxjjHcwXbkqIh3pc9/IXT0GEXcOHkOTPIK3vIGdjlzSoDsc4prtBWYH
 k8QIVZaqigWn+9jzAtOH38b52TjJScw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-dhxh1P-lO6GYxgecKf_qoA-1; Wed, 15 Dec 2021 15:57:08 -0500
X-MC-Unique: dhxh1P-lO6GYxgecKf_qoA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so166151wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1QZaUX7yV4EgKglh08VNobzVezCGWyGjEtpVWTYYRc=;
 b=5pePjJOHWcDW43JpVeM9DCZLUfXeRNAGXu3mAlqxrh0g2C74dOGMEvv0zFx1XK+tuP
 JUSjU40d+IHo80e1cVCqe0+z92mGH5uZ2Izpn0zNmTMP2uLeMUbpSXjRu3sp+QgPpNuD
 z6v720RRq87kSMISoqlP/Esw3oe/8a4vbflS8065lpL7XhHmnElfjn535lauFedYQIrb
 Oy/fqh17VT0ZpZdtUVcUqlU3XIfJtDZvIrR9UKXu2wDyCmJQyQrCoPKH1+JZLIHFFC4c
 5nNMOEGARu980m9XAJnxMIxj+ADRX7Xs9XBrzY0PW1OWSAnELCCbw49NaONt5ForNKbS
 om3A==
X-Gm-Message-State: AOAM533BwwVCfv6VpYrSCncYsUvMrOvFT+vsj04fZMx2ao45rfaQ5lau
 PYbvlafKhDmo/xFDWmjplt1HsD4VmyuFQKg1D6Cfd0vn2hgWOIC7/rGdyzsW74v0Jt7t3RgqpvA
 6sC24t9R9Z9loFu4EPDgUoW5T66p/KIjmuGPVCUyP7IgHxfRzPgyg9f6GLf8EOlz5
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr1893415wmh.15.1639601825960;
 Wed, 15 Dec 2021 12:57:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMFJlnmEm+zqeUY/edpzf/3cWhZBpWGq7FHu88ens9qn20xgiFSI5mfrL6ILzSl4a1S3/3Bw==
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr1893375wmh.15.1639601825698;
 Wed, 15 Dec 2021 12:57:05 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u12sm2927470wrf.60.2021.12.15.12.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:57:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/3] hw/sd/sdhci: Fix DMA re-entrancy issue
Date: Wed, 15 Dec 2021 21:56:53 +0100
Message-Id: <20211215205656.488940-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is an attempt to fix the DMA re-entrancy problem=0D
on the SDHCI device. OSS-Fuzz found it and Alexander generated=0D
a helpful reproducer.=0D
=0D
By setting the MemTxAttrs::memory bit before doing DMA transactions,=0D
the flatview API will return MEMTX_BUS_ERROR if the transaction=0D
targets a non-memory (a device), which is usually how DMA-reentrancy=0D
bugs are exploited.=0D
=0D
On real hardware, the checks are on the interconnect bus, not in=0D
the SDHCI block. However QEMU blocks aren't modelled that way.=0D
Using the flatview API seems (to me) the simplest and closer=0D
to hardware, it is a generic API and we can use it to trace=0D
bus transactions on all blocks.=0D
=0D
Note this series is simply one example to fix the generic=0D
issues. The important changes are in the previous series:=0D
https://lore.kernel.org/qemu-devel/20211215182421.418374-1-philmd@redhat.co=
m/=0D
Based-on: <20211215182421.418374-1-philmd@redhat.com>=0D
"physmem: Have flatview API check bus permission from MemTxAttrs"=0D
=0D
Cc: Mauro Matteo Cascella <mcascell@redhat.com>=0D
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>=0D
Cc: Peter Xu <peterx@redhat.com>=0D
Cc: Jason Wang <jasowang@redhat.com>=0D
Cc: David Hildenbrand <david@redhat.com>=0D
Cc: Gerd Hoffmann <kraxel@redhat.com>=0D
Cc: Peter Maydell <peter.maydell@linaro.org>=0D
Cc: Li Qiang <liq3ea@gmail.com>=0D
Cc: Thomas Huth <thuth@redhat.com>=0D
Cc: Laurent Vivier <lvivier@redhat.com>=0D
Cc: Bandan Das <bsd@redhat.com>=0D
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>=0D
Cc: Darren Kenny <darren.kenny@oracle.com>=0D
Cc: Bin Meng <bin.meng@windriver.com>=0D
Cc: Paolo Bonzini <pbonzini@redhat.com>=0D
Cc: Alexander Bulekov <alxndr@bu.edu>=0D
Cc: Stefan Hajnoczi <stefanha@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sd/sdhci: Honor failed DMA transactions=0D
  hw/sd/sdhci: Prohibit DMA accesses to devices=0D
  tests/qtest/fuzz-sdcard-test: Add reproducer for OSS-Fuzz (Issue=0D
    29225)=0D
=0D
 hw/sd/sdhci.c                  | 35 ++++++++++++----=0D
 tests/qtest/fuzz-sdcard-test.c | 76 ++++++++++++++++++++++++++++++++++=0D
 2 files changed, 102 insertions(+), 9 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


