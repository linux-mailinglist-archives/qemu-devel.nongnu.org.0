Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1521E48A1D9
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:24:00 +0100 (CET)
Received: from localhost ([::1]:46838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7291-0000ah-6x
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71wv-0004yn-Cp
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:11:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71wt-0005Tz-LG
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641849087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cDYtXsg7dSqwPX9xsAwXxY4y/ac2tSq7w/Zu5rIPW68=;
 b=CzsaYP0+PVfZK773CtRMsaOxmke681TsOFim0cgSx77rvvOPazN3lY2RnKhsqEzdj/QEnP
 fD8J898slJb/dACuz0dWAjPSYfP3pCW0YLR6xn43UyS8NeCr6vBaurpfbnU64JYPRjklGO
 2MoAj9NlRaUuX9mIfE0sGnWpsFgOjqo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-xrQDzZYRON2iHu5yzWmz-Q-1; Mon, 10 Jan 2022 16:11:26 -0500
X-MC-Unique: xrQDzZYRON2iHu5yzWmz-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so629667wmq.6
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cDYtXsg7dSqwPX9xsAwXxY4y/ac2tSq7w/Zu5rIPW68=;
 b=HwFJCy5iwYlmukhAo3thWCnDQvMjRcJTizNvCQ0wgcEHAUCI3rjgnULlQN34nto0Zk
 iDsaIlECetQoATBoc96KcpxHFkNpM+xOJkt3IrMbTpFTAubgEn7QzEA2CRh/izfXbtwL
 wfehCfVUJYvRIOMssjq2YTtIfBJzc1MKeIew7hnpU8awYwu8+cnphTe/1tDsPlKWPwLe
 DhxlLY7aLuw8yobZ/BL8r6n4BdmLFq+pNsKKJdQ9ylq5WWwL5ke3V4JqKZcj0Gl/d2kY
 VNiHQZNlG6HMMLEZGwGCiSRWuUp5JgWrXKthflJx6s/Ycm9tPVlGcMaAKmP8ZUIc3E/j
 PPJw==
X-Gm-Message-State: AOAM5302/bna/3giy8JRhfJvEvakGVwXsFIQuqxaHedmyRFRmtFVjz9W
 qXnaQm6sc/uCEqPj8zMbhK83gXJYRFKr32cnGBuPtjVu9PxcTcOzcPKs1g8D5CLqte46N6DFmXD
 2qTvCyIcTaeXQNFQ=
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr1113835wrs.712.1641849082985; 
 Mon, 10 Jan 2022 13:11:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7g2Jcgf4SD7m1mXyq6K+zLAbsOh2EOpAGHn6/+NWv/pooQvKspqo/RmzlDZXYS2x9NdRUPw==
X-Received: by 2002:a5d:6da3:: with SMTP id u3mr1113829wrs.712.1641849082810; 
 Mon, 10 Jan 2022 13:11:22 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id g18sm4062wmq.5.2022.01.10.13.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:11:22 -0800 (PST)
Date: Mon, 10 Jan 2022 16:11:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: Re: [PATCH v2 1/5] libvhost-user: Add vu_rem_mem_reg input validation
Message-ID: <20220110160952-mutt-send-email-mst@kernel.org>
References: <20220106064717.7477-1-raphael.norwitz@nutanix.com>
 <20220106064717.7477-2-raphael.norwitz@nutanix.com>
 <20220110043354-mutt-send-email-mst@kernel.org>
 <20220110194253.GA7751@raphael-debian-dev>
MIME-Version: 1.0
In-Reply-To: <20220110194253.GA7751@raphael-debian-dev>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "raphael.s.norwitz@gmail.com" <raphael.s.norwitz@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 07:43:06PM +0000, Raphael Norwitz wrote:
> On Mon, Jan 10, 2022 at 04:36:34AM -0500, Michael S. Tsirkin wrote:
> > On Thu, Jan 06, 2022 at 06:47:26AM +0000, Raphael Norwitz wrote:
> > > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > 
> > 
> > Raphael any chance you can add a bit more to commit logs?
> > E.g. what happens right now if you pass more?
> >
> 
> Sure - I'll add those details.
> 
> > > ---
> > >  subprojects/libvhost-user/libvhost-user.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
> > > index 787f4d2d4f..a6dadeb637 100644
> > > --- a/subprojects/libvhost-user/libvhost-user.c
> > > +++ b/subprojects/libvhost-user/libvhost-user.c
> > > @@ -801,6 +801,12 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> > >      VuDevRegion shadow_regions[VHOST_USER_MAX_RAM_SLOTS] = {};
> > >      VhostUserMemoryRegion m = vmsg->payload.memreg.region, *msg_region = &m;
> > >  
> > > +    if (vmsg->fd_num != 1 ||
> > > +        vmsg->size != sizeof(vmsg->payload.memreg)) {
> > 
> > Is there a chance someone is sending larger messages and relying
> > on libvhost-user to ignore padding?
> > 
> 
> Great point -  I didn't consider padding. I'll drop the vmsg->size check
> here.
> 
> It looks like we are inconsistent with size checking. For example, in
> vu_set_log_base_exec() we also check the size.
> 
> Should we make it consistent across the library or am I missing some
> details about why the padding is not an issue in that case?

Not sure. We don't allow arbitrary padding do we? That would require
extra processing to skip padding in case it's very large.
Let's try to come up with a policy and document it as part of the spec?

> > > +        vu_panic(dev, "VHOST_USER_REM_MEM_REG received multiple regions");
> > 
> > Maybe print the parameters that caused the issue?
> >
> 
> Ack.
> 
> > > +        return false;
> > > +    }
> > > +
> > >      DPRINT("Removing region:\n");
> > >      DPRINT("    guest_phys_addr: 0x%016"PRIx64"\n",
> > >             msg_region->guest_phys_addr);
> > > -- 
> > > 2.20.1
> > 


