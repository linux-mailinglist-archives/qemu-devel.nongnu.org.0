Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0044E57988E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 13:33:00 +0200 (CEST)
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDlTI-0004vI-45
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 07:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlPf-00014I-Cf
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27298)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oDlPc-0003GQ-Hw
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 07:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658230151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rh0ZUKCkTvPlWRzjf6+M562yc0xV1eSIPrd0vriVb/Y=;
 b=BuHQ6m0O6Y8u56W+DfgBdnRhDmG24l+e0TTQpG2J1muIHX4EBnfsDPqXAdthWSH/QgA5Mk
 rTDmNzrPcwrBvSVW5RA85SRI29Evfxbqt5v3sk0J5Ch7i2YX7WLOSzb291HAVHKupRkF20
 86uw1WCJwjdjsvAWTopd2rURMNv63uY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-oPcwe23RM4mtGaLJqnrAMA-1; Tue, 19 Jul 2022 07:29:04 -0400
X-MC-Unique: oPcwe23RM4mtGaLJqnrAMA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v18-20020adf8b52000000b0021d641d2bb0so2509779wra.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 04:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rh0ZUKCkTvPlWRzjf6+M562yc0xV1eSIPrd0vriVb/Y=;
 b=fwhVkMJctwKYF1ipisx8fu1UK6Gcc4xGR7kFyPOSn6FwoM3wKI0t7QaXkRZv4chZje
 ACj2FtEKRUWG61WMFyvPEpeT1jWIXT8TQkm3IJBXHBtUGUCe1XzvOy9x85sZnujwGPP1
 yAI/1KKCAb60H7O0nOI26EMLRLXzZmQZRiDVwoRDPrq4DWKgE9HRoJH+PFVZB1nyPnjv
 VhEBuZwBAFQPsBAaNpCb88ubmvREl/LZrA+8oNpgcg4l9EzFgRhBuop3EAaEFv1wjOdT
 aNcZgM6Qdm7DMTSk6Kaqog/ifIRnSw1kHpGRd2LOabgRd2T/gs1l254BiFc+nytVz353
 jVPA==
X-Gm-Message-State: AJIora+Q3FqKy3TMXJZg/e6LBleBi6J9hXvvgidYKT1gZ6tz7muMhoRZ
 wQj5l5oyIyepFKsJfrDQ61utxPb240nRQSBsv9eHIO1kTRjj4JBp02Ub7njUWAjukWvcbwM7AY9
 kfkNGwyAOKHe77KI=
X-Received: by 2002:a7b:cbd1:0:b0:3a3:187a:296c with SMTP id
 n17-20020a7bcbd1000000b003a3187a296cmr11069718wmi.123.1658230143632; 
 Tue, 19 Jul 2022 04:29:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9mGSXkpHJ2EVn+fF8r4VnAeYIIZNePEmMU121qBgoRAskV10RtkJS1QE73hdk1rJATjRfHg==
X-Received: by 2002:a7b:cbd1:0:b0:3a3:187a:296c with SMTP id
 n17-20020a7bcbd1000000b003a3187a296cmr11069683wmi.123.1658230143385; 
 Tue, 19 Jul 2022 04:29:03 -0700 (PDT)
Received: from redhat.com ([2.55.25.63]) by smtp.gmail.com with ESMTPSA id
 r124-20020a1c4482000000b003a2e2a2e294sm19106823wma.18.2022.07.19.04.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 04:29:02 -0700 (PDT)
Date: Tue, 19 Jul 2022 07:28:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cornelia Huck <cohuck@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eric Blake <eblake@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/19] vdpa net devices Rx filter change notification
 with Shadow VQ
Message-ID: <20220719072839-mutt-send-email-mst@kernel.org>
References: <20220715171834.2666455-1-eperezma@redhat.com>
 <CACGkMEs5QYD8JpQasRh3r83bme3cQBzMwf2fDFm0PQMzzYJmWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACGkMEs5QYD8JpQasRh3r83bme3cQBzMwf2fDFm0PQMzzYJmWA@mail.gmail.com>
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

