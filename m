Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C604B31B61B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:03:24 +0100 (CET)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBZmt-0002Hr-Tc
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lBZlK-0001Gg-7p
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:01:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lBZlI-0003PL-CT
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:01:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613379703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6EU2CbtY1+hSTeP9sW4+l01O52dUAAywi4jZvZYRQ0=;
 b=hQLQ3Rsy1nNX+C5YyHcXarkJ4CC04ZoiQkc2/I5f/9vQCP8+VCih92eKzrfTUHHK/LnNTX
 XMX/fKsLEBwb7SY4jKjgOrrfA60CR/L55o210sBrbSL5ky0c1WpnW26wg1eyllVlJh01ef
 GRP7JBOWH8SVl4Ez37Yjk5dEIJ2Ez1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-SIiVMr9uNNOWJURT1sNUww-1; Mon, 15 Feb 2021 04:01:39 -0500
X-MC-Unique: SIiVMr9uNNOWJURT1sNUww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F320E874980;
 Mon, 15 Feb 2021 09:01:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-164.ams2.redhat.com
 [10.36.112.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBAB461D33;
 Mon, 15 Feb 2021 09:01:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 35F6E1800383; Mon, 15 Feb 2021 10:01:36 +0100 (CET)
Date: Mon, 15 Feb 2021 10:01:36 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: can surface_bits_per_pixel() for the console surface ever return
 anything other than 32 ?
Message-ID: <20210215090136.e6iyhiluc36r6xbu@sirius.home.kraxel.org>
References: <CAFEAcA-DZJDe+DziaT9boPObnpnqyLj+-4-S+1ikFbqr_U-SDA@mail.gmail.com>
 <20210211101200.wyzaut76ik77dl2x@sirius.home.kraxel.org>
 <CAFEAcA9E-HpCv91DmBoxi2dZjXY0Nsy58dxUQ5HGFki4YK5uaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9E-HpCv91DmBoxi2dZjXY0Nsy58dxUQ5HGFki4YK5uaw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, Feb 12, 2021 at 06:38:16PM +0000, Peter Maydell wrote:
> On Thu, 11 Feb 2021 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > I notice that as well as handling surface_bits_per_pixel()
> > > possibly returning 8, 15, 16, 24, these devices also seem to
> > > check for the possibility it returns 0 (presumably meaning
> > > "no surface" or "no surface yet" ?).
> >
> > Depends a bit on how the surface is created.
> >
> > When using host memory as backing storage (typical workflow is
> > qemu_console_resize() + qemu_console_surface() calls) bits per pixel is
> > 32 no matter what (format is PIXMAN_x8r8g8b8 to be exact).  I think this
> > is true for most if not all arm display devices.
> 
> Quick follow-up check: this is always RGB, ie is_surface_bgr()
> will always return false, right ?

Yes, always rgb (in host native byte order).

take care,
  Gerd


