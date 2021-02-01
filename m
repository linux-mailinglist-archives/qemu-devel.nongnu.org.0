Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C4E30ADA6
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 18:22:02 +0100 (CET)
Received: from localhost ([::1]:45504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ctl-0004jw-Re
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 12:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6cfs-0008V9-Oe
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:07:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cdupontd@redhat.com>)
 id 1l6cfn-0003kG-Kj
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 12:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612199253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CgyzMH3X/JTRmozoTjhird/tS7PoCfbCEjiYYVQw/50=;
 b=LWdcdxz/3a8mvpNqwZmI3tSHyMleF+NtiKJoZDVo8tRLiEoethRMxP4adqq+pDMHFqI70c
 2Jvs/By4pOhbdsyOmB+akrjOTY4EfnFaMvCx9qd4NYiT6HqsySJLOsIa4aTPnOf/QR6ZIj
 7S4u+peu60ybZTUAsSJhxkEu83Rf/zw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-fOz0Rmr4OaC3Y0YSvV__NQ-1; Mon, 01 Feb 2021 12:07:19 -0500
X-MC-Unique: fOz0Rmr4OaC3Y0YSvV__NQ-1
Received: by mail-wr1-f71.google.com with SMTP id h18so10775519wrr.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 09:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=xnhrKKYkEPpWgAPsmOWVz1UunuEtvF+bQqFS3G5wWCU=;
 b=rIXNF0PaKWNiZaRkRCevJ+V8GATQEhBCZZOxIPlYBTfSwgt2VJb6qrWppxsbwYHn6J
 5AIkk2dG17dUSj/qRMROq59WniuZPeN40eQqfYl8c/6Lnr59VVTWrXuN79o7cB6iBMh2
 sfxBMZedbgZpsmZLQ4W8GSZaH9+pG9FAcwX7EJnlM4OYEUjvOsuWZM8SELtBDIYgAqBJ
 6QPb7PDzgMOMm9UmUsVprx9rRC/X/taCBRBcOltt1KnQ7nOY6uqsbHskpe4ie/VpWYPr
 0WGeEq9aYPoaw5CfHnq1fl0WvzNO64xv/qgAjkjt3qkSjEPcJahTV8LYkQ8PL+qSs9rU
 2EAA==
X-Gm-Message-State: AOAM5310hE6ZRBSKUQk3PDqxGbwone0GZrob331W+TBKawMrrfLbbWj9
 N4rDzGJPmy4ooKnopOW65t4z60f+H8YUK2GbUXJIa15j9HHS4qMkA5LhOveu9YJxhMnjGnyAzOi
 tTYNqlxPMnImC/3U=
X-Received: by 2002:adf:dd45:: with SMTP id u5mr18988022wrm.392.1612199238386; 
 Mon, 01 Feb 2021 09:07:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIDeljwivDOrsElWly+Q/WzVccRKZN1RAQPoCloFGWRVrwFqzmJx1j3QsuMUHhOyq0de3Q+w==
X-Received: by 2002:adf:dd45:: with SMTP id u5mr18987991wrm.392.1612199238172; 
 Mon, 01 Feb 2021 09:07:18 -0800 (PST)
Received: from ?IPv6:2a01:e0a:466:71c0:f46f:cfeb:afa5:1898?
 ([2a01:e0a:466:71c0:f46f:cfeb:afa5:1898])
 by smtp.gmail.com with ESMTPSA id b138sm9073683wmb.35.2021.02.01.09.07.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Feb 2021 09:07:17 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: vnc clipboard support
From: Christophe de Dinechin <cdupontd@redhat.com>
In-Reply-To: <20210129150454.fgfhrcrqao7aqee5@sirius.home.kraxel.org>
Date: Mon, 1 Feb 2021 18:07:16 +0100
Message-Id: <8701EE73-CA92-42F1-9F7E-C8E352531A1C@redhat.com>
References: <20210128171224.exbklnwtyb232oe2@sirius.home.kraxel.org>
 <C26A91E6-A5AE-4258-A470-91B6B5BC7C7F@redhat.com>
 <20210129080323.xuvokq5kytoomx6j@sirius.home.kraxel.org>
 <8E05F8C9-A60D-45A9-AFCB-79D866F57660@redhat.com>
 <20210129110814.GF4001740@redhat.com>
 <0F802343-19F8-487C-8BBE-5BBE2014BA1C@redhat.com>
 <20210129150454.fgfhrcrqao7aqee5@sirius.home.kraxel.org>
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
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 29 Jan 2021, at 16:04, Gerd Hoffmann <kraxel@redhat.com> wrote:
>=20
>  Hi,
>=20
>> Unless we para-virtualize the keyboard?
>=20
> The main advantage of paste via key events is that it doesn't require
> guest support.

The main disadvantage, though, is that it does not work at all ;-)

Imagine pasting Ademar's favorite signature, :wq!
Or pasting "ahs" to a guest that thinks the control key is down
(a not uncommon occurence with VNC, in my personal experience).
So now you pasted "Select All, Delete, Save" in many GUI apps.

(insert infinite variations on the "doom" theme here)

>  Requiring any kind of software in the guest (paravirt
> keyboard driver, agent figuring the keymap, whatever else) kills that
> advantage.

Indeed. I was pointing out that any option that brought any modicum
of reasonable paste behavior (ignoring copy for the moment) required
some in-guest piece of software. So we might as well go for one that
is known to work, and also deals with the copy-from-guest issue.


>  And if we need guest cooperation anyway it is much better
> to just read/write the guest clipboard directly.

=E2=80=A6 which is exactly what VNC in the guest knows how to do in a
reasonable way, on a large number of platforms. So I don't see
any benefit to reinvent that wheel. I'd rather leverage the VNC
code to build a solid, multi-platform agent. You can extract the
clipboard code into some smaller agent that talks to a specific qemu
character device if you think it's a worthy optimization.


>=20
> Standard keyboard seems to not be an option either.  The HID specs
> (https://usb.org/document-library/hid-usage-tables-121) lists a
> Unicode Page (Section 18), which looks like it could be used to
> send unicode chars to the guest.  Problem is (a) this is 16bit
> only (so no emoji) and (b) widely unimplemented in guest OSes.

Some operating systems have a way to enter unicode code points.
On Linux, you can sometimes type shift-control u (hex code), but it's a bit
dependent on the some alignment of mysterious planets.
On Windows, you can type <hex> alt-x. Sometimes. Or alt + <hex>.
On macOS, you need to enable Unicode Hex Input, so unreliable.

Not that I would recommend trying any of that ;-)



