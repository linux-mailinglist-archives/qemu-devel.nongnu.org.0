Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241043740E0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:39:29 +0200 (CEST)
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKYa-0003Kl-6u
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leK9m-0005MT-FA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leK9h-0006Yr-O2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eJn2+fUBva7wHFI0MAUcyHTtldjxc9m/TXYymoYi5UI=;
 b=IF7xkpZmjq3kWBzTmBRqKO9rScPp3hA+CsfY+25S/LVhn71KXeLHVIx4ozg03KLfPq10iD
 GJqWXHIwgOX4fyy8H5u+10Gg0w/Y4BKmbgGhUaw4sUap9RdZVKXjpVHC72kFQ2CBTfE1oq
 NFS1hgm+hRk0dE3hYuTV+WSnJJ0hRfw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-a6PUf-WJNwmKBfs0RpkM9Q-1; Wed, 05 May 2021 12:13:42 -0400
X-MC-Unique: a6PUf-WJNwmKBfs0RpkM9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso902221wrp.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eJn2+fUBva7wHFI0MAUcyHTtldjxc9m/TXYymoYi5UI=;
 b=ZOKRA572l/VvqafT0UtatFn/pYghPSJ0vrpGGDOENky/ovFXkVBRbrjs/CYnzHAToX
 0XFF5NUsAnYO1o/1zpGoUnBSp1yjMHQ573XDcRj6mjvohKOfrb137xMFaXw9HWI/R5dC
 Uzh2PkTxhVfZBprDOjssC3AG+uEr6TFY8bX6sPWMZPePKo1rv5eGwbzJL3ZMW9+AhBWa
 2jPwh+jI7kENFB+4RX5w7U2ood9mcXS3DKCzO0kQHfchVhtjFjW2p8SBnWsTY+FwaUn8
 NIFFN4votaDChhlHnpztRf4NgRKjovdxn+Ynjzg7dtzu8E+f1aXG6o59X+uu5PCgW3VP
 Yr4Q==
X-Gm-Message-State: AOAM533V6QJs8/th2Ub58tb2SHB4ifbGWjZsKT3yeT8KeZuKTx7U38j3
 TNhbkrz81Cswk5lAWjH42dXfI5lGiq912H94I51z3DCYpVpEwRFwl7NjEgeN3eYvatp9QioRlmw
 TR2HZrWtFFgcaiUY=
X-Received: by 2002:a1c:9a88:: with SMTP id c130mr33929083wme.3.1620231221097; 
 Wed, 05 May 2021 09:13:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXZWeyyXR6NShzKSroOWu1nvFOG07UsaxLTakELzuDKEmtOLnNxknXOvcCkqoPlOIjB6adqg==
X-Received: by 2002:a1c:9a88:: with SMTP id c130mr33929062wme.3.1620231220914; 
 Wed, 05 May 2021 09:13:40 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id f20sm2274605wmh.41.2021.05.05.09.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 09:13:40 -0700 (PDT)
Subject: Re: [PATCH v6 0/4] Add support for ipv6 host forwarding
To: Doug Evans <dje@google.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210415033925.1290401-1-dje@google.com>
 <CADPb22SBzeHj75aaNnJKN2Ov--=MExh5CuZCYRZO7gK8A-A-Lw@mail.gmail.com>
 <CADPb22RJJHOdSqc4veQU-Gzuf4gDGsCdC6=BpL_eeprtFw-vDw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a30cdc7c-eb53-ff0f-2fb8-e3ec88a3122c@redhat.com>
Date: Wed, 5 May 2021 18:13:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADPb22RJJHOdSqc4veQU-Gzuf4gDGsCdC6=BpL_eeprtFw-vDw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Marc-André

On 5/5/21 5:21 PM, Doug Evans wrote:
> Ping.
> 
> On Wed, Apr 28, 2021 at 8:37 PM Doug Evans <dje@google.com
> <mailto:dje@google.com>> wrote:
> 
>     Ping.
> 
>     On Wed, Apr 14, 2021 at 8:39 PM Doug Evans <dje@google.com
>     <mailto:dje@google.com>> wrote:
> 
>         This patchset takes the original patch from Maxim,
>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html <https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html>
>         and updates it.
> 
>         Option hostfwd is extended to support ipv6 addresses.
>         Commands hostfwd_add, hostfwd_remove are extended as well.
> 
>         The libslirp part of the patch has been committed upstream,
>         and is now in qemu. See patch 1/4.
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
>           - libslirp currently only provides a stateless DHCPv6 server,
>         which means
>             it can't know in advance what the guest's IP address is, and
>         thus
>             cannot do the "addr-any -> guest ip address" translation
>         that is done
>             for ipv4
> 
>         2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse
> 
>         - this patch is new in v4
>           - provides new utility: inet_parse_host_and_port, updates
>         inet_parse
>             to use it
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
>           - instead of creating new ipv6 option, commands
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
>           slirp: Advance libslirp submodule to add ipv6 host-forward support
>           util/qemu-sockets.c: Split host:port parsing out of inet_parse
>           net/slirp.c: Refactor address parsing
>           net: Extend host forwarding to support IPv6
> 
>          hmp-commands.hx             |  18 ++-
>          include/qemu/sockets.h      |   5 +
>          net/slirp.c                 | 236
>         ++++++++++++++++++++++++++----------
>          slirp                       |   2 +-
>          tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++++++
>          util/qemu-sockets.c         |  82 +++++++++----
>          6 files changed, 436 insertions(+), 92 deletions(-)
>          create mode 100644 tests/acceptance/hostfwd.py
> 
>         -- 
>         2.31.1.295.g9ea45b61b8-goog
> 


