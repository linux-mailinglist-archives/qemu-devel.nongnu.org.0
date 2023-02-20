Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7569D510
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 21:39:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUCuz-0003IX-RE; Mon, 20 Feb 2023 15:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCuy-0003I9-03
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pUCuw-00018c-Ai
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 15:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676925465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7d3gEh2+5qlRKXLvmGFb/IvmK+QhQwu6ICYMI8ioFBk=;
 b=LApM7ZADCQ6/iBEGWm9f/rK5u05eevnW/8u2gw/PshosVHAt/J8UDSRkWslXcBA9362Gt7
 KmCDS75UExu7S75NPMAMhPRqjh27trZd4x4dYWszr4G9aGC8sq4NFroD5dJkBNnSc87Nlp
 64AygA5HaAz9pGSvrdUlvGC/6hOXcTw=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-mF7DFefKN6CRjADqmDjfDQ-1; Mon, 20 Feb 2023 15:37:43 -0500
X-MC-Unique: mF7DFefKN6CRjADqmDjfDQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 o38-20020a635d66000000b004fbec68e875so583207pgm.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 12:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7d3gEh2+5qlRKXLvmGFb/IvmK+QhQwu6ICYMI8ioFBk=;
 b=3i8xPZy9B4d9chQNWa03BGGJgTpIWoYFVBhQVgoNzKgAQph2li/+BG9yT/NqxqocJ2
 S8qJEmK7BHVkh0xetpLjH1UioPjjHr5HRGmF9jJfey224bIpmwJ4aZIiWlvDObf1uocU
 yI0C0cxNE42SkqrxTh8n7CzCmIDjqywHFZdFhlr2m8735u23HwiXV6LYbrwnIDms9wMz
 v3PKcVUxQYJM71t2TX/7eayJ8u/5k162EVww8/owe2jszaaHnoEyEJsNDfXS/lnd924i
 Wt/yvVmz6TnJV2XhToRv4GgeQ7esSLpgfueK8/13B6JDMsdB2Cp51YVCvdx3D/zDZqt4
 Ryrw==
X-Gm-Message-State: AO0yUKVu6xzwvuGqUFwpd3OLUFRiFXkNpm/qhBHZPwdjR06NJ0FJfKVn
 E1G7T2jFnZlcOy2k2oGB1gLo/sgHwGjbQXv+eN7OEJIBu3wOp2/MHKgIh7DIauixDb7SFw8JjVR
 iV67hGSh2ztz4PS3a7kCxzJI8tvdyMuo=
X-Received: by 2002:a17:903:2986:b0:199:6e3:187a with SMTP id
 lm6-20020a170903298600b0019906e3187amr525679plb.6.1676925462722; 
 Mon, 20 Feb 2023 12:37:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8xmesOIv0cEHisJ/BJlFZacmK/O3N7tz/Bex8sOXw6+UyNHw4Ey7hHUVq3igOJ2Jv1eNBCNT2JPNDe9ZOD8VI=
X-Received: by 2002:a17:903:2986:b0:199:6e3:187a with SMTP id
 lm6-20020a170903298600b0019906e3187amr525677plb.6.1676925462344; Mon, 20 Feb
 2023 12:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
 <20230215132547.1620575-2-vsementsov@yandex-team.ru>
In-Reply-To: <20230215132547.1620575-2-vsementsov@yandex-team.ru>
From: John Snow <jsnow@redhat.com>
Date: Mon, 20 Feb 2023 15:37:30 -0500
Message-ID: <CAFn=p-ZS5dis8Q2DWcFrXAEJuj0ek0K0fJ8Whdk9mh=djLAmPg@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] python: fix superfluous-parens pylint error
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, crosa@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 15, 2023 at 8:26 AM Vladimir Sementsov-Ogievskiy
<vsementsov@yandex-team.ru> wrote:
>
> Now make check-dev called in python/ directory fails due to this error.
> Let's fix it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Reviewed-by: John Snow <jsnow@redhat.com>

I've got a similar patch queued already in jsnow/python, I'll send the PR soon.

--js

> ---
>  python/qemu/qmp/protocol.py                            | 2 +-
>  python/qemu/qmp/qmp_client.py                          | 2 +-
>  tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
> index 6d3d739daa..22e60298d2 100644
> --- a/python/qemu/qmp/protocol.py
> +++ b/python/qemu/qmp/protocol.py
> @@ -207,7 +207,7 @@ class AsyncProtocol(Generic[T]):
>      logger = logging.getLogger(__name__)
>
>      # Maximum allowable size of read buffer
> -    _limit = (64 * 1024)
> +    _limit = 64 * 1024
>
>      # -------------------------
>      # Section: Public interface
> diff --git a/python/qemu/qmp/qmp_client.py b/python/qemu/qmp/qmp_client.py
> index b5772e7f32..9d73ae6e7a 100644
> --- a/python/qemu/qmp/qmp_client.py
> +++ b/python/qemu/qmp/qmp_client.py
> @@ -198,7 +198,7 @@ async def run(self, address='/tmp/qemu.socket'):
>      logger = logging.getLogger(__name__)
>
>      # Read buffer limit; 10MB like libvirt default
> -    _limit = (10 * 1024 * 1024)
> +    _limit = 10 * 1024 * 1024
>
>      # Type alias for pending execute() result items
>      _PendingT = Union[Message, ExecInterruptedError]
> diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> index fc9c4b4ef4..dda55fad28 100755
> --- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> +++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
> @@ -84,7 +84,7 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
>                  e['vm'] = 'SRC'
>              for e in self.vm_b_events:
>                  e['vm'] = 'DST'
> -            events = (self.vm_a_events + self.vm_b_events)
> +            events = self.vm_a_events + self.vm_b_events
>              events = [(e['timestamp']['seconds'],
>                         e['timestamp']['microseconds'],
>                         e['vm'],
> --
> 2.34.1
>


