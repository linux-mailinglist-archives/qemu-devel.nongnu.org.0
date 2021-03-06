Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1696B32FCCB
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 20:32:04 +0100 (CET)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIceg-0002JP-M5
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 14:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lIcc5-0001dA-Nj
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 14:29:21 -0500
Received: from hera.aquilenet.fr ([185.233.100.1]:48576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lIcc2-0002Ds-I7
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 14:29:21 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0BB73266;
 Sat,  6 Mar 2021 20:29:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4X89kzrXNWbC; Sat,  6 Mar 2021 20:29:14 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 05E65EE;
 Sat,  6 Mar 2021 20:29:13 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lIcbw-000SaB-9k; Sat, 06 Mar 2021 20:29:12 +0100
Date: Sat, 6 Mar 2021 20:29:12 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210306192912.wzs5d7pynxztnvxb@begin>
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
 <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com>
 <20210305212806.kx62ycfr7k4wxdlq@begin>
 <CADPb22Tv0-oXhxu7Fke3hDq+yq1_n5RTcAC4efmZ0iniAUxVQg@mail.gmail.com>
 <20210306001014.zsvg35ku4647wpr4@begin>
 <CADPb22SXEZx-qvvDNBbb0NbohUWaddYuUvT2zBNH4bFQPp9QZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADPb22SXEZx-qvvDNBbb0NbohUWaddYuUvT2zBNH4bFQPp9QZA@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0BB73266
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

Hello,

Doug Evans, le ven. 05 mars 2021 17:00:13 -0800, a ecrit:
> Is it possible for QEMU to lazily determine the guest's IPv6
> address? I.e., postpone the ""->guest address mapping until it's
> needed and then, say, take the first entry in the NDP table?

That would probably be possible, yes, by moving the 

if (!guest_addr.s_addr) {
    guest_addr = slirp->vdhcp_startaddr;
}

from slirp_add_hostfwd() and alike to tcp_connect() and sorecvfrom()
(along the other sotranslate call).

> That feels a bit fragile: what if someone else gets the first entry in
> the NDP table? But is that any more fragile than assuming the first
> handed out DHCP address is to the guest?

I don't think it's really more fragile.

> [<<-- Honest question, can we assume the first handed out DHCP address
> will necessarily be the guest?]

It "cannot" be anything else. What could happen is a PXE loader that
uses DHCP/NDP, and then the OS that does it again.

> But that would mean the defaults for the guest would have to be
> different than for the host. E.g.,
> host: ",ipv4" means both,

Why would it mean both? I don't follow you here.

> whereas guest: ",ipv4" (ideally) means ipv4 (since both is meaningless)

Samuel

