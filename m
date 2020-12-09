Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C71552D4A65
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:36:23 +0100 (CET)
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5GA-0001db-L3
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn40R-0000Ef-2d
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn40O-00028s-6m
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:16:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCO20VEqHn7kh1peBYJr6YHeYgR9igxb9bxHxv1SRhY=;
 b=Jk1/n15mC3JpEWUyekXASLghicDzpIjsSYup0OYVBxkq9c7t05A9s9OS2My0E11gygz8YJ
 cPPW1Bu4cLGQ55iGsnTtdQizUDVClrqRIoesZLUEqlE2idnAWlLjRltK+QdyhC3zfCiR5N
 jOD3NblQAqN+E9ong4IQ5Tq3Ps0CmYk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-PzjL2jrmN76yLc-SI89t6A-1; Wed, 09 Dec 2020 13:15:54 -0500
X-MC-Unique: PzjL2jrmN76yLc-SI89t6A-1
Received: by mail-qt1-f198.google.com with SMTP id v9so1840611qtw.12
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LCO20VEqHn7kh1peBYJr6YHeYgR9igxb9bxHxv1SRhY=;
 b=SVCz63BYjJQXpBAg21Oz7100nzBrRswTRngxgoG+4GE1iyB5wI0HCfUoAge7MUoZU1
 YRKtP4CnY/FyvDulSSsSYVDvhimXxFqTMkd6TBC2Uqd8HaQZEXKTIkYl38g1+tiMij55
 8DYkxlJiuqLht+tKoN2dZyhJhuqfRcRHPZxT+eeuDNfuPzGqkQO46IrcybzYEIeYNNdM
 gkXDpeuDxiQo0O30DS01e0ud1Q9Dj0IVArhdbXb98jp21/bxME8G2IZnAdxBajHYP6Ox
 U112KU/IFMO7dE28qPqbJGSq6hEnC17G6WlqtoveMoBvbTjXwDjwcFlV3uSbCSHWtEVs
 Ou9w==
X-Gm-Message-State: AOAM530Bi5khNHG5PJYsddNyQVpPv+ihXyJwwbCtqsPE0+A/pZwu+HbT
 24muijzHNdaqfQCAwVgweKizx/TnzDup9U6bqggioZh+Ie16pfDpKl+87sLVtJ3BllqytMYuQ1E
 dBdXNFcwy8blZDQFXhBDzHb+b5731gM4=
X-Received: by 2002:aed:2742:: with SMTP id n60mr4525102qtd.221.1607537754331; 
 Wed, 09 Dec 2020 10:15:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRR7eTmC6fUaKX0udwkL3ONw4tu9eb9neNhi5/HstFuag8F4I8eIY3AujcOjLz0M0eITRDUoT9ahz2b/eZm9w=
X-Received: by 2002:aed:2742:: with SMTP id n60mr4525061qtd.221.1607537754124; 
 Wed, 09 Dec 2020 10:15:54 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-11-eperezma@redhat.com>
 <20201208081755.GS203660@stefanha-x1.localdomain>
In-Reply-To: <20201208081755.GS203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 19:15:17 +0100
Message-ID: <CAJaqyWdLyVCzm-WAxaGPvs6kO09ks1cPe1nzM52JHe2KxuYqgw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/27] vhost: Allocate shadow vring
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 8, 2020 at 9:18 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:48PM +0100, Eugenio P=C3=A9rez wrote:
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/virtio/vhost-sw-lm-ring.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.=
c
> > index cbf53965cd..cd7b5ba772 100644
> > --- a/hw/virtio/vhost-sw-lm-ring.c
> > +++ b/hw/virtio/vhost-sw-lm-ring.c
> > @@ -16,8 +16,11 @@
> >  #include "qemu/event_notifier.h"
> >
> >  typedef struct VhostShadowVirtqueue {
> > +    struct vring vring;
> >      EventNotifier hdev_notifier;
> >      VirtQueue *vq;
> > +
> > +    vring_desc_t descs[];
> >  } VhostShadowVirtqueue;
>
> Looking at later patches I see that this is the vhost hdev vring state,
> not the VirtIODevice vring state. That makes more sense.

I will add a comment here too.


