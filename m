Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A132F548
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 22:29:41 +0100 (CET)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lII0y-0003HB-Cs
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 16:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lIHza-0002pz-NC
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 16:28:14 -0500
Received: from hera.aquilenet.fr ([2a0c:e300::1]:56770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1lIHzY-0001Yt-VN
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 16:28:14 -0500
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id BF26327F;
 Fri,  5 Mar 2021 22:28:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bf2F9DWncJ3S; Fri,  5 Mar 2021 22:28:08 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 04BF517C;
 Fri,  5 Mar 2021 22:28:07 +0100 (CET)
Received: from samy by begin with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1lIHzS-00FRNU-Lh; Fri, 05 Mar 2021 22:28:06 +0100
Date: Fri, 5 Mar 2021 22:28:06 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
Message-ID: <20210305212806.kx62ycfr7k4wxdlq@begin>
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com>
 <20210228213957.xkc4cceh5o6rgd5n@begin>
 <CADPb22RAxehwfRRBdsRm1exU2D38FCcRv23XcS5VKdZfvDp+pQ@mail.gmail.com>
 <YD/RXfECJ4TshqsT@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YD/RXfECJ4TshqsT@redhat.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: BF26327F
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_FIVE(0.00)[5];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 TO_DN_ALL(0.00)[]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MID_RHS_NOT_FQDN(0.50)[];
 BAYES_HAM(-3.00)[100.00%]
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrangé, le mer. 03 mars 2021 18:11:41 +0000, a ecrit:
> On Wed, Mar 03, 2021 at 10:06:50AM -0800, Doug Evans wrote:
> > On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <samuel.thibault@gnu.org>
> > wrote:
> > 
> > > > +  Examples:
> > > > +  hostfwd_add net0 tcp:127.0.0.1:10022-:22
> > > > +  hostfwd_add net0 tcp:[::1]:10022-[fe80::1:2:3:4]:22
> > >
> > > Yep, that looks good to me.
> > 
> > Daniel, you wanted me to use inet_parse().
> > Is the above syntax ok with you?
> > You must have had some expectation that at least some of
> > the various flags that inet_parse() recognizes would be needed here.
> 
> It feels like the ,ipv4=on|off,ipv6=on|off flags are relevant here,
> especially in the empty address case. eg
> 
>    tcp::10022          - attempt to listen on both ipv4 + ipv6
>    tcp::10022,ipv4=off - listen on default address, but only for ipv6
>    tcp::10022,ipv6=off - listen on default address, but only for ipv4
> 
> Basically this ends up bringing the hostfwd stuff into alignment with
> the way other backends deal with this

I'm fine with this yes, better have a coherent user interface.

Samuel

