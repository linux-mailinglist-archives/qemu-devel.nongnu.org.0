Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BD044289F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 08:34:18 +0100 (CET)
Received: from localhost ([::1]:35810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhoJF-0005L5-2t
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 03:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhoHm-0004eI-Mx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhoHj-0006IS-VD
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 03:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635838362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jXIGWxIexqQhEsP8RmW7lyQcuftiwinbtzPGfJNvL7E=;
 b=bWsXJLTEJ+PWoMOuD6KKpz6mZHhhZVZjfalAHbZtSC9x04o+O7RS+29Vz3VOvCBJhXAn8j
 OypbJJfxOgqdeZotmOegVRclge1nyeoY/ZdeZIJt+M63kyof8pmUhsK90rwRs1onpEHsd2
 IOZun09lOaEPFdI6sUUAJTBI/1Bpjx0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-3MNed7BCMPKHsAThxSJxpA-1; Tue, 02 Nov 2021 03:32:39 -0400
X-MC-Unique: 3MNed7BCMPKHsAThxSJxpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so6539891wmc.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 00:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jXIGWxIexqQhEsP8RmW7lyQcuftiwinbtzPGfJNvL7E=;
 b=2Lyy8EydF2bepRkmMPmDO1kc0nCAmQIuft7bnkgnfUq7UdKZ6n4HkqzjG6I9DWPkHj
 OsjL5cSK2G9eIadZMAbDpu6HL7QNlh+7uNLZv31uB85lbxb2vDyOJiar6XpBQuMSeX6W
 qybzbaWSPSO9nEDJB7b2/gYueAPtaaYI5H57fjvmPeyWpOBdJvDcZfR7eS4x1ZI7O5tb
 yACWB1/ccYwWPugLZhrxNegzQTFZpp+HIc61dnbEYUkz790Nxh5ytcoXmXqbZO6nLWhB
 SDAYsB7CGjEL4i7H4acW1Po5Ek8QF668EhjKZ3DrI8PKQdk6b6XTz4QdCSPigTJgUmid
 m/vQ==
X-Gm-Message-State: AOAM530qZP1gv9szAN2TkFz06V33PlsfY7HM4yNyQEjE53917Bv7Gtmp
 vxALsYVaQZkLE1LQd2wohuUsxmjmDUGFji/ZSMoxp4o5Bon7AjaIqOWXsjSdcR6TVpR7HnzINtf
 mHqkQ/4wed0MFnDw=
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr28024899wrt.419.1635838358548; 
 Tue, 02 Nov 2021 00:32:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMqCM2P9kaHXyYe/WWB38JSW9QHSKtfVRjZJzoRSB8gwOOJjGge06qArXnzrvSPeg8WOgJpA==
X-Received: by 2002:a5d:4b82:: with SMTP id b2mr28024866wrt.419.1635838358332; 
 Tue, 02 Nov 2021 00:32:38 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207f:b499:edfc:9aad:137a:a971])
 by smtp.gmail.com with ESMTPSA id 9sm9766103wry.0.2021.11.02.00.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:32:37 -0700 (PDT)
Date: Tue, 2 Nov 2021 03:32:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [RFC PATCH v5 02/26] vhost: Fix last queue index of devices with
 no cvq
Message-ID: <20211102033023-mutt-send-email-mst@kernel.org>
References: <20211029183525.1776416-1-eperezma@redhat.com>
 <20211029183525.1776416-3-eperezma@redhat.com>
 <87a6inow7s.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87a6inow7s.fsf@secure.mitica>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eric Blake <eblake@redhat.com>, virtualization@lists.linux-foundation.org,
 Parav Pandit <parav@mellanox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 08:25:27AM +0100, Juan Quintela wrote:
> Eugenio Pérez <eperezma@redhat.com> wrote:
> > The -1 assumes that all devices with no cvq have an spare vq allocated
> > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> > case, and the device may have a pair number of queues.
>                                   ^^^^
> even
> 
> I know, I know, I am Spanish myself O:-)

Nobody expects the Spanish ;)

> > To fix this, just resort to the lower even number of queues.
> 
> I don't understand what you try to achieve here.
> 
> > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the
> > virtio device")
> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > ---
> >  hw/net/vhost_net.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 0d888f29a6..edf56a597f 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> >      NetClientState *peer;
> >  
> >      if (!cvq) {
> > -        last_index -= 1;
> > +        last_index &= ~1ULL;
> >      }
> 
> As far as I can see, that is a nop. last_index is defined as an int.
> 
> $ cat kk.c
> #include <stdio.h>
> 
> int main(void)
> {
> 	int i = 7;
> 	i &= -1ULL;

Stefano's patch has ~1ULL , not -1ULL here.

> 	printf("%d\n", i);
> 	i = 8;
> 	i &= -1ULL;
> 	printf("%d\n", i);
> 	i = 0;
> 	i &= -1ULL;
> 	printf("%d\n", i);
> 	i = -2;
> 	i &= -1ULL;
> 	printf("%d\n", i);
> 	return 0;
> }
> $ ./kk
> 7
> 8
> 0
> -2


