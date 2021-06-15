Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC743A8CD2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 01:44:34 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltIjQ-0005lt-RY
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 19:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max7255@yandex-team.ru>)
 id 1ltIht-00051L-Fc
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:42:57 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:40202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max7255@yandex-team.ru>)
 id 1ltIho-0004q6-TT
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 19:42:55 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 7C29D2E15E0;
 Wed, 16 Jun 2021 02:42:44 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 P5ffPjbVTm-ghxqVtpT; Wed, 16 Jun 2021 02:42:44 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1623800564; bh=fvw9gsTfCtdCVqq3M4JAUWEvbZX1NgnD1aon8pUUxVY=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=i2AidvIyPVLTmKHoR/8IiYWT+icrGclcY8Lx1rzCB6SacHiv764bj8HCN1OtmL0Qs
 D6fUGDfhr9R9V8HnoCZdB4OasQE6eURDWgk+rzcpi4+slieL9M6ke/8TM9PjDcRNOv
 Vhtr9JU8Pzax5ZnVyV10Gl42bB7yeGnPjaKQerbc=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:8919::1:d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 LcQmhj5XUR-gh3auqve; Wed, 16 Jun 2021 02:42:43 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH v7 0/4] Add support for ipv6 host forwarding
To: Doug Evans <dje@google.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210528235331.3727583-1-dje@google.com>
 <CADPb22SrzgN=YqkXCn-LYuEVcLhP78_BZv=KiD9pwDG+h=icTg@mail.gmail.com>
 <CADPb22R6sHYeXAJCB_OH9T6Bv0XxOApt=51f7fAKAu+UqxXqwA@mail.gmail.com>
From: max7255 <max7255@yandex-team.ru>
Message-ID: <f77c23f7-d9f7-98f0-2d32-9e1e1e02257e@yandex-team.ru>
Date: Wed, 16 Jun 2021 02:42:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADPb22R6sHYeXAJCB_OH9T6Bv0XxOApt=51f7fAKAu+UqxXqwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=max7255@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

Looking good for me.

Thanks for finishing this!
The whole patchset also looks simpler now.

On 6/15/21 2:24 PM, Doug Evans wrote:
> Ping.
> 
> On Wed, Jun 9, 2021 at 9:41 PM Doug Evans <dje@google.com 
> <mailto:dje@google.com>> wrote:
> 
>     Ping.
> 
>     On Fri, May 28, 2021 at 4:53 PM Doug Evans <dje@google.com
>     <mailto:dje@google.com>> wrote:
> 
>         This patchset takes the original patch from Maxim,
>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html
>         and updates it.
> 
>         Option hostfwd is extended to support ipv6 addresses.
>         Commands hostfwd_add, hostfwd_remove are extended as well.
> 
>         Changes from v6:
> 
>         1/4: Update to use libslirp v4.5.0 tag
> 
>         The libslirp parts of the patch have been committed to the
>         libslirp repo,
>         and are now in QEMU's copy of the libslirp repo.
>         Advancing QEMU to use Libslirp v4.5.0 is being done separately.
>         Discussion of patch 1/4 is left to that thread:
>         https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg06010.html
> 
>         2/4: No change
> 
>         3/4: Add support for --enable-slirp=system
>         Tested with system libslirp 4.4.0.
> 
>         4/4: No change
> 
>         Changes from v5:
> 
>         1/4 slirp: Advance libslirp submodule to current master
>         NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>         maintainer takes on advancing QEMU's libslirp to libslirp's master.
>         Beyond that, I really don't know what to do except submit this
>         patch as
>         is currently provided.
> 
>         2/4: util/qemu-sockets.c: Split host:port parsing out of inet_parse
> 
>         Also split out parsing of ipv4=on|off, ipv6=on|off
> 
>         3/4: net/slirp.c: Refactor address parsing
> 
>         Use InetSocketAddress and getaddrinfo().
>         Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.
> 
>         4/4: net: Extend host forwarding to support IPv6
> 
>         Recognize ipv4=,ipv6= options.
> 
>         Note: v5's 3/5 "Recognize []:port (empty ipv6 address)" has been
>         deleted:
>         the churn on this patch series needs to be reduced.
>         This change is not required, and can easily be done in a later
>         patch.
> 
>         Changes from v4:
> 
>         1/5 slirp: Advance libslirp submodule to add ipv6 host-forward
>         support
>         NOTE TO REVIEWERS: I need some hand-holding to know what The Right
>         way to submit this particular patch is.
> 
>         - no change
> 
>         2/5 util/qemu-sockets.c: Split host:port parsing out of inet_parse
> 
>         - move recognition of "[]:port" to separate patch
>         - allow passing NULL for ip_v6
>         - fix some formatting issues
> 
>         3/5 inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)
> 
>         - new in this patchset revision
> 
>         4/5 net/slirp.c: Refactor address parsing
> 
>         - was 3/4 in v4
>         - fix some formatting issues
> 
>         5/5 net: Extend host forwarding to support IPv6
> 
>         - was 4/4 in v4
>         - fix some formatting issues
> 
>         Changes from v3:
> 
>         1/4 slirp: Advance libslirp submodule to add ipv6 host-forward
>         support
> 
>         - pick up latest libslirp patch to reject ipv6 addr-any for
>         guest address
>            - libslirp currently only provides a stateless DHCPv6 server,
>         which means
>              it can't know in advance what the guest's IP address is,
>         and thus
>              cannot do the "addr-any -> guest ip address" translation
>         that is done
>              for ipv4
> 
>         2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse
> 
>         - this patch is new in v4
>            - provides new utility: inet_parse_host_and_port, updates
>         inet_parse
>              to use it
> 
>         3/4 net/slirp.c: Refactor address parsing
> 
>         - this patch renamed from 2/3 to 3/4
>         - call inet_parse_host_and_port from util/qemu-sockets.c
>         - added tests/acceptance/hostfwd.py
> 
>         4/4 net: Extend host forwarding to support IPv6
> 
>         - this patch renamed from 3/3 to 4/4
>         - ipv6 support added to existing hostfwd option, commands
>            - instead of creating new ipv6 option, commands
>         - added tests to tests/acceptance/hostfwd.py
> 
>         Changes from v2:
>         - split out libslirp commit
>         - clarify spelling of ipv6 addresses in docs
>         - tighten parsing of ipv6 addresses
> 
>         Change from v1:
>         - libslirp part is now upstream
>         - net/slirp.c changes split into two pieces (refactor, add ipv6)
>         - added docs
> 
>         Doug Evans (4):
>            slirp: Advance libslirp submodule to 4.5 release
>            util/qemu-sockets.c: Split host:port parsing out of inet_parse
>            net/slirp.c: Refactor address parsing
>            net: Extend host forwarding to support IPv6
> 
>           hmp-commands.hx             |  18 ++-
>           include/qemu/sockets.h      |   5 +
>           net/slirp.c                 | 272
>         ++++++++++++++++++++++++++++--------
>           slirp                       |   2 +-
>           tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++
>           util/qemu-sockets.c         |  82 +++++++----
>           6 files changed, 473 insertions(+), 91 deletions(-)
>           create mode 100644 tests/acceptance/hostfwd.py
> 
>         -- 
>         2.32.0.rc0.204.g9fa02ecfa5-goog
> 

