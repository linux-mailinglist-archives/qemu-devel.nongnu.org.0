Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F74F4203E6
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 22:28:40 +0200 (CEST)
Received: from localhost ([::1]:51350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX86B-0004Mr-B0
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 16:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mX84u-0003hE-3p
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mX84p-0007H0-Dn
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 16:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633292832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OvaB66/4WeE1yRlI3V8sHGXySU73cYChRyFwjaOiV2A=;
 b=cFhSwCl4p28ZM+CHSGpFof3AblzGNR5zOzadxDX2IDbnKZySq4ErVF3Np+XSCy/m4tIRdx
 qSK++EzusskoYb8mT87wlJyYvvq3KBK7t3bJOW3IDctJWWalCJlRGAS+vHTqPSrc7hMayF
 i00RhhCUGkeIuc0SY9Rssy4sRyJOQZo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-uk29Tm3nP0igrnT7qy3nzA-1; Sun, 03 Oct 2021 16:27:08 -0400
X-MC-Unique: uk29Tm3nP0igrnT7qy3nzA-1
Received: by mail-ed1-f72.google.com with SMTP id
 1-20020a508741000000b003da559ba1eeso15175601edv.13
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 13:27:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OvaB66/4WeE1yRlI3V8sHGXySU73cYChRyFwjaOiV2A=;
 b=J9Jrlu0GpmQa2EpvrEhBY8OXya9QpjltHoGo5cl35YOqd3WtgIxZsTGs76zxRl7+xt
 0ooc3SgkTmS1krvJcgjZNsQGryXRxD+qK+VKJIG94/KVslIXsGA6ms7bssXWacItol9T
 hUyoBfQdWK6aMOEVAYOeTs9iBy/sgLSccMuTXcMCkXy5MAVewM6e9eKHEZcQrLbB/5l8
 Peamc2DZ6Xx7bK9BI8DccGv8jCTGTDQWaDf2GJ6GzBhScjYAhT95Z1QZWCGYzUq0/q4l
 apB/IUBzt/ziJ8vtWm4E/+3obYOmD16zefO/UyMX5XyyHxoLBxMm9kGmOWrIc/sHu/42
 9ntA==
X-Gm-Message-State: AOAM531FJziXOSPMg8sABqC7Nt3WTsR7k6/PKrPk8QUf/yQcFjMoa/MY
 SU80OEj/xikh4DEcE6/YOCZ82pybGtFcCnjyQ7WAoxV3R8F/CA5LBBAfYJC3IgqNSXiHSJAm5o7
 9dyB/kUurdqvJwVk=
X-Received: by 2002:a17:906:848b:: with SMTP id
 m11mr12848234ejx.270.1633292827356; 
 Sun, 03 Oct 2021 13:27:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUFYAjyjnHwE8x4fpRr4BLFqIjyvA8itpTw8toMXzSWSyyD7fPNk/aKhQGVR/0iD7+Ofzm1Q==
X-Received: by 2002:a17:906:848b:: with SMTP id
 m11mr12848207ejx.270.1633292827034; 
 Sun, 03 Oct 2021 13:27:07 -0700 (PDT)
Received: from redhat.com ([2.55.134.94])
 by smtp.gmail.com with ESMTPSA id nd22sm5619196ejc.98.2021.10.03.13.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 13:27:06 -0700 (PDT)
Date: Sun, 3 Oct 2021 16:27:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtio 4M limit
Message-ID: <20211003162341-mutt-send-email-mst@kernel.org>
References: <2311207.AWRhmksWK6@silver>
 <9125826.uuVAOS58fx@silver>
MIME-Version: 1.0
In-Reply-To: <9125826.uuVAOS58fx@silver>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Oct 03, 2021 at 08:14:55PM +0200, Christian Schoenebeck wrote:
> On Freitag, 1. Oktober 2021 13:21:23 CEST Christian Schoenebeck wrote:
> > Hi Michael,
> > 
> > while testing the following kernel patches I realized there is currently a
> > size limitation of 4 MB with virtio on QEMU side:
> > https://lore.kernel.org/netdev/cover.1632327421.git.linux_oss@crudebyte.com/
> > 
> > So with those kernel patches applied I can mount 9pfs on Linux guest with
> > the 9p 'msize' (maximum message size) option with a value of up to 4186112
> > successfully. If I try to go higher with 'msize' then the system would hang
> > with the following QEMU error:
> > 
> >   qemu-system-x86_64: virtio: too many write descriptors in indirect table
> > 
> > Which apparently is due to the amount of scatter gather lists on QEMU virtio
> > side currently being hard coded to 1024 (i.e. multiplied by 4k page size =>
> > 4 MB):
> > 
> >   ./include/hw/virtio/virtio.h:
> >   #define VIRTQUEUE_MAX_SIZE 1024
> > 
> > Is that hard coded limit carved into stone for some reason or would it be OK
> > if I change that into a runtime variable?
> 
> After reviewing the code and protocol specs, it seems that this value is
> simply too small. I will therefore send a patch suggsting to raise this value
> to 32768, as this is the maximum possible value according to the virtio specs.
> 
> https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-240006

I think it's too aggressive to change it for all devices.
Pls find a way to only have it affect 9pfs.

> > If that would be Ok, maybe something similar that I did with those kernel
> > patches, i.e. retaining 1024 as an initial default value and if indicated
> > from guest side that more is needed, increasing the SG list amount
> > subsequently according to whatever is needed by guest?
> 
> Further changes are probably not necessary.
> 
> The only thing I have spotted that probably should be changed is that at some
> few locations, a local array is allocated on the stack with VIRTQUEUE_MAX_SIZE
> as array size, e.g.:
> 
> static void *virtqueue_split_pop(VirtQueue *vq, size_t sz)
> {
>     ...
>     hwaddr addr[VIRTQUEUE_MAX_SIZE];
>     struct iovec iov[VIRTQUEUE_MAX_SIZE];
>     ...
> }
> 
> > And as I am not too familiar with the virtio protocol, is that current limit
> > already visible to guest side? Because obviously it would make sense if I
> > change my kernel patches so that they automatically limit to whatever QEMU
> > supports instead of causing a hang.
> 
> Apparently the value of VIRTQUEUE_MAX_SIZE (the maximum amount of scatter
> gather lists or the maximum queue size ever possible) is not visible to guest.
> 
> I thought about making a hack to make the guest Linux kernel aware whether
> host side has the old limit of 1024 or rather the correct value 32768, but
> probably not worth it.
> 
> Best regards,
> Christian Schoenebeck
> 


