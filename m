Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD536F5B85
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:50:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puEjV-0005Vb-RE; Wed, 03 May 2023 11:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puEjT-0005VJ-Dn
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puEjR-00030A-Go
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:49:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683128968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XaWePBcbq2UD768Tnd75W81GSgd+Js/r4AnMQhmp4QE=;
 b=E3xMavbHCUVRv3KOyJMsKr4HRleIhLrd4VXRWPqPjjhFak5GG3bv+unDjf29i33cMc6Aoo
 34sT/K/OpxSCnKjyk0q22pLvOq0OZdHZKLraXoWUv+DyuuolRJmdIYALAK1riyoquII33l
 AW5mTDkw0Ghk4ipr6HhHli75nw6F4ms=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-Cvzs5SD_NrqMg3JwOVyCIw-1; Wed, 03 May 2023 11:49:26 -0400
X-MC-Unique: Cvzs5SD_NrqMg3JwOVyCIw-1
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-61a3c7657aeso2757826d6.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683128966; x=1685720966;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XaWePBcbq2UD768Tnd75W81GSgd+Js/r4AnMQhmp4QE=;
 b=WxWb5LbEBZkMEPTIGqwJ7Y5K03dZ2uZU5ZbtJZJntI2j+gn6kyAHsNCiEqoWbxzROU
 ExB/qpIB47lTVQsBlGRdDdq/Oj7Y5vlT7BPSLC47Yk+l/rDGblxuRApPGzl9CgKIFc8E
 sjltTQbIiGgBHgNUuJTf37Liuf8Tcdp93vYDoy9+VGDFGEGFSH430x8P5/m5KL/2CJtW
 zlVMHttborkcMtIajTAxqbrWR7tGS2KxxulAQQARrFu8Ci+Ax0Kq+6GFe/j2e7Rvqbm3
 +paAMzlLLpqi8n0I4rDpqmydLNN8ZswPURLGRdzNDeLiJkmTRIQg+puBmqezoP1dJnYL
 nd7A==
X-Gm-Message-State: AC+VfDzieDt9UQapqGqRqX4EDsSCFpflB46zJMbxobgkQyVYQQIR3En6
 2rsT/DU202DJIAKqj84l3RDAXfsyxZJFKnLmZAN80EDoFnoiwJSnGWHhlYVa2Ryw0hIyK2X/UUB
 7YvfsOMuaFBu6q+A=
X-Received: by 2002:a05:6214:501a:b0:61b:73b2:85ca with SMTP id
 jo26-20020a056214501a00b0061b73b285camr3663559qvb.5.1683128966131; 
 Wed, 03 May 2023 08:49:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7v9bxnoyGeqJfAgXyNLsh2V7PWVX+0uj5B4VwDzWMccNKzoR9vLkGWkGZtmC78JcuskvG3Sg==
X-Received: by 2002:a05:6214:501a:b0:61b:73b2:85ca with SMTP id
 jo26-20020a056214501a00b0061b73b285camr3663518qvb.5.1683128965764; 
 Wed, 03 May 2023 08:49:25 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 bq16-20020a05620a469000b0074e020ff0edsm10804947qkb.48.2023.05.03.08.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:49:24 -0700 (PDT)
Date: Wed, 3 May 2023 11:49:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH 0/8] migration: Add precopy initial data capability and
 VFIO precopy support
Message-ID: <ZFKCg2xnws2Smchb@x1n>
References: <20230501140141.11743-1-avihaih@nvidia.com> <ZFGTerErJWnWHD6/@x1n>
 <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72e14c81-a953-c288-c570-4987492b3569@nvidia.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 06:22:59PM +0300, Avihai Horon wrote:
