Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7233D4B7455
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:32:16 +0100 (CET)
Received: from localhost ([::1]:53206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2cZ-0007o1-35
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:32:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK2aO-0005tK-BD
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK2aK-0005Wf-1l
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644949794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0GsrW0YMplZY5vHRJY9Bmkw4UCseLFx59jLTdR/HDA=;
 b=bW6F9akGkWKHytaLLOAD8QVBSfFV/iGVg7gL7mLQ7hrIIUvIOBRnJ4zhzNbbqQn4UxKoUN
 PT+SgTzmCDyrnBjYMw0QigYkbFOSyxNYZmPahrdsEcQRQjkOsq/k9ml0sl0x0pNXbcaX8U
 /uakp+rv7Qxic9qMcelaH3SgsHBs4MQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-O32N_98PP0eEPzb4xMULhQ-1; Tue, 15 Feb 2022 13:29:50 -0500
X-MC-Unique: O32N_98PP0eEPzb4xMULhQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q21-20020adfab15000000b001e57c9a342aso5057969wrc.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 10:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=U0GsrW0YMplZY5vHRJY9Bmkw4UCseLFx59jLTdR/HDA=;
 b=s4EssB0K6CJSRQtTCVHrsrDRk3rt1DWP1f3uOGSoAuf9a3A1kTGp8x+Fdb3MToOXac
 cn/i1INaHM6vdZ/wh5kMtioVOOvoo9OqBWyKrujLoqLiLFWIUe5WkMAv2Fv/FR+TW8iS
 75LK0Mlz5uz98Ba0XguVzNY7GTLkcYkBpD7ILQmX3CRwMs8snTtmQddPFrNS/szhCDB1
 Vi0RVNFqeub7c9hzD4HjO4FlH8So5Q9UHwdfMg8kJWRv5Y+FDo81dA8+K6TZZphi/erH
 oys9SHapLGO9zK3Yl8FPoIu/rC68tGE4HjmhGezsgHj2UXngzK59d2VC5clNbQWzgu45
 SKjg==
X-Gm-Message-State: AOAM533zjOshjwaltMc+xmUQm/L4PLGc9sU13q2s4e3aC3nh4fl0ygMz
 zQ1YMTE5r1moIAD4Ed+QP6HZMfF4fDBT9yq5jDSbXKZ9NbxcptWtiMQ9yYC6PPAgZcIVGTKaQkj
 BHZWhPSd4a9g2pFQ=
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr245866wmg.57.1644949788946;
 Tue, 15 Feb 2022 10:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPT49A52D5xyAtvq2NuaMxQfUcL92hsg0iORovQbPFPsRuNEoImdX0qdx5FWDMmbVc9w0sQg==
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr245846wmg.57.1644949788692;
 Tue, 15 Feb 2022 10:29:48 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l26sm15237685wmp.31.2022.02.15.10.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 10:29:47 -0800 (PST)
Date: Tue, 15 Feb 2022 18:29:46 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
Message-ID: <YgvxGimmjuRQ+2VV@work-vm>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com>
 <YgvtLmoJcv+ZSW1S@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YgvtLmoJcv+ZSW1S@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, thuth@redhat.com, quintela@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Tue, Feb 15, 2022 at 04:25:33PM +0000, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The 'q35' machine type series has been around for a few years now, and
> > is getting heavily used downstream without many problems;  lets flip
> > to using it as the default.
> 
> I don't think I'd claim 'without many problems'.  In RHEL while 'q35'
> is recommended, it explicitly isn't the default because it would havbe
> created compatibility problems for applications. Every non-trivial
> application needs to make code changes to cope with 'q35' if they're
> using 'i440fx' today.  Apps that Red Hat ships, either in RHEL or as
> add-on products, have been updated, but it was certainly not painfree
> and took considerable time for OpenStack at least. I worry about how
> ready the broader QEMU consumers are to work with 'q35' as an opt-in,
> let alone as a default.

How many of these consumers do all of:
  a) Don't specify the machine type
  b) and try and do hotplug etc

> PCI is the really big ticket item here. If keeping the same command
> line none of the PCI devices added will be hotpluggable because
> they'll all be put in the root complex as integrated end points,
> whether PCI or PCIe devices.
> 
> To allow for hot-unplug, any cold plugged PCIe devices need to be
> placed in unique pcie-root-port (one root port per device). The
> PCI devices meanwhile have to be put into a pci-bridge, which is
> in turn plugged into a pcie-to-pci-bridge.  QEMU doesn't do this
> placement by default so nothing is hot-unpluggable.
> 
> To allow for hot-plug, it is needed to pre-create many pcie-root-port
> devices - one for each device to be plugged.

I'm tempted to modify q35 to create a bunch of root ports by default
and then tweak the placement to pick them;  that would have no effect
on libvirt users but would make simple command line use easy again.

> Libvirt tried to make this a little easier by putting cold plugged
> devices into a place that allows them to be hot-unplugged.
> 
> On the libvirt side, there's also the need to know about sata vs
> ide. That ones fun because at the QEMU level we still refer to it
> as 'ide' throughout, even though q35 is implementing sata. 
> 
> There was one other notable difference that impacted apps, but I
> can't remember what it was offhand.

There be dragons, but I can't remember where :-)

> 
> > While it is of course newer and shinier than it's old i440fx cousin,
> > the main reasons are:
> 
> s/newer and shinier/slightly less ancient and obsolete/ ;-P
> 
> >   * PCIe support
> >   * No default floppy or IDE
> >   * More modern defaults for NIC
> >   * Better OVMF support
> 
> These are fine reasons for recommending apps to prefer use of 'q35'
> on an opt-in basis.
> 
> Given the semantic differences from 'i440fx', changing the default
> machine type has effects that are equivalent to breaking command
> line syntax compatibility, which is something we've always tried
> to avoid.

I'm not sure where to draw the line; it's always been legal for
new versions of machine types to have different slightly different
behaviour; for example it would be reasonable for a new version to use
up a PCIe bus slot/address that was previously unused and thus break
your command line that was trying to stuff another device in there.

To my mind, as long as -M pc  puts everything back the way it was, I
wasn't too worried about that breakage.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


