Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597CC376803
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 17:31:09 +0200 (CEST)
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf2RY-0004UH-EN
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 11:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2Pr-0003Vm-No
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:29:23 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:46886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lf2Po-0003jR-4K
 for qemu-devel@nongnu.org; Fri, 07 May 2021 11:29:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id u21so14184980ejo.13
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6HvVxSVH/+1QxqiovEbL31w668Zle+EgwrQBF/Qo5U=;
 b=coWb667Ai/fJAkqMCmu1GlFOS3iL6CTOuxkLqVVoFs3zrERseYcU8YSU5C9jUFZEyk
 AWQo1isufmZSsLG4bxbGiCfY2CDdNUfJIgQkYtr0V1VCXUhxKiBxUTmaou29emG4Hrj6
 sBNNwoTwljsj7ncOMAoJB3udWWaPZq3em+eUofrRfdJ4/mq89mkQepIDWxZ7C1PCTeX+
 ZtGwaNYLlvVgMd6nN6TC6mXtoo5VgF9HaRiJWO06Hevujy3NZ4Em5AsVWmXTtNG9GEOG
 fynZNF6Nul9Qog19HwBIbZXuVZnO/uIXJauBM/43zsFjdHtJrJXdo7JR7i6V23fNCRg4
 3qgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6HvVxSVH/+1QxqiovEbL31w668Zle+EgwrQBF/Qo5U=;
 b=EqjLpOR9/VLj6dkP7kkkptzZ9qfBqaBvPa2RXbnM414FTbCPtnXWWypu+TbHfAjSng
 ptfS++Iv9GWAm3bwbiMPOl8T5ZvZDXR0caoa8+phztp3qUl8pVr6Juhpa05KX5/XRPL5
 gOF+A4SLwL5Ewc4aGN1CQnklPOOZRb7R4pkSMUVpDHIpCY/GezniNM2BNFwQ63SQiKH3
 sKGXRVLfAltcZXK8s27bSmVy6+DDqX63eRV+0j3cluOv8RiikgZpfphNrVoxKIKqAiTZ
 ZFdRYDYA9FKjFuPb4+QUT06xrQAVqs7H/yxAXwPByetkKeltvE9LX1Hmj/brmNMpSLJI
 AMIw==
X-Gm-Message-State: AOAM533rab0IMthAOi479SUVOinZItuAxwKqj1FeLpKohsAH5EIVEr8N
 YhXKETJn6gPt+5H44QW1dKPicr0/W8pz3J36BcM=
X-Google-Smtp-Source: ABdhPJw0xsnF6z86bjyHO1jMAlY/2J+CuJR/SM40AGWU9SR+a2FYQKU/aYS4nQqXI82Ee79RlQJRtOBrd3v9wjSWtiQ=
X-Received: by 2002:a17:907:1b1e:: with SMTP id
 mp30mr10562050ejc.532.1620401358056; 
 Fri, 07 May 2021 08:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210415033925.1290401-1-dje@google.com>
 <20210415033925.1290401-4-dje@google.com>
In-Reply-To: <20210415033925.1290401-4-dje@google.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 7 May 2021 19:29:05 +0400
Message-ID: <CAJ+F1CKwNQ+YCMr+kmquxB32fMkWyXZd+E8deRR96C8V4qte7g@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] net/slirp.c: Refactor address parsing
To: Doug Evans <dje@google.com>
Content-Type: multipart/alternative; boundary="00000000000057337405c1bf17bc"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057337405c1bf17bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Apr 15, 2021 at 7:44 AM Doug Evans <dje@google.com> wrote:

