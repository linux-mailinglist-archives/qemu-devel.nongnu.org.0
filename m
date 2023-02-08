Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820AE68F0C9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlOd-0005aK-F4; Wed, 08 Feb 2023 09:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlOX-0005Zw-Me
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:25:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pPlOW-0006JL-5d
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675866355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QwbEE/Z2PtfDHwYKJkjB0059AR56kLzY/K6nHOFGm18=;
 b=LMfwZF+CGuIlfw2rlTU24RQU4NAHvnFf989nVxIlBLGZGdXdXML8dmrlpC+qvSF073iSLE
 gYRXmip/HoSXIjgfdL8l/zF8mWCw2Er3lnUdg3OtJDJbiq/Sp437bHCCZeHnEWD+7ZBC7Y
 /zluOnCdsGPM9A363IUilo6VC5ch0oU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-U5oWYiv2Nda8cQaCRNpUvA-1; Wed, 08 Feb 2023 09:25:54 -0500
X-MC-Unique: U5oWYiv2Nda8cQaCRNpUvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b003dc5dd44c0cso8971125wms.8
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwbEE/Z2PtfDHwYKJkjB0059AR56kLzY/K6nHOFGm18=;
 b=uvxCzjeFN8VgmUYuU0wIEk+z3pqKL4e3l/pocKTCNvWtIojNqiaGM2rCIJ2WXWCrnj
 AYYuy4si0iIYqFa939lzKZrDADR832AwRWJzQ5iwwvkSb9Mioc28A6+DD2JDO/nerDor
 h6Z2i3Q3SPLv+88aufbrmMn2Y3EqZ0PL7AIM6h9qffkv/HWS5WaZekEfA+mIPfwm+9aX
 IiP02Dm6GbkYf4NbPddIYDdhncgeRufRfaJ5TrKPN7G8QpzwDJEdQHPsSO9F/wf9Rzbf
 s+gYyl3Oyd8xdRjF3MKIJ4cGfHmvkjC0Uy6s2+4jrFFrxcZrFb/VhqkDpwfgmVaQ8Slb
 UO5w==
X-Gm-Message-State: AO0yUKVAcieFxKxUwlWzeBw0jT0XyKt/cYWx5dBPAzcR1L4sWQyx2npV
 I7opxloX9SZwN298UXASx1EogeRPQg/fxcLY75S4KB86UTX3F1lxiVDUzH/c+L6Z54sBsS9A46I
 8dCK58dDR60vjTEg=
X-Received: by 2002:a05:600c:1c87:b0:3dc:42d2:aee4 with SMTP id
 k7-20020a05600c1c8700b003dc42d2aee4mr6810378wms.25.1675866353050; 
 Wed, 08 Feb 2023 06:25:53 -0800 (PST)
X-Google-Smtp-Source: AK7set+WYvAJxafaawg2sIGovwNT/Am9e1k3MOtQL3FMBpbTl+hPNEE6l+f/qdSVN/Ioj0ig8YHISQ==
X-Received: by 2002:a05:600c:1c87:b0:3dc:42d2:aee4 with SMTP id
 k7-20020a05600c1c8700b003dc42d2aee4mr6810363wms.25.1675866352860; 
 Wed, 08 Feb 2023 06:25:52 -0800 (PST)
Received: from redhat.com ([2.52.132.212]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c2ca100b003dc3f3d77e3sm2184361wmc.7.2023.02.08.06.25.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 06:25:52 -0800 (PST)
Date: Wed, 8 Feb 2023 09:25:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH 11/12] tests/qtest: bios-tables-test: Skip if missing
 configs
Message-ID: <20230208092220-mutt-send-email-mst@kernel.org>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-12-farosas@suse.de>
 <218e02c0-efed-1461-e9d5-6bee0a5ecbbc@redhat.com>
 <20230207094103-mutt-send-email-mst@kernel.org>
 <20230208115238.3083843f@imammedo.users.ipa.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208115238.3083843f@imammedo.users.ipa.redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 08, 2023 at 11:52:38AM +0100, Igor Mammedov wrote:
> On Tue, 7 Feb 2023 09:42:45 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Tue, Feb 07, 2023 at 03:35:56PM +0100, Thomas Huth wrote:
> > > On 06/02/2023 16.04, Fabiano Rosas wrote:  
> > > > If we build with --without-default-devices, CONFIG_HPET and
> > > > CONFIG_PARALLEL are set to N, which makes the respective devices go
> > > > missing from acpi tables.
> > > > 
> > > > Signed-off-by: Fabiano Rosas <farosas@suse.de>
> > > > ---
> > > > I currently don't see a way of allowing the tests to pass in the
> > > > absence of these two configs. As far as I understand, we would need to
> > > > have one set of expected table files (tests/data/acpi) for each
> > > > combination of machine vs. possible CONFIG that can be toggled.  
> > > 
> > > I think you're right ... maintaining tables for each combination does not
> > > scale. Disabling the test in that case is likely the best we can do here
> > > right now.
> > >   
> > > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > > > index a930706a43..2829eda2c9 100644
> > > > --- a/tests/qtest/meson.build
> > > > +++ b/tests/qtest/meson.build
> > > > @@ -78,7 +78,9 @@ qtests_i386 = \
> > > >      config_all_devices.has_key('CONFIG_Q35') and                                             \
> > > >      config_all_devices.has_key('CONFIG_VIRTIO_PCI') and                                      \
> > > >      slirp.found() ? ['virtio-net-failover'] : []) +                                          \
> > > > -  (unpack_edk2_blobs ? ['bios-tables-test'] : []) +                                         \
> > > > +  (unpack_edk2_blobs and                                                                    \
> > > > +   config_all_devices.has_key('CONFIG_HPET') and                                            \
> > > > +   config_all_devices.has_key('CONFIG_PARALLEL') ? ['bios-tables-test'] : []) +             \
> > > >     qtests_pci +                                                                              \
> > > >     qtests_cxl +                                                                              \
> > > >     ['fdc-test',  
> > > 
> > > Reviewed-by: Thomas Huth <thuth@redhat.com>  
> > 
> > 
> > One thing we could do is move this code to an SSDT by itself.  Then
> > there's two variants of e.g. HPET SSDT: with and without CONFIG_HPET.
> > Needs ACPI work though. Igor what do you think? Worth it?
> 
> I'd go with just disabling test in this case.

ok for now.

> having dedicated ACPI tables for each permutation config changes
> might cause doesn't look to me as sustainable.
> 

I feel I was unclear. What I am proposing is not that we add SSDT
for each permutation.

What I am saying is basically this: we have build_hpet_aml.  call it
from a separate SSDT. Now with HPET we check this expected SSDT.
Without HPET we don't have this SSDT so nothing to check.


-- 
MST


