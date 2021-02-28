Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE603274AB
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 22:45:10 +0100 (CET)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGTsD-0004SB-29
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 16:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGTnK-0002st-0k
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:40:06 -0500
Received: from hera.aquilenet.fr ([2a0c:e300::1]:48258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGTnI-0003RH-8o
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 16:40:05 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 2DBAA34C;
 Sun, 28 Feb 2021 22:39:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4iZprQ8eXfa; Sun, 28 Feb 2021 22:39:58 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 26184EE;
 Sun, 28 Feb 2021 22:39:58 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lGTnB-001Ffc-18; Sun, 28 Feb 2021 22:39:57 +0100
Date: Sun, 28 Feb 2021 22:39:57 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Doug Evans <dje@google.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210228213957.xkc4cceh5o6rgd5n@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 2DBAA34C
X-Spamd-Result: default: False [0.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_ALL(0.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Daniel P. Berrangé, le lun. 22 févr. 2021 09:39:41 +0000, a ecrit:
> In general callers shouldn't care about which format was parsed. The use
> of [] is just a mechanism to reliably separate the port from the address.
> Once you have the address part getaddrinfo() will reliably parse the
> address into a sockaddr struct on its own.

Agreed.

> The is_v6 flag is only needed
> for the legacy compat needs in slirp, even that is only if we want to 
> have strict equivalence with historical behaviour, as opposed to changing
> empty string to mean to listen on both IPv4+6 concurrently..

I would say that empty address meaning ipv4+6 looks better to me.

Doug Evans, le lun. 22 févr. 2021 09:55:09 -0800, a ecrit:
> Hi guys. I think before I submit yet another patchset in this series I need
> someone with authority to define the user API for ipv6 host forwarding.
> Since the hostfwd syntax is parsed in net/slirp.c, Samuel I think that means
> you (based on what I'm reading in MAINTAINERS).

Well, I'm not maintainer of the user API actually. That'd rather be
Markus Armbruster, now Cc-ed, who devises the command-line options,
QAPI, etc.

> Based on what Maxim originally wrote I was going with addresses wrapped in []
> mean ipv6, but Daniel does not want that.

Specifying [127.0.0.1] would be odd, but for instance 

ssh localhost -D '[127.0.0.1]':23456

happens to listen on 127.0.0.1. So I would say that common practice
really is that [] only matters for syntax, and not semantic.

> There are issues to consider of course.
> Note that one issue I am leaving for later (i.e., I don't want to drag this
> patch series out to include it), is whether and how to support ipv4-host->
> ipv6-guest forwarding and vice versa. Can libslirp support this?

That would be feasible yes: since the data flow is completely rebuilt
between the host and the guest, there is no remnant of the IP version.
It was simpler to have e.g. udp_listen and udp6_listen separate to keep
uint32_t / in6_addr parameters, but there is no strict reason for this:
the haddr is only passed to the bind() call, and the laddr is only
recorded in the so. Put another way, a refactoring patch could be to
just hand udp_listen two sockaddrs, and it will just work fine. We'd
then introduce a slirp_add_hostfwd that takes two sockaddr instead of
host/port.

> Setting cross-forwarding aside, we can't break existing uses of course, so that
> means that one issue is that if [] is not used to identify ipv6 addresses then
> something like ",ipv6" will be needed as a separate argument; otherwise the
> empty address "" will be ambiguous.

(as I mentioned above, I'd say empty address "" should mean ipv4+ipv6)

> +  Examples:
> +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
> +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22

Yep, that looks good to me.

Samuel