> ... in preparation for adding ipv6 host forwarding support.
>
> Tested:
> avocado run tests/acceptance/hostfwd.py
>
> Signed-off-by: Doug Evans <dje@google.com>
> ---
>
> Changes from v5:
>
> Use InetSocketAddress and getaddrinfo().
> Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.
>
>  include/qemu/sockets.h      |   2 +
>  net/slirp.c                 | 200 ++++++++++++++++++++++++------------
>  tests/acceptance/hostfwd.py |  91 ++++++++++++++++
>  util/qemu-sockets.c         |  17 +--
>  4 files changed, 241 insertions(+), 69 deletions(-)
>  create mode 100644 tests/acceptance/hostfwd.py
>
> diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h
> index 94f4e8de83..6fd71775ce 100644
> --- a/include/qemu/sockets.h
> +++ b/include/qemu/sockets.h
> @@ -29,6 +29,8 @@ int socket_set_fast_reuse(int fd);
>  #define SHUT_RDWR 2
>  #endif
>
> +int sockaddr_getport(const struct sockaddr *addr);
> +
>  int inet_ai_family_from_address(InetSocketAddress *addr,
>                                  Error **errp);
>  const char *inet_parse_host_port(InetSocketAddress *addr,
> diff --git a/net/slirp.c b/net/slirp.c
> index a01a0fccd3..4be065c30b 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -641,15 +641,108 @@ static SlirpState *slirp_lookup(Monitor *mon, cons=
t
> char *id)
>      }
>  }
>
> +static const char *parse_protocol(const char *str, bool *is_udp,
> +                                  Error **errp)
> +{
> +    char buf[10];
> +    const char *p =3D str;
> +
> +    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> +        error_setg(errp, "missing protocol name separator");
> +        return NULL;
> +    }
> +
> +    if (!strcmp(buf, "tcp") || buf[0] =3D=3D '\0') {
> +        *is_udp =3D false;
> +    } else if (!strcmp(buf, "udp")) {
> +        *is_udp =3D true;
> +    } else {
> +        error_setg(errp, "bad protocol name '%s'", buf);
> +        return NULL;
> +    }
> +
> +    return p;
> +}
> +
> +static int parse_hostfwd_sockaddr(const char *str, int socktype,
> +                                  struct sockaddr_storage *saddr,
> +                                  Error **errp)
> +{
> +    struct addrinfo hints, *res =3D NULL, *e;
> +    InetSocketAddress *addr =3D g_new(InetSocketAddress, 1);
> +    int gai_rc;
> +    int rc =3D -1;
> +
> +    const char *optstr =3D inet_parse_host_port(addr, str, errp);
> +    if (optstr =3D=3D NULL) {
> +        goto fail_return;
> +    }
> +
> +    memset(&hints, 0, sizeof(hints));
> +    hints.ai_flags =3D AI_PASSIVE; /* ignored if host is not ""(->NULL) =
*/
> +    hints.ai_flags |=3D AI_NUMERICHOST | AI_NUMERICSERV;
> +    hints.ai_socktype =3D socktype;
> +    hints.ai_family =3D PF_INET;
> +
> +    /*
> +     * Calling getaddrinfo for guest addresses is dubious, but addresses
> are
> +     * restricted to numeric only. Convert "" to NULL for getaddrinfo's
> +     * benefit.
> +     */
> +    gai_rc =3D getaddrinfo(*addr->host ? addr->host : NULL,
> +                         *addr->port ? addr->port : NULL, &hints, &res);
> +    if (gai_rc !=3D 0) {
> +        error_setg(errp, "address resolution failed for '%s': %s",
> +                   str, gai_strerror(gai_rc));
> +        goto fail_return;
> +    }
> +    if (res->ai_next !=3D NULL) {
> +        /*
> +         * The caller only wants one address, and except for "any" for
> both
> +         * ipv4 and ipv6 (which we've already precluded above), we
> shouldn't
> +         * get more than one. To assist debugging print all we find.
> +         */
> +        GString *s =3D g_string_new(NULL);
> +        for (e =3D res; e !=3D NULL; e =3D e->ai_next) {
> +            char host[NI_MAXHOST];
> +            char serv[NI_MAXSERV];
> +            int ret =3D getnameinfo((struct sockaddr *)e->ai_addr,
> e->ai_addrlen,
> +                                  host, sizeof(host),
> +                                  serv, sizeof(serv),
> +                                  NI_NUMERICHOST | NI_NUMERICSERV);
> +            if (ret =3D=3D 0) {
> +                g_string_append_printf(s, "\n  %s:%s", host, serv);
> +            } else {
> +                g_string_append_printf(s, "\n  unknown, got: %s",
> +                                       gai_strerror(ret));
> +            }
> +        }
> +        error_setg(errp, "multiple addresses resolved for '%s':%s",
> +                   str, s->str);
> +        g_string_free(s, TRUE);
> +        goto fail_return;
> +    }
> +
> +    memcpy(saddr, res->ai_addr, res->ai_addrlen);
> +    rc =3D 0;
> +
> + fail_return:
> +    qapi_free_InetSocketAddress(addr);
> +    if (res) {
> +        freeaddrinfo(res);
> +    }
> +    return rc;
> +}
> +
>  void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>  {
> -    struct in_addr host_addr =3D { .s_addr =3D INADDR_ANY };
> -    int host_port;
> -    char buf[256];
> +    struct sockaddr_storage host_addr;
>      const char *src_str, *p;
>      SlirpState *s;
> -    int is_udp =3D 0;
> +    bool is_udp;
> +    Error *error =3D NULL;
>      int err;
> +    int flags =3D 0;
>      const char *arg1 =3D qdict_get_str(qdict, "arg1");
>      const char *arg2 =3D qdict_get_try_str(qdict, "arg2");
>
> @@ -664,110 +757,91 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict
> *qdict)
>          return;
>      }
>
> +    g_assert(src_str !=3D NULL);
>      p =3D src_str;
> -    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> -        goto fail_syntax;
> -    }
>
> -    if (!strcmp(buf, "tcp") || buf[0] =3D=3D '\0') {
> -        is_udp =3D 0;
> -    } else if (!strcmp(buf, "udp")) {
> -        is_udp =3D 1;
> -    } else {
> +    p =3D parse_protocol(p, &is_udp, &error);
> +    if (p =3D=3D NULL) {
>          goto fail_syntax;
>      }
> -
> -    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> -        goto fail_syntax;
> -    }
> -    if (buf[0] !=3D '\0' && !inet_aton(buf, &host_addr)) {
> -        goto fail_syntax;
> +    if (is_udp) {
> +        flags |=3D SLIRP_HOSTFWD_UDP;
>

This fails to build with the system version of libslirp, as there has not
been releases with this new symbol yet. I am not sure what's the status for
upstream release, we should create an issue there and discuss it.

Anyway, you'll probably need to make the new code conditional with
SLIRP_CHECK_VERSION(), as we don't want qemu to depend on too recent
releases.

thanks


     }
>
> -    if (qemu_strtoi(p, NULL, 10, &host_port)) {
> +    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
> +                               &host_addr, &error) < 0) {
>          goto fail_syntax;
>      }
>
> -    err =3D slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port)=
;
> +    err =3D slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_ad=
dr,
> +                                sizeof(host_addr), flags);
>
>      monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>                     err ? "not found" : "removed");
>      return;
>
>   fail_syntax:
> -    monitor_printf(mon, "invalid format\n");
> +    monitor_printf(mon, "Invalid format: %s\n", error_get_pretty(error))=
;
> +    error_free(error);
>  }
>
>  static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error
> **errp)
>  {
> -    struct in_addr host_addr =3D { .s_addr =3D INADDR_ANY };
> -    struct in_addr guest_addr =3D { .s_addr =3D 0 };
> -    int host_port, guest_port;
> +    struct sockaddr_storage host_addr, guest_addr;
>      const char *p;
>      char buf[256];
> -    int is_udp;
> -    char *end;
> -    const char *fail_reason =3D "Unknown reason";
> +    bool is_udp;
> +    Error *error =3D NULL;
> +    int flags =3D 0;
> +    int port;
>
> +    g_assert(redir_str !=3D NULL);
>      p =3D redir_str;
> -    if (!p || get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> -        fail_reason =3D "No : separators";
> -        goto fail_syntax;
> -    }
> -    if (!strcmp(buf, "tcp") || buf[0] =3D=3D '\0') {
> -        is_udp =3D 0;
> -    } else if (!strcmp(buf, "udp")) {
> -        is_udp =3D 1;
> -    } else {
> -        fail_reason =3D "Bad protocol name";
> -        goto fail_syntax;
> -    }
>
> -    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> -        fail_reason =3D "Missing : separator";
> +    p =3D parse_protocol(p, &is_udp, &error);
> +    if (p =3D=3D NULL) {
>          goto fail_syntax;
>      }
> -    if (buf[0] !=3D '\0' && !inet_aton(buf, &host_addr)) {
> -        fail_reason =3D "Bad host address";
> -        goto fail_syntax;
> +    if (is_udp) {
> +        flags |=3D SLIRP_HOSTFWD_UDP;
>      }
>
>      if (get_str_sep(buf, sizeof(buf), &p, '-') < 0) {
> -        fail_reason =3D "Bad host port separator";
> -        goto fail_syntax;
> -    }
> -    host_port =3D strtol(buf, &end, 0);
> -    if (*end !=3D '\0' || host_port < 0 || host_port > 65535) {
> -        fail_reason =3D "Bad host port";
> +        error_setg(&error, "missing host-guest separator");
>          goto fail_syntax;
>      }
>
> -    if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> -        fail_reason =3D "Missing guest address";
> +    if (parse_hostfwd_sockaddr(buf, is_udp ? SOCK_DGRAM : SOCK_STREAM,
> +                               &host_addr, &error) < 0) {
> +        error_prepend(&error, "For host address: ");
>          goto fail_syntax;
>      }
> -    if (buf[0] !=3D '\0' && !inet_aton(buf, &guest_addr)) {
> -        fail_reason =3D "Bad guest address";
> +
> +    if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STREAM,
> +                               &guest_addr, &error) < 0) {
> +        error_prepend(&error, "For guest address: ");
>          goto fail_syntax;
>      }
> -
> -    guest_port =3D strtol(p, &end, 0);
> -    if (*end !=3D '\0' || guest_port < 1 || guest_port > 65535) {
> -        fail_reason =3D "Bad guest port";
> +    port =3D sockaddr_getport((struct sockaddr *) &guest_addr);
> +    if (port =3D=3D 0) {
> +        error_setg(&error, "For guest address: invalid port '0'");
>          goto fail_syntax;
>      }
>
> -    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port,
> guest_addr,
> -                          guest_port) < 0) {
> -        error_setg(errp, "Could not set up host forwarding rule '%s'",
> -                   redir_str);
> +    if (slirp_add_hostxfwd(s->slirp,
> +                           (struct sockaddr *) &host_addr,
> sizeof(host_addr),
> +                           (struct sockaddr *) &guest_addr,
> sizeof(guest_addr),
> +                           flags) < 0) {
> +        error_setg(errp, "Could not set up host forwarding rule '%s': %s=
",
> +                   redir_str, strerror(errno));
>          return -1;
>      }
>      return 0;
>
>   fail_syntax:
>      error_setg(errp, "Invalid host forwarding rule '%s' (%s)", redir_str=
,
> -               fail_reason);
> +               error_get_pretty(error));
> +    error_free(error);
>      return -1;
>  }
>
> diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py
> new file mode 100644
> index 0000000000..9b9db142c3
> --- /dev/null
> +++ b/tests/acceptance/hostfwd.py
> @@ -0,0 +1,91 @@
> +# Hostfwd command tests
> +#
> +# Copyright 2021 Google LLC
> +#
> +# This program is free software; you can redistribute it and/or modify i=
t
> +# under the terms of the GNU General Public License as published by the
> +# Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful, but
> WITHOUT
> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> +# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
> +# for more details.
> +
> +
> +from avocado_qemu import Test
> +
> +
> +class Hostfwd(Test):
> +    """
> +    :avocado: tags=3Dhostfwd
> +    """
> +    def hmc(self, cmd):
> +        return self.vm.command('human-monitor-command', command_line=3Dc=
md)
> +
> +    def test_qmp_hostfwd_ipv4(self):
> +        self.vm.add_args('-nodefaults',
> +                         '-netdev', 'user,id=3Dvnet',
> +                         '-device', 'virtio-net,netdev=3Dvnet')
> +        self.vm.launch()
> +        self.assertEquals(self.hmc('hostfwd_add vnet tcp::65022-:22'), '=
')
> +        self.assertEquals(self.hmc('hostfwd_remove vnet tcp::65022'),
> +                          'host forwarding rule for tcp::65022
> removed\r\n')
> +        self.assertEquals(self.hmc('hostfwd_add tcp::65022-:22'), '')
> +        self.assertEquals(self.hmc('hostfwd_remove tcp::65022'),
> +                          'host forwarding rule for tcp::65022
> removed\r\n')
> +        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'), '')
> +        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
> +                          'host forwarding rule for udp::65042
> removed\r\n')
> +
> +    def test_qmp_hostfwd_ipv4_functional_errors(self):
> +        """Verify handling of various kinds of errors given valid
> addresses."""
> +        self.vm.add_args('-nodefaults',
> +                         '-netdev', 'user,id=3Dvnet',
> +                         '-device', 'virtio-net,netdev=3Dvnet')
> +        self.vm.launch()
> +        self.assertEquals(self.hmc('hostfwd_remove ::65022'),
> +                          'host forwarding rule for ::65022 not
> found\r\n')
> +        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'), '')
> +        self.assertEquals(self.hmc('hostfwd_add udp::65042-:42'),
> +                          "Could not set up host forwarding rule" + \
> +                          " 'udp::65042-:42': Address already in use\r\n=
")
> +        self.assertEquals(self.hmc('hostfwd_remove ::65042'),
> +                          'host forwarding rule for ::65042 not
> found\r\n')
> +        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
> +                          'host forwarding rule for udp::65042
> removed\r\n')
> +        self.assertEquals(self.hmc('hostfwd_remove udp::65042'),
> +                          'host forwarding rule for udp::65042 not
> found\r\n')
> +
> +    def test_qmp_hostfwd_ipv4_parsing_errors(self):
> +        """Verify handling of various kinds of parsing errors."""
> +        self.vm.add_args('-nodefaults',
> +                         '-netdev', 'user,id=3Dvnet',
> +                         '-device', 'virtio-net,netdev=3Dvnet')
> +        self.vm.launch()
> +        self.assertEquals(self.hmc('hostfwd_remove abc::42'),
> +                          "Invalid format: bad protocol name 'abc'\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add abc::65022-:22'),
> +                          "Invalid host forwarding rule 'abc::65022-:22'=
"
> + \
> +                          " (bad protocol name 'abc')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add :foo'),
> +                          "Invalid host forwarding rule ':foo'" + \
> +                          " (missing host-guest separator)\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add :a.b.c.d:66-:66'),
> +                          "Invalid host forwarding rule
> ':a.b.c.d:66-:66'" + \
> +                          " (For host address: address resolution failed
> for" \
> +                          " 'a.b.c.d:66': Name or service not known)\r\n=
")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-a.b.c.d:66'),
> +                          "Invalid host forwarding rule
> '::66-a.b.c.d:66'" + \
> +                          " (For guest address: address resolution
> failed" + \
> +                          " for 'a.b.c.d:66': Name or service not
> known)\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::-1-foo'),
> +                          "Invalid host forwarding rule '::-1-foo'" + \
> +                          " (For host address: error parsing port in" + =
\
> +                          " address ':')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-foo'),
> +                          "Invalid host forwarding rule '::66-foo' (For"
> + \
> +                          " guest address: error parsing address
> 'foo')\r\n")
> +        self.assertEquals(self.hmc('hostfwd_add ::66-:0'),
> +                          "Invalid host forwarding rule '::66-:0'" + \
> +                          " (For guest address: invalid port '0')\r\n")
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index c0069f2565..983efeee2f 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -46,23 +46,28 @@
>  #endif
>
>
> -static int inet_getport(struct addrinfo *e)
> +int sockaddr_getport(const struct sockaddr *addr)
>  {
> -    struct sockaddr_in *i4;
> -    struct sockaddr_in6 *i6;
> +    const struct sockaddr_in *i4;
> +    const struct sockaddr_in6 *i6;
>
> -    switch (e->ai_family) {
> +    switch (addr->sa_family) {
>      case PF_INET6:
> -        i6 =3D (void*)e->ai_addr;
> +        i6 =3D (void *)addr;
>          return ntohs(i6->sin6_port);
>      case PF_INET:
> -        i4 =3D (void*)e->ai_addr;
> +        i4 =3D (void *)addr;
>          return ntohs(i4->sin_port);
>      default:
>          return 0;
>      }
>  }
>
> +static int inet_getport(struct addrinfo *e)
> +{
> +    return sockaddr_getport(e->ai_addr);
> +}
> +
>  static void inet_setport(struct addrinfo *e, int port)
>  {
>      struct sockaddr_in *i4;
> --
> 2.31.1.295.g9ea45b61b8-goog
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000057337405c1bf17bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 15, 2021 at 7:44 AM Dou=
g Evans &lt;<a href=3D"mailto:dje@google.com">dje@google.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">... in preparat=
ion for adding ipv6 host forwarding support.<br>
<br>
Tested:<br>
avocado run tests/acceptance/hostfwd.py<br>
<br>
Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_=
blank">dje@google.com</a>&gt;<br>
---<br>
<br>
Changes from v5:<br>
<br>
Use InetSocketAddress and getaddrinfo().<br>
Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.<br>
<br>
=C2=A0include/qemu/sockets.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 200 ++++++++++++++++++++++++------------<br>
=C2=A0tests/acceptance/hostfwd.py |=C2=A0 91 ++++++++++++++++<br>
=C2=A0util/qemu-sockets.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +--<b=
r>
=C2=A04 files changed, 241 insertions(+), 69 deletions(-)<br>
=C2=A0create mode 100644 tests/acceptance/hostfwd.py<br>
<br>
diff --git a/include/qemu/sockets.h b/include/qemu/sockets.h<br>
index 94f4e8de83..6fd71775ce 100644<br>
--- a/include/qemu/sockets.h<br>
+++ b/include/qemu/sockets.h<br>
@@ -29,6 +29,8 @@ int socket_set_fast_reuse(int fd);<br>
=C2=A0#define SHUT_RDWR 2<br>
=C2=A0#endif<br>
<br>
+int sockaddr_getport(const struct sockaddr *addr);<br>
+<br>
=C2=A0int inet_ai_family_from_address(InetSocketAddress *addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp);<br>
=C2=A0const char *inet_parse_host_port(InetSocketAddress *addr,<br>
diff --git a/net/slirp.c b/net/slirp.c<br>
index a01a0fccd3..4be065c30b 100644<br>
--- a/net/slirp.c<br>
+++ b/net/slirp.c<br>
@@ -641,15 +641,108 @@ static SlirpState *slirp_lookup(Monitor *mon, const =
char *id)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static const char *parse_protocol(const char *str, bool *is_udp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 char buf[10];<br>
+=C2=A0 =C2=A0 const char *p =3D str;<br>
+<br>
+=C2=A0 =C2=A0 if (get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;) &lt; =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;missing protocol name s=
eparator&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (!strcmp(buf, &quot;tcp&quot;) || buf[0] =3D=3D &#39;\0&#=
39;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *is_udp =3D false;<br>
+=C2=A0 =C2=A0 } else if (!strcmp(buf, &quot;udp&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *is_udp =3D true;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;bad protocol name &#39;=
%s&#39;&quot;, buf);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return p;<br>
+}<br>
+<br>
+static int parse_hostfwd_sockaddr(const char *str, int socktype,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_storage *sadd=
r,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 struct addrinfo hints, *res =3D NULL, *e;<br>
+=C2=A0 =C2=A0 InetSocketAddress *addr =3D g_new(InetSocketAddress, 1);<br>
+=C2=A0 =C2=A0 int gai_rc;<br>
+=C2=A0 =C2=A0 int rc =3D -1;<br>
+<br>
+=C2=A0 =C2=A0 const char *optstr =3D inet_parse_host_port(addr, str, errp)=
;<br>
+=C2=A0 =C2=A0 if (optstr =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memset(&amp;hints, 0, sizeof(hints));<br>
+=C2=A0 =C2=A0 hints.ai_flags =3D AI_PASSIVE; /* ignored if host is not &qu=
ot;&quot;(-&gt;NULL) */<br>
+=C2=A0 =C2=A0 hints.ai_flags |=3D AI_NUMERICHOST | AI_NUMERICSERV;<br>
+=C2=A0 =C2=A0 hints.ai_socktype =3D socktype;<br>
+=C2=A0 =C2=A0 hints.ai_family =3D PF_INET;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Calling getaddrinfo for guest addresses is dubious, =
but addresses are<br>
+=C2=A0 =C2=A0 =C2=A0* restricted to numeric only. Convert &quot;&quot; to =
NULL for getaddrinfo&#39;s<br>
+=C2=A0 =C2=A0 =C2=A0* benefit.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 gai_rc =3D getaddrinfo(*addr-&gt;host ? addr-&gt;host : NULL=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*addr-&gt;port ? addr-&gt;port : NULL, &amp;hints, &amp;re=
s);<br>
+=C2=A0 =C2=A0 if (gai_rc !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;address resolution fail=
ed for &#39;%s&#39;: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str, =
gai_strerror(gai_rc));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (res-&gt;ai_next !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The caller only wants one address, and=
 except for &quot;any&quot; for both<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* ipv4 and ipv6 (which we&#39;ve already=
 precluded above), we shouldn&#39;t<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* get more than one. To assist debugging=
 print all we find.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 GString *s =3D g_string_new(NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (e =3D res; e !=3D NULL; e =3D e-&gt;ai_ne=
xt) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char host[NI_MAXHOST];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char serv[NI_MAXSERV];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D getnameinfo((struct =
sockaddr *)e-&gt;ai_addr, e-&gt;ai_addrlen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host, sizeof(host),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 serv, sizeof(serv),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NI_NUMERICHOST | NI_NUMERICSE=
RV);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_pr=
intf(s, &quot;\n=C2=A0 %s:%s&quot;, host, serv);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_pr=
intf(s, &quot;\n=C2=A0 unknown, got: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gai_strer=
ror(ret));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;multiple addresses reso=
lved for &#39;%s&#39;:%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str, =
s-&gt;str);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_free(s, TRUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 memcpy(saddr, res-&gt;ai_addr, res-&gt;ai_addrlen);<br>
+=C2=A0 =C2=A0 rc =3D 0;<br>
+<br>
+ fail_return:<br>
+=C2=A0 =C2=A0 qapi_free_InetSocketAddress(addr);<br>
+=C2=A0 =C2=A0 if (res) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 freeaddrinfo(res);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return rc;<br>
+}<br>
+<br>
=C2=A0void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 struct in_addr host_addr =3D { .s_addr =3D INADDR_ANY };<br>
-=C2=A0 =C2=A0 int host_port;<br>
-=C2=A0 =C2=A0 char buf[256];<br>
+=C2=A0 =C2=A0 struct sockaddr_storage host_addr;<br>
=C2=A0 =C2=A0 =C2=A0const char *src_str, *p;<br>
=C2=A0 =C2=A0 =C2=A0SlirpState *s;<br>
-=C2=A0 =C2=A0 int is_udp =3D 0;<br>
+=C2=A0 =C2=A0 bool is_udp;<br>
+=C2=A0 =C2=A0 Error *error =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 int flags =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0const char *arg1 =3D qdict_get_str(qdict, &quot;arg1&qu=
ot;);<br>
=C2=A0 =C2=A0 =C2=A0const char *arg2 =3D qdict_get_try_str(qdict, &quot;arg=
2&quot;);<br>
<br>
@@ -664,110 +757,91 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *q=
dict)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 g_assert(src_str !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0p =3D src_str;<br>
-=C2=A0 =C2=A0 if (!p || get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;)=
 &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (!strcmp(buf, &quot;tcp&quot;) || buf[0] =3D=3D &#39;\0&#=
39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_udp =3D 0;<br>
-=C2=A0 =C2=A0 } else if (!strcmp(buf, &quot;udp&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_udp =3D 1;<br>
-=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 p =3D parse_protocol(p, &amp;is_udp, &amp;error);<br>
+=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 if (get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;) &lt; =
0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (buf[0] !=3D &#39;\0&#39; &amp;&amp; !inet_aton(buf, &amp=
;host_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
+=C2=A0 =C2=A0 if (is_udp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D SLIRP_HOSTFWD_UDP;<br></blockquote>=
<div><br></div><div>This fails to build with the system version of libslirp=
, as there has not been releases with this new symbol yet. I am not sure wh=
at&#39;s the status for upstream release, we should create an issue there a=
nd discuss it.<br></div><div><br></div><div>Anyway, you&#39;ll probably nee=
d to make the new code conditional with SLIRP_CHECK_VERSION(), as we don&#3=
9;t want qemu to depend on too recent releases.</div><div><br></div><div>th=
anks<br></div><div><br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (qemu_strtoi(p, NULL, 10, &amp;host_port)) {<br>
+=C2=A0 =C2=A0 if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STR=
EAM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;host_addr, &amp;error) &lt; 0) {=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 err =3D slirp_remove_hostfwd(s-&gt;slirp, is_udp, host_addr,=
 host_port);<br>
+=C2=A0 =C2=A0 err =3D slirp_remove_hostxfwd(s-&gt;slirp, (struct sockaddr =
*) &amp;host_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(host_addr), flags);<br>
<br>
=C2=A0 =C2=A0 =C2=A0monitor_printf(mon, &quot;host forwarding rule for %s %=
s\n&quot;, src_str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err ?=
 &quot;not found&quot; : &quot;removed&quot;);<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
<br>
=C2=A0 fail_syntax:<br>
-=C2=A0 =C2=A0 monitor_printf(mon, &quot;invalid format\n&quot;);<br>
+=C2=A0 =C2=A0 monitor_printf(mon, &quot;Invalid format: %s\n&quot;, error_=
get_pretty(error));<br>
+=C2=A0 =C2=A0 error_free(error);<br>
=C2=A0}<br>
<br>
=C2=A0static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error =
**errp)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 struct in_addr host_addr =3D { .s_addr =3D INADDR_ANY };<br>
-=C2=A0 =C2=A0 struct in_addr guest_addr =3D { .s_addr =3D 0 };<br>
-=C2=A0 =C2=A0 int host_port, guest_port;<br>
+=C2=A0 =C2=A0 struct sockaddr_storage host_addr, guest_addr;<br>
=C2=A0 =C2=A0 =C2=A0const char *p;<br>
=C2=A0 =C2=A0 =C2=A0char buf[256];<br>
-=C2=A0 =C2=A0 int is_udp;<br>
-=C2=A0 =C2=A0 char *end;<br>
-=C2=A0 =C2=A0 const char *fail_reason =3D &quot;Unknown reason&quot;;<br>
+=C2=A0 =C2=A0 bool is_udp;<br>
+=C2=A0 =C2=A0 Error *error =3D NULL;<br>
+=C2=A0 =C2=A0 int flags =3D 0;<br>
+=C2=A0 =C2=A0 int port;<br>
<br>
+=C2=A0 =C2=A0 g_assert(redir_str !=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0p =3D redir_str;<br>
-=C2=A0 =C2=A0 if (!p || get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;)=
 &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;No : separators&quot;;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 if (!strcmp(buf, &quot;tcp&quot;) || buf[0] =3D=3D &#39;\0&#=
39;) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_udp =3D 0;<br>
-=C2=A0 =C2=A0 } else if (!strcmp(buf, &quot;udp&quot;)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_udp =3D 1;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad protocol name&quot;;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;) &lt; =
0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Missing : separator&quot=
;;<br>
+=C2=A0 =C2=A0 p =3D parse_protocol(p, &amp;is_udp, &amp;error);<br>
+=C2=A0 =C2=A0 if (p =3D=3D NULL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (buf[0] !=3D &#39;\0&#39; &amp;&amp; !inet_aton(buf, &amp=
;host_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad host address&quot;;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
+=C2=A0 =C2=A0 if (is_udp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 flags |=3D SLIRP_HOSTFWD_UDP;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (get_str_sep(buf, sizeof(buf), &amp;p, &#39;-&#39;) =
&lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad host port separator&=
quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail_syntax;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 host_port =3D strtol(buf, &amp;end, 0);<br>
-=C2=A0 =C2=A0 if (*end !=3D &#39;\0&#39; || host_port &lt; 0 || host_port =
&gt; 65535) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad host port&quot;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;error, &quot;missing host-gues=
t separator&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (get_str_sep(buf, sizeof(buf), &amp;p, &#39;:&#39;) &lt; =
0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Missing guest address&qu=
ot;;<br>
+=C2=A0 =C2=A0 if (parse_hostfwd_sockaddr(buf, is_udp ? SOCK_DGRAM : SOCK_S=
TREAM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;host_addr, &amp;error) &lt; 0) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_prepend(&amp;error, &quot;For host addre=
ss: &quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 if (buf[0] !=3D &#39;\0&#39; &amp;&amp; !inet_aton(buf, &amp=
;guest_addr)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad guest address&quot;;=
<br>
+<br>
+=C2=A0 =C2=A0 if (parse_hostfwd_sockaddr(p, is_udp ? SOCK_DGRAM : SOCK_STR=
EAM,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;guest_addr, &amp;error) &lt; 0) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_prepend(&amp;error, &quot;For guest addr=
ess: &quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 guest_port =3D strtol(p, &amp;end, 0);<br>
-=C2=A0 =C2=A0 if (*end !=3D &#39;\0&#39; || guest_port &lt; 1 || guest_por=
t &gt; 65535) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_reason =3D &quot;Bad guest port&quot;;<br=
>
+=C2=A0 =C2=A0 port =3D sockaddr_getport((struct sockaddr *) &amp;guest_add=
r);<br>
+=C2=A0 =C2=A0 if (port =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(&amp;error, &quot;For guest address=
: invalid port &#39;0&#39;&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_syntax;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (slirp_add_hostfwd(s-&gt;slirp, is_udp, host_addr, host_p=
ort, guest_addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 guest_port) &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Could not set up host f=
orwarding rule &#39;%s&#39;&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redir=
_str);<br>
+=C2=A0 =C2=A0 if (slirp_add_hostxfwd(s-&gt;slirp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *) &amp;host_addr, sizeof(host_add=
r),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(struct sockaddr *) &amp;guest_addr, sizeof(guest_a=
ddr),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0flags) &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Could not set up host f=
orwarding rule &#39;%s&#39;: %s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redir=
_str, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0return 0;<br>
<br>
=C2=A0 fail_syntax:<br>
=C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Invalid host forwarding rule &#3=
9;%s&#39; (%s)&quot;, redir_str,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail_reason);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_get_pretty(er=
ror));<br>
+=C2=A0 =C2=A0 error_free(error);<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
diff --git a/tests/acceptance/hostfwd.py b/tests/acceptance/hostfwd.py<br>
new file mode 100644<br>
index 0000000000..9b9db142c3<br>
--- /dev/null<br>
+++ b/tests/acceptance/hostfwd.py<br>
@@ -0,0 +1,91 @@<br>
+# Hostfwd command tests<br>
+#<br>
+# Copyright 2021 Google LLC<br>
+#<br>
+# This program is free software; you can redistribute it and/or modify it<=
br>
+# under the terms of the GNU General Public License as published by the<br=
>
+# Free Software Foundation; either version 2 of the License, or<br>
+# (at your option) any later version.<br>
+#<br>
+# This program is distributed in the hope that it will be useful, but WITH=
OUT<br>
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or<br=
>
+# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License<br>
+# for more details.<br>
+<br>
+<br>
+from avocado_qemu import Test<br>
+<br>
+<br>
+class Hostfwd(Test):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 :avocado: tags=3Dhostfwd<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 def hmc(self, cmd):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return self.vm.command(&#39;human-monitor-comm=
and&#39;, command_line=3Dcmd)<br>
+<br>
+=C2=A0 =C2=A0 def test_qmp_hostfwd_ipv4(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nodefaults&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dvnet&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add vn=
et tcp::65022-:22&#39;), &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 vnet tcp::65022&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for tcp::65022 removed\r\n&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add tc=
p::65022-:22&#39;), &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 tcp::65022&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for tcp::65022 removed\r\n&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ud=
p::65042-:42&#39;), &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 udp::65042&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for udp::65042 removed\r\n&#39;=
)<br>
+<br>
+=C2=A0 =C2=A0 def test_qmp_hostfwd_ipv4_functional_errors(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Verify handling of various k=
inds of errors given valid addresses.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nodefaults&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dvnet&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 ::65022&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for ::65022 not found\r\n&#39;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ud=
p::65042-:42&#39;), &#39;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ud=
p::65042-:42&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Could not set up host forwarding rule&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; &#39;udp::65042-:42&#39;: Address already in use\r=
\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 ::65042&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for ::65042 not found\r\n&#39;)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 udp::65042&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for udp::65042 removed\r\n&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 udp::65042&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &#39;host forwarding rule for udp::65042 not found\r\n&#3=
9;)<br>
+<br>
+=C2=A0 =C2=A0 def test_qmp_hostfwd_ipv4_parsing_errors(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Verify handling of various k=
inds of parsing errors.&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-nodefaults&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-netdev&#39;, &#39;user,id=3Dvnet&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-device&#39;, &#39;virtio-net,netdev=3Dvnet&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_remove=
 abc::42&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid format: bad protocol name &#39;abc&#39;\r\n=
&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ab=
c::65022-:22&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;abc::65022-:22&#3=
9;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (bad protocol name &#39;abc&#39;)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add :f=
oo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;:foo&#39;&quot; +=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (missing host-guest separator)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add :a=
.b.c.d:66-:66&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;:a.b.c.d:66-:66&#=
39;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For host address: address resolution failed for&q=
uot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; &#39;a.b.c.d:66&#39;: Name or service not known)\r=
\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-a.b.c.d:66&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-a.b.c.d:66&#=
39;&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For guest address: address resolution failed&quot=
; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; for &#39;a.b.c.d:66&#39;: Name or service not know=
n)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
-1-foo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::-1-foo&#39;&quo=
t; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For host address: error parsing port in&quot; + \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; address &#39;:&#39;)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-foo&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-foo&#39; (Fo=
r&quot; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; guest address: error parsing address &#39;foo&#39;=
)\r\n&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEquals(self.hmc(&#39;hostfwd_add ::=
66-:0&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;Invalid host forwarding rule &#39;::66-:0&#39;&quot=
; + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot; (For guest address: invalid port &#39;0&#39;)\r\n&=
quot;)<br>
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c<br>
index c0069f2565..983efeee2f 100644<br>
--- a/util/qemu-sockets.c<br>
+++ b/util/qemu-sockets.c<br>
@@ -46,23 +46,28 @@<br>
=C2=A0#endif<br>
<br>
<br>
-static int inet_getport(struct addrinfo *e)<br>
+int sockaddr_getport(const struct sockaddr *addr)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 struct sockaddr_in *i4;<br>
-=C2=A0 =C2=A0 struct sockaddr_in6 *i6;<br>
+=C2=A0 =C2=A0 const struct sockaddr_in *i4;<br>
+=C2=A0 =C2=A0 const struct sockaddr_in6 *i6;<br>
<br>
-=C2=A0 =C2=A0 switch (e-&gt;ai_family) {<br>
+=C2=A0 =C2=A0 switch (addr-&gt;sa_family) {<br>
=C2=A0 =C2=A0 =C2=A0case PF_INET6:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i6 =3D (void*)e-&gt;ai_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i6 =3D (void *)addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ntohs(i6-&gt;sin6_port);<br>
=C2=A0 =C2=A0 =C2=A0case PF_INET:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 i4 =3D (void*)e-&gt;ai_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 i4 =3D (void *)addr;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ntohs(i4-&gt;sin_port);<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static int inet_getport(struct addrinfo *e)<br>
+{<br>
+=C2=A0 =C2=A0 return sockaddr_getport(e-&gt;ai_addr);<br>
+}<br>
+<br>
=C2=A0static void inet_setport(struct addrinfo *e, int port)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_in *i4;<br>
-- <br>
2.31.1.295.g9ea45b61b8-goog<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000057337405c1bf17bc--

