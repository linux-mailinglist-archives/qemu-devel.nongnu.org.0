Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4E248ADE8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:51:44 +0100 (CET)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Gcp-0006aB-2z
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7GQS-0002dH-H6
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7GQG-0001Q9-Ps
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641904713;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pbG25pS5h3Ev4xfcCxXaGh8HVpV7FJifW0rMlR2h868=;
 b=fEryi/6x/qxBFUS+aQ9T3NbBu/DBcGrUfDPnxVogwwit5uv5SSjX+Yh/rif6gt/jKlVbtE
 FDV4ESmZkEDJg9YjIRiCT5iLzbI29bdRZHpELU+qzrTzV2Za6iH06zfigRQzhKvwIQJ9Qi
 sjgGYsLcaeZh0t2pHgAE8MDOGZQK3Vw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399--e_vvtGQOESzXwU76pMiWw-1; Tue, 11 Jan 2022 07:38:30 -0500
X-MC-Unique: -e_vvtGQOESzXwU76pMiWw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C4A1083F62;
 Tue, 11 Jan 2022 12:38:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7633477440;
 Tue, 11 Jan 2022 12:38:21 +0000 (UTC)
Date: Tue, 11 Jan 2022 12:38:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: Re: [PATCH] usb: allow max 8192 bytes for desc
Message-ID: <Yd16OkZB5C+rVnad@redhat.com>
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
 <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
 <Yd13NAsHpuRCMJRy@redhat.com>
 <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Peter Maydell <peter.maydell@linaro.org>, f4bug@amsat.org,
 qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 08:27:35PM +0800, zhenwei pi wrote:
> 
> 
> On 1/11/22 8:25 PM, Daniel P. Berrangé wrote:
> > On Tue, Jan 11, 2022 at 12:21:42PM +0000, Peter Maydell wrote:
> > > On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
> > > > 
> > > > A device of USB video class usually uses larger desc structure, so
> > > > use larger buffer to avoid failure. (dev-video.c is ready)
> > > > 
> > > > Allocating memory dynamically by g_malloc of the orignal version of
> > > > this change, Philippe suggested just using the stack. Test the two
> > > > versions of qemu binary, the size of stack gets no change.
> > > > 
> > > > CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > ---
> > > >   hw/usb/desc.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/usb/desc.c b/hw/usb/desc.c
> > > > index 8b6eaea407..57d2aedba1 100644
> > > > --- a/hw/usb/desc.c
> > > > +++ b/hw/usb/desc.c
> > > > @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
> > > >       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
> > > >       const USBDesc *desc = usb_device_get_usb_desc(dev);
> > > >       const USBDescDevice *other_dev;
> > > > -    uint8_t buf[256];
> > > > +    uint8_t buf[8192];
> > > >       uint8_t type = value >> 8;
> > > >       uint8_t index = value & 0xff;
> > > >       int flags, ret = -1;
> > > 
> > > I think 8K is too large to be allocating as an array on
> > > the stack, so if we need this buffer to be larger we should
> > > switch to some other allocation strategy for it.
> > 
> > IIUC, querying USB device descriptors is not a hot path, so using
> > heap allocation feels sufficient.
> > 
> Yes, I tested this a lot, and found that it's an unlikely code path:
> 1, during guest startup, guest tries to probe device.
> 2, run 'lsusb' command in guest(or other similar commands).
> 
> The original patch and context link:
> https://patchwork.kernel.org/project/qemu-devel/patch/20211227142734.691900-5-pizhenwei@bytedance.com/

Yes, the orignal patch is better I think.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


