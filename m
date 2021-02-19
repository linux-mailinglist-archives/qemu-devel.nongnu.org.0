Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C93320147
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:19:24 +0100 (CET)
Received: from localhost ([::1]:43912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDE7Q-0003EA-1J
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lDE6R-0002o9-6y
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:18:23 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a]:39312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lDE6O-0004an-IY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:18:22 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id m25so1547698vkk.6
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 14:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wxxFYuEyY3LF93G405rCJ57VPv7h9i+FO5AxhEFNl8E=;
 b=T37qcDkUdYjFZ721TCVaCBg3pvp4qC5bkwV5LCJVWmTUKZ70dD+p+FfkKyGpF3aXvw
 +KdfR4SRG1xCAUfKF4fcQdTE5lEwgqumlTWFK3d9HdnG4Jn8DKI938j5J7Za/75ZrwQm
 zZB4mU5h9Dl9dcUwO//C4IqqKMDaD94CYO9/SPn9H5bQdcJ9xzo/wsudUKXDBKZ6Qbyx
 i5SFUDq3rLn2ftEJPlZI5DMgJ7GHIuYXkgoiqmkbKmk0Tvv+wNvWux3kFNWdLUXtDlhf
 3ZBRim3ZUJyZXTfS6RXbGfbdYaWMyxDBrQGV1vAaUPKKoP6IW7ZlhXSR2/WazrMMTTW5
 I3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wxxFYuEyY3LF93G405rCJ57VPv7h9i+FO5AxhEFNl8E=;
 b=MxvFSMR3rOdm1Pdmw0IdReOEQnhTgroIyVcAxdTRRY+xdKXBg+Przi5l/rx394YTo7
 MjhDNRLx6hbwPtYlHt5SV86m1dRetFMEwmNtZs1hMffb1qAH5qe1EW3A0suUM+ZSSvRl
 YGTnUUOhqeoj/smhKwYuw4dUgWRbavWOi2uzyVEdnYI5EJet9RWKKsIVtijTz4de9kyq
 OjGz5FD3KquJWfZI8oLDRUA6HT6ivF+2ZLBPbyhJhDYnIYa+9p+jeHWtG83xBxXjl1s4
 vno5OQnP/6bmWG5esK2lAlXa8t/GBA12CRaUGXc+ix7uAu01CNI4k5e6e82ur/LIPZyU
 MjcQ==
X-Gm-Message-State: AOAM531pD6A37iDR5PF4lilCICjltg/8ujsSQPfSBVC1nX64U4DBA5Sm
 +/BWfLGEF4dOd2s3GGfi7eR1iZPL/36jMEgXowao+Q==
X-Google-Smtp-Source: ABdhPJxiy03YKOgDxDlgZejIkdp2PC2B23bfW2rz23mw3uz2zSJoevn/iLLAmRkgBXgcO8/crZAhCehWP0w6kzCg9ok=
X-Received: by 2002:a05:6122:1cb:: with SMTP id
 h11mr1482175vko.18.1613773099131; 
 Fri, 19 Feb 2021 14:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20210218201538.701509-1-dje@google.com>
 <20210218201538.701509-3-dje@google.com>
 <YC+MTYWe4HYpcAIk@redhat.com>
