Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2EC3D0EDF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 14:41:59 +0200 (CEST)
Received: from localhost ([::1]:58776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6BXx-0005U4-Vn
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 08:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6BVy-00041Q-Ef
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6BVv-0002Z4-69
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 08:39:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626871189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LomIih3YhU+uKwtiBrULgNJVM4YJhEjcO2ZlT5xY4VY=;
 b=iFZi6C7gnZlT4kyWWbADjlpDzD/bNgfkQuElZIilcJA+It/Hqirx8UdH4mn0foMZjO508K
 YbUSDbQgfF9fOyEfMa6x2RExHV1Lmy90PQF6SQQ8PKGcyaZQBVD5K4wFA4wkeOG7+zMwjY
 Ods1kVJW/CoycjxnjDjcW2N07Le3f6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-nAlX_lJCMOKq8ECTOeKfYQ-1; Wed, 21 Jul 2021 08:39:45 -0400
X-MC-Unique: nAlX_lJCMOKq8ECTOeKfYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FBBC801FCE;
 Wed, 21 Jul 2021 12:39:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D0CF260854;
 Wed, 21 Jul 2021 12:39:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0EACD18000B2; Wed, 21 Jul 2021 14:39:42 +0200 (CEST)
Date: Wed, 21 Jul 2021 14:39:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH for 6.1 1/2] ui/gtk: add a keyboard fifo to the VTE
 consoles
Message-ID: <20210721123942.q7omeebgo4o2feyo@sirius.home.kraxel.org>
References: <9e436e5c-ed11-69ec-3cb9-a19cbf96cb08@t-online.de>
 <20210718074757.22489-1-vr_qemu@t-online.de>
MIME-Version: 1.0
In-Reply-To: <20210718074757.22489-1-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Zack Marvel <zpmarvel@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +static void gd_vc_send_chars(VirtualConsole *vc)
> +{
> +    uint32_t len, avail;
> +    const uint8_t *buf;
> +
> +    len = qemu_chr_be_can_write(vc->vte.chr);
> +    avail = fifo8_num_used(&vc->vte.out_fifo);
> +    if (len > avail) {
> +        len = avail;
> +    }
> +    while (len > 0) {
> +        uint32_t size;
> +
> +        buf = fifo8_pop_buf(&vc->vte.out_fifo, len, &size);
> +        qemu_chr_be_write(vc->vte.chr, (uint8_t *)buf, size);
> +        len -= size;
> +        avail -= size;
> +    }
> +    /*
> +     * characters are pending: we send them a bit later (XXX:
> +     * horrible, should change char device API)
> +     */
> +    if (avail > 0) {
> +        timer_mod(vc->vte.kbd_timer,
> +                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 1);
> +    }

There is ChardevClass->chr_accept_input() which gets called when you can
send more data, so there is no need to use a timer for that.

Typical workflow is to only read data when it can be pushed forward to
the guest, so when the guest stops reading data qemu stops doing so too,
effectively forwarding the stalls.  Which works fine for things like tcp
sockets.  Not so much for user input though.

So, yes, just throw away data is the only option we have here.  Adding a
reasonable-sized fifo makes sense too to cover bulky input, so you can
cut+paste a longish URL even if the guest accepts only a few chars at a
time (16550 fifo is 16 chars IIRC ...).

I would suggest to keep things simple, just throw away what you can't
store in the fifo, I don't see the point taking different actions
depending on how long the stalls are lasting (patch 2/2).

take care,
  Gerd


