Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42193239FEF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Aug 2020 08:57:42 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2UPj-0006x5-U8
	for lists+qemu-devel@lfdr.de; Mon, 03 Aug 2020 02:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k2UON-00065l-LB
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 02:56:15 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43185
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1k2UOK-0001vb-Ma
 for qemu-devel@nongnu.org; Mon, 03 Aug 2020 02:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596437771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kw4pY+jKdki/d1k9ily6DV8XhwTulrsH41MyqnAOxgY=;
 b=UT6DEB41Ir7D1ftmw6VW24GWOEpCZgmOmILKn5EeveGonaesfWif9yorzH/APqYj9siwXY
 xTF1JWtMHni55n+4dSASGjz6MHs5IDPYm8plRKiudOnBlrE9W/FcVIyRwueMKFxIoOiQve
 U6PZbfRrRyKN4TugcU3LvbwTAYTye2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-MTwa8C58MPOfYeZEH0Wa8g-1; Mon, 03 Aug 2020 02:56:09 -0400
X-MC-Unique: MTwa8C58MPOfYeZEH0Wa8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8993C1030BCF;
 Mon,  3 Aug 2020 06:56:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726A7712EB;
 Mon,  3 Aug 2020 06:56:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F45811AB5; Mon,  3 Aug 2020 08:56:04 +0200 (CEST)
Date: Mon, 3 Aug 2020 08:56:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [Bug 1888606] [NEW] Heap-use-after-free in
 virtio_gpu_ctrl_response
Message-ID: <20200803065604.lvvplrxwc5yomwl7@sirius.home.kraxel.org>
References: <159548011952.31456.8249433335836304327.malonedeb@chaenomeles.canonical.com>
 <20200723153726.m6eckrxwkoooreh3@mozz.bu.edu>
MIME-Version: 1.0
In-Reply-To: <20200723153726.m6eckrxwkoooreh3@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/03 02:56:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bug 1888606 <1888606@bugs.launchpad.net>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > The ASAN trace:
> > ==29798==ERROR: AddressSanitizer: heap-use-after-free on address 0x60d0000050e8 at pc 0x560629814761 bp 0x7ffe916eb1e0 sp 0x7ffe916eb1d8
> > READ of size 8 at 0x60d0000050e8 thread T0
> >     #0 0x560629814760 in virtio_gpu_ctrl_response /home/alxndr/Development/qemu/hw/display/virtio-gpu.c:181:42
> >     #4 0x56062a8f1c96 in aio_bh_poll /home/alxndr/Development/qemu/util/async.c:164:13

> >     #1 0x560629827730 in virtio_gpu_reset /home/alxndr/Development/qemu/hw/display/virtio-gpu.c:1160:9

So it looks like the bottom half accesses stuff released by reset.

Guess the reset should cancel any scheduled bh calls to avoid that ...

Does the patch below help?

thanks,
  Gerd

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 5f0dd7c15002..18f0011b5a0a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1144,6 +1144,9 @@ static void virtio_gpu_reset(VirtIODevice *vdev)
     struct virtio_gpu_simple_resource *res, *tmp;
     struct virtio_gpu_ctrl_command *cmd;
 
+    qemu_bh_cancel(g->ctrl_bh);
+    qemu_bh_cancel(g->cursor_bh);
+
 #ifdef CONFIG_VIRGL
     if (g->parent_obj.use_virgl_renderer) {
         virtio_gpu_virgl_reset(g);


