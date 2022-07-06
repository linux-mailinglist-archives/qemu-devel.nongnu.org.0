Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E924568BE9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 16:54:47 +0200 (CEST)
Received: from localhost ([::1]:35866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o96QQ-0005Wh-1y
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 10:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o96PX-0004mF-2X
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o96PT-0004o2-Ef
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 10:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657119225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fh1fDYTC+D3PBVizxbAy6PgyCrKsh4I0ccmIu6wAu/o=;
 b=FWYLsRP7pMFTt1/YhSfFOvyau9WMcY0pqhjk6000SptqBc5lmhvgfvP8076aXTAxojzMxT
 t2beEymC6/6wds2JSG97/Do/WfjNYDFEhxBa/HmwhIjAXiwK7ipgbZykE6L0SYZ9hfLltg
 UQrW6F1KnZGokot9sGDOmXg+Vj3rmJc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-DcLyffO_OwKDOuivBbEgTw-1; Wed, 06 Jul 2022 10:53:44 -0400
X-MC-Unique: DcLyffO_OwKDOuivBbEgTw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-31c972f5f84so59146417b3.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 07:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fh1fDYTC+D3PBVizxbAy6PgyCrKsh4I0ccmIu6wAu/o=;
 b=lVJpdh1eE21jXr4SLVHBaJXfetGNTVOvyVLzcuQPnqGWj1rj8aBINwZ51coK+wRD3f
 A6/94KdF9Q0y71pcLhlECy0447+SZPY1s8p78yJpfm8RutRPNTBxoefqZwiY2yanV/0m
 oYcbYuQSPi999NvdIYR0dFCK4m+Y+DhztKZOrsurX5Wl5x86u0UTHKwWk3v5oUl7sMSp
 WIMSji3GeBZ0V8Sihvfayxyf6ZeCUAOuphHS8wPwLegOdDzwAasyVSSAxvLF/IbONVHX
 Bs1/YuddS6FffkY/Lza4Cz81dS4utWMUUUGZ/gZ8l81ZQGYfclSSB3KKf4Hl3UBBPT4U
 25Vg==
X-Gm-Message-State: AJIora8xXpp7+g4GFnE4bVQOJupaRtB8botNo0isc67hRxg2Z/kfU1H0
 kJcgXQQTHDvIGw7msXNl/XGWmVBJVQvGUFy+qpxq4j8Rkc9IGA/3erOPXJuz2f6tCl/uzLuB2JA
 IuEb3FVoromG9YaC1RAHRtsThznOTFro=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr43891680ybj.7.1657119224026; 
 Wed, 06 Jul 2022 07:53:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBUSdM0dAFW88B7c0ndBrcktWtjMnf1oKQBgA3S207b0EA4QT8oJagA2LUDkF8qtSbPkl36Zn5LsrB0hDnNOQ=
X-Received: by 2002:a25:b90c:0:b0:668:b8b8:ba5a with SMTP id
 x12-20020a25b90c000000b00668b8b8ba5amr43891652ybj.7.1657119223655; Wed, 06
 Jul 2022 07:53:43 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 09:53:43 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-6-victortoso@redhat.com>
 <CABJz62MhUS4LNOWNwPdf0vwwL2JMUzkmLrPBotezchyomGg58Q@mail.gmail.com>
 <YsRrHbNAZCjmQUcL@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YsRrHbNAZCjmQUcL@redhat.com>
Date: Wed, 6 Jul 2022 09:53:43 -0500
Message-ID: <CABJz62Pr+7tSGKLpe+OQfhmW_SwaVwdeS2=vmieTjAioiCdV7Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/8] qapi: golang: Generate qapi's event types in Go
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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

On Tue, Jul 05, 2022 at 05:47:25PM +0100, Daniel P. Berrang=C3=A9 wrote:
> On Tue, Jul 05, 2022 at 08:45:54AM -0700, Andrea Bolognani wrote:
> > On Fri, Jun 17, 2022 at 02:19:29PM +0200, Victor Toso wrote:
> > > func (s *AcpiDeviceOstEvent) GetTimestamp() Timestamp {
> > >     return s.EventTimestamp
> > > }
> >
> > Does this even need a getter? The struct member is public, and Go
> > code seems to favor direct member access.
>
> It satisfies the 'Event' interface, so you can fetch timestamp
> without needing to know the specific event struct you're dealing
> with.

Yeah but we're generating structs for all possible events ourselves
and we don't really expect external implementations of this
interface so I don't see what having this getter buys us over the
guarantee, that we have by construction, that all events will have a
public member with a specific name that contains the timestamp.

> I don't think this kind of detail really needs to be exposed to
> clients. Also parsing the same json doc twice just feels wrong.
>
> I think using the dummy union structs is the right approach, but
> I'd just call it 'EventFromJSON' rather than 'UnmarshalJSON' to
> make it clear this is different from a normal 'UnmarshalJSON'
> method.

Fair point on avoiding parsing the JSON twice.

I still don't like the fact that we have to force clients to use a
non-standard API, or that the API for events has to be different from
that for unions. But Go won't let you add method implementations to
an interface, so we're kinda stuck.

The only alternative I can think of would be to define Event as

  type Event struct {
      Shutdown *ShutdownEvent
      Reset    *ResetEvent
      // and so on
  }

which wouldn't be too bad from client code, as you'd only have to
change from

  e, err :=3D EventFromJSON(in)
  switch v :=3D e.(type) {
      case ShutdownEvent:
         // do something with v
      case ResetEvent:
         // do something with v
      // and so on
  }

to

  err :=3D json.UnmarshalJSON(in, &e)
  if e.Shutdown !=3D nil {
      // do something with e.Shutdown
  } else if e.Reset !=3D nil {
      // do something with e.Reset
  } // and so on

but that would mean each time we have to parse an event we'd end up
allocating room for ~50 pointers and only actually using one, which
is a massive waste.

--=20
Andrea Bolognani / Red Hat / Virtualization


