Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6524256733A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 17:49:12 +0200 (CEST)
Received: from localhost ([::1]:46532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8knX-0004id-2H
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 11:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kjl-0002hZ-9B
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1o8kjg-0000by-SR
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 11:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657035910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt7TNUlNEutzptCBzGkJOOuEMS4QeW0+0l5zT/DKQ/o=;
 b=U4KMvwOLXkos9KSgmGSAzYxvvsR/6i3Xn0CJQ6UYC0Nsplv1eH2rQw/jupAjFwK+2ZCw2Z
 INroJ1iX55+XJwSzpy6Vu21jsFDt93HGFF1IUAegJQvsWCbPH/nqvj/+xOOZNRJEY0ztxi
 JjX2havFkv3beeQyalbw3+z5a09Kx0c=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-20rs3IFSPUyQzsp-0oA_3Q-1; Tue, 05 Jul 2022 11:45:08 -0400
X-MC-Unique: 20rs3IFSPUyQzsp-0oA_3Q-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-31797057755so89544997b3.16
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 08:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=wt7TNUlNEutzptCBzGkJOOuEMS4QeW0+0l5zT/DKQ/o=;
 b=jNj+awYm6WogSJMFzJVlB4vYax2vKL8mRTFusCdV4zJ7pyJbLwgkVj5b5X8CzQIoOq
 FPLiVBq0Ok4hFr1yeJ62+oXgdlvo5FzcnJUk5c2PT8VDaMyE3a/G/Rx6R1yQFipOdoAL
 g4aT0pwGGGGX9lHBpVs8mSkm2LtZBF0GLnkfnZmLveMcgCz7NenR0C2n2XlOZ0hZg0K1
 BF43nRsy2WZ3o0B6vu1mcgdrGRuNUeMZZY+yu+ZMDm76X6MOJpimNIdNwQZ/ux4COaHJ
 UfKVmGCGW8eBlAsVQdLPN86Isp0hqQXZ/6zHZ59l8oFrRe9J7ZVhN5vq0eVxNSn3opQj
 xj/Q==
X-Gm-Message-State: AJIora+6Kxkt2WUxRlPD7Nc9vkT2Bk2dOLa4Qi5XH3IVswRytBu9kmXD
 RaVphUSIKj2I48+fQ0OFY5QB4/tVZMQ8Mfm/Zj9x8iP+YAb8f0cb3Sf27TPhLg+afbcjFp8LJKR
 wARFqJvBAbd6TVdVtwanjxB3h7gB5Fuc=
X-Received: by 2002:a81:6f56:0:b0:31b:c2d1:3c96 with SMTP id
 k83-20020a816f56000000b0031bc2d13c96mr42230806ywc.87.1657035907689; 
 Tue, 05 Jul 2022 08:45:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vooXA7lAFyHUtbS/mXaMVawIbikXgPSIMTXI87wtsy7vRK8nDXtEqxuqKibZ9KexozXv6htp3x3ry2vPQkafk=
X-Received: by 2002:a81:6f56:0:b0:31b:c2d1:3c96 with SMTP id
 k83-20020a816f56000000b0031bc2d13c96mr42230770ywc.87.1657035907338; Tue, 05
 Jul 2022 08:45:07 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Jul 2022 08:45:06 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220617121932.249381-3-victortoso@redhat.com>
Date: Tue, 5 Jul 2022 08:45:06 -0700
Message-ID: <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
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

Sorry it took me a while to find the time to look into this!

Overall this second iteration is a significant improvement over the
initial one. There are still a few things that I think should be
changed, so for the time being I'm going to comment mostly on the
generated Go code and leave the details of the implementation for
later.


On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
> This patch handles QAPI alternate types and generates data structures
> in Go that handles it.
>
> At this moment, there are 5 alternates in qemu/qapi, they are:
>  * BlockDirtyBitmapMergeSource
>  * Qcow2OverlapChecks
>  * BlockdevRef
>  * BlockdevRefOrNull
>  * StrOrNull

I personally don't think it's very useful to list all the alternate
types in the commit message, or even mention how many there are. You
do this for all other types too, and it seems to me that it's just an
opportunity for incosistent information to make their way to the git
repository - what if a new type is introduced between the time your
series is queued and merged? I'd say just drop this part.

> Example:
>
> qapi:
>   | { 'alternate': 'BlockdevRef',
>   |   'data': { 'definition': 'BlockdevOptions',
>   |             'reference': 'str' } }
>
> go:
>   | type BlockdevRef struct {
>   |         Definition *BlockdevOptions
>   |         Reference  *string
>   | }
>
> usage:
>   | input := `{"driver":"qcow2","data-file":"/some/place/my-image"}`
>   | k := BlockdevRef{}
>   | err := json.Unmarshal([]byte(input), &k)
>   | if err != nil {
>   |     panic(err)
>   | }
>   | // *k.Definition.Qcow2.DataFile.Reference == "/some/place/my-image"

Let me just say that I absolutely *love* how you've added these bits
comparing the QAPI / Go representations as well as usage. They really
help a lot understanding what the generator is trying to achieve :)

