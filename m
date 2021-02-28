Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740C43274C8
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:22:46 +0100 (CET)
Received: from localhost ([::1]:59200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUSb-00067E-04
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUQe-0005Mx-Fh
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:20:44 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:33886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUQc-0004Sr-LR
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:20:44 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0DF9E34C;
 Sun, 28 Feb 2021 23:20:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP07iL8AxLVV; Sun, 28 Feb 2021 23:20:39 +0100 (CET)
Received: from begin.home (unknown
 [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 15E0B1AF;
 Sun, 28 Feb 2021 23:20:39 +0100 (CET)
Received: from samy by begin.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lGUQX-001Uue-Fn; Sun, 28 Feb 2021 23:20:37 +0100
Date: Sun, 28 Feb 2021 23:20:37 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Doug Evans <dje@google.com>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210228222037.2k2zaccdf3egbivw@begin>
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
 <20210228213957.xkc4cceh5o6rgd5n@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210228213957.xkc4cceh5o6rgd5n@begin>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0DF9E34C
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
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Samuel Thibault, le dim. 28 févr. 2021 22:39:57 +0100, a ecrit:
> It was simpler to have e.g. udp_listen and udp6_listen separate to keep
> uint32_t / in6_addr parameters, but there is no strict reason for this:
> the haddr is only passed to the bind() call, and the laddr is only
> recorded in the so. Put another way, a refactoring patch could be to
> just hand udp_listen two sockaddrs, and it will just work fine.

I have submitted that part to
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/74
Could you review it?

> We'd then introduce a slirp_add_xhostfwd that takes two sockaddr
> instead of host/port.

That should then be easy to introduce indeed, and immediately more
powerful than the slirp_add/remove_ipv6_hostfwd. Possibly you could just
replace in qemu the existing slirp_add/remove_hostfwd call, and thus
make the whole code simpler: ideally it's the address parsing function
that would produce a sockaddr.

Samuel

