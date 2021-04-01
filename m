Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14535134D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:21:13 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuRs-0001Y0-0T
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRuQA-00014i-W7
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:19:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRuQ8-0006h0-8O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617272363;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWDhm7n+g8QqYNqVy/VAxQLPcVJh8VLnxGoJcKYEUO4=;
 b=h9j2TqawDSHX6jJDoITypNFR3L/WFXgWQxlGsM3kWUv7dGweUdSI9sIDSWi09yp+/RGz+2
 9uR3M8M01OFfXDJ1bsHf3N9zwZ6ZQJa5PWUd4XGLsYkH5ONS73PkM0xN0xaMFVdG6Kc2hn
 mQiaUxFykfjYVXFMe/IMos4M0cVR3SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-WQxa5TpIPW2bcHqS0LXJ1A-1; Thu, 01 Apr 2021 06:19:18 -0400
X-MC-Unique: WQxa5TpIPW2bcHqS0LXJ1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEB951084D70;
 Thu,  1 Apr 2021 10:19:17 +0000 (UTC)
Received: from redhat.com (ovpn-114-106.ams2.redhat.com [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FBDB5D9CA;
 Thu,  1 Apr 2021 10:19:12 +0000 (UTC)
Date: Thu, 1 Apr 2021 11:19:09 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v2 2/2] hw/smbios: retrieve PCI address from specified
 device for Type 41
Message-ID: <YGWeHXMPIbbI5wWA@redhat.com>
References: <20210401082544.16522-1-vincent@bernat.ch>
 <20210401082544.16522-2-vincent@bernat.ch>
 <YGWUrw9wgOI1E3aN@redhat.com> <m3wntmjp25.fsf@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <m3wntmjp25.fsf@bernat.ch>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 12:07:30PM +0200, Vincent Bernat wrote:
>  ❦  1 avril 2021 10:38 +01, Daniel P. Berrangé:
> 
> >>  hw/smbios/smbios.c | 47 +++++++++++++++++++++-------------------------
> >>  qemu-options.hx    |  2 +-
> >>  2 files changed, 22 insertions(+), 27 deletions(-)
> >
> > It doesn't really make sense to have this as a separate patch
> > when it is deleting half the code you added in the previous
> > patch. Just merge them together as one.
> 
> I'll do that.
> 
> >> +                /*
> >> +                 * TODO: Extract the appropriate value. Most of the
> >> +                 * time, this will be 0.
> >> +                 */
> >> +                t->segment_group_number = cpu_to_le16(0);
> >
> > Hmm, tricky, as it requires interpreting the PCI topology. Wonder if
> > there's any helper that can do the hard work for you
> 
> There is pci_root_bus_path(), but it returns a string which could just
> contain a segment or several segments. It seems the SMBIOS standard
> didn't account for complex topologies. I could parse the string. and
> keep only the right-most segment.
> 
> >> +                t->bus_number = pci_dev_bus_num(pdev);
> >> +                t->device_number = pdev->devfn;
> >> +            } else {
> >> +                fprintf(stderr, "%s: cannot find PCI device %s\n",
> >> +                        __func__, t41->pcidev);
> >
> > This isn't terminating execution which looks like a bug.
> 
> It was my intention. The PCI address will then be 00:00:00.0. If you
> think it's better to terminate, I can do what you suggest.

If we can't find the PCI device, that's user configuration error, and
we prefer to report those & exit, rather than continuing with likely
bogus data.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


