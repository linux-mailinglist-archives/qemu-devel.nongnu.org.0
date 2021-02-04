Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1133B30EE7E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:34:42 +0100 (CET)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7a65-0007T8-4B
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7a3l-00062P-6N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:32:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l7a3g-0003Bz-L1
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 03:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612427528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z8fzRMKeKITPsIL0lVIoOrHHflkwIkHl0uf4vj+zRw4=;
 b=FzceIUpRLNvoeL0HHFJQrBV8H/dNrGQfZPwTsW76RrQDtejeNWkiUgKVXSpvti+/NU/2Lh
 xAESN93hXWho/IWxwdTGQKtqX+LZCu3TlMDo9ClSnTD+pGZozIwf3sm+0WWuM8qkm9lL1u
 p2KB53DDHc5c/Y3NX0PhxoEuE1yuR8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-kld1GpYcOlSLJi85vBZf3Q-1; Thu, 04 Feb 2021 03:32:06 -0500
X-MC-Unique: kld1GpYcOlSLJi85vBZf3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2A936D4E6
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 08:32:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CE6210013C1;
 Thu,  4 Feb 2021 08:32:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F29121800385; Thu,  4 Feb 2021 09:32:00 +0100 (CET)
Date: Thu, 4 Feb 2021 09:32:00 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 11/20] ui: add an optional get_flags callback to
 GraphicHwOps
Message-ID: <20210204083200.xduubtproypxcgtv@sirius.home.kraxel.org>
References: <20210202142625.609070-1-marcandre.lureau@redhat.com>
 <20210202142625.609070-12-marcandre.lureau@redhat.com>
 <20210203154820.wolx57xxegwdw7q2@sirius.home.kraxel.org>
 <CAMxuvaxDMR2a+mKFPjA29rQrTzbNPt7hpBWVqBvV3iAABTLeoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvaxDMR2a+mKFPjA29rQrTzbNPt7hpBWVqBvV3iAABTLeoA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 02:21:02AM +0400, Marc-André Lureau wrote:
> On Wed, Feb 3, 2021 at 7:48 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> 
> > > +static int
> > > +virtio_gpu_get_flags(void *opaque)
> > > +{
> > > +    VirtIOGPUBase *g = opaque;
> > > +    int flags = GRAPHIC_FLAGS_NONE;
> > > +
> > > +    if (virtio_gpu_virgl_enabled(g->conf))
> > > +        flags |= GRAPHIC_FLAGS_GL;
> > > +
> > > +    if (virtio_gpu_dmabuf_enabled(g->conf))
> > > +        flags |= GRAPHIC_FLAGS_DMABUF;
> >
> > fbe6ba76ac01 ui: add an optional get_flags callback to GraphicHwOps
> > ERROR: braces {} are necessary for all arms of this statement
> > #50: FILE: hw/display/virtio-gpu-base.c:123:
> > +    if (virtio_gpu_virgl_enabled(g->conf))
> > [...]
> >
> > ERROR: braces {} are necessary for all arms of this statement
> > #53: FILE: hw/display/virtio-gpu-base.c:126:
> > +    if (virtio_gpu_dmabuf_enabled(g->conf))
> > [...]
> >
> > total: 2 errors, 0 warnings, 68 lines checked
> >
> 
> If you queued the series, do you mind squashing a style fix? Otherwise I
> can resend.

Whatever is easier for you (note there are more codestyle warnings in
following patches, see patchew report).

take care,
  Gerd


