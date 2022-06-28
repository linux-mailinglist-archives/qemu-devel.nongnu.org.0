Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B2F55C0C2
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 13:38:16 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o69Xr-00043T-F5
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 07:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69FN-0006xC-Ju
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o69FL-0003LM-KA
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 07:19:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656415145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hj+1CyZRCEoAL8+M5Wg20oRgp6dkAzvWvH7hEeigsZw=;
 b=aAPOaadOFNv1+VgomrmxZ4rxau+UCsSAg3W5oqugfBz0tD4ArDgHGEuWn1BVO1izuIUj1y
 89AJwQr7QjzPrfGjOhl8iXWijyogVQvskAfwuYRqaVBKqbVbsQJL+d2JQT6Hhbpj2zpHL8
 ZHHWaZi+EnSU9ffFw3dHlfhNRxInVQY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-EwaAqeQlPxGFPP4m7fL8Dg-1; Tue, 28 Jun 2022 07:19:04 -0400
X-MC-Unique: EwaAqeQlPxGFPP4m7fL8Dg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h125-20020a1c2183000000b003a0374f1eb8so7635949wmh.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 04:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hj+1CyZRCEoAL8+M5Wg20oRgp6dkAzvWvH7hEeigsZw=;
 b=NJwMEVgp/cfjVABpe5TvKvxKKo4Yh2f70GrDTnUB38FUn3+ttdcGXkMSX166orq5mY
 upLaLzECBqXTxpAP6oMFT5iXGRDLZ4KugXxtznEAMu8qPwHefoRZMnfNmBtVLv9YJuRD
 5c5dZ3QdVL6FDhMyKpAJOeSWT+4sU7wd/wyEExvVkNf6XpuLgpAQ6plArG7jNfmHMV4M
 vk5urgiYeKIaKrHJdWOZpyMeA7tYwzPbvzcxt1otqCT3ZJk1JwF+EiF5PtM5Vn93jLgO
 x+I0gSqc7LVGMok9+CZIjROA0AZ5FvREpET2Ml209q6l3IctDnEmsUVN5kUy7UAyNUE3
 BPkQ==
X-Gm-Message-State: AJIora9o4AHdwOlR6jehDmv4iuIkh7VupCj21Y0BFaP21+2qe8IRz5D0
 6ia+4qOTPPVLedMskEVdj7DgNGBI6pLn259tJugLMwe1HGSW85qS3kBRrHtPUVGlHEM90L2y2aC
 XQGBMLc2Z1rO//dQ=
X-Received: by 2002:a05:600c:128c:b0:39c:4c58:f37a with SMTP id
 t12-20020a05600c128c00b0039c4c58f37amr21327338wmd.7.1656415143042; 
 Tue, 28 Jun 2022 04:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vlE848fdrAaXXtNd9bEA8OVC/dIugHL17RSBxkZCCuahbHbUz+QObzLsgBb3H0+EOTsIJYPg==
X-Received: by 2002:a05:600c:128c:b0:39c:4c58:f37a with SMTP id
 t12-20020a05600c128c00b0039c4c58f37amr21327321wmd.7.1656415142814; 
 Tue, 28 Jun 2022 04:19:02 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 u16-20020a05600c441000b0039c4d022a44sm17390755wmn.1.2022.06.28.04.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:19:02 -0700 (PDT)
Date: Tue, 28 Jun 2022 07:18:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628071510-mutt-send-email-mst@kernel.org>
References: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrbHYJn5soL/V6n@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 28, 2022 at 11:42:37AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 03:58:21PM +0530, Ani Sinha wrote:
> > On Tue, Jun 28, 2022 at 3:37 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrangé wrote:
> > > > If it is actually booting a real guest image (from biosbits) and interacting
> > > > with it, then it does feel like the scope of this testing is more appropriate
> > > > to QEMU's avocado framework than qtest, especially given the desire to use
> > > > python for it all.
> > > >
> > > > With regards,
> > > > Daniel
> > >
> > > I feel avocado is directed towards booting full fledged guest OS.
> > > It makes it much easier to figure out guest issues but it also
> > > prone to false positives and is harder to debug as a result.
> > > Booting a minimal image like this shouldn't require that.
> > 
> > Yes 100% agree with Michael on this. Biobits is *not* booting any OS
> > image. It runs off grub, that is, directly from bootloader stage. The
> > interraction with the VM is minimal.
> 
> Just because it doesn't run a whole Linux kernel, doesn't make it
> not a guest OS image. It is merely unsual in that it can do everything
> it needs from grub stage, because it is just poking low level BIOS
> stuff and doesn't need a full OS like Linux on top. This is still
> functional integration testing IMHO and relevant to avocado in QEMU.
> 
> With regards,
> Daniel

I wonder why it needs grub BTW. Let's just load all of disk into ram
and be done with it?


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


