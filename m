Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF033323B0A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:09:12 +0100 (CET)
Received: from localhost ([::1]:55212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEs2Z-0006lT-Sg
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEs0a-0005gO-3k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:07:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lEs0X-0007ie-Jr
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:07:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614164824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KPmEpEP4TJpEip3BkWCYobLAg1uOT2Wpyz+7EwgjRRE=;
 b=PGqpnnb/X+bAwy+LfyOtuTPgP8zwqV23w21nGAn2GbeKwe0PgjPP4Rk8BbMXiyt+z0n6ap
 MBzFbidg/GDFip27laQbj5lxoXhbP3Wyf+rmVC6qtUGqlftdd+InbhQ7JD8Fnl12LyoUUU
 712F+AND29pVAntV0YeGttML6/ppttU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-PKvChP3KPlSdCS-MJEpFVw-1; Wed, 24 Feb 2021 06:07:03 -0500
X-MC-Unique: PKvChP3KPlSdCS-MJEpFVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29FF2835E27;
 Wed, 24 Feb 2021 11:07:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAC4276E0F;
 Wed, 24 Feb 2021 11:06:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CE97B18000AE; Wed, 24 Feb 2021 12:06:56 +0100 (CET)
Date: Wed, 24 Feb 2021 12:06:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2] ui/console: Pass placeholder surface to displays
Message-ID: <20210224110656.5pctwd7hdpvqi2na@sirius.home.kraxel.org>
References: <20210219144848.wy7wmel4lixaqkyb@sirius.home.kraxel.org>
 <20210220113810.78371-1-akihiko.odaki@gmail.com>
 <20210222105100.idqhislns33etne7@sirius.home.kraxel.org>
 <CAMVc7JXTXngrnKF-u91S7JHUMVWrDGLEdupX4XN99dM1ZPJw-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMVc7JXTXngrnKF-u91S7JHUMVWrDGLEdupX4XN99dM1ZPJw-w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > > -    if (!new_surface) {
> > > +    if (is_placeholder(new_surface)) {
> >
> > Same here.
> 
> The other surfaces created by qemu_create_message_surface() are not
> considered as "placeholder" here, and have contents to be displayed.

Which ones?  Pretty much any qemu_create_message_surface() use is
basically "we can't show the guest display for $reason".  Which is
the definition of a placeholder surface, isn't it?

> Since no emulated devices give NULL to dpy_gfx_replace_surface for the
> primary connection, it will never get the "placeholder", and its
> window will be always shown.

Well, this could change.  The special handling for scanout #0 in
virtio-gpu can go away when we have this in place.

Also:  The patch os growing, and it probably makes sense to split it
into a series, with one patch adding the placeholder flag and the core
code in console.c, next one patch for each UI, and finally one for
virtio-gpu ...

take care,
  Gerd


