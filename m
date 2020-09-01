Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5625870B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 06:50:33 +0200 (CEST)
Received: from localhost ([::1]:40940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCyFc-0001Iz-Ak
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 00:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kCyEt-0000tS-Cj
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 00:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kCyEq-0007qy-SV
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 00:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598935782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SLgcDxT0W3cj9QQpTiyecSi6vde/ia5HwuZnr8JSuBg=;
 b=UsyQMGTW9qHtCPBTzJ2cGzm6U8iLMpxy89+SxcZ6JVaLjp5BX7GaywSnKzb/zQXX6w6+EW
 SzyymwqCNJVXdOvnOBLamhRYHynmPMry3pnn3fPYDHu5rRRnXIW+4o+imF2ZaGW5DJIdjt
 8Ypm2T3X6kj5bw1FMFpgwo4KynJi70c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-WXU4BEZrPEG_u2laB09Iyw-1; Tue, 01 Sep 2020 00:49:38 -0400
X-MC-Unique: WXU4BEZrPEG_u2laB09Iyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79E0C805EE3;
 Tue,  1 Sep 2020 04:49:37 +0000 (UTC)
Received: from kaapi (unknown [10.74.8.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E01695D9D5;
 Tue,  1 Sep 2020 04:49:29 +0000 (UTC)
Date: Tue, 1 Sep 2020 10:19:26 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@kaapi
To: Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>
Subject: Re: [PATCH] xhci: check return value from usb_packet_map
In-Reply-To: <20200830152737.l3f42t2fvvrmdiwo@mozz.bu.edu>
Message-ID: <nycvar.YSQ.7.78.906.2009011011400.306228@xnncv>
References: <20200827115933.1851563-1-ppandit@redhat.com>
 <20200830152737.l3f42t2fvvrmdiwo@mozz.bu.edu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Ruhr-University <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Sun, 30 Aug 2020, Alexander Bulekov wrote --+
| I think there is already a fix queued for this one:
| https://www.mail-archive.com/qemu-devel@nongnu.org/msg734424.html

  Yes, it looks similar.

| > @@ -1615,7 +1615,14 @@ static int xhci_setup_packet(XHCITransfer *xfer)
| >      xhci_xfer_create_sgl(xfer, dir == USB_TOKEN_IN); /* Also sets int_req */
| >      usb_packet_setup(&xfer->packet, dir, ep, xfer->streamid,
| >                       xfer->trbs[0].addr, false, xfer->int_req);
| > -    usb_packet_map(&xfer->packet, &xfer->sgl);
| > +    if (usb_packet_map(&xfer->packet, &xfer->sgl) < 0) {
| > +        DPRINTF("xhci: setup packet failed: pid: 0x%x addr %d ep %d\n",
| > +                xfer->packet.pid, ep->dev->addr, ep->nr);
| > +        usb_packet_cleanup(&xfer->packet);
| > +        qemu_sglist_destroy(&xfer->sgl);
| > +        return -1;

We don't need 'usb_packet_cleanup' call? (to confirm)


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


