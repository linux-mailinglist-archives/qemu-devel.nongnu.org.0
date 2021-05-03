Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB8937130C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:34:19 +0200 (CEST)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUy2-0005fv-CI
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUwV-0004kl-OP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ldUwT-0008US-8t
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620034360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yblqy7+BjRA6ZpqsrnKZvhcS67Wb49+Ruuf27zigUqI=;
 b=MPctiqe6aHzYlGfkpLd6ROTZYrR5Wh+RGcrVgVTS3ViIDllRZHIOi/u+zIoIei0lDmTlv1
 tjGohfE0YpW04lLC4qiSO2xWEkUWuIRCwM74maGWoU7PoCkYZdnzab4tlkM2FW1yVZyAFW
 bV6tZXixKhBZlZ6taKSG4NlMqIu2oto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-MIuSvgPQMhO-cl7kh43muA-1; Mon, 03 May 2021 05:32:38 -0400
X-MC-Unique: MIuSvgPQMhO-cl7kh43muA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D88E31020C21;
 Mon,  3 May 2021 09:32:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 210EA60937;
 Mon,  3 May 2021 09:32:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C92DC1800398; Mon,  3 May 2021 11:32:30 +0200 (CEST)
Date: Mon, 3 May 2021 11:32:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v2 00/16] virtio-gpu: split into two devices.
Message-ID: <20210503093230.yim4lst2k3a3fc4p@sirius.home.kraxel.org>
References: <20210430113547.1816178-1-kraxel@redhat.com>
 <CAJ+F1C+cj6fAARksZfGcG-7mAjR2fRW91ZXpqr2DC8kiwGTVig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+cj6fAARksZfGcG-7mAjR2fRW91ZXpqr2DC8kiwGTVig@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, QEMU <qemu-devel@nongnu.org>,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 07:32:58PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Fri, Apr 30, 2021 at 4:23 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > Currently we have one virtio-gpu device.  Problem with this approach is
> > that if you compile a full-featured qemu you'll get a virtio-gpu device
> > which depends on opengl and virgl, so these dependencies must be
> > installed and the libraries will be loaded into memory even if you don't
> > use virgl.  Also the code is cluttered with #ifdefs and a bit messy.
> >
> > This patch series splits the virtio-gpu device into two:
> >
> >  (1) virtio-gpu-device becomes the non-virgl device, same as
> >      virtio-gpu-device,virgl=off today.
> >  (2) virtio-gpu-gl-device is the new virgl device, same as
> >      virtio-gpu-device,virgl=on today.
> >
> > When compiling qemu without virglrenderer support virtio-gpu-device
> > behavior doesn't change.
> >
> > v2:
> >  - rebase to latest master.
> >  - move pci and vga wrappers to separate modules.
> >  - fix ci failures.
> >
> 
> The patch series looks good.
> 
> But isn't that a breaking change? Any existing user of
> virtio-gpu/vga,virgl=on will no longer get a working setup. Right?

Correct.

> Imho, in
> this case (virgl VM being not very common) the benefit is worth it.
> However, I suggest to keep the 'virgl=' property, and print a deprecation /
> replaced-by warning, falling back to non-virgl/2d mode.

Problem with that is that libvirt uses the virgl property to figure
whenever virtio-gpu-pci / virtio-vga supports virgl or not.  So a dummy
virgl property just for printing a warning message doesn't look like a
good idea to me.

> Or perhaps we could
> have more cleverness to have virgl=on aliasing to the new devices.

If that is doable without ugly hacks I'm open to it.
Suggestions how to do that anyone?

take care,
  Gerd


