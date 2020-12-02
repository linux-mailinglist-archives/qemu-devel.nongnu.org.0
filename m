Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED0F2CBB2B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:01:59 +0100 (CET)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkPtT-0001M3-WF
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPPb-0005f0-Nq
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kkPPO-0007z5-SJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 05:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606905049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o/Vfe5392bdDgq3gGRD0QZjdEVEToouSfkaPvRTMJM0=;
 b=Md/pQ2mfBbS/TcxbRdrCQjYSM+qrsSG1aVwMdy526GdFDb7y2SEMkEJ4ounZ3tqG3+R5cX
 DMg0WsJsiVcngJU9QgrsMGXiKkfcx9OdCMfXHN1HeFYkWLr7gW9feYvZWSj0AGlUqagVD6
 WP2/KQ3PVA28mYFm5iI1vHG8nSINyzg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-uO-Bu0AMOOm2OWeG1eXw2A-1; Wed, 02 Dec 2020 05:30:48 -0500
X-MC-Unique: uO-Bu0AMOOm2OWeG1eXw2A-1
Received: by mail-wr1-f71.google.com with SMTP id f4so3068251wru.21
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 02:30:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o/Vfe5392bdDgq3gGRD0QZjdEVEToouSfkaPvRTMJM0=;
 b=c9D9kA70Jp4NIwMCYKk0QP2QyjlmjkqXalMzrFnv2tERSNQDydggIkK53Fs3HdnARw
 YlSoit9GZXf25+Km70YKCDNQ0VtTkFbmbo9zv5s7OS2ocxNtq6fL2POtlnak5+doNo2P
 m/OY3ohMlt9sdJB/TViog2r8ol7sxUji+3dS36klneWBtVIzuoy91P7tt3SCrwvtGcmJ
 5csohXVUjCvdHoWjFh2CDKPNKZigHMj4CI73E9y+BLPrQimyEjjAfzdxLI/EkIQhBi6g
 OlNf4+Fupc00bbOtP+vn3tBATc2X0GSo/ZsaNZNwcONFMLkkbXYQMWWQpoVeOfwgbOj7
 LTVA==
X-Gm-Message-State: AOAM531+CLfPQ3ozodm5ZGdjAaILQP2wTpzEnc7jb1bpL6TdXGtOzWrt
 sKyvF4rPjGhojT/z4N5g9uLQ7yxp/NfmSHellDNz0lUKeP17oOLzqKgLrywSP/LisWFV7nzocPD
 KbgkZYJVf4dFRnUg=
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr2464373wrx.321.1606905046842; 
 Wed, 02 Dec 2020 02:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyclUdbVWLhq2CjPuFo11tcM0yz0bBsWUVmLZFPYxbrUvIH/PNBnzVIHJ13aXJnvkr5DO7dNQ==
X-Received: by 2002:a05:6000:1cf:: with SMTP id
 t15mr2464342wrx.321.1606905046531; 
 Wed, 02 Dec 2020 02:30:46 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id q17sm1715633wro.36.2020.12.02.02.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 02:30:45 -0800 (PST)
Date: Wed, 2 Dec 2020 05:30:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v2 00/27] Virtio net failover fixes
Message-ID: <20201202052934-mutt-send-email-mst@kernel.org>
References: <20201118083748.1328-1-quintela@redhat.com>
 <20201118035209-mutt-send-email-mst@kernel.org>
 <87r1o8ldi3.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87r1o8ldi3.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 11:16:04AM +0100, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Wed, Nov 18, 2020 at 09:37:21AM +0100, Juan Quintela wrote:
> >> Hi
> >> 
> >> This is a big rework of the network failover setup.  General idea is:
> >> * We don't cache the name of the primary/standby devices
> >>   We have several problems there with stale pointers
> >> * After this:
> >> - We can always remove either the primary/standby devices without trouble
> >> - Pluggin/unplugging works
> >> - We go to device opts to see what the failover device are.
> >>   Notice that we are plugging/unplugging the device, so it is not critical.
> >> - Once there, I "fixed" managedsave for libvirt (now gives an error instead o=
> >> f just hanging)
> >> * Fields not cached anymore:
> >> - primary_device_dict
> >> - primary_device_opts
> >> - standby_id
> >> - primary_device_id
> >> - primary_dev
> >> * I renamed the should_be_hidden() callback to hide device, but if
> >>   people preffer the old name I can leave it.
> >> * Add (some) doc to some functions
> >> * Remove almost 100 lines of code while fixing things.
> >> 
> >> Please review.
> >
> > OK that's great, any of this appropriate for 5.2?
> > The memory leak fix maybe?
> 
> 1st one is also a fix, current code just hangs the guest.


Hmm it does but then proceeds when you unpause so I'm not sure
it's a good idea for 5.2. It's late in the cycle to try to
handle management bugs ...

> Rest of things .... current code fails a lot, but we are too late on the
> cycle.
> 
> Later, Juan.
> 
> 
> >> Later, Juan.
> >> 
> >> Juan Quintela (27):
> >>   migration: Network Failover can't work with a paused guest
> >>   failover: fix indentantion
> >>   failover: Use always atomics for primary_should_be_hidden
> >>   failover: primary bus is only used once, and where it is set
> >>   failover: Remove unused parameter
> >>   failover: Remove external partially_hotplugged property
> >>   failover: qdev_device_add() returns err or dev set
> >>   failover: Rename bool to failover_primary_hidden
> >>   failover: g_strcmp0() knows how to handle NULL
> >>   failover: Remove primary_device_opts
> >>   failover: remove standby_id variable
> >>   failover: Remove primary_device_dict
> >>   failover: Remove memory leak
> >>   failover: simplify virtio_net_find_primary()
> >>   failover: should_be_hidden() should take a bool
> >>   failover: Rename function to hide_device()
> >>   failover: virtio_net_connect_failover_devices() does nothing
> >>   failover: Rename to failover_find_primary_device()
> >>   failover: simplify qdev_device_add() failover case
> >>   failover: simplify qdev_device_add()
> >>   failover: make sure that id always exist
> >>   failover: remove failover_find_primary_device() error parameter
> >>   failover: split failover_find_primary_device_id()
> >>   failover: We don't need to cache primary_device_id anymore
> >>   failover: Caller of this two functions already have primary_dev
> >>   failover: simplify failover_unplug_primary
> >>   failover: Remove primary_dev member
> >> 
> >>  include/hw/qdev-core.h         |  28 ++--
> >>  include/hw/virtio/virtio-net.h |   9 +-
> >>  hw/core/qdev.c                 |  19 +--
> >>  hw/net/virtio-net.c            | 298 +++++++++++++--------------------
> >>  migration/migration.c          |  13 ++
> >>  softmmu/qdev-monitor.c         |  43 ++---
> >>  6 files changed, 167 insertions(+), 243 deletions(-)
> >> 
> >> --=20
> >> 2.26.2
> >> 


