Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528060A518
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 14:20:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwCW-0007G1-1N; Mon, 24 Oct 2022 08:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1omwCS-0007Fo-Jw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1omwCQ-0000yD-JX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666613096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TN68KVpvR7XKYr0YdRyHBatb1VXNIh4kpbgamAYS4Zw=;
 b=FygN9HLwnOEGwdv5JNvYoChxURDnAXgt6I/SZWZdChr0IhfnHY2caU5IBqBSi+yCK1uvug
 yGvr4fD1Ai+mb2CVsbDgI/0a1QT83099Y0SwRFuwfIS4zyde7hfHfO68hqmFbhq6mbANce
 YnBxgWCD3yH1cTpc/OXdrFY2l2og+Wc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-5LUlF93eMRuhxrfgfGRSFA-1; Mon, 24 Oct 2022 08:04:55 -0400
X-MC-Unique: 5LUlF93eMRuhxrfgfGRSFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA3E8065E8;
 Mon, 24 Oct 2022 12:04:54 +0000 (UTC)
Received: from maya.cloud.tilaa.com (ovpn-208-31.brq.redhat.com [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2E5E200C0DA;
 Mon, 24 Oct 2022 12:04:53 +0000 (UTC)
Date: Mon, 24 Oct 2022 14:04:31 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org, Paul Durrant
 <paul@xen.org>, Thomas Huth <thuth@redhat.com>, "Daniel P. =?UTF-8?B?QmVy?=
 =?UTF-8?B?cmFuZ8Op?=" <berrange@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>, Stefano Stabellini
 <sstabellini@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, Eric
 Blake <eblake@redhat.com>, xen-devel@lists.xenproject.org, "Michael S.
 Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Anthony Perard <anthony.perard@citrix.com>,
 Laine Stump <laine@redhat.com>
Subject: Re: [PATCH v13 17/17] net: stream: add QAPI events to report
 connection state
Message-ID: <20221024140431.2e93dd2b@elisabeth>
In-Reply-To: <87tu3tsczq.fsf@pond.sub.org>
References: <20221020162558.123284-1-lvivier@redhat.com>
 <20221020162558.123284-18-lvivier@redhat.com>
 <87pmel4th4.fsf@pond.sub.org>
 <52e989b9-6f8d-99c6-ef04-3ce32006b002@redhat.com>
 <87lep935hn.fsf@pond.sub.org> <87tu3tsczq.fsf@pond.sub.org>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 13:00:09 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Markus Armbruster <armbru@redhat.com> writes:
> 
> > Cc: Stefano Brivio
> >
> > Laurent Vivier <lvivier@redhat.com> writes:
> >  
> >> On 10/21/22 07:48, Markus Armbruster wrote:  
> >>> Laurent Vivier <lvivier@redhat.com> writes:
> >>>   
> >>>> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> >>>> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.  
> >>>
> >>> Use cases?  
> >>
> >> This is asked by Stefano Brivio to allow libvirt to detect if connection to passt is lost and to restart passt.  
> 
> [...]
> 
> >>> Could similar event signalling be useful for other kinds of netdev
> >>> backends?  
> >>
> >> I was wondering, but it becomes more complicated to be generic.  
> >
> > Making something complicated and generic where a simpler special
> > solution would do is the worst.
> >
> > Not quite as bad (but still plenty bad) is making a few special
> > solutions first, then replace them all with a generic solution.
> >
> > I believe we should have a good, hard think on possible applications of
> > a generic solution now.
> >
> > There is no need to hold back this series for that.
> >
> > If we conclude a generic solution is called for, we better replace this
> > special solution before it becomes ABI.  Either by replacing it before
> > we release it, or by keeping it unstable until we replace it.  
> 
> Stefano, any thoughts on this?

Actually, to me, it already looks as generic as it can be: stream
back-ends are the only ones connecting and disconnecting.

I quickly tried to think about possible, similar events for other
back-ends:

- user: handled by libslirp, there's no connection, and probably not
  much we can or want to export from libslirp itself

- tap, bridge: the closest equivalent would be interfaces changing
  states, but that's something that's also externally observable with a
  netlink socket, in case one needs to know. And in any case, it's
  logically very different from a connection or disconnection. If we
  want events for that, they should have different names

- vhost-user, vde: we could implement something similar if the need
  arises, but it should logically have a different name

- l2tpv3: stateless, same as datagram-oriented socket. No states, no
  events to report, I guess.

All in all, to me, NETDEV_STREAM_{,DIS}CONNECTED events here don't look
very "special" or hackish.

-- 
Stefano