On Mon, Jul 18, 2022 at 11:32:57AM +0800, Jason Wang wrote:
> On Sat, Jul 16, 2022 at 1:18 AM Eugenio Pérez <eperezma@redhat.com> wrote:
> >
> > Control virtqueue is used by networking device for accepting various
> > commands from the driver. It's a must to support advanced configurations.
> >
> > Rx filtering event is issues by qemu when device's MAC address changed once and
> > the previous one has not been queried by external agents.
> >
> > Shadow VirtQueue (SVQ) already makes possible tracking the state of virtqueues,
> > effectively intercepting them so qemu can track what regions of memory are
> > dirty because device action and needs migration. However, this does not solve
> > networking device state seen by the driver because CVQ messages, like changes
> > on MAC addresses from the driver.
> >
> > This series uses SVQ infrastructure to intercept networking control messages
> > used by the device. This way, qemu is able to update VirtIONet device model and
> > react to them. In particular, this series enables rx filter change
> > notification.
> >
> > This is a prerequisite to achieve net vdpa device with CVQ live migration.
> > It's a stripped down version of [1], with error paths checked and no migration
> > enabled.
> >
> > First nine patches reorder and clean code base so its easier to apply later
> > ones. No functional change should be noticed from these changes.
> >
> > Patches from 11 to 14 enable SVQ API to make other parts of qemu to interact
> > with it. In particular, they will be used by vhost-vdpa net to handle CVQ
> > messages.
> >
> > Patches 15 to 17 enable the update of the virtio-net device model for each
> > CVQ message acknowledged by the device.
> >
> > Last patches enable x-svq parameter, forbidding device migration since it is
> > not restored in the destination's vdpa device yet. This will be added in later
> > series, using this work.
> >
> > Comments are welcome.
> > v3:
> > - Replace SVQElement with SVQDescState
> >
> > v2:
> > - (Comments from series [1]).
> > - Active poll for CVQ answer instead of relay on async used callback
> > - Do not offer a new buffer to device but reuse qemu's
> > - Use vhost_svq_add instead of not needed vhost_svq_inject
> > - Delete used and detach callbacks, not needed anymore
> > - Embed members of SVQElement in VirtQueueElement
> > - Reuse the same buffers for all CVQ commands
> >
> > [1] https://patchwork.kernel.org/project/qemu-devel/cover/20220706184008.1649478-1-eperezma@redhat.com/
> >
> > Eugenio Pérez (19):
> >   vhost: move descriptor translation to vhost_svq_vring_write_descs
> >   virtio-net: Expose MAC_TABLE_ENTRIES
> >   virtio-net: Expose ctrl virtqueue logic
> >   vhost: Reorder vhost_svq_kick
> >   vhost: Move vhost_svq_kick call to vhost_svq_add
> >   vhost: Check for queue full at vhost_svq_add
> >   vhost: Decouple vhost_svq_add from VirtQueueElement
> >   vhost: Add SVQDescState
> >   vhost: Track number of descs in SVQDescState
> >   vhost: add vhost_svq_push_elem
> >   vhost: Expose vhost_svq_add
> >   vhost: add vhost_svq_poll
> >   vhost: Add svq avail_handler callback
> >   vdpa: Export vhost_vdpa_dma_map and unmap calls
> >   vdpa: manual forward CVQ buffers
> >   vdpa: Buffer CVQ support on shadow virtqueue
> >   vdpa: Extract get features part from vhost_vdpa_get_max_queue_pairs
> >   vdpa: Add device migration blocker
> >   vdpa: Add x-svq to NetdevVhostVDPAOptions
> >
> >  qapi/net.json                      |   9 +-
> >  hw/virtio/vhost-shadow-virtqueue.h |  52 ++++-
> >  include/hw/virtio/vhost-vdpa.h     |   8 +
> >  include/hw/virtio/virtio-net.h     |   7 +
> >  hw/net/virtio-net.c                |  85 ++++---
> >  hw/virtio/vhost-shadow-virtqueue.c | 202 +++++++++++-----
> >  hw/virtio/vhost-vdpa.c             |  25 +-
> >  net/vhost-vdpa.c                   | 357 +++++++++++++++++++++++++++--
> >  8 files changed, 627 insertions(+), 118 deletions(-)
> 
> Looks good to me.
> 
> Michael, if you don't object, I plan to merge this series so vendors
> can start to test this.
> 
> Thanks

Sounds good.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> >
> > --
> > 2.31.1
> >
> >