> 
> On 03/05/2023 1:49, Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Mon, May 01, 2023 at 05:01:33PM +0300, Avihai Horon wrote:
> > > Hello everyone,
> > Hi, Avihai,
> > 
> > > === Flow of operation ===
> > > 
> > > To use precopy initial data, the capability must be enabled in the
> > > source.
> > > 
> > > As this capability must be supported also in the destination, a
> > > handshake is performed during migration setup. The purpose of the
> > > handshake is to notify the destination that precopy initial data is used
> > > and to check if it's supported.
> > > 
> > > The handshake is done in two levels. First, a general handshake is done
> > > with the destination migration code to notify that precopy initial data
> > > is used. Then, for each migration user in the source that supports
> > > precopy initial data, a handshake is done with its counterpart in the
> > > destination:
> > > If both support it, precopy initial data will be used for them.
> > > If source doesn't support it, precopy initial data will not be used for
> > > them.
> > > If source supports it and destination doesn't, migration will be failed.
> > > 
> > > Assuming the handshake succeeded, migration starts to send precopy data
> > > and as part of it also the initial precopy data. Initial precopy data is
> > > just like any other precopy data and as such, migration code is not
> > > aware of it. Therefore, it's the responsibility of the migration users
> > > (such as VFIO devices) to notify their counterparts in the destination
> > > that their initial precopy data has been sent (for example, VFIO
> > > migration does it when its initial bytes reach zero).
> > > 
> > > In the destination, migration code will query each migration user that
> > > supports precopy initial data and check if its initial data has been
> > > loaded. If initial data has been loaded by all of them, an ACK will be
> > > sent to the source which will now be able to complete migration when
> > > appropriate.
> > I can understand why this is useful, what I'm not 100% sure is whether the
> > complexity is needed.  The idea seems to be that src never switchover
> > unless it receives a READY notification from dst.
> > 
> > I'm imaging below simplified and more general workflow, not sure whether it
> > could work for you:
> > 
> >    - Introduce a new cap "switchover-ready", it means whether there'll be a
> >      ready event sent from dst -> src for "being ready for switchover"
> > 
> >    - When cap set, a new msg MIG_RP_MSG_SWITCHOVER_READY is defined and
> >      handled on src showing that dest is ready for switchover. It'll be sent
> >      only if dest is ready for the switchover
> > 
> >    - Introduce a field SaveVMHandlers.explicit_switchover_needed.  For each
> >      special device like vfio that would like to participate in the decision
> >      making, device can set its explicit_switchover_needed=1.  This field is
> >      ignored if the new cap is not set.
> > 
> >    - Dst qemu: when new cap set, remember how many special devices are there
> >      requesting explicit switchover (count of SaveVMHandlers that has the
> >      bit set during load setup) as switch_over_pending=N.
> > 
> >    - Dst qemu: Once a device thinks its fine to switchover (probably in the
> >      load_state() callback), it calls migration_notify_switchover_ready().
> >      That decreases switch_over_pending and when it hits zero, one msg
> >      MIG_RP_MSG_SWITCHOVER_READY will be sent to src.
> > 
> > Only until READY msg received on src could src switchover the precopy to
> > dst.
> > 
> > Then it only needs 1 more field in SaveVMHandlers rather than 3, and only 1
> > more msg (dst->src).
> > 
> > This is based on the fact that right now we always set caps on both qemus
> > so I suppose it already means either both have or don't have the feature
> > (even if one has, not setting the cap means disabled on both).
> > 
> > Would it work for this case and cleaner?
> 
> Hi Peter, thanks for the response!
> Your approach is indeed much simpler, however I have a few concerns
> regarding compatibility.
> 
> You are saying that caps are always set both in src and dest.
> But what happens if we set the cap only on one side?
> Should we care about these scenarios?

I think it's not needed for now, but I am aware that this is a problem.
It's just that it is a more generic problem to me rather than very special
in the current feature being proposed.  At least there're a few times
Daniel showed concern on keeping this way and hoped we can have a better
handshake in general with migration framework.

I'd be perfectly fine if you want to approach this with a handshake
methodology, but I hope if so we should provide a more generic handshake.
So potentially that can make this new feature rely on the handshake work,
and slower to get into shape.  Your call on how to address this, at least
fine by me either way.

In my imagination a generic handshake should happen at the very start of
migration and negociate feature bits between src/dst qemu, so they can
reach a consensus on what to do next.

> For example, if we set the cap only in src, then src will wait indefinitely
> for dest to notify that switchover is ready.
> Would you expect migration to fail instead of just keep running
> indefinitely?
> In current approach we only need to enable the cap in the source, so such
> scenario can't happen.
> 
> Let's look at some other scenario.
> Src QEMU supports explicit-switchover for device X but *not* for device Y
> (i.e., src QEMU is some older version of QEMU that supports
> explicit-switchover for device X but not for Y).
> Dest QEMU supports explicit-switchover for device X and device Y.
> The capability is set in both src and dest.
> In the destination we will have switchover_pending=2 because both X and Y
> support explicit-switchover.
> We do migration, but switchover_pending will never reach 0 because only X
> supports it in the source, so the migration will run indefinitely.
> The per-device handshake solves this by making device Y not use
> explicit-switchover in this case.

Hmm, right.  When I was replying obviously I thought that decision can be
made sololy by the dest qemu, then I assumed it's fine.  Because IIUC in
that case how many devices that supports switchover_pending on src qemu
doesn't really matter but only dest.

But I re-read the last patch and I do see that there's a new bit that will
change the device protocol of migration:

  if (migration->initial_data_active && !migration->precopy_init_size &&
      !migration->initial_data_sent) {
      qemu_put_be64(f, VFIO_MIG_FLAG_DEV_INIT_DATA_SENT);
      migration->initial_data_sent = true;
  } else {
      qemu_put_be64(f, VFIO_MIG_FLAG_END_OF_STATE);
  }

With this, I think what you said makes sense because then the src qemu
matters on deciding whether to send VFIO_MIG_FLAG_DEV_INIT_DATA_SENT, it
also needs to make sure dst qemu will recognize it.

Do you think this new VFIO_MIG_FLAG_DEV_INIT_DATA_SENT is a must to have?
Can this decision be made on dest qemu only?

To ask in another way, I saw that precopy_init_size is the fundation to
decide whether to send this flag.  Then it's a matter of whether dest qemu
is also aware of precopy_init_size, then it can already tell when it's
ready to handle the switchover.

Thanks,

-- 
Peter Xu


