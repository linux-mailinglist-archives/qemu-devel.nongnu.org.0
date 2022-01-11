Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AB48AD9B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:28:40 +0100 (CET)
Received: from localhost ([::1]:43180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7GGV-00049i-El
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:28:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7GDl-0001eE-9k
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:25:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7GDi-0007Gv-SU
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641903941;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FwDP/tPK24zgj+zRK4rB4L2pShZ3g2cizC65/joYwQ=;
 b=BAN5TJcKJMn5EjrQaVnXv4ifJk5zYkQRZxU+g7Xg5og3nIHi3VshRrSAYUKEQNTG52gJem
 pLSeoQ6+XrI4wW2YR4zae//kkE6m1dVb81CyM8s+GB4iTNb4u6dSWN/x/LPSwU1FMsAK1T
 2n9M4z7li/d5Lzwjla7TEjOD+zEaVow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-TD-XSWg8OqCGv89540E09A-1; Tue, 11 Jan 2022 07:25:33 -0500
X-MC-Unique: TD-XSWg8OqCGv89540E09A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 974881006AA6;
 Tue, 11 Jan 2022 12:25:32 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE1A76110;
 Tue, 11 Jan 2022 12:25:28 +0000 (UTC)
Date: Tue, 11 Jan 2022 12:25:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] usb: allow max 8192 bytes for desc
Message-ID: <Yd13NAsHpuRCMJRy@redhat.com>
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
 <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: f4bug@amsat.org, qemu-devel@nongnu.org,
 zhenwei pi <pizhenwei@bytedance.com>, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 12:21:42PM +0000, Peter Maydell wrote:
> On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
> >
> > A device of USB video class usually uses larger desc structure, so
> > use larger buffer to avoid failure. (dev-video.c is ready)
> >
> > Allocating memory dynamically by g_malloc of the orignal version of
> > this change, Philippe suggested just using the stack. Test the two
> > versions of qemu binary, the size of stack gets no change.
> >
> > CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > ---
> >  hw/usb/desc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/usb/desc.c b/hw/usb/desc.c
> > index 8b6eaea407..57d2aedba1 100644
> > --- a/hw/usb/desc.c
> > +++ b/hw/usb/desc.c
> > @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
> >      bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
> >      const USBDesc *desc = usb_device_get_usb_desc(dev);
> >      const USBDescDevice *other_dev;
> > -    uint8_t buf[256];
> > +    uint8_t buf[8192];
> >      uint8_t type = value >> 8;
> >      uint8_t index = value & 0xff;
> >      int flags, ret = -1;
> 
> I think 8K is too large to be allocating as an array on
> the stack, so if we need this buffer to be larger we should
> switch to some other allocation strategy for it.

IIUC, querying USB device descriptors is not a hot path, so using
heap allocation feels sufficient.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


