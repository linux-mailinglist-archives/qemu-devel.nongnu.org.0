Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654EF3D0FFA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 15:46:39 +0200 (CEST)
Received: from localhost ([::1]:59220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6CYY-0000g8-Gl
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 09:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6CXd-0008Jz-3d
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m6CXa-00029Q-CN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 09:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626875137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zcWbek23U4qGOzptcRKYangTRQePFZDNltwojhyx2bU=;
 b=JxwfFzOCQkUPljXyQ9anDbmXbY/17R8JKFVvcmmc115+3pD5uXMRl1b/YTUpp+lMwdOT1j
 CVTS/TEjruTjdoEgXfiYR8TJnw6HovysKohRhiG2MCrhA1aZ4UgjlHZw+TDNlyP0lPfXHl
 P36McSH/LmnoROztkHBYz9V71YENTbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-qQEDHdYPN5Wx377ohVwI6Q-1; Wed, 21 Jul 2021 09:45:35 -0400
X-MC-Unique: qQEDHdYPN5Wx377ohVwI6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 m4-20020adffa040000b02901404c442853so1031598wrr.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 06:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zcWbek23U4qGOzptcRKYangTRQePFZDNltwojhyx2bU=;
 b=Kx5he/XD/FgU/qJ2uJ6zdzXdjaBC9Cjur65Ig7wU9UmMZx+pLzdac2m5B8dL8DvCNO
 d6J/AnpkzxgQqxtraQkdEGOi2dsL0SwvS1nlFlJL0O5sdpwAuWv8e/DEdvG0+1B9DLqt
 KomuW/nA1fG+DXaSRLZwetWp7lpdc4b4v/0z9tpLExpVeD2n7jBJdBdSbdzfHnWfxGAh
 py3TfRGyUr3gyJFhmSF6LDSpH6sizWqJKCBdy3mpNJJWCtbF72DF5X8SCeimdJpnsEci
 GYSmhvEw/PUFUXNZH7I44BU6eNuxHMFrrdTpg6iaraDHCIDd9C1HeagK9u7CqRNxk1sA
 xLWw==
X-Gm-Message-State: AOAM5321aOXVHzZWb0oVgqDiM5gcNOZmLrxQrKJf3hlUGQdjxRtlaACx
 99qiqcbD3BdfDpKV+XE8dhroY1cC7AewYB8LwTb/OE5bwU38NIRNJdwQnoquOXapa1yFklW0X5D
 6JYBbErk0gc0Qu+M=
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr4171788wmq.116.1626875134637; 
 Wed, 21 Jul 2021 06:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUECRxHGFsxMyFSq0tXDURATqIKNkRlPX/EXUocM1HBBaZn3kJ5K9V9lPHzz+JbvKTta/czw==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr4171768wmq.116.1626875134439; 
 Wed, 21 Jul 2021 06:45:34 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id n5sm20229822wrp.80.2021.07.21.06.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 06:45:34 -0700 (PDT)
Date: Wed, 21 Jul 2021 14:45:32 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH v3] failover: unregister ROM on unplug
Message-ID: <YPgk/FqrhyLL42OT@work-vm>
References: <20210721093955.225759-1-lvivier@redhat.com>
 <YPgAjFzE/hq+tSIS@work-vm> <87tukneqdi.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87tukneqdi.fsf@secure.mitica>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Juan Quintela (quintela@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > * Laurent Vivier (lvivier@redhat.com) wrote:
> >> The intend of failover is to allow to migrate a VM with a VFIO
> >> networking card without disrupting the network operation by switching
> >> to a virtio-net device during the migration.
> >> 
> >> This simple change allows to test failover with a simulated device
> >> like e1000e rather than a vfio device, even if it's useless in real
> >> life it can help to debug failover.
> >> 
> >> This is interesting to developers that want to test failover on
> >> a system with no vfio device. Moreover it simplifies host networking
> >> configuration as we can use the same bridge for virtio-net and
> >> the other failover networking device.
> >> 
> >> Without this change the migration of a system configured with failover
> >> fails with:
> >> 
> >>   ...
> >>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
> >>   -device e1000,failover_pair_id=virtionet0,... \
> >>   ...
> >> 
> >>   (qemu) migrate ...
> >> 
> >>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
> >>   error while loading state for instance 0x0 of device 'ram'
> >>   load of migration failed: Invalid argument
> >> 
> >> This happens because QEMU correctly unregisters the interface vmstate but
> >> not the ROM one. This patch fixes that.
> >> 
> >> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >> ---
> >> 
> >> Notes:
> >>     v3:
> >>       remove useless space before comma
> >>     
> >>     v2:
> >>       reset has_rom to false
> >>       update commit log message
> >> 
> >>  hw/net/virtio-net.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >> 
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 16d20cdee52a..c0c2ec1ebb98 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -3256,6 +3256,10 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
> >>      if (migration_in_setup(s) && !should_be_hidden) {
> >>          if (failover_unplug_primary(n, dev)) {
> >>              vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
> >> +            if (PCI_DEVICE(dev)->has_rom) {
> >> +                PCI_DEVICE(dev)->has_rom = false;
> >> +                vmstate_unregister_ram(&PCI_DEVICE(dev)->rom, dev);
> >> +            }
> >
> > Not actually originated by your fix, but....
> >
> > Why doesn't failover_replug_primary re-add the vmstates?
> 
> Because we can't migrate until the "unplug" has happened.
> Yes, it is a mess.

But if the migrate fails, shouldn't it add it back?

Dave

> I think this is the saner patch that I can think of for that
> functionality.
> 
> What I wonder is why we register rom as ram, but I guess that the rom
> can be updated from userspace, or who knows.
> 
> Later, Juan.
> 
> > (I did wonder if passing rom-file="" to the e1000 would help in your
> > testing case, but it still creates the RAM image).
> >
> > Dave
> >
> >>              qapi_event_send_unplug_primary(dev->id);
> >>              qatomic_set(&n->failover_primary_hidden, true);
> >>          } else {
> >> -- 
> >> 2.31.1
> >> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


