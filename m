Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45DB516D18
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:08:46 +0200 (CEST)
Received: from localhost ([::1]:55220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlS2u-00071b-S5
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlRzy-0005yh-Lp
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:05:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nlRzu-0002Fr-VW
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651482336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=stQQgQ/34g4IiampLdkjBy6YpZGpUvPt6ds6hjxHfF4=;
 b=Rs7BpTdBxvJE3EZh1lujrOuy5XGh8hPt4mhoE00h40gDO00a/spUjsaCXLdXBE9P6hjfzx
 j6OIBRV5mXS/7oV2Hb/f7EH7XLzfz/zDImOCl4qD7y/46WNrh98udt9F7flS0E4SyvufzA
 ytzYd9+lQmfAd2jkvplv0NCUEGx1dsc=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-290-5ImHllwtPymlRzqSADjlhw-1; Mon, 02 May 2022 05:04:14 -0400
X-MC-Unique: 5ImHllwtPymlRzqSADjlhw-1
Received: by mail-yb1-f198.google.com with SMTP id
 d22-20020a25add6000000b00645d796034fso12684486ybe.2
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 02:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:references:mime-version:in-reply-to:date
 :message-id:subject:to:cc;
 bh=stQQgQ/34g4IiampLdkjBy6YpZGpUvPt6ds6hjxHfF4=;
 b=bi06PLFTa+dWiLiulm942dj++CWbeB3Tuj47koBfwDm/RueDVm64Qhbvu3SEwveFrL
 gghn49MB/2P8Z/eEEnLXykoeAIRZcseHwgDgp9348BHRCrv+SftahKwNlD+i1uhyX8Nz
 A3uzmSb8APr0MZEu/ypGsNMey2TEtdozOnrlw9iae/SznZXyhVOFxVzLMWs2V4VTJea6
 8IHCSdoTlD7Y84Cw9Wp2YRZ814Uy1UMYlMf3ymIEYMrsJtJ6l0at8hXJzOv84pUbeXlx
 T4Y9wgSnsDXgkEo6w3ZDMmvk4j7x3VQ3OgQqOTWqVdh2omQhxDkyqHXw1dcXBNvZcK1M
 /u6Q==
X-Gm-Message-State: AOAM531Zbgw2srx/5aAA11khgJrK+ak3egsvfCx5XY9nXfPzn6KIOh82
 85t8oPntfGHMqpnJtB6KMxDcKC72C7Pnf1jXvC7Q2jLWptAPvy+ecCGrvqdtBH6lnOCVv0J+co4
 KHJDgkm4nQMFxZ6/I+0pTTCW9XRY1S18=
X-Received: by 2002:a25:1307:0:b0:649:9048:a411 with SMTP id
 7-20020a251307000000b006499048a411mr2482652ybt.7.1651482254048; 
 Mon, 02 May 2022 02:04:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+QZm+0ISrUZfP4yfEKx63d1WBKVu4FgMOD93CaDcNXWVDoOhc4tKssC77lMfk99aCk2jOOi0SfphebOk4rHo=
X-Received: by 2002:a25:1307:0:b0:649:9048:a411 with SMTP id
 7-20020a251307000000b006499048a411mr2482636ybt.7.1651482253839; Mon, 02 May
 2022 02:04:13 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 05:04:13 -0400
From: Andrea Bolognani <abologna@redhat.com>
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 <87v8uos8lb.fsf@pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v8uos8lb.fsf@pond.sub.org>
Date: Mon, 2 May 2022 05:04:13 -0400
Message-ID: <CABJz62MTVhDHZo5+sTJKm5b+SZM_W+_o5VmMgx0NVyibYfs=hw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 09:21:36AM +0200, Markus Armbruster wrote:
> Andrea Bolognani <abologna@redhat.com> writes:
> > The wire protocol would still retain the unappealing name, but at
> > least client libraries could hide the uglyness from users.
>
> At the price of mild inconsistency between the library interface and
> QMP.

That's fine, and in fact it already happens all the time when QAPI
names (log-append) are translated to C identifiers (log_append).

> We could clean up QMP if we care, keeping around the old names for
> compatibility.  See also Kevin's work on QAPI aliases.  Which is much
> more ambitious, though.

I wasn't aware of that effort. Personally I'm always in favor of
cleaning up inconsistencies, so I am automatically a fan :)

That said, the idea of exposing a sub-par Go API until such massive
undertaking can be completed is not terribly appealing. And it would
not address every facet of the issue (see below).

> > Capitalization of these acronyms is inconsistent across the schema,
>
> Common issue with camel-cased compounds containing acronyms, because
> either way is ugly.

Agreed :) But consistent ugliness is still preferable to inconsistent
ugliness.

> > with one of the two forms disagreeing with Go naming expectations.
>
> Pardon my ignorance: What are Go's expectations?

Acronyms are usually all upper case:

  https://pkg.go.dev/net/http#ParseHTTPVersion
  https://pkg.go.dev/net/http#ProxyURL
  https://pkg.go.dev/crypto/tls#NewLRUClientSessionCache

The same seems to be true of Python:

  https://docs.python.org/3/library/http.html#http.HTTPStatus
  https://docs.python.org/3/library/urllib.error.html#urllib.error.URLError
  https://docs.python.org/3/library/xmlrpc.server.html#xmlrpc.server.SimpleXMLRPCServer

Rust, on the other hand, seems to prefer only capitalizing the first
letter of a word, no matter if it's an acronym:

  https://doc.rust-lang.org/std/net/struct.TcpStream.html
  https://doc.rust-lang.org/std/net/struct.Ipv4Addr.html
  https://doc.rust-lang.org/std/ffi/struct.OsString.html

Whether different naming conventions are used for types, functions
and struct members is also language-dependent.

> > In this case we might be able to just change the schema without
> > introducing backwards compatibility issues, though? Type names are
> > not actually transmitted on the wire IIUC.
>
> Correct!

That's great, but even if we decided to change all type names so that
the schema is internally consistent and follows a naming convention
that's reasonable for C, Go and Python, we'd still leave the Rust
interface looking weird... There's no one-size-fits-all name,
unfortunately.

> > Of course such annotations would only be necessary to deal with
> > identifiers that are not already following the expected naming
> > conventions and when MLAs are involved.
>
> Pardon my ignorance some more: what are MLAs?

Multi Letter Acronyms. Which are actually just called "acronyms" I
guess? O:-)

The point is that, if we want to provide a language interface that
feels natural, we need a way to mark parts of a QAPI symbol's name in
a way that makes it possible for the generator to know they're
acronyms and treat them in an appropriate, language-specific manner.

The obvious way to implement this would be with an annotation along
the lines of the one I proposed. Other ideas?

-- 
Andrea Bolognani / Red Hat / Virtualization


