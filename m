Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71D553501
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:54:34 +0200 (CEST)
Received: from localhost ([::1]:39924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3fGz-0005d3-MZ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3fEU-00046d-6H
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:51:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3fEP-0008Hx-JO
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655823109;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPBZiq8rngDUsBl1yN0SK/JaGIajVgel4NQCuarwPls=;
 b=M7aNtCpI7DhgHIxgSv6LZAr+y5WzR1hw13pwePQVTpkS6v0G7Zl/6tB7MbSQnhgsa/fdJU
 QSqqKgjlnSb+U547UCVwyE379Cirvxcuj+Qq9VAqd1yjsfpisvwBEAJupr0PdElNpSW7Yl
 XwReQirqe6B17RojGn6N9aCPaOBbHAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-ofSJo4QiMNiFkdcr1iju8g-1; Tue, 21 Jun 2022 10:51:48 -0400
X-MC-Unique: ofSJo4QiMNiFkdcr1iju8g-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so4395522wmr.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 07:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPBZiq8rngDUsBl1yN0SK/JaGIajVgel4NQCuarwPls=;
 b=CLf0j+HAy54+NW+G4USxPanX3xeEFE6ke+6Ab6Il9zxjoXjFb27fJkTaqEaCBwYh8G
 oKbQLY7nTmJeVmPb58LlADkOrnXAlON51DHRNmFFEaDAAAmlJ2J4sjDJ6f7yht+sxTLC
 +lJt5f59EpM2zzU/+3zos84tyWmNDI28I/riQ8cuY7M3RMIyqM3WX8nitB7lVViDyNt+
 0eWPrUL97BeJcIAgTZAGuevs08fbJ2DJ+v9iiD+pTZdPQbEmlWs9psRt06J/5kN4glkF
 YmijTCKSB7G9zLW1mVuZodS0X51i0J5dKO1kaiVwsETV/sL331eBa6NQZKv5ik1OdShG
 DcXw==
X-Gm-Message-State: AJIora8SWPya/5cOy35pqh07fAFXAkTJl52GO+fR3ciqiHH1HXCCg2mN
 kBS5yUp/uCR0ecAoqcJgms/XxWUW1SX0lcfnO5ufFgcXDNr7biXSBc6aLPw9x2rKfGa1MpJQYNh
 0DTjONc8Ic35zc6o=
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id
 r14-20020a05600c35ce00b0039c7dc2aec0mr30986917wmq.33.1655823102274; 
 Tue, 21 Jun 2022 07:51:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNhowo+YR06h6AnhlErHMlnVxJuqsE0xB0EUIKVZVBd5Qf2xS7KUrmyBpCtTI2tiR3pGXe9g==
X-Received: by 2002:a05:600c:35ce:b0:39c:7dc2:aec0 with SMTP id
 r14-20020a05600c35ce00b0039c7dc2aec0mr30986893wmq.33.1655823102012; 
 Tue, 21 Jun 2022 07:51:42 -0700 (PDT)
Received: from localhost ([31.4.180.61]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5d63c5000000b0020c5253d8c2sm15645615wrw.14.2022.06.21.07.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 07:51:41 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: Peter Xu <peterx@redhat.com>,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  "Daniel P." =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Markus Armbruster <armbru@redhat.com>,
 =?utf-8?B?5b6Q6Zev?= <xuchuangxclwt@bytedance.com>,  qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/4] migration: zero-copy flush only at the end of
 bitmap scanning
In-Reply-To: <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Tue, 21 Jun 2022 00:35:54
 -0300")
References: <20220620053944.257547-1-leobras@redhat.com>
 <20220620053944.257547-4-leobras@redhat.com>
 <87wndb4riu.fsf@secure.mitica> <YrCV089JKhc067sm@xz-m1.local>
 <7fbc118dedbaf7d01dd72220255affc98abffc9d.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 21 Jun 2022 16:51:39 +0200
Message-ID: <875ykuvzlw.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Mon, 2022-06-20 at 11:44 -0400, Peter Xu wrote:
>> On Mon, Jun 20, 2022 at 11:23:53AM +0200, Juan Quintela wrote:
>> > Once discussed this, what I asked in the past is that you are having t=
oo
>> > much dirty memory on zero_copy.=C2=A0 When you have a Multiterabyte gu=
est, in
>> > a single round you have a "potentially" dirty memory on each channel o=
f:
>> >=20
>> > =C2=A0=C2=A0 total_amount_memory / number of channels.
>> >=20
>> > In a Multiterabyte guest, this is going to be more that probably in the
>> > dozens of gigabytes.=C2=A0 As far as I know there is no card/driver th=
at will
>> > benefit for so many pages in zero_copy, and kernel will move to
>> > synchronous copy at some point.=C2=A0 (In older threads, daniel showed=
 how to
>> > test for this case).
>>=20
>> I was wondering whether the kernel needs to cache a lot of messages for
>> zero copy if we don't flush it for a long time, as recvmsg(MSG_ERRQUEUE)
>> seems to be fetching one message from the kernel one at a time.=C2=A0 An=
d,
>> whether that queue has a limit in length or something.
>
> IIRC, if all messages look the same, it 'merges' them in a single message=
, like,
> 'this range has these flags and output'.
>
> So, if no issue happens, we should have a single message with the confirm=
ation
> of all sent buffers, meaning just a little memory is used for that.
>
>>=20
>> Does it mean that when the kernel could have cached enough of these
>> messages then it'll fallback to the no-zero-copy mode?=C2=A0 And probabl=
y that's
>> the way how kernel protects itself from using too much buffer for the er=
ror
>> msgs?
>
> Since it merges the messages, I don't think it uses a lot of space for th=
at.
>
> IIRC, the kernel will fall back to copying only if the network adapter / =
driver
> does not support MSG_ZEROCOPY, like when it does not support scatter-gath=
er.

My understanding is that it will fallback when you have too much stuff
inflight.

>>=20
>> This reminded me - Leo, have you considered adding the patch altogether =
to
>> detect the "fallback to non-zero-copy" condition?=C2=A0 Because when wit=
h it and
>> when the fallback happens at some point (e.g. when the guest memory is
>> larger than some value) we'll know.
>
> I still did not consider that, but sure, how do you see that working?

send with zero_copy(1MB)
send with zero_copy(1MB)
.... (repeat)
at some point kernel decides:
sync all queue()
send synchronously next package.

we are not wondering if the kernel does this (it does).  What we are
wondering is when it does it, i.e. after 1MB worth of writes, 2MB, 10MB
....
That is the thing that depends on kernel/network card/driver.


> We can't just disable zero-copy-send because the user actually opted in, =
so we
> could instead add a one time error message for when it falls back to copy=
ing, as
> it should happen in the first try of zero-copy send.

On your 1st (or second) series, Dan Berrange explained hew to use the
error message interface to detect it.

> Or we could fail the migration, stating the interface does not support
> MSG_ZEROCOPY, since it should happen in the first sendmsg().

> I would personally opt for the last option.
>
> What do you think?

Later, Juan.


