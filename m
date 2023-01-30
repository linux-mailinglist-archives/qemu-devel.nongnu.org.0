Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2D68192E
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:31:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYvO-0001Q2-DQ; Mon, 30 Jan 2023 13:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMYvJ-0001Oz-Q4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:30:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pMYvH-0001Qz-E2
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675103430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iKHEgxU1GNKwB8Yt7Pw34w3WgKbgUb5geal138rrGc8=;
 b=W2J4+5RnoUY+lAi6mdBWRDm5Jpaf04+ROf6z1C8MK4wIHC23/hsGSDzjKK93NUfCrbAVNP
 dQwoCEFZHrc15+wviKj1e18Zhya3gCrzKD0eskuI/Rpasx53DXGUycnYu/UNaxVipfz1H/
 69oGqSjNwi3GLPIOWUsN0B/ICD3b64Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-2SLJ-CCAN7KGnAeKs_ESXw-1; Mon, 30 Jan 2023 13:30:27 -0500
X-MC-Unique: 2SLJ-CCAN7KGnAeKs_ESXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A7F6385F361;
 Mon, 30 Jan 2023 18:30:25 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55128492B06;
 Mon, 30 Jan 2023 18:30:21 +0000 (UTC)
Date: Mon, 30 Jan 2023 18:30:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: Sam Li <faithilikerun@gmail.com>, qemu-devel@nongnu.org,
 dmitry.fomichev@wdc.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, stefanha@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, damien.lemoal@opensource.wdc.com,
 hare@suse.de, Markus Armbruster <armbru@redhat.com>,
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC v6 2/4] virtio-blk: add zoned storage emulation for zoned
 devices
Message-ID: <Y9gMuBUOiPBStx+b@redhat.com>
References: <20230129103951.86063-1-faithilikerun@gmail.com>
 <20230129103951.86063-3-faithilikerun@gmail.com>
 <Y9e48KYxf2TLHmP4@redhat.com>
 <CAJSP0QUOQge9V2jM+ibhNgt-c-sjWw5RjFeO2isfw6Gxo3gEwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJSP0QUOQge9V2jM+ibhNgt-c-sjWw5RjFeO2isfw6Gxo3gEwQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 30, 2023 at 10:17:48AM -0500, Stefan Hajnoczi wrote:
> On Mon, 30 Jan 2023 at 07:33, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Sun, Jan 29, 2023 at 06:39:49PM +0800, Sam Li wrote:
> > > This patch extends virtio-blk emulation to handle zoned device commands
> > > by calling the new block layer APIs to perform zoned device I/O on
> > > behalf of the guest. It supports Report Zone, four zone oparations (open,
> > > close, finish, reset), and Append Zone.
> > >
> > > The VIRTIO_BLK_F_ZONED feature bit will only be set if the host does
> > > support zoned block devices. Regular block devices(conventional zones)
> > > will not be set.
> > >
> > > The guest os can use blktests, fio to test those commands on zoned devices.
> > > Furthermore, using zonefs to test zone append write is also supported.
> > >
> > > Signed-off-by: Sam Li <faithilikerun@gmail.com>
> > > ---
> > >  hw/block/virtio-blk-common.c |   2 +
> > >  hw/block/virtio-blk.c        | 394 +++++++++++++++++++++++++++++++++++
> > >  2 files changed, 396 insertions(+)
> > >
> >
> > > @@ -949,6 +1311,30 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
> > >          blkcfg.write_zeroes_may_unmap = 1;
> > >          virtio_stl_p(vdev, &blkcfg.max_write_zeroes_seg, 1);
> > >      }
> > > +    if (bs->bl.zoned != BLK_Z_NONE) {
> > > +        switch (bs->bl.zoned) {
> > > +        case BLK_Z_HM:
> > > +            blkcfg.zoned.model = VIRTIO_BLK_Z_HM;
> > > +            break;
> > > +        case BLK_Z_HA:
> > > +            blkcfg.zoned.model = VIRTIO_BLK_Z_HA;
> > > +            break;
> > > +        default:
> > > +            g_assert_not_reached();
> > > +        }
> > > +
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.zone_sectors,
> > > +                     bs->bl.zone_size / 512);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_active_zones,
> > > +                     bs->bl.max_active_zones);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_open_zones,
> > > +                     bs->bl.max_open_zones);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.write_granularity, blk_size);
> > > +        virtio_stl_p(vdev, &blkcfg.zoned.max_append_sectors,
> > > +                     bs->bl.max_append_sectors);
> >
> > So these are all ABI sensitive frontend device settings, but they are
> > not exposed as tunables on the virtio-blk device, instead they are
> > implicitly set from the backend.
> >
> > We have done this kind of thing before in QEMU, but several times it
> > has bitten QEMU maintainers/users, as having a backend affect the
> > frontend ABI is not to typical. It wouldn't be immediately obvious
> > when starting QEMU on a target host that the live migration would
> > be breaking ABI if the target host wasn't using a zoned device with
> > exact same settings.
> >
> > This also limits mgmt flexibility across live migration, if the
> > mgmt app wants/needs to change the storage backend. eg maybe they
> > need to evacuate the host for an emergency, but don't have spare
> > hosts with same kind of storage. It might be desirable to migrate
> > and switch to a plain block device or raw/qcow2 file, rather than
> > let the VM die.
> >
> > Can we make these virtio setting be explicitly controlled on the
> > virtio-blk device.  If not specified explicitly they could be
> > auto-populated from the backend for ease of use, but if specified
> > then simply validate the backend is a match. libvirt would then
> > make sure these are always explicitly set on the frontend.
> 
> I think this is a good idea, especially if we streamline the
> file-posix.c driver by merging --blockdev zoned_host_device into
> --blockdev host_device. It won't be obvious from the command-line
> whether this is a zoned or non-zoned device. There should be a
> --device virtio-blk-pci,drive=drive0,zoned=on option that fails when
> drive0 isn't zoned. It should probably be on/off/auto where auto is
> the default and doesn't check anything, on requires a zoned device,
> and off requires a non-zoned device. That will prevent accidental
> migration between zoned/non-zoned devices.
> 
> I want to point out that virtio-blk doesn't have checks for the disk
> size or other details, so what you're suggesting for zone_sectors, etc
> is stricter than what QEMU does today. Since the virtio-blk parameters
> you're proposing are optional, I think it doesn't hurt though.

Yeah, it is slightly different than some of the parameters handling.
I guess you could say that with disk capacity, matching size is a
fairly obvious constraint/expectation to manage, and also long standing. 

With disk capacity, you can add the 'raw' driver on top of any block
driver stack, to apply an arbitrary offset+size, to make the storage
smaller than it otherwise is on disk. Conceptually than could have
been done on the frontend device(s) too, but I guess it made more
sense to do it in the block layer to give consistent enforcement
of the limits across frontends. It is fuzzy whether such a use of
the 'raw' driver is really considered backend config,  as opposed to
frontend config but to me it feels likle frontend config.

You could possibly come up with the concept of a 'zoned' format that
can be layered on top of a block driver stack to add zoned I/O constraints
for sake of compatibility, where none otherwise exists in the physical
storage. Possibly useful if multiple frontends all support zoned storage,
to avoid duplicating the constraints across all ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


