Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36576433423
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:59:58 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcmqb-0007jY-C2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcmoh-0006Fr-RU
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mcmob-0006Ws-CF
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634641072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jGfhgucF0hs1HcOPzJk3PckuNfIFCLe30SBUEqpOwYE=;
 b=OgDIfMpfz6pbqICau5yTrx/m57ebbDCyQEnrfDwbgqzTi8uDHcveljDC09fLHZL3zrmhe3
 6bfKOND36/q6epTg8+4hoo4b1H0bH4b/HZ10mCAc8wav/2BcFunUYcKHt6oN0UBezqBrBH
 7J5I/fT+PX/f10GvVU4nB57TixgwRxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-dqNcMWAmPeaYn8xrUTwC3Q-1; Tue, 19 Oct 2021 06:57:49 -0400
X-MC-Unique: dqNcMWAmPeaYn8xrUTwC3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4AD15721D;
 Tue, 19 Oct 2021 10:57:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C878B60936;
 Tue, 19 Oct 2021 10:57:31 +0000 (UTC)
Date: Tue, 19 Oct 2021 12:57:30 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 12/15] virtio-net: Store failover primary opts pointer
 locally
Message-ID: <YW6kmnhGPwjFQlZd@redhat.com>
References: <20211008133442.141332-1-kwolf@redhat.com>
 <20211008133442.141332-13-kwolf@redhat.com>
 <3be47c0d-817b-b5e6-fa7f-234a417ec2c5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3be47c0d-817b-b5e6-fa7f-234a417ec2c5@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: damien.hedde@greensocs.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 libvir-list@redhat.com, jasowang@redhat.com, quintela@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@virtuozzo.com,
 its@irrelevant.dk, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.10.2021 um 10:06 hat Laurent Vivier geschrieben:
> On 08/10/2021 15:34, Kevin Wolf wrote:
> > Instead of accessing the global QemuOptsList, which really belong to the
> > command line parser and shouldn't be accessed from devices, store a
> > pointer to the QemuOpts in a new VirtIONet field.
> > 
> > This is not the final state, but just an intermediate step to get rid of
> > QemuOpts in devices. It will later be replaced with an options QDict.
> > 
> > Before this patch, two "primary" devices could be hidden for the same
> > standby device, but only one of them would actually be enabled and the
> > other one would be kept hidden forever, so this doesn't make sense.
> > After this patch, configuring a second primary device is an error.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >   include/hw/virtio/virtio-net.h |  1 +
> >   hw/net/virtio-net.c            | 26 ++++++++++++++++++--------
> >   2 files changed, 19 insertions(+), 8 deletions(-)
> > 
> > diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
> > index 824a69c23f..d118c95f69 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -209,6 +209,7 @@ struct VirtIONet {
> >       bool failover_primary_hidden;
> >       bool failover;
> >       DeviceListener primary_listener;
> > +    QemuOpts *primary_opts;
> >       Notifier migration_state;
> >       VirtioNetRssData rss_data;
> >       struct NetRxPkt *rx_pkt;
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index a17d5739fc..ed9a9012e9 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -858,27 +858,24 @@ static DeviceState *failover_find_primary_device(VirtIONet *n)
> >   static void failover_add_primary(VirtIONet *n, Error **errp)
> >   {
> >       Error *err = NULL;
> > -    QemuOpts *opts;
> > -    char *id;
> >       DeviceState *dev = failover_find_primary_device(n);
> >       if (dev) {
> >           return;
> >       }
> > -    id = failover_find_primary_device_id(n);
> > -    if (!id) {
> > +    if (!n->primary_opts) {
> >           error_setg(errp, "Primary device not found");
> >           error_append_hint(errp, "Virtio-net failover will not work. Make "
> >                             "sure primary device has parameter"
> >                             " failover_pair_id=%s\n", n->netclient_name);
> >           return;
> >       }
> > -    opts = qemu_opts_find(qemu_find_opts("device"), id);
> > -    g_assert(opts); /* cannot be NULL because id was found using opts list */
> > -    dev = qdev_device_add(opts, &err);
> > +
> > +    dev = qdev_device_add(n->primary_opts, &err);
> >       if (err) {
> > -        qemu_opts_del(opts);
> > +        qemu_opts_del(n->primary_opts);
> > +        n->primary_opts = NULL;
> >       } else {
> >           object_unref(OBJECT(dev));
> >       }
> > @@ -3317,6 +3314,19 @@ static bool failover_hide_primary_device(DeviceListener *listener,
> >           return false;
> >       }
> > +    if (n->primary_opts) {
> > +        error_setg(errp, "Cannot attach more than one primary device to '%s'",
> > +                   n->netclient_name);
> > +        return false;
> > +    }
> > +
> 
> This part has introduced a regression, I've sent a patch to fix that.
> 
> https://patchew.org/QEMU/20211019071532.682717-1-lvivier@redhat.com/

Thanks for catching this! The fix looks good to me.

Kevin


