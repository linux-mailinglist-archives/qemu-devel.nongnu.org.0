Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4E225AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 11:05:23 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxRje-0004B3-Se
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 05:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jxRiQ-0002vg-Tl
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 05:04:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33571
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jxRiP-0007S3-2Z
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 05:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595235844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dfjpEUqQi45XgGMbGdKmKOEr4uI+EiisNge0a8kLSGI=;
 b=b3QVYqVEtMbsaGy3leMqCW4RGSQ94FudvQqCZmJknsKO8vs6ZKyAT1/nrvzbKrVlhwS2F7
 OcoYGjy+f2kgsWAfE3bx7e/r8NmhCdgQOUWlDCQw9bCKiNneAkLrxqKMrmFS9iviJV27Cu
 b+zvfOPvLwRJUP8tvNMlFLvY8q8LZVs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-UGQAoqhDOWim95vCCcMYuw-1; Mon, 20 Jul 2020 05:04:00 -0400
X-MC-Unique: UGQAoqhDOWim95vCCcMYuw-1
Received: by mail-wm1-f70.google.com with SMTP id b13so14025479wme.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 02:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dfjpEUqQi45XgGMbGdKmKOEr4uI+EiisNge0a8kLSGI=;
 b=sTorEYUDDtLfBsGXQQw7DqLXos0duOenfIiENwW3cErx3+BAS+azrUCsmtJ7mjUjt2
 +tz10L6pCgrfQXoIEGrqLBy94tNFXLQiqFca4rpHVPj+zRckqCmj/TJCYFrSIx/us0yF
 mJH3mnU8wze2FcOKyzw91PO9fFrY7lz03EMAlkAlLiUkCYK+Yia/RfMnRJ8MlOevcqOx
 9KZ1/Ly/DZs+8hubyHz6Oy7KiBxv+QZdeM5OIN9+YvQpIduuqWirPS8iqHg6yfrL7Dyw
 9AxVjOKo5GS9EMa2l76qLJPhtIVlXwpj3X6+IdMgX/CH8/IE+iJcj0VUiwW0PUH3EWFy
 vv3Q==
X-Gm-Message-State: AOAM532Q3mTnTzzoJshKgIQGZtqtSoyTxep2vesiTrI5cON7X9e1vo3t
 krm5CoJLegu7Idn9mn4pP5S3E+/v3kPU30xE0cbTMvU4BzOvYiwl4ffFEfwuwTb9pclTu2+GLbH
 Hz1TXIiqdeaE/7ks=
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr20534612wmj.136.1595235839558; 
 Mon, 20 Jul 2020 02:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhMz/47xq9ULmj0iXRY7O72xOKwfIK3dKyrBheUssolzyTvTRuRTnjvej/VfwGuEmr9vt9aw==
X-Received: by 2002:a7b:c38c:: with SMTP id s12mr20534587wmj.136.1595235839199; 
 Mon, 20 Jul 2020 02:03:59 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id 68sm19632889wra.39.2020.07.20.02.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 02:03:58 -0700 (PDT)
Date: Mon, 20 Jul 2020 05:03:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/2] virtio: non-legacy device handling
Message-ID: <20200720050215-mutt-send-email-mst@kernel.org>
References: <20200707105446.677966-1-cohuck@redhat.com>
 <51e457ef-106e-1c1a-778d-4d53d9e48d8e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <51e457ef-106e-1c1a-778d-4d53d9e48d8e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 20, 2020 at 10:09:57AM +0200, David Hildenbrand wrote:
> On 07.07.20 12:54, Cornelia Huck wrote:
> > As discussed in "virtio-fs: force virtio 1.x usage", it seems like
> > a good idea to make sure that any new virtio device (which does not
> > support legacy virtio) is indeed a non-transitional device, just to
> > catch accidental misconfigurations. We can easily compile a list
> > of virtio devices with legacy support and have transports verify
> > in their plugged callbacks that legacy support is off for any device
> > not in that list.
> > 
> > Most new virtio devices force non-transitional already, so nothing
> > changes for them. vhost-user-fs-pci even does not allow to configure
> > a non-transitional device, so it is fine as well.
> > 
> > One problematic device, however, is virtio-iommu-pci. It currently
> > offers both the transitional and the non-transitional variety of the
> > device, and does not force anything. I'm unsure whether we should
> > consider transitional virtio-iommu unsupported, or if we should add
> > some compat handling. (The support for legacy or not generally may
> > change based upon the bus, IIUC, so I'm unsure how to come up with
> > something generic.)
> > 
> > Cornelia Huck (2):
> >   virtio: list legacy-capable devices
> >   virtio: verify that legacy support is not accidentally on
> 
> I'd squash both patches. Looking at patch #1, I wonder why we don't
> store that information along with the device implementation? What was
> the motivation to define this information separately?

Because people seem to cut and paste code, so when one
enables it in an old device, it gets pasted into a new one.
With a list in a central place, it's easier to figure out
what's going on.

> 
> -- 
> Thanks,
> 
> David / dhildenb


