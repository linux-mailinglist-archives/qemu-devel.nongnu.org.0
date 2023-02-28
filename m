Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DD36A5510
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 10:04:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvtr-00061L-2o; Tue, 28 Feb 2023 04:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvtm-00060A-IK
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pWvtj-0004vi-IG
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 04:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677575026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
 b=fo5LSnkfs6JQaYj+NOsTSolyflqlvkdwL2ggNJm8VIuL9NM/50dFiY+kSv624zRYxiJPWL
 0e1gqIPLT2/yntkN2wr5KUALTdRSOnzO8WPz6NgMVblLZ1eYgzyRu0apUt+mCs2k8PTYC4
 KPJr0Yp4qf0atnTmz0MtVfUa6fFo0mM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-OUjWwESCNCqFJ198niUCBw-1; Tue, 28 Feb 2023 04:03:45 -0500
X-MC-Unique: OUjWwESCNCqFJ198niUCBw-1
Received: by mail-wm1-f72.google.com with SMTP id
 n15-20020a05600c500f00b003dd07ce79c8so4011776wmr.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 01:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677575024;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mo3Ix7HhvRTB/uL9iGxje7SInRQ3/WqLFw5P2OgDP1c=;
 b=Zl5IlavRnZtzUIRz/qccs4caWwlmVVMxSNlfZmzZeSC1D8SwUNnDP2cTBgmKOFmhXU
 bweY7mKiGcsHS6SxVxiD8jlcJfOAT79YLJRHQAhY3e960vwZBbvRbYZWUihcsC/UmQZ5
 Cp6brdOYZgtYdJjsnOYhdvsphCZywVAWQi6uS7JwuRK5zo+i3N8X8eW2BMFZZ/08N3ve
 otmhyaFJhOum7ojkng9j9EpcDSsCMNGI63GTptdTCQdIklmTd5QjTa4wcH3qccES09qo
 yY8sgWYWRoZeau7lr7IKLNWWcvgtxv3xN7ECp4kk/W7DhoJ171z3esSwi6nZ1kjxCi93
 h70Q==
X-Gm-Message-State: AO0yUKW3zMKaQB6xaeXmur5K54ij9REq/QIhwOUtGM5K1I+gp8sozQfn
 vgngmPoyw6hXeDYYTPsS+cKYG2LZgM34HlZ3+yXsnpxYFlfQdr0PZMzoflsOJYFUUwxrcrgyw7o
 /LwSYBBa6opp+KxE=
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id
 b40-20020a05600c4aa800b003eb394741eamr1323187wmp.37.1677575024175; 
 Tue, 28 Feb 2023 01:03:44 -0800 (PST)
X-Google-Smtp-Source: AK7set+8SxD5nvNj4eV/WkOWGobg8EUZ1L7PKKhyad8zHqSvg6kV07EAi8Li74NHX7YpKP3bxvWK1g==
X-Received: by 2002:a05:600c:4aa8:b0:3eb:3947:41ea with SMTP id
 b40-20020a05600c4aa800b003eb394741eamr1323163wmp.37.1677575023825; 
 Tue, 28 Feb 2023 01:03:43 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 bi13-20020a05600c3d8d00b003e204fdb160sm15217479wmb.3.2023.02.28.01.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:03:43 -0800 (PST)
Date: Tue, 28 Feb 2023 04:03:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Message-ID: <20230228040115-mutt-send-email-mst@kernel.org>
References: <20230227111050.54083-1-thuth@redhat.com>
 <20230227111050.54083-2-thuth@redhat.com>
 <Y/yY72L9wyjuv3Yz@redhat.com>
 <20230227150858-mutt-send-email-mst@kernel.org>
 <84d7d3e5-0da2-7506-44a7-047ebfcfc4da@redhat.com>
 <20230228031026-mutt-send-email-mst@kernel.org>
 <Y/3CiEKKoG06t9rr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/3CiEKKoG06t9rr@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 28, 2023 at 08:59:52AM +0000, Daniel P. Berrangé wrote:
> On Tue, Feb 28, 2023 at 03:19:20AM -0500, Michael S. Tsirkin wrote:
> > On Tue, Feb 28, 2023 at 08:49:09AM +0100, Thomas Huth wrote:
> > > On 27/02/2023 21.12, Michael S. Tsirkin wrote:
> > > > On Mon, Feb 27, 2023 at 11:50:07AM +0000, Daniel P. Berrangé wrote:
> > > > > I feel like we should have separate deprecation entries for the
> > > > > i686 host support, and for qemu-system-i386 emulator binary, as
> > > > > although they're related they are independant features with
> > > > > differing impact. eg removing qemu-system-i386 affects all
> > > > > host architectures, not merely 32-bit x86 host, so I think we
> > > > > can explain the impact more clearly if we separate them.
> > > > 
> > > > Removing qemu-system-i386 seems ok to me - I think qemu-system-x86_64 is
> > > > a superset.
> > > > 
> > > > Removing support for building on 32 bit systems seems like a pity - it's
> > > > one of a small number of ways to run 64 bit binaries on 32 bit systems,
> > > > and the maintainance overhead is quite small.
> > > 
> > > Note: We're talking about 32-bit *x86* hosts here. Do you really think that
> > > someone is still using QEMU usermode emulation
> > > to run 64-bit binaries on a 32-bit x86 host?? ... If so, I'd be very surprised!
> > 
> > I don't know - why x86 specifically? One can build a 32 bit binary on any host.
> > I think 32 bit x86 environments are just more common in the cloud.
> 
> Can you point to anything that backs up that assertion. Clouds I've
> seen always give you a 64-bit environment, and many OS no longer
> even ship 32-bit installable media.


Sorry about being unclear. I meant that it seems easier to run CI in the
cloud in a 32 bit x64 environment than get a 32 bit ARM environment.

> I would be surprised if 32-bit
> is above very very low single digits usage compared to x86_64.

Absolutely.

> > > > In fact, keeping this support around forces correct use of
> > > > posix APIs such as e.g. PRIx64 which makes the code base
> > > > more future-proof.
> > > 
> > > If you're concerned about PRIx64 and friends: We still continue to do
> > > compile testing with 32-bit MIPS cross-compilers and Windows 32-bit
> > > cross-compilers for now. The only thing we'd lose is the 32-bit "make check"
> > > run in the CI.
> > > 
> > >  Thomas
> > 
> > Yes - fundamentally 32 bit does not seem that different from e.g.
> > windows builds - we presumably support these but AFAIK CI does not
> > test these.
> 
> We do compile test windows in CI via mingw, and we also do build
> and unit tests via msys.
> 
> Even Windows has dropped 32-bit support though, and so the only
> reason we keep 32-bit Windows around is because of Windows 10.
> Once a Windows 12 comes along, we'll not need to support 32-bit
> Windows either.
> 
> With regards,
> Daniel

Or maybe we'll just rely on WSL.

> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


