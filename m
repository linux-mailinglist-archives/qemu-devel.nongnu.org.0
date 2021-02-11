Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB03187D7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:15:13 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA90C-0003DQ-A0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lA8xS-0001wC-D1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lA8xM-0005dN-CR
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:12:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613038333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZyARgN7E2gMIP+HaC6c3drv1sInAL34AKCu1HUPM9SE=;
 b=bHpGj4JuMPkHe7W2FQ+yEQlIzQQKT1WrLeY7mTYVcXoApaCXKjpQHYeqTqYSK+qh2Jzo5x
 BGOJhwSRNxaMGx9h/FasZGCOgPHoNFD+8iHgFOcfA/MG0EZSmQOn/+qKVSoikNTh2+Ba1u
 3uE7Kf6Li1vsg7NLuAJB+Op+E3jnDRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-l6OFyQVANLq5Toxpovk9_w-1; Thu, 11 Feb 2021 05:12:11 -0500
X-MC-Unique: l6OFyQVANLq5Toxpovk9_w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83E1DC7400;
 Thu, 11 Feb 2021 10:12:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-161.ams2.redhat.com
 [10.36.112.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AA547095D;
 Thu, 11 Feb 2021 10:12:10 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2921418000B7; Thu, 11 Feb 2021 11:12:00 +0100 (CET)
Date: Thu, 11 Feb 2021 11:12:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: can surface_bits_per_pixel() for the console surface ever return
 anything other than 32 ?
Message-ID: <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
References: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> I notice that as well as handling surface_bits_per_pixel()
> possibly returning 8, 15, 16, 24, these devices also seem to
> check for the possibility it returns 0 (presumably meaning
> "no surface" or "no surface yet" ?).

Depends a bit on how the surface is created.

When using host memory as backing storage (typical workflow is
qemu_console_resize() + qemu_console_surface() calls) bits per pixel is
32 no matter what (format is PIXMAN_x8r8g8b8 to be exact).  I think this
is true for most if not all arm display devices.

Depth 15+15+24 can happen when the display device uses
qemu_create_displaysurface_from().  That is typically the case when
using guest-accessible memory (vga vram for example) as backing storage
for the surface.  Which implies there is no need for the display device
to update the surface in the first place because the guest can render
directly to the surface then.

"no surface" can only happen when the display device explicitly calls 
dpy_gfx_replace_surface(con, NULL).  virtio-gpu does that in case the
guest disables the output for example.

HTH,
  Gerd


