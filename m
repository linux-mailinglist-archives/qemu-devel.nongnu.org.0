Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6E618654
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqeDf-0006rl-3Y; Thu, 03 Nov 2022 13:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqeDb-0006pl-6Q
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:41:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oqeDZ-0005ab-3E
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667497287;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+y9bc9HQ0VcktHp46p/WGO/Tw6Ce4umekIRdsmZEzVc=;
 b=Pt3SowYSyPrLwkdHmlJQMbXtNlH/nXkinhtQGkOtJB12qtxH70oEQb4U+DLeYd46xipj04
 iejKOzyezwaab39/ZAdq/z08gk/HF2VKyvs2GEoka9SkZY02/tKuIfDj16SmXqk2EX+5KK
 1RjevucW7OaObSFK3iDevfccNs8MsHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-i-eaquq3Nq6_39kS2xb2hA-1; Thu, 03 Nov 2022 13:41:24 -0400
X-MC-Unique: i-eaquq3Nq6_39kS2xb2hA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CE093817973;
 Thu,  3 Nov 2022 17:41:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18CB37AE5;
 Thu,  3 Nov 2022 17:41:22 +0000 (UTC)
Date: Thu, 3 Nov 2022 17:41:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: philmd@linaro.org, mst@redhat.com, peter.maydell@linaro.org,
 qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Message-ID: <Y2P9QAMyL2MIfbSL@redhat.com>
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
 <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
 <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAARzgwyVA8M_9S2Hio5m9Zin9JyeWcHUeejQJj6=e98FkPYL2A@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 03, 2022 at 10:26:26PM +0530, Ani Sinha wrote:
> On Thu, Nov 3, 2022 at 10:18 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > > On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
> > > >
> > > > > To pull this image:
> > > >
> > > > > $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest
> > > >
> > > > Actually the URL is:
> > > >
> > > > $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest
> > > >
> > > > > (or to be sure to pull the very same:)
> > > >
> > > > > $ docker pull
> > > > > registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> > > >
> > > > Same here,
> > > >
> > > > registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> > >
> > > I pulled this container,
> 
> This is fc35, the same mst is using:
> 
> # cat /etc/fedora-release
> Fedora release 35 (Thirty Five)
> 
> Hmm. Something else is going on in the gitlab specific environment.

Or it is a non-deterministic race condition and the chance  of hitting
it varies based on your hardware and/or CPU load.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


