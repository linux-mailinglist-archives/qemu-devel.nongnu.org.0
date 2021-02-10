Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8229316127
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 09:42:38 +0100 (CET)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9l53-00041Y-Hd
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 03:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9l1Y-0003HT-FK
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:39:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l9l1O-0004UH-UQ
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 03:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612946328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzXlZ4TyLTMGtqS5nXt2au+jl+/N1wTH30tfg4MyI3c=;
 b=UPTmIqUKlmOxHpc822l1aF1dKRE7A4lA28Z/d7AoihTXOy6SHav616deMDBlpWKTxMlgPP
 ge3YsnyMs8Cd6ZIDzH90bdkHOfIEXNX+LY5G6BYBTalawGb39Mrb3bOzL7KMmXX3ycnI6h
 2OYyVJAyK/XA7CyEHAhLSPJu9SLdmBw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-2T9dijXROg6MfusrDUEn8Q-1; Wed, 10 Feb 2021 03:38:42 -0500
X-MC-Unique: 2T9dijXROg6MfusrDUEn8Q-1
Received: by mail-wr1-f72.google.com with SMTP id c9so1289713wrq.18
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 00:38:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dzXlZ4TyLTMGtqS5nXt2au+jl+/N1wTH30tfg4MyI3c=;
 b=J5y2L0EG+D2RjT2s1TBWoxnjta/ZJO9oRTX3HV6pAA/JGNsIo4T3w5FS/XKxXSy+y8
 QJgvzPAR9Wc5xYmjax0mL0/gvg7SdG7OQ/xhDRqMNbuuilrtbITyTzyM9Q1vk98CYa8n
 jpvIktSyZNI8TIQZohSDZtGElGXerqLXoPCgYOD+I3kCLuNpAzUEciascE5cltclbOZO
 o0bCzgb3VEHcCubhhoCuyAP9aDNuvXqE41x1FeVClgiymqOT0dftTghAUahRK89z60eH
 EG/fcakHEU/rF32lTg9cyMIEx8y2ne4z6MtpxCeSQ0Hydb2cq33mGKvKB0KZREkgKomr
 cGyQ==
X-Gm-Message-State: AOAM532ay46HXg5K9SEo4aPGv5Sok/3Jj6RcUcqVJDT+lkahHSl8FOYN
 UcTxhnhwqIvUgv3YO9YihOE1R7k6jOvaPFZ9baeD1NqyH/NGfwc1EF+e5GRZjUzOejeUpdLb7Aj
 KRTtWN/ec8p4nc7w=
X-Received: by 2002:a1c:2501:: with SMTP id l1mr1867254wml.41.1612946321216;
 Wed, 10 Feb 2021 00:38:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypTECg/YxtZybj8oXYw7OA7kUIr6Ied4qHluXufVdukHA12zFtxNn130gi/bshRDMXA56zRA==
X-Received: by 2002:a1c:2501:: with SMTP id l1mr1867231wml.41.1612946320936;
 Wed, 10 Feb 2021 00:38:40 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id g16sm1486246wmi.30.2021.02.10.00.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 00:38:40 -0800 (PST)
Date: Wed, 10 Feb 2021 03:38:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 0/3] virtio-net: graceful drop of vhost for TAP
Message-ID: <20210210033236-mutt-send-email-mst@kernel.org>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
 <20210209093201-mutt-send-email-mst@kernel.org>
 <20210209145105.GP1166421@redhat.com>
 <20210209095553-mutt-send-email-mst@kernel.org>
 <0890bb17-9677-ff1d-bd08-c9be791e1c81@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0890bb17-9677-ff1d-bd08-c9be791e1c81@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yan@daynix.com, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 02:19:59PM +0800, Jason Wang wrote:
> 
> On 2021/2/9 下午11:04, Michael S. Tsirkin wrote:
> > On Tue, Feb 09, 2021 at 02:51:05PM +0000, Daniel P. Berrangé wrote:
> > > On Tue, Feb 09, 2021 at 09:34:20AM -0500, Michael S. Tsirkin wrote:
> > > > On Thu, Feb 04, 2021 at 10:29:12PM +0200, Yuri Benditovich wrote:
> > > > > This set of patches introduces graceful switch from tap-vhost to
> > > > > tap-no-vhost depending on guest features. Before that the features
> > > > > that vhost does not support were silently cleared in get_features.
> > > > > This creates potential problem of migration from the machine where
> > > > > some of virtio-net features are supported by the vhost kernel to the
> > > > > machine where they are not supported (packed ring as an example).
> > > > I still worry that adding new features will silently disable vhost for people.
> > > > Can we limit the change to when a VM is migrated in?
> > > Some management applications expect bi-directional live migration to
> > > work, so taking specific actions on incoming migration only feels
> > > dangerous.
> > Could you be more specific?
> > 
> > Bi-directional migration is currently broken
> > when migrating new kernel->old kernel.
> > 
> > This seems to be the motivation for this patch, though I wish
> > it was spelled out more explicitly.
> > 
> > People don't complain much, but I'm fine with fixing that
> > with a userspace fallback.
> > 
> > 
> > I'd rather not force the fallback on others though: vhost is generally
> > specified explicitly by user while features are generally set
> > automatically, so this patch will make us override what user specified,
> > not nice.
> > 
> > 
> > > IMHO if the features we're adding cannot be expected to exist in
> > > host kernels in general, then the feature should defualt to off
> > > and require explicit user config to enable.
> > > Downstream distros which can guarantee newer kernels can flip the
> > > default in their custom machine types if they desire.
> > > 
> > > Regards,
> > > Daniel
> > Unfortunately that will basically mean we are stuck with no new features
> > for years. We did what this patch is trying to change for years now, in
> > particular KVM also seems to happily disable CPU features not supported
> > by kernel so I wonder why we can't keep doing it, with tweaks for some
> > corner cases.
> 
> 
> It's probably not the corner case.
> 
> So my understanding is when a feature is turned on via command line,


Most people do not play with these flags on command line, the
main path to turn features on if when they default to on.

> it
> should not be cleared silently otherwise we may break migration for sure.

Not if we are careful. Setting flags is more dangerous. Clearing is
generally ok.

> E.g when packed=on is specified, we should disable vhost instead of clear it
> from the device.
> 
> Thanks

From usability POV, consider packed as an example, people only enable it
to get better performance. libvirt says:


		The attribute packed controls if QEMU should try to use packed
	virtqueues. Compared to regular split queues, packed queues consist of
	only a single descriptor ring replacing available and used ring, index
	and descriptor buffer. This can result in better cache utilization and
	performance. If packed virtqueues are actually used depends on the
	feature negotiation between QEMU, vhost backends and guest drivers.
	Possible values are on or off. 

Switching to a completely different backend clearly isn't what user intended.

> 
> > 
> > userspace and kernel not being in 100% sync wrt features is not
> > a corner case though, and switching backends seems like too big
> > a hammer.
> > 
> > > -- 
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> > 


