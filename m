Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4551224EC4
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jul 2020 04:52:03 +0200 (CEST)
Received: from localhost ([::1]:45494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwzQo-0008QT-AX
	for lists+qemu-devel@lfdr.de; Sat, 18 Jul 2020 22:52:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1jwzPq-00080X-UN
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 22:51:02 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:50606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1jwzPp-0005uL-7o
 for qemu-devel@nongnu.org; Sat, 18 Jul 2020 22:51:02 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 395FC9C0;
 Sun, 19 Jul 2020 04:50:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l-DxgTMYHrEk; Sun, 19 Jul 2020 04:50:56 +0200 (CEST)
Received: from function.home (unknown
 [IPv6:2a01:cb19:956:1b00:9eb6:d0ff:fe88:c3c7])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6BC3C9BA;
 Sun, 19 Jul 2020 04:50:56 +0200 (CEST)
Received: from samy by function.home with local (Exim 4.94)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1jwzPj-009lfw-5s; Sun, 19 Jul 2020 04:50:55 +0200
Date: Sun, 19 Jul 2020 04:50:55 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Subject: Re: Is traceroute supposed to work in user mode networking (slirp) ?
Message-ID: <20200719025055.kkjjiegyn4t6x64v@function>
References: <CAEJNuHy+CqveTjiCxpjiLX-D=NczSveUSDSAZyz=D5F0XvL5QQ@mail.gmail.com>
 <CAEJNuHze25wdA_Kjw8ryi+hmg0eLP8nhZMR50_2yqXPu_Jir9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEJNuHze25wdA_Kjw8ryi+hmg0eLP8nhZMR50_2yqXPu_Jir9A@mail.gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Ottavio Caruso, le mar. 14 juil. 2020 12:15:48 +0100, a ecrit:
> I cannot get traceroute to work with standard udp from any of my
> guests.
> 
> $ traceroute 8.8.8.8
> traceroute to 8.8.8.8 (8.8.8.8), 64 hops max, 40 byte packets
>  1  * * *

That was because

- libslirp was not forwarding the ttl value, thus always set to 64 hops
- libslirp was not reporting icmp errors.

I had a try at both, and that indeed seems to be fixing the issue:
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/48
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/49

> Any clues? Is this intended behaviour? Any workarounds that don't
> involve tap/tun/bridges?

Not without updating libslirp with the abovementioned patches.

Samuel

