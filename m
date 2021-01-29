Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 516FD30895D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 14:36:39 +0100 (CET)
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Tx0-0005NM-Bi
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 08:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5TpT-0008HB-FJ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l5TpL-0001Pa-5l
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 08:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611926919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A52UMLtbop86ilA2JW+ET7anaWDkx+vNwofhi/Mdv8k=;
 b=K6cyCrJ1e47zYRHzrPYFr3zTFFOL+QSACUvci4h7e1YAJIA3f1Clq6ss8nLNKENqoAdCE/
 T0pmlLOfj1u/K0wbYHoU4ID4fk3kfFIpHg5MhPNshZXywdw+JTMuoIwvAHGiBxcDdOV68P
 fRKKl2fPTZY31gkHQntvcYCfDaVa4kU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-NajMDACXOaynxELxpxIESg-1; Fri, 29 Jan 2021 08:28:37 -0500
X-MC-Unique: NajMDACXOaynxELxpxIESg-1
Received: by mail-wr1-f71.google.com with SMTP id n15so5081893wrv.20
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 05:28:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cQmCuQvC2x4l/fCWJTWVT+8eSjs7UkanQRjd7MEYgLU=;
 b=BricUbZ77QKqqfswWxzeDAPTRXze/0CvXrvjzGFa2IzNHahZtC4SexetgXC7pBf2NW
 YJRzaYhNB8PUUyzdwK34tUtFAQ9qCf/ME5oY1sC2H1YB+b3ziyS9s6ovmeClmw6IBCh6
 qtaBrtiqdkg0usumuDVafx5rpomIKUiNeCi3V1shyXFAm5YGJwZLcRDy8VHnQd5dNmTZ
 WR7kUUkFKM/OXyOku/BKd+2wpEcqP80YMqNq6BCN2ubQgUXmRMUzneXuBC1ChFjB9M0I
 PZa94xvxRQ2/Olqf8hZ9TyPV7CY0DzHjIlCE35/mTPW2Z0Tk4L37hETHBH3jsBYVwY0T
 EoOw==
X-Gm-Message-State: AOAM5335qH5+MZ5er1ZJUsIdNr6nxU8GUh6YH7hv/WP2LomkYK75wciI
 AoE0b2AoKHAV1Ij7FLKEnGOR8Bu8I4G4YZbCLnBRGov/WKlQwhr+D8WddcgIZG0ohpEvTVZS1t6
 qTjCujZ9TmyuEk2o=
X-Received: by 2002:a1c:a784:: with SMTP id q126mr3868543wme.52.1611926916649; 
 Fri, 29 Jan 2021 05:28:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynBFjmkTxuwbkv1OreiwPDv9h2PB4nSrfM+D0tEBvYruzOa36em1pubThoNIqIJbgHvUfEBQ==
X-Received: by 2002:a1c:a784:: with SMTP id q126mr3868515wme.52.1611926916329; 
 Fri, 29 Jan 2021 05:28:36 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:b806:f900:b9dc:9b2b?
 ([2a01:e0a:466:71c0:b806:f900:b9dc:9b2b])
 by smtp.gmail.com with ESMTPSA id k9sm10856955wma.17.2021.01.29.05.28.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 Jan 2021 05:28:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20210129114903.nh4vll2fexdigusc@sirius.home.kraxel.org>
Date: Fri, 29 Jan 2021 14:28:34 +0100
Message-Id: <3E9900BE-9E9E-45CD-9E44-1E03A6877C09@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129114903.nh4vll2fexdigusc@sirius.home.kraxel.org>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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



> On 29 Jan 2021, at 12:49, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi,
>=20
>> - What I'm suggesting is that qemu-vnc could then switch to simply
>> relaying VNC traffic to that in-guest server. You'd get the smart update
>> algorithm that Apple has put in place to deal with transparency and the
>> like, as well as a level of guest OS integration that would otherwise be
>> much harder to replicate.
>=20
> Ok, so basically add a vnc proxy mode and allow switching between
> internals server and proxy mode (automatically if possible, or
> manually).

Yes.

>=20
>> If you don't have it, you fallback to virtual keystrokes, which you can'=
t
>> dispense with because of the early boot case, but which will at best
>> deal with simple ASCII (making that work with a clipboard containing
>> tabs and Control-C/Control-V characters is left as an exercise for the
>> reader  ;-)
>=20
> Well, even simple ascii is tricky.  How do you send 'z', as KEY_Z or as
> KEY_Y ?

Exactly. Scancode / keymap conversions are no joke. and qemu has
very little information about the current state of the guest in that respec=
t.

>=20
>> Finally, an optimization I alluded to is to have an agent which is basic=
ally
>> a stripped-down VNC server dealing with only the clipboard aspect, and
>> that is your agent. In other words, you don't' invent yet another protoc=
ol,
>> but you furiously copy-paste the existing VNC code.
>=20
> Third mode: proxy only clipboard messages.
>=20
>> Hope this sounds a bit less crazy explained that way=E2=80=A6
>=20
> Well, I can't see a way to make all that work nicely fully automatic ...

I see many aspects that are difficult, like disconnecting / reconnecting,
dealing with versions of the protocol, capability changes, and so on.

It was quite hard for SPICE to switch between console and streaming
agent, so I can understand why the prospect does not sound appealing.
Maybe that was just a bad idea.

>=20
> take care,
>  Gerd
>=20


