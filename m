Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665355529BC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 05:38:01 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3UiF-0001J9-W3
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 23:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3Ugb-0000ZH-0s
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o3UgR-0002nA-44
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 23:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655782566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XfFF+59WvY3X6hhugSPmKaCn1+S6XGXqX17TJcsKQZQ=;
 b=C9U20ZDGZhoLRywXwEL6Rx/li18TPikc52jEeVBBvqSfRJRXiTgYbYSgxRn5efMFUpvHaK
 pXkDSEKHLA+FglIY5K5diD4NFQ8b0OLcRg4PyWWQp/625QgIDb3+5KJksnTdrdpeUW4XO+
 wUeuwUs01mrzH/FL+JPe0LigHvZNxi0=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-qqPYbHVFNTuPhwlbsu9-mA-1; Mon, 20 Jun 2022 23:35:59 -0400
X-MC-Unique: qqPYbHVFNTuPhwlbsu9-mA-1
Received: by mail-oi1-f200.google.com with SMTP id
 c5-20020a056808138500b003331cc39f1cso4179231oiw.20
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 20:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=XfFF+59WvY3X6hhugSPmKaCn1+S6XGXqX17TJcsKQZQ=;
 b=0yuKeUMQwb30G7AC3tZuwVe3JBiqWMYRV1WlGm7yd68hQfPy3DHK8T0YexsgpdfAla
 TyC8H5ejcwvJ5lPQN8raLHD+QWIVzIcujbXHdVGgxlRoEFMX8IZlnLh2lfZx547YIlr3
 M39mNURPM27FKg+nSVGB33DRFxIjT5kLWfaOWtsL1yHYKAJrauZDud3kaE1bfa2wVGZ8
 xjL++DowKlNVyOQ+IdQ8ATTpfWYGhBw5QrCFXb0O36w9MOPyW207ioYzt11qhWJDrd/h
 2qQpb8O4q9IEk3s55bgLYi9kTWtWH2FIVav4HLsEeem/w2zXU6xfy8bzcBIuJTa5qFxC
 eIVA==
X-Gm-Message-State: AJIora9pk7maSHWr1rYB2mDA5hTFQpQSHxwenOrIcUSchaFyIbOui92I
 6Nr4CBagnU/eH0XOBpqGKADz56A0+4N9lNvuud5Ko/b5Q35T5NZdktG63+JYEWZ3Y+K4ZelCjSo
 p6CwlwnHmSZ8nAOM=
X-Received: by 2002:a05:6870:c18a:b0:101:fe5b:bd4e with SMTP id
 h10-20020a056870c18a00b00101fe5bbd4emr3200957oad.275.1655782558450; 
 Mon, 20 Jun 2022 20:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uy+XXxt+R1es2ombKGxNFalotWqySAeCMoR/6PDSKpcMEOD1Fis3HbwWWjZjPmkbGgI5y5RQ==
X-Received: by 2002:a05:6870:c18a:b0:101:fe5b:bd4e with SMTP id
 h10-20020a056870c18a00b00101fe5bbd4emr3200946oad.275.1655782558207; 
 Mon, 20 Jun 2022 20:35:58 -0700 (PDT)
Received: from ?IPv6:2804:431:c7f0:d933:8f52:267a:639c:b4c0?
 ([2804:431:c7f0:d933:8f52:267a:639c:b4c0])
 by smtp.gmail.com with ESMTPSA id
 y125-20020acae183000000b00325cda1ff8esm8403537oig.13.2022.06.20.20.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 20:35:57 -0700 (PDT)
Message-ID: <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, "Dr.
 David Alan Gilbert"
 <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?=E5=BE=90=E9=97=AF?=
 <xuchuangxclwt@bytedance.com>, qemu-devel@nongnu.org
Date: Tue, 21 Jun 2022 00:35:54 -0300
In-Reply-To: <YrCV089JKhc067sm@xz-m1.local>
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com> <87wndb4riu.fsf@secure.mitica>
 <YrCV089JKhc067sm@xz-m1.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2022-06-20 at 11:44 -0400, Peter Xu wrote:
> On Mon, Jun 20, 2022 at 11:23:53AM +0200, Juan Quintela wrote:
> > Once discussed this, what I asked in the past is that you are having to=
o
> > much dirty memory on zero_copy.=C2=A0 When you have a Multiterabyte gue=
st, in
> > a single round you have a "potentially" dirty memory on each channel of=
:
> >=20
> > =C2=A0=C2=A0 total_amount_memory / number of channels.
> >=20
> > In a Multiterabyte guest, this is going to be more that probably in the
> > dozens of gigabytes.=C2=A0 As far as I know there is no card/driver tha=
t will
> > benefit for so many pages in zero_copy, and kernel will move to
> > synchronous copy at some point.=C2=A0 (In older threads, daniel showed =
how to
> > test for this case).
>=20
> I was wondering whether the kernel needs to cache a lot of messages for
> zero copy if we don't flush it for a long time, as recvmsg(MSG_ERRQUEUE)
> seems to be fetching one message from the kernel one at a time.=C2=A0 And=
,
> whether that queue has a limit in length or something.

IIRC, if all messages look the same, it 'merges' them in a single message, =
like,
'this range has these flags and output'.

So, if no issue happens, we should have a single message with the confirmat=
ion
of all sent buffers, meaning just a little memory is used for that.

>=20
> Does it mean that when the kernel could have cached enough of these
> messages then it'll fallback to the no-zero-copy mode?=C2=A0 And probably=
 that's
> the way how kernel protects itself from using too much buffer for the err=
or
> msgs?

Since it merges the messages, I don't think it uses a lot of space for that=
.

IIRC, the kernel will fall back to copying only if the network adapter / dr=
iver
does not support MSG_ZEROCOPY, like when it does not support scatter-gather=
.

>=20
> This reminded me - Leo, have you considered adding the patch altogether t=
o
> detect the "fallback to non-zero-copy" condition?=C2=A0 Because when with=
 it and
> when the fallback happens at some point (e.g. when the guest memory is
> larger than some value) we'll know.

I still did not consider that, but sure, how do you see that working?

We can't just disable zero-copy-send because the user actually opted in, so=
 we
could instead add a one time error message for when it falls back to copyin=
g, as
it should happen in the first try of zero-copy send.

Or we could fail the migration, stating the interface does not support
MSG_ZEROCOPY, since it should happen in the first sendmsg().

I would personally opt for the last option.

What do you think?

>=20
> Thanks,
>=20

Thanks Peter!

Best regards,
Leo


