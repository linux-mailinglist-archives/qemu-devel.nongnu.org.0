Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560B94763D3
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:57:10 +0100 (CET)
Received: from localhost ([::1]:40988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbKn-0008Kg-2d
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbJP-0007Ov-DQ
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:55:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxbJN-0004sE-25
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:55:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639601739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=igvxfb/aYusWeyarBvd8wYyevdEAGBlY9RFgRJHtZK8=;
 b=E7it3nxdM03uhAdpqhWzg0pMqoG6A10QB+4TLlCcDu+3c1J7rJ9asGgOot76qg9eo5B+CC
 TPwRbdz4hbXOMbT1zyf/rv0mD4zuZxoFtPNCQAzF5xWR3PhHH5oy+azAMnv6Y1w5OBz94W
 I+PYQzYfAzUyYa4LYNhA1F/WUF/BVIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-IXMDIknRPTWMuOf8mGCsFg-1; Wed, 15 Dec 2021 15:55:39 -0500
X-MC-Unique: IXMDIknRPTWMuOf8mGCsFg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so9526885wms.8
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g1QZaUX7yV4EgKglh08VNobzVezCGWyGjEtpVWTYYRc=;
 b=YhZHKyUE1C9kfbrjDxTtWlEjEPINELnpo7lJXGyll9uOamRIyM2CqMCEss5ufsDexu
 C+0vrfYs176T/Kc3BMlcmg88gWi6EFeKzoSgKNYY7INibdN//C7XSU0nLTGqQ2unEcAi
 p0RYQHyivJOplcOSf0oFeJmTnKutYV3ZQyYYdkOe6d0txFk11snxSUY4KnwWUVwin0ys
 jYtglGbqjq7cnoNNv0e6Xf+J0Ri+OFwI5ZWpQ7lBqOu4mzpjF/XIEuvmQfkqoPz3/a9N
 Fe7xkHI9trqQHS6BdlCV3F6/6KPhSthvp+gC1vp4FmUdxKTPkQ//b/JQ2rNs5/6Pniwt
 Phog==
X-Gm-Message-State: AOAM530IrjOMBj19AmWLwqZSnhRdHLQN0k3hH3PKYqyOjU1GhCOA8RH5
 ryu1sJIe2af9H2Mu+i/YCm6rN0mqtg8h/gBy55pV9D3FSyEvZ+uSM6Jd9dkwUM2XRa4lg9O+kAY
 w6giTrVecsNRvKWb96O+yNsqcCnr7n0pspRdm5DDfM2DbOnI9ydwYxUY53pQbFdmO
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr1894412wmg.118.1639601737529; 
 Wed, 15 Dec 2021 12:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyskVEjgYfgBlX0qIRjmrl4MsviUeugIMBwnFXZBGoZBx+ZfzYvGoGnaQf+n5pm4nhzOrS/Ew==
X-Received: by 2002:a05:600c:1549:: with SMTP id
 f9mr1894380wmg.118.1639601737282; 
 Wed, 15 Dec 2021 12:55:37 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id v9sm3109635wrb.107.2021.12.15.12.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:55:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/sd/sdhci: Fix DMA re-entrancy issue
Date: Wed, 15 Dec 2021 21:55:24 +0100
Message-Id: <20211215205527.488480-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


