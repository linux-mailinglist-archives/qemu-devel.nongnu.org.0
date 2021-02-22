Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF4432133F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:40:49 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7hw-0006t8-53
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lE7h8-0006N1-Pv
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lE7h5-0005ui-Gy
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 04:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613986793;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NuGFJEbAXsnNGh3D1BIciMScT+dXwSVAqAtRxKyDyOY=;
 b=ef4ng/jrZTuYsbuT1bFGwSgyxdK38caKXBJPMACHfFEvm3FswvRTNTh6/pr01gjGRFDLtS
 U0FDZQtzEnEZxpcaMqerF8NwrfISaLKagjw7Gqr1+IOcjbb+k+9x6h67QCbv33UKClDxn2
 S95aZiG6/rz6pcM9XgLjB2R0vQZD/LA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-7msQWWBBPLq-FvmPyH0VXQ-1; Mon, 22 Feb 2021 04:39:47 -0500
X-MC-Unique: 7msQWWBBPLq-FvmPyH0VXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46B27814736;
 Mon, 22 Feb 2021 09:39:46 +0000 (UTC)
Received: from redhat.com (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEFBE3AC0;
 Mon, 22 Feb 2021 09:39:44 +0000 (UTC)
Date: Mon, 22 Feb 2021 09:39:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <YDN73SqaDQDtwlgZ@redhat.com>
References: <20210218201538.701509-1-dje@google.com>
 <20210218201538.701509-3-dje@google.com>
 <YC+MTYWe4HYpcAIk@redhat.com>
 <CADPb22ROPdpaQGobxP_vhcW=KBJVV4FwrmGb3+Z6nZecymT4BA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADPb22ROPdpaQGobxP_vhcW=KBJVV4FwrmGb3+Z6nZecymT4BA@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 02:17:42PM -0800, Doug Evans wrote:
> On Fri, Feb 19, 2021 at 2:00 AM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Thu, Feb 18, 2021 at 12:15:36PM -0800, Doug Evans wrote:
> > > The parsing is moved into new function inet_parse_host_and_port.
> > > This is done in preparation for using the function in net/slirp.c.
> > >
> > > Signed-off-by: Doug Evans <dje@google.com>
> > > ---
> > >
> > > Changes from v3:
> > > - this patch is new in v4
> > >   - provides new utility: inet_parse_host_and_port, updates inet_parse
> > >     to use it
> > >
> > >  include/qemu/sockets.h |  3 ++
> > >  util/qemu-sockets.c    | 94 +++++++++++++++++++++++++++++++-----------
> > >  2 files changed, 72 insertions(+), 25 deletions(-)
> > >
> > > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > > index 7d1f813576..f720378a6b 100644
> > > --- a/include/qemu/sockets.h
> > > +++ b/include/qemu/sockets.h
> > > @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
> > >
> > >  int inet_ai_family_from_address(InetSocketAddress *addr,
> > >                                  Error **errp);
> > > +const char* inet_parse_host_and_port(const char* str, int terminator,
> > > +                                     char **addr, char **port, bool
> > *is_v6,
> > > +                                     Error **errp);
> > >  int inet_parse(InetSocketAddress *addr, const char *str, Error **errp);
> > >  int inet_connect(const char *str, Error **errp);
> > >  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
> > > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > > index 8af0278f15..9fca7d9212 100644
> > > --- a/util/qemu-sockets.c
> > > +++ b/util/qemu-sockets.c
> > > @@ -615,44 +615,88 @@ static int inet_parse_flag(const char *flagname,
> > const char *optstr, bool *val,
> > >      return 0;
> > >  }
> > >
> > > -int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> > > +/*
> > > + * Parse an inet host and port as "host:port<terminator>".
> > > + * Terminator may be '\0'.
> > > + * The syntax for ipv4 addresses is: address:port.
> > > + * The syntax for ipv6 addresses is: [address]:port.
> >
> > It also supports
> >
> >    "The syntax for hostnames is hostname:port
> >
> > > + * On success, returns a pointer to the terminator. Space for the
> > address and
> > > + * port is malloced and stored in *host, *port, the caller must free.
> > > + * *is_v6 indicates whether the address is ipv4 or ipv6. If ipv6 then
> > the
> > > + * surrounding [] brackets are removed.
> >
> > When is_v6 is true, it indicates that a numeric ipv6 address was given.
> > When false either a numberic ipv4 address or hostname was given.
> >
> > > + * On failure NULL is returned with the error stored in *errp.
> > > + */
> > > +const char* inet_parse_host_and_port(const char* str, int terminator,
> > > +                                     char **hostp, char **portp, bool
> > *is_v6,
> > > +                                     Error **errp)
> > >  {
> > > -    const char *optstr, *h;
> > > +    const char *terminator_ptr = strchr(str, terminator);
> > > +    g_autofree char *buf = NULL;
> > >      char host[65];
> > >      char port[33];
> > > -    int to;
> > > -    int pos;
> > > -    char *begin;
> > >
> > > -    memset(addr, 0, sizeof(*addr));
> > > +    if (terminator_ptr == NULL) {
> > > +        /* If the terminator isn't found then use the entire string. */
> > > +        terminator_ptr = str + strlen(str);
> > > +    }
> > > +    buf = g_strndup(str, terminator_ptr - str);
> > >
> > > -    /* parse address */
> > > -    if (str[0] == ':') {
> > > -        /* no host given */
> > > -        host[0] = '\0';
> > > -        if (sscanf(str, ":%32[^,]%n", port, &pos) != 1) {
> > > -            error_setg(errp, "error parsing port in address '%s'", str);
> > > -            return -1;
> > > -        }
> >
> >
> > > -    } else if (str[0] == '[') {
> > > +    if (buf[0] == '[') {
> > >          /* IPv6 addr */
> > > -        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) != 2) {
> > > -            error_setg(errp, "error parsing IPv6 address '%s'", str);
> > > -            return -1;
> > > +        if (buf[1] == ']') {
> > > +            /* sscanf %[ doesn't recognize empty contents. */
> > > +            host[0] = '\0';
> > > +            if (sscanf(buf, "[]:%32s", port) != 1) {
> > > +                error_setg(errp, "error parsing IPv6 host:port '%s'",
> > buf);
> > > +                return NULL;
> > > +            }
> >
> > This is introducing new functionality to the parser. Current callers
> > let empty string ":port" be used for both ipv4 and ipv6, based
> > on whether the flags ",ipv4[=on|off],ipv6[=on|off]" later follow.
> >
> 
> 
> We're creating a new utility subroutine: Let's decide what the API is for
> it.
> The fact that inet_parse is passed additional parameters to specify ipv4 vs
> ipv6 is not something this new subroutine should care about.
> 
> I presume you want an explicit way to represent an empty ipv6 hostname
> > to avoid changing semantics for existing slirp CLI args, where the
> > existing ":port" exclusively means ipv4. IIC, this is also why you
> > needed to introduce the "is_v6" flag, because any non-empty address
> > can be reliably parsed without needing this flag.
> >
> 
> 
> Actually, no. The "is_v6" flag is needed because otherwise the caller has
> no means (other than maybe subsequent grepping for "." vs ":") for knowing
> whether str contained "address" or "[address]".
> 
> Plus, for my needs I don't need to support "[hostname]". If someone later
> wants that supported that can be designed then.
> Thus supporting "[hostname]" is not something I'm considering in this
> patchset.
> 
> 
> 
> >
> > This is reasonable, but any such functional change should be in a
> > separate commit from refactoring.
> >
> > IOW, remove this and the is_v6 flag, and add them in a separate
> > patch to explain to the need for new functionality in the parsing.
> >
> > Given that existing callers don't need to support "[]", we should
> > not let that be parsed, unless the caller passing a "is_v6" pointer
> > which is not NULL.
> >
> > > +        } else {
> > > +            if (sscanf(buf, "[%64[^]]]:%32s", host, port) != 2) {
> > > +                error_setg(errp, "error parsing IPv6 host:port '%s'",
> > buf);
> > > +                return NULL;
> > > +            }
> > >          }
> > >      } else {
> > > -        /* hostname or IPv4 addr */
> > > -        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) != 2) {
> > > -            error_setg(errp, "error parsing address '%s'", str);
> > > -            return -1;
> > > +        if (buf[0] == ':') {
> > > +            /* no host given */
> > > +            host[0] = '\0';
> > > +            if (sscanf(buf, ":%32s", port) != 1) {
> > > +                error_setg(errp, "error parsing host:port '%s'", buf);
> > > +                return NULL;
> > > +            }
> >
> > It would be preferreable if the parsing code was not re-ordered when
> > extracting it. It doesn't look like a functional change, but I'm unsure
> > why you moved it ?
> >
> > > +        } else {
> > > +            /* hostname or IPv4 addr */
> > > +            if (sscanf(buf, "%64[^:]:%32s", host, port) != 2) {
> > > +                error_setg(errp, "error parsing host:port '%s'", buf);
> > > +                return NULL;
> > > +            }
> > >          }
> > >      }
> > >
> > > -    addr->host = g_strdup(host);
> > > -    addr->port = g_strdup(port);
> > > +    *hostp = g_strdup(host);
> > > +    *portp = g_strdup(port);
> > > +    *is_v6 = buf[0] == '[';
> > > +
> > > +    return terminator_ptr;
> > > +}
> > > +
> > > +int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> > > +{
> > > +    const char *optstr, *h;
> > > +    bool is_v6;
> > > +    int to;
> > > +    int pos;
> > > +    char *begin;
> > > +
> > > +    memset(addr, 0, sizeof(*addr));
> > > +
> > > +    optstr = inet_parse_host_and_port(str, ',', &addr->host,
> > &addr->port,
> > > +                                      &is_v6, errp);
> >
> > Just pass NULL since we don't need is_v6
> >
> > > +    if (optstr == NULL) {
> > > +        return -1;
> > > +    }
> > >
> > >      /* parse options */
> > > -    optstr = str + pos;
> > >      h = strstr(optstr, ",to=");
> > >      if (h) {
> > >          h += 4;
> > > --
> > > 2.30.0.617.g56c4b15f3c-goog
> > >
> 
> 
> 
> I can certainly defer [] handling to a later patch series.
> Splitting the patch into one with the is_v6 flag and one without is a lot
> of work for little gain (zero IMO): When looking at
> inet_parse_host_and_port() as its own utility subroutine, not providing the
> caller with the means to distinguish whether str was "address:port" or
> "[address]:port" is a poor API.

In general callers shouldn't care about which format was parsed. The use
of [] is just a mechanism to reliably separate the port from the address.
Once you have the address part getaddrinfo() will reliably parse the
address into a sockaddr struct on its own. The is_v6 flag is only needed
for the legacy compat needs in slirp, even that is only if we want to 
have strict equivalence with historical behaviour, as opposed to changing
empty string to mean to listen on both IPv4+6 concurrently..

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


