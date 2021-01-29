Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E923087EE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 11:51:17 +0100 (CET)
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RMy-0002k7-Ka
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 05:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5RM4-0002CP-8V
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5RM1-0002K5-G9
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 05:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611917416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8P+9su4ofuhK2m1CkH7s9VyMnf7dcr1qg+iUcMd3VU0=;
 b=aobEU2wS71OCP2uI5xokI9TEGJ3419h+WnvVHWm6tbgtg7fd5bhed4dE0+b/rpj0Ez3/rF
 fzmrybTfdPbrGTrWy9wGe6Z14K/dDQMfgudsA8TQaT+RdYQPOoPeWF5fHikfwx9RDbeIeV
 Rw6ZuFD0XBaP4ZDUl9GeC4ukGCI9lfU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-2J5pSv8DOZKEh7jjpy5-AA-1; Fri, 29 Jan 2021 05:50:14 -0500
X-MC-Unique: 2J5pSv8DOZKEh7jjpy5-AA-1
Received: by mail-wm1-f71.google.com with SMTP id n17so2969010wmk.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 02:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SDU4F3DPbNpbBZwpJxo1VcLXux2jFiqUML0emZlS2jk=;
 b=PYd+jeynJVXapd2JNbM94BAxTAGjGo5obNr3Bg4WM2neGqpH5KLNKS7cOP/zsS3oUb
 qrVUn5HYEmSBEkJ+yspqGDqPMOZIf30DRCLGPw24ZCJwgoDw9UXP0tYPz894r02m8/XP
 qaZ8QQ7Sl9D1IFCL9vd1nnk3KQK9yX7mJ6A/4TO76fW+WyG5eZZ2IMpSpmjKf0ALkoUD
 9JS2DGL5f6i0YRFC1yKgZIzEsdFA8pZZMBW8nQBZ/+7KijnmR4adrWwtrfcizjiEAxAQ
 b9P3RF/DSUqCLoMdFrVqDE4Zx8bz7wk4HZxuML6zKJE0ntPglY3tNjvaVv6PHIZ46BKE
 OMrw==
X-Gm-Message-State: AOAM530QIq4WV5te3RDcZD9Td5ByMT4OM8S06Jgli+SZxF2obd64MYH5
 bOTWhtOYT6xO/wSv1lxxShoHSiO+sBavTa8xtq6dlV24fjKdIdTLOtIU3/MvJx70q0xbYcSiC+T
 BTLh2yK/HUHEN/A8=
X-Received: by 2002:a1c:2d48:: with SMTP id t69mr3136936wmt.124.1611917412861; 
 Fri, 29 Jan 2021 02:50:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnJRA76QEvKI+fVvVxCzxDjjduEQwat0hMA1yjReE/ycHGo+DdDKZT1AW+jc5R7j3g/MDTww==
X-Received: by 2002:a1c:2d48:: with SMTP id t69mr3136911wmt.124.1611917412501; 
 Fri, 29 Jan 2021 02:50:12 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:b806:f900:b9dc:9b2b?
 ([2a01:e0a:466:71c0:b806:f900:b9dc:9b2b])
 by smtp.gmail.com with ESMTPSA id p18sm6900384wrx.84.2021.01.29.02.50.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 02:50:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
Date: Fri, 29 Jan 2021 11:50:10 +0100
Message-Id: <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cdupontd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cdupontd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 29 Jan 2021, at 09:03, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi,
>=20
>>> (1) Have some guest agent (spice does it that way).
>>>     Advantage: more flexible, allows more features.
>>>     Disadvantage: requires agent in the guest.
>>=20
>> What about running the option to relay data to a VNC server in the
>> guest if there is one running? In other words, using an existing
>> VNC server as an agent, with the option of having a stripped-down,
>> clipboard only VNC server as a later optimization.
>=20
> Well, if you run Xvnc in the guest anyway why use the qemu vnc server
> in the first place?

I assume that if you use the qemu VNC, it's because you you don't want to
run Xvnc on some external network, or care about accessing the guest
before Xvnc can be launched. There can be many reasons.

Again, I want to make it clear that my suggestion is _not_ simply to access
the existing Xvnc as is, but rather to stick with some VNC server code to h=
andle
the clipboard if / when possible.

Let me try to imagine a scenario, where I'll use a macOS guest intentionall=
y
to clarify what I was thinking about.

- During early boot, there is no in-guest VNC server, so to address that,
you connect to the qemu VNC. At this stage, all screen refresh is handled
by the qemu VNC, and the best you can do if you want to support any
kind of copy-paste is to convert it to virtual keystrokes. The same would
be true for Linux on a text console.

- Then comes up you macOS guest, and it still has no VNC port open,
so you are stuck with qemu-vnc doing all the work. But now you can
enable screen sharing, and that launches the Apple-maintained macOS
VNC server.

- Let's assume for illustration that this listens on some private network
that qemu can access, but that is not visible externally. In this case,
you could not VNC to the guest, but you can still VNC to qemu.

- What I'm suggesting is that qemu-vnc could then switch to simply
relaying VNC traffic to that in-guest server. You'd get the smart update
algorithm that Apple has put in place to deal with transparency and the
like, as well as a level of guest OS integration that would otherwise be
much harder to replicate.

I believe that the same holds true with X as well. If you can activate or
detect an Xvnc, you are much better off using _that_ to deal with the
idiosyncrasies of Xclipboard rather than try to convert keycodes.

If you don't have it, you fallback to virtual keystrokes, which you can't
dispense with because of the early boot case, but which will at best
deal with simple ASCII (making that work with a clipboard containing
tabs and Control-C/Control-V characters is left as an exercise for the
reader  ;-)

Finally, an optimization I alluded to is to have an agent which is basicall=
y
a stripped-down VNC server dealing with only the clipboard aspect, and
that is your agent. In other words, you don't' invent yet another protocol,
but you furiously copy-paste the existing VNC code.


Hope this sounds a bit less crazy explained that way=E2=80=A6
Thanks
Christophe


