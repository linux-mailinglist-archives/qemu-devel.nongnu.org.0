Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FF06ABF38
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 13:12:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ9he-0008Ma-Ks; Mon, 06 Mar 2023 07:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZ9hb-0008M3-7d
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZ9hZ-0007qz-ES
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 07:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678104744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba4Xudlxo5/Y1yaJF2J3Fv4s4bdF3zkVeGFIWNZmZEA=;
 b=eOrweTQTdfBvdVOrzqZ4RRJxmM9dSK3Rtygm5w7khFiUdETT8sW50AHEyOuRYsOajuF4Yf
 l4a7kHKxOfkM4UzG+JUNr1M3aR3Q3buttRrTEjKK2+iDukz93ffzuIOLxMW++cZJ1Tkunx
 YQgGLWjh5RyZgpzMr49iqE8pu94x0dw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-vvJvoYgaMX2RKrU5Q-v1hg-1; Mon, 06 Mar 2023 07:12:22 -0500
X-MC-Unique: vvJvoYgaMX2RKrU5Q-v1hg-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so6677765wml.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 04:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678104741;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ba4Xudlxo5/Y1yaJF2J3Fv4s4bdF3zkVeGFIWNZmZEA=;
 b=RsGKdp6F3g0rsE4V8W5LokNKY1Yy3rW8PR4RHwfnkL7umUTtEh2krPs+g5o7Y/4KaD
 Bf+Kjd4E0nRPfyCAyCPLzt/GO46A7s6noF2OvVn8XvQ80SVyHYsX7S5FgpNnamUaaNI1
 mPVcwE7VjcsSh8DcBprCmUObNk8WVWLB6oKy+awMNphRLKV2M1RnLLPyEObmrtxhQFhh
 +cNIKqSyPgnLn/VW+SnZpOtgU4fde7oHbBf3i1WY4Gi7gjfhPEWT5WnG42rMjh4VwJhp
 eLcIMzV4soXce1HVKENgz8u64ZrDS1RKPnjSDxmd3FkdyCXu0SeP5p0tJkOkUvDhJMyp
 ahPw==
X-Gm-Message-State: AO0yUKX8Yidx40wzL8dxDL5+TCsBxWg4MzIvk86U3hm0o2LrFXj/jtuj
 zSrLr7X4jAdjHsAdILl6RUL6D0UM/3PSDRsMiks2DzUXjNG4rrIrtyvnnoSiEEibae0TdH1dapd
 dCv8RfPpcVtY/8hc=
X-Received: by 2002:adf:f8d1:0:b0:2c7:1483:88d6 with SMTP id
 f17-20020adff8d1000000b002c7148388d6mr6101888wrq.23.1678104741773; 
 Mon, 06 Mar 2023 04:12:21 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2WpKByTys4bbf0HRUF2cam6KU++3pktYIZys9mp0LZSz0dvxEnKZb0kYmXW2b51ofPfu8Q==
X-Received: by 2002:adf:f8d1:0:b0:2c7:1483:88d6 with SMTP id
 f17-20020adff8d1000000b002c7148388d6mr6101874wrq.23.1678104741480; 
 Mon, 06 Mar 2023 04:12:21 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 z1-20020adff1c1000000b002c70c99db74sm9722756wro.86.2023.03.06.04.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 04:12:21 -0800 (PST)
Date: Mon, 6 Mar 2023 12:12:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 14/53] virtio-rng-pci: fix transitional migration compat
 for vectors
Message-ID: <ZAXYo5I/8OR49PqF@work-vm>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-15-mst@redhat.com>
 <456fa17c-71b6-8aec-c38c-d7fbc907e150@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <456fa17c-71b6-8aec-c38c-d7fbc907e150@msgid.tls.msk.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Michael Tokarev (mjt@tls.msk.ru) wrote:
> 02.03.2023 11:25, Michael S. Tsirkin wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > In bad9c5a516 ("virtio-rng-pci: fix migration compat for vectors") I
> > fixed the virtio-rng-pci migration compatibility, but it was discovered
> > that we also need to fix the other aliases of the device for the
> > transitional cases.
> > 
> > Fixes: 9ea02e8f1 ('virtio-rng-pci: Allow setting nvectors, so we can use MSI-X')
> > bz: https://bugzilla.redhat.com/show_bug.cgi?id=2162569
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Message-Id: <20230207174944.138255-1-dgilbert@redhat.com>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >   hw/core/machine.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index f29e700ee4..1cf6822e06 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -47,6 +47,8 @@ const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
> >   GlobalProperty hw_compat_7_1[] = {
> >       { "virtio-device", "queue_reset", "false" },
> >       { "virtio-rng-pci", "vectors", "0" },
> > +    { "virtio-rng-pci-transitional", "vectors", "0" },
> > +    { "virtio-rng-pci-non-transitional", "vectors", "0" },
> >   };
> 
> If we consider this one for 7.2 stable, the previous change here, which
> added "virtio-rng-pci" right before the lines being added, should also
> be picked up, which is bad9c5a5166fd5e3a892b7b0477cf2f4bd3a959a:
>  From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>  Date: Mon, 9 Jan 2023 10:58:09 +0000
>  Subject: virtio-rng-pci: fix migration compat for vectors
> 
> Should the two both be included in -stable, or both omitted?

I think both included; however note the warning in the original patch
(that's also true in this one); live migration from an unpatched world
to the patched would will break, but it fixes live migration from older
Qemu; you get to pick your favourite breakage.

Dave

> Thanks,
> 
> /mjt
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


