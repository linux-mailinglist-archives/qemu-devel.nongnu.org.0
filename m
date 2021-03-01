Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883A6328433
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:32:02 +0100 (CET)
Received: from localhost ([::1]:56528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlSh-0005EI-7D
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGlOj-00012p-8O
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:27:53 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:52740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGlOh-0000FY-L2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:27:53 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id BDEE61F6;
 Mon,  1 Mar 2021 17:27:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id obgVPyg0iJdY; Mon,  1 Mar 2021 17:27:49 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id AB7B31F4;
 Mon,  1 Mar 2021 17:27:48 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lGlOd-003Sa2-W0; Mon, 01 Mar 2021 17:27:47 +0100
Date: Mon, 1 Mar 2021 17:27:47 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210301162747.dmsaqzni6mrmkx4a@begin>
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
 <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RY3kT1U69M71+V2-azCwiLn=wm382KHswr2OZXDmZehA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADPb22RY3kT1U69M71+V2-azCwiLn=wm382KHswr2OZXDmZehA@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: BDEE61F6
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_ALL(0.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=185.233.100.1;
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
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doug Evans, le lun. 01 mars 2021 08:23:03 -0800, a ecrit:
> On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <[1]samuel.thibault@gnu.org>
> wrote:
> 
>     [...]
>     > Note that one issue I am leaving for later (i.e., I don't want to drag
>     this
>     > patch series out to include it), is whether and how to support
>     ipv4-host->
>     > ipv6-guest forwarding and vice versa. Can libslirp support this?
> 
>     That would be feasible yes: since the data flow is completely rebuilt
>     between the host and the guest, there is no remnant of the IP version.
>     It was simpler to have e.g. udp_listen and udp6_listen separate to keep
>     uint32_t / in6_addr parameters, but there is no strict reason for this:
>     the haddr is only passed to the bind() call, and the laddr is only
>     recorded in the so. Put another way, a refactoring patch could be to
>     just hand udp_listen two sockaddrs, and it will just work fine. We'd
>     then introduce a slirp_add_hostfwd that takes two sockaddr instead of
>     host/port.
> 
> 
> 
> I guess I'm not familiar enough with this code.
> Help me understand how passing two addresses to udp_listen is simpler.
> That feels confusing from an API viewpoint.

? udp_listen already takes two addresses + two ports. I just mean
replacing that with two sockaddr, which contains both, but also contains
the address family. I submitted this to 

https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/74

Samuel

