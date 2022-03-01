Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A44C90DE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:49:06 +0100 (CET)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5gP-00034X-Br
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nP5en-0002M3-FW
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:47:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nP5ek-000737-9W
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646153239;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wKRx8J1v+P6Zds2BdUJ+SAjwMAKFC4V+Bu1chmcFujw=;
 b=BgKlrKCv+OC3koR9rQOTxrVxWXO/Fv5oOGw2qYB1JBWf8c3k6vzlCNIgLPPZxdzXaAb/PO
 C1PadZWVjrv8zqURpw0vr6GO/JghIOpHYROgnNcM8d/qVJVn9AV6c9WxI6Wm/soM+HXV6a
 cI6fD5x+/Dla03WMVy1v5mLdehmxWto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-7v672GV6OUaD0VIBzrhyxw-1; Tue, 01 Mar 2022 11:47:11 -0500
X-MC-Unique: 7v672GV6OUaD0VIBzrhyxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D9B0800422;
 Tue,  1 Mar 2022 16:47:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAB7886BA0;
 Tue,  1 Mar 2022 16:47:07 +0000 (UTC)
Date: Tue, 1 Mar 2022 16:47:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
Message-ID: <Yh5OCECGjRMQtxbO@redhat.com>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
 <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com>
 <Yh5Jqg8oDDfPZ2c9@redhat.com>
 <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 04:30:30PM +0000, Peter Maydell wrote:
> On Tue, 1 Mar 2022 at 16:28, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Mar 01, 2022 at 04:16:25PM +0000, Peter Maydell wrote:
> > > On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> > > > <richard.henderson@linaro.org> wrote:
> > > > >
> > > > > Changes for v3:
> > > > >   * Update emulation.rst.
> > > > >   * Split out separate update to ID_AA64MMFR0.
> > > > >   * Hack for avocado.
> > > > >
> > > > > If the avocado hack isn't acceptable, perhaps just drop the
> > > > > last two patches for now?
> > > >
> > > > I think that given that there are Linux kernels out there
> > > > that won't boot if LPA2 is enabled, we should probably have
> > > > a -cpu command line option to disable it. Otherwise we might
> > > > get a bunch of "why did my kernel stop booting" bug reports.
> > >
> > > ...and should using a versioned machine type also default
> > > -cpu max to not enabling that? Not sure what x86 or other
> > > precedent is there.
> >
> > I don't recall us coming across an important scenario where a guest
> > would fail to boot when we /enable/ a given CPU feature on x86,
> > requiring us to hide it from -cpu max/host.
> >
> > Assuming the QEMU/KVM implementation of a CPU feature is correct
> > per the relevant spec, then artificially hiding it by default from
> > -cpu max feels questionable, as that penalizes non-buggy guest OS.
> 
> Yeah. It's just unfortunate that "buggy guest OS" here is
> "every Linux up to 5.11".

Lets say the lpa2 feature was tied so it only gets enabled in the
new 7.0 machine type version, even if KVM/QEMU could supports it
fine with any machine type version. If someone runs a VM with
Linux 5.6 with

  -cpu max -machine virt'

it is going to break.

Our choice is then between telling them to change their QEMU config to

   -cpu max,-lpa2 -machine virt

vs telling them to use

   -cpu max -machine virt-6.2

there's not much practical difference in those scenarios, for someone
deploying a new VM instance.

It would, however, benefit people who had already previously deployed
a VM with QEMU using a explicit versioned machine type. This would
be the case for anyone using libvirt, as libvirt always expands the
user's config to be fully versioned.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


