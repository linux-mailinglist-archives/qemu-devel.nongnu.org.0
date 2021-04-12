Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AB335CA4C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 17:44:55 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVykA-0007VO-EY
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 11:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVyia-0006zX-73
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lVyiX-0005lx-ND
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 11:43:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618242185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psFM2o1v3NlFvHt16JVpwJdvWWuHNb967kf8pdFGzj4=;
 b=DXITauFVPXfdzLwm2dAJWlyyrpbb4xBTNhmQ7g/938Ev5cDNY6UTwmf9IqHe1MX5eFqZOu
 ivw+gYgque/RiHATI/bsvW5O82IrUuhNH0HEvMVvmdFSUCJoa42yI5FK0ucf9BGd7dwuQ1
 3WgtJivMVLu3J0YDWatWryglAGUV9Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-4_vK0o6ENveIsVCV-vkriA-1; Mon, 12 Apr 2021 11:43:01 -0400
X-MC-Unique: 4_vK0o6ENveIsVCV-vkriA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F18800D53
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 15:43:00 +0000 (UTC)
Received: from work-vm (ovpn-115-48.ams2.redhat.com [10.36.115.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26D6810023AB;
 Mon, 12 Apr 2021 15:42:59 +0000 (UTC)
Date: Mon, 12 Apr 2021 16:42:56 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 5/5] sockets: Support multipath TCP
Message-ID: <YHRqgHxR63IkBw6L@work-vm>
References: <20210408191159.133644-1-dgilbert@redhat.com>
 <20210408191159.133644-6-dgilbert@redhat.com>
 <YHAc2V7bRS6EgQO9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YHAc2V7bRS6EgQO9@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: quintela@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, pabeni@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Apr 08, 2021 at 08:11:59PM +0100, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > Multipath TCP allows combining multiple interfaces/routes into a single
> > socket, with very little work for the user/admin.
> > 
> > It's enabled by 'mptcp' on most socket addresses:
> > 
> >    ./qemu-system-x86_64 -nographic -incoming tcp:0:4444,mptcp
> > 
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  io/dns-resolver.c   |  2 ++
> >  qapi/sockets.json   |  5 ++++-
> >  util/qemu-sockets.c | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 40 insertions(+), 1 deletion(-)
> > 
> > diff --git a/io/dns-resolver.c b/io/dns-resolver.c
> > index 743a0efc87..b081e098bb 100644
> > --- a/io/dns-resolver.c
> > +++ b/io/dns-resolver.c
> > @@ -122,6 +122,8 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
> >              .ipv4 = iaddr->ipv4,
> >              .has_ipv6 = iaddr->has_ipv6,
> >              .ipv6 = iaddr->ipv6,
> > +            .has_mptcp = iaddr->has_mptcp,
> > +            .mptcp = iaddr->mptcp,
> >          };
> >  
> >          (*addrs)[i] = newaddr;
> > diff --git a/qapi/sockets.json b/qapi/sockets.json
> > index 2e83452797..43122a38bf 100644
> > --- a/qapi/sockets.json
> > +++ b/qapi/sockets.json
> > @@ -57,6 +57,8 @@
> >  # @keep-alive: enable keep-alive when connecting to this socket. Not supported
> >  #              for passive sockets. (Since 4.2)
> >  #
> > +# @mptcp: enable multi-path TCP. (Since 6.0)
> > +#
> >  # Since: 1.3
> >  ##
> >  { 'struct': 'InetSocketAddress',
> > @@ -66,7 +68,8 @@
> >      '*to': 'uint16',
> >      '*ipv4': 'bool',
> >      '*ipv6': 'bool',
> > -    '*keep-alive': 'bool' } }
> > +    '*keep-alive': 'bool',
> > +    '*mptcp': 'bool' } }
> 
> I think this would need to be
> 
>    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' }
> 
> so that mgmt apps can probe when it truely is supported or not for
> this build

Done; now remember that just tells you if your C library knows about it,
not whether your kernel, firewall, or avian carriers know about it.

> >  
> >  ##
> >  # @UnixSocketAddress:
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 8af0278f15..72527972d5 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -206,6 +206,21 @@ static int try_bind(int socket, InetSocketAddress *saddr, struct addrinfo *e)
> >  #endif
> >  }
> >  
> > +static int check_mptcp(const InetSocketAddress *saddr, struct addrinfo *ai,
> > +                       Error **errp)
> > +{
> > +    if (saddr->has_mptcp && saddr->mptcp) {
> > +#ifdef IPPROTO_MPTCP
> > +        ai->ai_protocol = IPPROTO_MPTCP;
> > +#else
> > +        error_setg(errp, "MPTCP unavailable in this build");
> > +        return -1;
> > +#endif
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  static int inet_listen_saddr(InetSocketAddress *saddr,
> >                               int port_offset,
> >                               int num,
> > @@ -278,6 +293,11 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
> >  
> >      /* create socket + bind/listen */
> >      for (e = res; e != NULL; e = e->ai_next) {
> > +        if (check_mptcp(saddr, e, &err)) {
> > +            error_propagate(errp, err);
> > +            return -1;
> > +        }
> 
> So this is doing two different things - it checks whether mptcp was
> requested and if not compiled in, reports an error. Second it sets
> the mptcp flag. The second thing is suprising given the name of
> the function but also it delays error reporting until after we've
> gone through the DNS lookup which I think is undesirable.
> 
> If we make the 'mptcp' field in QAPI schema use the conditional that
> I show above, then we make it literally impossible to have the mptcp
> field set when IPPROTO_MPTCP is unset, avoiding the need to do error
> reporting at all.
> 
> IOW, the above 4 lines could be simplified to just
> 
>  #ifdef IPPROTO_MPTCP
>     if (saddr->has_mptcp && saddr->mptcp) {
>         ai->ai_protocol = IPPROTO_MPTCP;
>     }
>  #else

OK, done - (with a #endif)

> 
> 
> > @@ -687,6 +712,15 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> >          }
> >          addr->has_keep_alive = true;
> >      }
> > +    begin = strstr(optstr, ",mptcp");
> > +    if (begin) {
> > +        if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
> > +                            &addr->mptcp, errp) < 0)
> > +        {
> > +            return -1;
> > +        }
> > +        addr->has_mptcp = true;
> > +    }
> 
> This reminds me that inet_parse_flag is a bit of a crude design right
> now, because it only does half the job, leaving half the repeated code
> pattern in the caller still, with use having the string ",mtcp" /"mptcp"
> repeated three times !

Yeh I noticed that.

> If you fancy refactoring it, i think it'd make more sense if we could
> just have a caller pattern of
> 
>    if (inet_parse_flag(optstr,
>                        "mptcp",
>                        &addr->has_mptcp,
>                        &addr->mptcp, errp) < 0)
> 
> Not a blocker todo this though.

A job for another day.

Dave

> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