> +// Creates a decoder that errors on unknown Fields
> +// Returns true if successfully decoded @from string @into type
> +// Returns false without error is failed with "unknown field"
> +// Returns false with error is a different error was found
> +func StrictDecode(into interface{}, from []byte) error {
> +    dec := json.NewDecoder(strings.NewReader(string(from)))
> +    dec.DisallowUnknownFields()
> +
> +    if err := dec.Decode(into); err != nil {
> +        return err
> +    }
> +    return nil
> +}

The documentation doesn't seem to be consistent with how the function
actually works: AFAICT it returns false *with an error* for any
failure, including those caused by unknown fields being present in
the input JSON.


Looking at the generated code:

> type BlockdevRef struct {
>     Definition *BlockdevOptions
>     Reference  *string
> }
>
> func (s BlockdevRef) MarshalJSON() ([]byte, error) {
>     if s.Definition != nil {
>         return json.Marshal(s.Definition)
>     } else if s.Reference != nil {
>         return json.Marshal(s.Reference)
>     }
>     return nil, errors.New("BlockdevRef has empty fields")

Returning an error if no field is set is good. Can we be more strict
and returning one if more than one is set as well? That feels better
than just picking the first one.

> func (s *BlockdevRef) UnmarshalJSON(data []byte) error {
>     // Check for json-null first
>     if string(data) == "null" {
>         return errors.New(`null not supported for BlockdevRef`)
>     }
>     // Check for BlockdevOptions
>     {
>         s.Definition = new(BlockdevOptions)
>         if err := StrictDecode(s.Definition, data); err == nil {
>             return nil
>         }

The use of StrictDecode() here means that we won't be able to parse
an alternate produced by a version of QEMU where BlockdevOptions has
gained additional fields, doesn't it?

Considering that we will happily parse such a BlockdevOptions outside
of the context of BlockdevRef, I think we should be consistent and
allow the same to happen here.

>         s.Definition = nil
>     }
>     // Check for string
>     {
>         s.Reference = new(string)
>         if err := StrictDecode(s.Reference, data); err == nil {
>             return nil
>         }
>         s.Reference = nil
>     }
>
>     return errors.New(fmt.Sprintf("Can't convert to BlockdevRef: %s", string(data)))

On a similar note to the MarshalJSON comment above, I'm not sure this
is right.

If we find that more than one field of the alternate is set, we
should error out - that's just invalid JSON we're dealing with. But
if we couldn't find any, that might be valid JSON that's been
produced by a version of QEMU that introduced additional options to
the alternate. In the spirit of "be liberal in what you accept", I
think we should probably not reject that? Of course then the client
code will have to look like

  if r.Definition != nil {
      // do something with r.Definition
  } else if r.Reference != nil {
      // do something with r.Reference
  } else {
      // we don't recognize this - error out
  }

but the same is going to be true for enums, events and everything
else that can be extended in a backwards-compatible fashion.

-- 
Andrea Bolognani / Red Hat / Virtualization


