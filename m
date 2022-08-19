Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18910599F1E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 18:29:31 +0200 (CEST)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP4sE-0008VH-1o
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 12:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oP4q7-0006La-Tb
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:27:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1oP4q5-0005YI-43
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 12:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660926436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tBsgB8p3BaEYFbuPlydsQEUM3MS+Mdzwya6mAqQHhwI=;
 b=DgKvh3BpqqzJgGdl74/PZJasvEoh5O7nyH+TOQTCSdiPtjbNkPGof0jjS+iyoYIJYQ3jKy
 HX8+6I3qjeCCBkXl3PrWCU/coo9fgYGUj3Ji8cJHLZinKjJ8C121Zx2CMiWluM38yANvt5
 YutpbQpdvmAoJ+OfYr37PwZfCOzwhFQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-Bd_X_tdbPnCwEa7Gm46VEw-1; Fri, 19 Aug 2022 12:27:14 -0400
X-MC-Unique: Bd_X_tdbPnCwEa7Gm46VEw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-336c3b72da5so80855557b3.6
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 09:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc;
 bh=tBsgB8p3BaEYFbuPlydsQEUM3MS+Mdzwya6mAqQHhwI=;
 b=GCiOxfjczoyTG3a+7NgKLRv3cxznvZO7IAnFy73r/vUt8WFHNoMhss5+5ySnfbZKeN
 B+kYqPE47Byl7Iz/+RQsJY6BHlPMRG6DGOZL9UZK+w41lIcgGZ2OHMjQyKxFF4w38ja1
 nfjq48nXp77ivfetrviJTUhjA6IuEo5/ruFcL1VLGZyO5doIoUxLQzvTsnccpkok1rNo
 SL7cx3qlKuCOpP9DgUhB89Ivr61za27YKJFK5ceLb80bvY3vE2Jz9/rxG3xVEebmhrfh
 Gfrcy8Kfi8y508pg9EimHhtag1SKD1pTu8UDmK+pAhGVvLQ0vBAmDXM6Fdexo7a8ue1h
 xbaA==
X-Gm-Message-State: ACgBeo3hWHRJNU8Uv3lhjpMpfRNOQ6HM5QHXSowRI9XniV9V7gNX3U0G
 RIslUrxB4OYzZMwGC65ulm/MzRv76hT6++DYkqvVIuRFrUYRL32Jf8732WT74emOA+YvJLNUJ45
 2rvpNCtc28Nn8hGT5zY73yv9Mbq7EB30=
X-Received: by 2002:a25:6611:0:b0:67b:e0c2:3239 with SMTP id
 a17-20020a256611000000b0067be0c23239mr8091461ybc.18.1660926434236; 
 Fri, 19 Aug 2022 09:27:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7EW+W6WeG6AxNS0oY+8MNtssOo2BK6XUbachIhsW5DyseqU6x7M+QKUiPM4HaxA1lH+eP8NGOTeHnU9/Hq1As=
X-Received: by 2002:a25:6611:0:b0:67b:e0c2:3239 with SMTP id
 a17-20020a256611000000b0067be0c23239mr8091442ybc.18.1660926433999; Fri, 19
 Aug 2022 09:27:13 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Aug 2022 11:27:13 -0500
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
 <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
 <20220817140419.vpxjay4ouaz2gsam@tapioca>
MIME-Version: 1.0
In-Reply-To: <20220817140419.vpxjay4ouaz2gsam@tapioca>
Date: Fri, 19 Aug 2022 11:27:13 -0500
Message-ID: <CABJz62PZvdem1C-m-ODVMLrFaN6kqqJm0qyvbLxqeRPXL5jDaA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate types
 in Go
To: Victor Toso <victortoso@redhat.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Aug 17, 2022 at 04:04:19PM +0200, Victor Toso wrote:
> On Tue, Jul 05, 2022 at 08:45:06AM -0700, Andrea Bolognani wrote:
> > On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
> > > func (s *BlockdevRef) UnmarshalJSON(data []byte) error {
> > >     // Check for json-null first
> > >     if string(data) == "null" {
> > >         return errors.New(`null not supported for BlockdevRef`)
> > >     }
> > >     // Check for BlockdevOptions
> > >     {
> > >         s.Definition = new(BlockdevOptions)
> > >         if err := StrictDecode(s.Definition, data); err == nil {
> > >             return nil
> > >         }
> >
> > The use of StrictDecode() here means that we won't be able to
> > parse an alternate produced by a version of QEMU where
> > BlockdevOptions has gained additional fields, doesn't it?
>
> That's correct. This means that with this RFCv2 proposal, qapi-go
> based on qemu version 7.1 might not be able to decode a qmp
> message from qemu version 7.2 if it has introduced a new field.
>
> This needs fixing, not sure yet the way to go.
>
> > Considering that we will happily parse such a BlockdevOptions
> > outside of the context of BlockdevRef, I think we should be
> > consistent and allow the same to happen here.
>
> StrictDecode is only used with alternates because, unlike unions,
> Alternate types don't have a 'discriminator' field that would
> allow us to know what data type to expect.
>
> With this in mind, theoretically speaking, we could have very
> similar struct types as Alternate fields and we have to find on
> runtime which type is that underlying byte stream.
>
> So, to reply to your suggestion, if we allow BlockdevRef without
> StrictDecode we might find ourselves in a situation that it
> matched a few fields of BlockdevOptions but it the byte stream
> was actually another type.

IIUC your concern is that the QAPI schema could gain a new type,
TotallyNotBlockdevOptions, which looks exactly like BlockdevOptions
except for one or more extra fields.

If QEMU then produced a JSON like

  { "description": { /* a TotallyNotBlockdevOptions here */ } }

and we'd try to deserialize it with Go code like

  ref := BlockdevRef{}
  json.Unmarsal(&ref)

we'd end up mistakenly parsing the TotallyNotBlockdevOptions as a
valid BlockdevOptions, dropping the extra fields in the process.

Does that correctly describe the reason why you feel that the use of
StrictDecode is necessary?

If so, I respectfully disagree :)

If the client code is expecting a BlockdevRef as the return value of
a command and QEMU is producing something that is *not* a BlockdevRef
instead, that's an obvious bug in QEMU. If the client code is
expecting a BlockdevRef as the return value of a command that is
specified *not* to return a BlockdevRef, that's an obvious bug in the
client code.

In neither case it should be the responsibility of the SDK to
second-guess the declared intent, especially when it's perfectly
valid for a type to be extended in a backwards-compatible way by
adding fields to it.

-- 
Andrea Bolognani / Red Hat / Virtualization


