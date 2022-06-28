Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1B255C040
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:36:09 +0200 (CEST)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Zk-0005TH-HY
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68Pj-0000Ew-9v
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o68Pd-0001Gc-I1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656411937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsHS8jWMNsMEhulYiOL7rR59tS4hxdSAjb8hMjQp4nA=;
 b=VHgOTpoPxxY7DkEZgWRMvFfgnUIgHCsBPaBQWilC20B4GlakVlpsD6SPOzhcuSSt6nd0z1
 RaKVK/TWolhtK63ZyxpvR0J+Wc2qFhAkp9RTMvJW+9VuGgJezn5NODfC531o+ilfGJeVQ8
 Km9BA1Kgq5aZeSGJ9AyT+pvmTAagS9Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-yS7E-MSKNSe_mNuqlY5KzA-1; Tue, 28 Jun 2022 06:25:36 -0400
X-MC-Unique: yS7E-MSKNSe_mNuqlY5KzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so6907672wmq.5
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QsHS8jWMNsMEhulYiOL7rR59tS4hxdSAjb8hMjQp4nA=;
 b=HfCX+uQiIuXhHpoT/TUmJNH8qbI1QOH/Y7iExLk25zlE+NMJwE3QQysl89MPNgynbx
 m+T3/1Z1ExGuxAYcGBaJ3fC3piuUzpYyCa67bOu0HORKqRbMT1Am1jaJHBDok0T59h55
 fGcgtkLGmJwHqfr/cfsRf3iTa3KpVzol3AakHxzJ2sEkpT509uXjnhWxzgeh8H5bFeWz
 NEj/gasjvbOEOhy2xFpALYV7WCIYYRoOpT+0H1lE2G7Je0Dz34LWU7Qa/cNKJrUg6Xtu
 PUB+7jgG0oqjMoEdH2FmF23uJ5gaWNWpcgkdfqE/HwDpHLYIUFFzjSt2xWL5aJqoMVRg
 hQMw==
X-Gm-Message-State: AJIora8FhIitnloWbo6jxVGEiWFbCRgaN/zd4d3uJK6gjO5x5/f0sGeB
 zyXXC/M/DZHGWjxB9bAP/wOOgD+hpEcPcUUt7gzbjG0Ub+FlZRIDTo/MTi93f6a+OLYO7yMVqEl
 ujvRgwYWc6Sot0hc=
X-Received: by 2002:a05:600c:3659:b0:3a0:3915:8700 with SMTP id
 y25-20020a05600c365900b003a039158700mr20245858wmq.127.1656411935280; 
 Tue, 28 Jun 2022 03:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1us5H0ft7S1UlSVoj5nPobBMSARXmPMOobWOlZUSMnzxDQjByQIjvPusLDFPQc8YaJQcTBguw==
X-Received: by 2002:a05:600c:3659:b0:3a0:3915:8700 with SMTP id
 y25-20020a05600c365900b003a039158700mr20245835wmq.127.1656411935064; 
 Tue, 28 Jun 2022 03:25:35 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 e20-20020a5d5954000000b0020fcaba73bcsm13315922wri.104.2022.06.28.03.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 03:25:34 -0700 (PDT)
Date: Tue, 28 Jun 2022 06:25:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Message-ID: <20220628062134-mutt-send-email-mst@kernel.org>
References: <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com>
 <20220628060510-mutt-send-email-mst@kernel.org>
 <YrrVZkjZMEivmrKP@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YrrVZkjZMEivmrKP@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jun 28, 2022 at 11:18:14AM +0100, Daniel P. Berrangé wrote:
> On Tue, Jun 28, 2022 at 06:07:13AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jun 28, 2022 at 11:04:30AM +0100, Daniel P. Berrangé wrote:
> > > If it is actually booting a real guest image (from biosbits) and interacting
> > > with it, then it does feel like the scope of this testing is more appropriate
> > > to QEMU's avocado framework than qtest, especially given the desire to use
> > > python for it all.
> > > 
> > > With regards,
> > > Daniel
> > 
> > I feel avocado is directed towards booting full fledged guest OS.
> 
> That's essentially what this is doing - its a custom guest OS rather
> than a common distro IIUC

yes but then so is bios tables test - we generate the disk on the fly.

> > It makes it much easier to figure out guest issues but it also
> > prone to false positives and is harder to debug as a result.
> > Booting a minimal image like this shouldn't require that.
> 
> Well avocado is as reliable as the tests you write for it. The problems
> are largely around the images being used in avocado.

The idea of downloading large images as part of the test as opposed to
part of setup is a large part of what makes it flaky - due to
running into unpredictable latency and errors on both the internet and
local IO side of things.

> If the biosbits
> testing system is reliable, then avocado will be too, and if they not
> reliable, then it will affect qtest too.

A larger system has more potential for bugs ;) I'm with Ani here. Using
a system that is overkill will just make debugging more painful than it
needs to be.

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