In-Reply-To: <YC+MTYWe4HYpcAIk@redhat.com>
From: Doug Evans <dje@google.com>
Date: Fri, 19 Feb 2021 14:17:42 -0800
Message-ID: <CADPb22ROPdpaQGobxP_vhcW=KBJVV4FwrmGb3+Z6nZecymT4BA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000052e51705bbb7d4ba"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=dje@google.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000052e51705bbb7d4ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 2:00 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Thu, Feb 18, 2021 at 12:15:36PM -0800, Doug Evans wrote:
> > The parsing is moved into new function inet_parse_host_and_port.
> > This is done in preparation for using the function in net/slirp.c.
> >
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >
> > Changes from v3:
> > - this patch is new in v4
> >   - provides new utility: inet_parse_host_and_port, updates inet_parse
> >     to use it
> >
> >  include/qemu/sockets.h |  3 ++
> >  util/qemu-sockets.c    | 94 +++++++++++++++++++++++++++++++-----------
> >  2 files changed, 72 insertions(+), 25 deletions(-)
> >
> > diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> > index 7d1f813576..f720378a6b 100644
> > --- a/include/qemu/sockets.h
> > +++ b/include/qemu/sockets.h
> > @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);
> >
> >  int inet_ai_family_from_address(InetSocketAddress *addr,
> >                                  Error **errp);
> > +const char* inet_parse_host_and_port(const char* str, int terminator,
> > +                                     char **addr, char **port, bool
> *is_v6,
> > +                                     Error **errp);
> >  int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)=
;
> >  int inet_connect(const char *str, Error **errp);
> >  int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 8af0278f15..9fca7d9212 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -615,44 +615,88 @@ static int inet_parse_flag(const char *flagname,
> const char *optstr, bool *val,
> >      return 0;
> >  }
> >
> > -int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> > +/*
> > + * Parse an inet host and port as "host:port<terminator>".
> > + * Terminator may be '\0'.
> > + * The syntax for ipv4 addresses is: address:port.
> > + * The syntax for ipv6 addresses is: [address]:port.
>
> It also supports
>
>    "The syntax for hostnames is hostname:port
>
> > + * On success, returns a pointer to the terminator. Space for the
> address and
> > + * port is malloced and stored in *host, *port, the caller must free.
> > + * *is_v6 indicates whether the address is ipv4 or ipv6. If ipv6 then
> the
> > + * surrounding [] brackets are removed.
>
> When is_v6 is true, it indicates that a numeric ipv6 address was given.
> When false either a numberic ipv4 address or hostname was given.
>
> > + * On failure NULL is returned with the error stored in *errp.
> > + */
> > +const char* inet_parse_host_and_port(const char* str, int terminator,
> > +                                     char **hostp, char **portp, bool
> *is_v6,
> > +                                     Error **errp)
> >  {
> > -    const char *optstr, *h;
> > +    const char *terminator_ptr =3D strchr(str, terminator);
> > +    g_autofree char *buf =3D NULL;
> >      char host[65];
> >      char port[33];
> > -    int to;
> > -    int pos;
> > -    char *begin;
> >
> > -    memset(addr, 0, sizeof(*addr));
> > +    if (terminator_ptr =3D=3D NULL) {
> > +        /* If the terminator isn't found then use the entire string. *=
/
> > +        terminator_ptr =3D str + strlen(str);
> > +    }
> > +    buf =3D g_strndup(str, terminator_ptr - str);
> >
> > -    /* parse address */
> > -    if (str[0] =3D=3D ':') {
> > -        /* no host given */
> > -        host[0] =3D '\0';
> > -        if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
> > -            error_setg(errp, "error parsing port in address '%s'", str=
);
> > -            return -1;
> > -        }
>
>
> > -    } else if (str[0] =3D=3D '[') {
> > +    if (buf[0] =3D=3D '[') {
> >          /* IPv6 addr */
> > -        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=3D =
2) {
> > -            error_setg(errp, "error parsing IPv6 address '%s'", str);
> > -            return -1;
> > +        if (buf[1] =3D=3D ']') {
> > +            /* sscanf %[ doesn't recognize empty contents. */
> > +            host[0] =3D '\0';
> > +            if (sscanf(buf, "[]:%32s", port) !=3D 1) {
> > +                error_setg(errp, "error parsing IPv6 host:port '%s'",
> buf);
> > +                return NULL;
> > +            }
>
> This is introducing new functionality to the parser. Current callers
> let empty string ":port" be used for both ipv4 and ipv6, based
> on whether the flags ",ipv4[=3Don|off],ipv6[=3Don|off]" later follow.
>


We're creating a new utility subroutine: Let's decide what the API is for
it.
The fact that inet_parse is passed additional parameters to specify ipv4 vs
ipv6 is not something this new subroutine should care about.

I presume you want an explicit way to represent an empty ipv6 hostname
> to avoid changing semantics for existing slirp CLI args, where the
> existing ":port" exclusively means ipv4. IIC, this is also why you
> needed to introduce the "is_v6" flag, because any non-empty address
> can be reliably parsed without needing this flag.
>


Actually, no. The "is_v6" flag is needed because otherwise the caller has
no means (other than maybe subsequent grepping for "." vs ":") for knowing
whether str contained "address" or "[address]".

Plus, for my needs I don't need to support "[hostname]". If someone later
wants that supported that can be designed then.
Thus supporting "[hostname]" is not something I'm considering in this
patchset.



>
> This is reasonable, but any such functional change should be in a
> separate commit from refactoring.
>
> IOW, remove this and the is_v6 flag, and add them in a separate
> patch to explain to the need for new functionality in the parsing.
>
> Given that existing callers don't need to support "[]", we should
> not let that be parsed, unless the caller passing a "is_v6" pointer
> which is not NULL.
>
> > +        } else {
> > +            if (sscanf(buf, "[%64[^]]]:%32s", host, port) !=3D 2) {
> > +                error_setg(errp, "error parsing IPv6 host:port '%s'",
> buf);
> > +                return NULL;
> > +            }
> >          }
> >      } else {
> > -        /* hostname or IPv4 addr */
> > -        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=3D 2)=
 {
> > -            error_setg(errp, "error parsing address '%s'", str);
> > -            return -1;
> > +        if (buf[0] =3D=3D ':') {
> > +            /* no host given */
> > +            host[0] =3D '\0';
> > +            if (sscanf(buf, ":%32s", port) !=3D 1) {
> > +                error_setg(errp, "error parsing host:port '%s'", buf);
> > +                return NULL;
> > +            }
>
> It would be preferreable if the parsing code was not re-ordered when
> extracting it. It doesn't look like a functional change, but I'm unsure
> why you moved it ?
>
> > +        } else {
> > +            /* hostname or IPv4 addr */
> > +            if (sscanf(buf, "%64[^:]:%32s", host, port) !=3D 2) {
> > +                error_setg(errp, "error parsing host:port '%s'", buf);
> > +                return NULL;
> > +            }
> >          }
> >      }
> >
> > -    addr->host =3D g_strdup(host);
> > -    addr->port =3D g_strdup(port);
> > +    *hostp =3D g_strdup(host);
> > +    *portp =3D g_strdup(port);
> > +    *is_v6 =3D buf[0] =3D=3D '[';
> > +
> > +    return terminator_ptr;
> > +}
> > +
> > +int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
> > +{
> > +    const char *optstr, *h;
> > +    bool is_v6;
> > +    int to;
> > +    int pos;
> > +    char *begin;
> > +
> > +    memset(addr, 0, sizeof(*addr));
> > +
> > +    optstr =3D inet_parse_host_and_port(str, ',', &addr->host,
> &addr->port,
> > +                                      &is_v6, errp);
>
> Just pass NULL since we don't need is_v6
>
> > +    if (optstr =3D=3D NULL) {
> > +        return -1;
> > +    }
> >
> >      /* parse options */
> > -    optstr =3D str + pos;
> >      h =3D strstr(optstr, ",to=3D");
> >      if (h) {
> >          h +=3D 4;
> > --
> > 2.30.0.617.g56c4b15f3c-goog
> >



I can certainly defer [] handling to a later patch series.
Splitting the patch into one with the is_v6 flag and one without is a lot
of work for little gain (zero IMO): When looking at
inet_parse_host_and_port() as its own utility subroutine, not providing the
caller with the means to distinguish whether str was "address:port" or
"[address]:port" is a poor API.
I can still revise patch to allow is_v6 being NULL though.

--00000000000052e51705bbb7d4ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Feb 19, 2021 at 2:00 AM Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Thu, Feb 18, 2021 at 12:15:36PM -0800, Doug Evans wrote:<=
br>
&gt; The parsing is moved into new function inet_parse_host_and_port.<br>
&gt; This is done in preparation for using the function in net/slirp.c.<br>
&gt; <br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Changes from v3:<br>
&gt; - this patch is new in v4<br>
&gt;=C2=A0 =C2=A0- provides new utility: inet_parse_host_and_port, updates =
inet_parse<br>
&gt;=C2=A0 =C2=A0 =C2=A0to use it<br>
&gt; <br>
&gt;=C2=A0 include/qemu/sockets.h |=C2=A0 3 ++<br>
&gt;=C2=A0 util/qemu-sockets.c=C2=A0 =C2=A0 | 94 ++++++++++++++++++++++++++=
+++++-----------<br>
&gt;=C2=A0 2 files changed, 72 insertions(+), 25 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
&gt; index 7d1f813576..f720378a6b 100644<br>
&gt; --- a/include/qemu/sockets.h<br>
&gt; +++ b/include/qemu/sockets.h<br>
&gt; @@ -31,6 +31,9 @@ int socket_set_fast_reuse(int fd);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int inet_ai_family_from_address(InetSocketAddress *addr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp);<br>
&gt; +const char* inet_parse_host_and_port(const char* str, int terminator,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **addr,=
 char **port, bool *is_v6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp=
);<br>
&gt;=C2=A0 int inet_parse(InetSocketAddress *addr, const char *str, Error *=
*errp);<br>
&gt;=C2=A0 int inet_connect(const char *str, Error **errp);<br>
&gt;=C2=A0 int inet_connect_saddr(InetSocketAddress *saddr, Error **errp);<=
br>
&gt; diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
&gt; index 8af0278f15..9fca7d9212 100644<br>
&gt; --- a/util/qemu-sockets.c<br>
&gt; +++ b/util/qemu-sockets.c<br>
&gt; @@ -615,44 +615,88 @@ static int inet_parse_flag(const char *flagname,=
 const char *optstr, bool *val,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int inet_parse(InetSocketAddress *addr, const char *str, Error **errp=
)<br>
&gt; +/*<br>
&gt; + * Parse an inet host and port as &quot;host:port&lt;terminator&gt;&q=
uot;.<br>
&gt; + * Terminator may be &#39;\0&#39;.<br>
&gt; + * The syntax for ipv4 addresses is: address:port.<br>
&gt; + * The syntax for ipv6 addresses is: [address]:port.<br>
<br>
It also supports<br>
<br>
=C2=A0 =C2=A0&quot;The syntax for hostnames is hostname:port<br>
<br>
&gt; + * On success, returns a pointer to the terminator. Space for the add=
ress and<br>
&gt; + * port is malloced and stored in *host, *port, the caller must free.=
<br>
&gt; + * *is_v6 indicates whether the address is ipv4 or ipv6. If ipv6 then=
 the<br>
&gt; + * surrounding [] brackets are removed.<br>
<br>
When is_v6 is true, it indicates that a numeric ipv6 address was given.<br>
When false either a numberic ipv4 address or hostname was given.<br>
<br>
&gt; + * On failure NULL is returned with the error stored in *errp.<br>
&gt; + */<br>
&gt; +const char* inet_parse_host_and_port(const char* str, int terminator,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char **hostp=
, char **portp, bool *is_v6,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp=
)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 const char *optstr, *h;<br>
&gt; +=C2=A0 =C2=A0 const char *terminator_ptr =3D strchr(str, terminator);=
<br>
&gt; +=C2=A0 =C2=A0 g_autofree char *buf =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char host[65];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char port[33];<br>
&gt; -=C2=A0 =C2=A0 int to;<br>
&gt; -=C2=A0 =C2=A0 int pos;<br>
&gt; -=C2=A0 =C2=A0 char *begin;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 memset(addr, 0, sizeof(*addr));<br>
&gt; +=C2=A0 =C2=A0 if (terminator_ptr =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If the terminator isn&#39;t found then=
 use the entire string. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 terminator_ptr =3D str + strlen(str);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 buf =3D g_strndup(str, terminator_ptr - str);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /* parse address */<br>
&gt; -=C2=A0 =C2=A0 if (str[0] =3D=3D &#39;:&#39;) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no host given */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;\0&#39;;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;:%32[^,]%n&quot;, p=
ort, &amp;pos) !=3D 1) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;erro=
r parsing port in address &#39;%s&#39;&quot;, str);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
&gt; -=C2=A0 =C2=A0 } else if (str[0] =3D=3D &#39;[&#39;) {<br>
&gt; +=C2=A0 =C2=A0 if (buf[0] =3D=3D &#39;[&#39;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* IPv6 addr */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;[%64[^]]]:%32[^,]%n=
&quot;, host, port, &amp;pos) !=3D 2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;erro=
r parsing IPv6 address &#39;%s&#39;&quot;, str);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[1] =3D=3D &#39;]&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sscanf %[ doesn&#39;t re=
cognize empty contents. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;\0&#39;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &quot;[]:%3=
2s&quot;, port) !=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(er=
rp, &quot;error parsing IPv6 host:port &#39;%s&#39;&quot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This is introducing new functionality to the parser. Current callers<br>
let empty string &quot;:port&quot; be used for both ipv4 and ipv6, based<br=
>
on whether the flags &quot;,ipv4[=3Don|off],ipv6[=3Don|off]&quot; later fol=
low.<br></blockquote><div><br></div><div><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">We&#39;re creating a new utility subroutine:=
 Let&#39;s decide what the API is for it.</div><div class=3D"gmail_default"=
 style=3D"font-size:small">The fact that inet_parse is passed additional pa=
rameters to specify ipv4 vs ipv6 is not something this new subroutine shoul=
d care about.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small"></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">I presume you want an explicit=
 way to represent an empty ipv6 hostname<br>
to avoid changing semantics for existing slirp CLI args, where the<br>
existing &quot;:port&quot; exclusively means ipv4. IIC, this is also why yo=
u<br>
needed to introduce the &quot;is_v6&quot; flag, because any non-empty addre=
ss<br>
can be reliably parsed without needing this flag.<br></blockquote><div><br>=
</div><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Actually, no. The &quot;is_v6&quot; flag is needed because otherwise =
the caller has no means (other than maybe subsequent grepping for &quot;.&q=
uot; vs &quot;:&quot;) for knowing whether str contained &quot;address&quot=
; or &quot;[address]&quot;.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">Plus, for my needs I don&#39;t need to support &quot;[hostname]&quot;. I=
f someone later wants that supported that can be designed then.</div></div>=
<div class=3D"gmail_default" style=3D"font-size:small">Thus supporting &quo=
t;[hostname]&quot; is not something I&#39;m considering in this patchset.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
This is reasonable, but any such functional change should be in a <br>
separate commit from refactoring.<br>
<br>
IOW, remove this and the is_v6 flag, and add them in a separate<br>
patch to explain to the need for new functionality in the parsing.<br>
<br>
Given that existing callers don&#39;t need to support &quot;[]&quot;, we sh=
ould<br>
not let that be parsed, unless the caller passing a &quot;is_v6&quot; point=
er<br>
which is not NULL.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &quot;[%64[=
^]]]:%32s&quot;, host, port) !=3D 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(er=
rp, &quot;error parsing IPv6 host:port &#39;%s&#39;&quot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* hostname or IPv4 addr */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(str, &quot;%64[^:]:%32[^,]%n&q=
uot;, host, port, &amp;pos) !=3D 2) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;erro=
r parsing address &#39;%s&#39;&quot;, str);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[0] =3D=3D &#39;:&#39;) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no host given */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host[0] =3D &#39;\0&#39;;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &quot;:%32s=
&quot;, port) !=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(er=
rp, &quot;error parsing host:port &#39;%s&#39;&quot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
It would be preferreable if the parsing code was not re-ordered when<br>
extracting it. It doesn&#39;t look like a functional change, but I&#39;m un=
sure<br>
why you moved it ?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* hostname or IPv4 addr */=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(buf, &quot;%64[^=
:]:%32s&quot;, host, port) !=3D 2) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(er=
rp, &quot;error parsing host:port &#39;%s&#39;&quot;, buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 addr-&gt;host =3D g_strdup(host);<br>
&gt; -=C2=A0 =C2=A0 addr-&gt;port =3D g_strdup(port);<br>
&gt; +=C2=A0 =C2=A0 *hostp =3D g_strdup(host);<br>
&gt; +=C2=A0 =C2=A0 *portp =3D g_strdup(port);<br>
&gt; +=C2=A0 =C2=A0 *is_v6 =3D buf[0] =3D=3D &#39;[&#39;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return terminator_ptr;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int inet_parse(InetSocketAddress *addr, const char *str, Error **errp=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const char *optstr, *h;<br>
&gt; +=C2=A0 =C2=A0 bool is_v6;<br>
&gt; +=C2=A0 =C2=A0 int to;<br>
&gt; +=C2=A0 =C2=A0 int pos;<br>
&gt; +=C2=A0 =C2=A0 char *begin;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memset(addr, 0, sizeof(*addr));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 optstr =3D inet_parse_host_and_port(str, &#39;,&#39;, &=
amp;addr-&gt;host, &amp;addr-&gt;port,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;is_v6,=
 errp);<br>
<br>
Just pass NULL since we don&#39;t need is_v6<br>
<br>
&gt; +=C2=A0 =C2=A0 if (optstr =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* parse options */<br>
&gt; -=C2=A0 =C2=A0 optstr =3D str + pos;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 h =3D strstr(optstr, &quot;,to=3D&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (h) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 h +=3D 4;<br>
&gt; -- <br>
&gt; 2.30.0.617.g56c4b15f3c-goog<br>
&gt;</blockquote><div><br></div><div><br></div><div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I can certainly defer [] handling to a late=
r patch series.</div></div><div class=3D"gmail_default" style=3D"font-size:=
small">Splitting the patch into one with the is_v6 flag and one without is =
a lot of work for little gain (zero IMO): When looking at inet_parse_host_a=
nd_port() as its own utility subroutine, not providing the caller with the =
means to distinguish whether str was &quot;address:port&quot; or &quot;[add=
ress]:port&quot; is a poor API.</div><div class=3D"gmail_default" style=3D"=
font-size:small">I can still revise patch to allow is_v6 being NULL though.=
</div></div></div>

--00000000000052e51705bbb7d4ba--

