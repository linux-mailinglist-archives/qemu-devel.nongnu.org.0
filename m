Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BA62B435A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:11:10 +0100 (CET)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedLh-0000qk-KP
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:11:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedE7-0002xR-Q7
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedE5-0004AA-NL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605528196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zObYHP51vKIsSHOvQNpH4DLP4XAjdB2Z9uq1HSCTViA=;
 b=dILKlrHdznb83XRDlhWHJLV4q4QKeHM/a2okZMWY9CYry19T4256Un/Ivcqtj26Er6K4hc
 U4f5upPwPHZFKQ4Et74CPP9Dp2PC6ZDBgA7+dJKSsy7LFpsEzG6fVYQ8Yr37n4rRimq6Ag
 h3MHJY+9zE3r2THQ7nO0N2Ooghn2Zv0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-90W2B2MZPoiQedJvRFFoSA-1; Mon, 16 Nov 2020 07:03:14 -0500
X-MC-Unique: 90W2B2MZPoiQedJvRFFoSA-1
Received: by mail-ed1-f71.google.com with SMTP id d1so8027504edz.14
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=LyNNBmvhWm55coud7eZVVlnoEud/DqKBJXyVxJWNepQ=;
 b=oNOEvQIBY/q205LWx3lLMnvM73HKBC1mN2g3FJtuOEhggY+bdcFQ5Ie7oIPd3Sq1r3
 CdhFnse8Flp0lU6/ypYIwgEO6aZ9Auq2hWFjQL6RizRn6ZnMUlGBFPPwN+D4vwE8MhZv
 jll6yPXPXcJY2HU0RaVHqCxsVBfxpoNIkWsixNfrJUmUgmGx+9E5GhQgA4VZq6Sq5nVj
 47Mswq42/mdTa0e4OQJDyIMhNtGX9av1IX4On9h055niuTGFzcDXerW9+MEocY5qMlhh
 ArmJvaihbWwHNzW35pPQe9r05rUlH9XqO5jQ0lzJ/I0NPKYgq4NlUokD/PzcbEz7np3h
 aJ4Q==
X-Gm-Message-State: AOAM533/+uoPiLlZhnYG6yAi3h9fkEDamg9l71ndfD8rFSnLqppEs3E3
 R0F3lQhGwYPx2n6neMVrb06803H83bznZbtGwriNZj8HdRhazpd30jHUECjWNfHpVEHpM20l6FZ
 jnqeh0fc0TTCn06I=
X-Received: by 2002:a05:6402:236e:: with SMTP id
 a14mr15318218eda.103.1605528193221; 
 Mon, 16 Nov 2020 04:03:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvxiaMsuEzj9sVCV7yyndu3jTaC2Htms5UEpE8bPYkjscYTBQE6JeiszLxJV5ebMJRmgkhMw==
X-Received: by 2002:a05:6402:236e:: with SMTP id
 a14mr15318188eda.103.1605528192995; 
 Mon, 16 Nov 2020 04:03:12 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id k3sm9906967ejd.36.2020.11.16.04.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:03:12 -0800 (PST)
Date: Mon, 16 Nov 2020 07:03:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116065906-mutt-send-email-mst@kernel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
 <20201116114125.GE104771@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201116114125.GE104771@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 11:41:25AM +0000, Daniel P. Berrangé wrote:
> > It is possible to simplify the problem, but we'll lose freedom. For
> > example, hard coding knowledge of the device implementation into the
> > management tool eliminates the need for a general migration checking
> > algorithm. Or we might be able to simplify it by explicitly not
> > supporting cross-device implementation migration (although that would
> > place stricter rules on what a new version of an existing device can
> > change in order to preserve migration compatibility).
> 
> Is migrating between 2 different vendors' impls of the same core
> device spec really a thing that's needed ? 

If there's intent to have this supercede vhost-user then certainly.
Same I'm guessing for NVMe.


> > I have doubts that these trade-offs can be made without losing support
> > for use cases that are necessary.
> 
> >From my POV, the key goal is that it should be possible to migrate
> between two hosts without needing to check every single possible
> config parameter that the device supports. It should only be neccessary
> to check the parameters that are actually changed from their default
> values. Then there just needs to be some simple string parameter that
> encodes a particular set of devices, akin to the versioned machine
> type.
> 
> Applications that want to migration between cross-vendor device impls
> could opt-in to checking every single little parameter, but most can
> just stick with a much simplified view where they only have to check
> the parameters that they've actually overriden/exposed.
> 
> Regards,
> Daniel

It's a problem even for a single vendor. And we have lots of experience
telling us it's a messy, difficult one. Just punting and saying
vendors will do the right thing will not lead to quality
implementations.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


