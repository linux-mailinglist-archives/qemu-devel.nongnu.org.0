Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B153B2A8C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:41:33 +0200 (CEST)
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKvU-0002Px-VP
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKtY-0007UD-CT
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:39:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKtW-0006Ib-8t
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KMONyWjZHDWTcDKZgVImcioISyJIK1MQCSsztZ5sn4A=;
 b=gx0a9xHvBNDTLhufmcLAmUMA99Brzm4wqkyY9zq0gPKi3yE0tNc9SjAJ6++09AfUHjKcNz
 ZPuGc7jxVj9wAO7VGQc2/OcG7ghlGt51kdi2IRfkfmGW9/1EoqeukupYs/47YVaarPJN53
 wEjXquSY38BEtR7fYO9bdpIYaF+vccI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-UPhI8HIcMbS2jIzEd7dt7Q-1; Thu, 24 Jun 2021 04:39:27 -0400
X-MC-Unique: UPhI8HIcMbS2jIzEd7dt7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0808089D9D4;
 Thu, 24 Jun 2021 08:39:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6EE25DA2D;
 Thu, 24 Jun 2021 08:39:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C01F1180060E; Thu, 24 Jun 2021 10:39:21 +0200 (CEST)
Date: Thu, 24 Jun 2021 10:39:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v3 3/5] ui: Create sync objects and fences only for blobs
Message-ID: <20210624083921.5ciwcykojkb2fey6@sirius.home.kraxel.org>
References: <20210621192425.1188442-1-vivek.kasireddy@intel.com>
 <20210621192425.1188442-4-vivek.kasireddy@intel.com>
 <20210623081515.ezdchomanr73wrp5@sirius.home.kraxel.org>
 <2b7a5e50d754416fba8fc271054b0db1@intel.com>
MIME-Version: 1.0
In-Reply-To: <2b7a5e50d754416fba8fc271054b0db1@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> >   Hi,
> > 
> > >      dmabuf->buf.fd = res->dmabuf_fd;
> > > +    dmabuf->buf.blob = true;
> > 
> > Do you actually need the 'blob' field?
> > I think checking 'fd' instead should work too.
> [Kasireddy, Vivek] I want these changes to be limited to blob resources only as I do not
> know how they might affect other use-cases or whether they are needed there or not. I
> don't think I can rely on fd as vfio/display.c also populates the fd field:
>     dmabuf = g_new0(VFIODMABuf, 1);
>     dmabuf->dmabuf_id  = plane.dmabuf_id;
>     dmabuf->buf.width  = plane.width;
>     dmabuf->buf.height = plane.height;
>     dmabuf->buf.stride = plane.stride;
>     dmabuf->buf.fourcc = plane.drm_format;
>     dmabuf->buf.modifier = plane.drm_format_mod;
>     dmabuf->buf.fd     = fd;
> 
> Therefore, I need a way to identify a dmabuf that is associated with blobs vs others.

And it actually is a dma-buf too (the guest display provided by i915 gvt
mdev driver).  So fencing that should work, right?

Even if we have to restrict it to some kinds of dma-bufs the field
should have a more descriptive name like "allow_fences".

take care,
  Gerd


