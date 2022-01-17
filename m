Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DD4910BC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 20:39:00 +0100 (CET)
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9XqF-0001dt-By
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 14:38:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9XeL-0000tg-3F
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:26:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n9XeD-0003X2-M3
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 14:26:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642447591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3KWWF3397I6S50fttLlbzGD3INzd8M9j6IJpqSYkRc8=;
 b=XHnHnM5JGenbVhEOu9+qh9uLLGAmRRvQXhuohZX36EPmE20k1ZKfaB5c/b5rqSFWWEip9I
 XG+h9jvc9cOT78ax5t1e/vziE5B0bDqRzaXpv7T6xOnpXNUj+YYwqnM2iSVjlnOs0/jhR9
 9RanaynuMXxdJnXdelCoyY075KfUP7g=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-spcXm2EMN0SgMVl6yYgkqA-1; Mon, 17 Jan 2022 14:26:30 -0500
X-MC-Unique: spcXm2EMN0SgMVl6yYgkqA-1
Received: by mail-ua1-f72.google.com with SMTP id
 v10-20020ab036ca000000b003068cf1e17bso10574874uau.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 11:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3KWWF3397I6S50fttLlbzGD3INzd8M9j6IJpqSYkRc8=;
 b=Ye4coVTq4cw5S42R+Fa+pVdf2b/mBBedsGrAbfG9XzuKUuhW31+zg7gQkEI2UpomtX
 yR6MY4XhOTM0uautNNqLWmbE0THfHS5iM0quPQbrWjGCuJQ7gJyMv6q0wD05desTGbVy
 rJURXcEOHqVfx8HGxeqwjNXgZdTC5uxDAJgA0ftXQmLLF0rKdWBVIaMEiOQmWg7qm2d8
 JevAdzCUIyVgZhYSRkRZxAapIx81r5PSPZqTQZvoBO21tXhIyNs/qi3q/H+aZzg8fRqY
 cBwSWyUNKUs0RGyk140D1W1pX02WT4tdoiZ6LQRY+E5yNkRQQZ2svgDKj0prpo498SHi
 BnTQ==
X-Gm-Message-State: AOAM5314tZW2trtEps64/0WngYfdQcAfXlESIVXM54wspQzUIph5ZP5u
 Zt3Ke/r7zKUogx3bJC8/zNvdIzodjIwfobnVy+X6XWLjKEqBl0XtvGp6wRECsDu3RtbuR02ZQ9J
 o+r23ylQrL2QRQop1frcJDZF8qeEDPUQ=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr8238012uak.79.1642447589385;
 Mon, 17 Jan 2022 11:26:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAF1aC4kRQLAD/xUj7W29I/c57GAId71chVOuzijHTscXUDVbS/sZVsvarJnneTLIEFtHGDIXwcEyZuL+SiJI=
X-Received: by 2002:ab0:d97:: with SMTP id i23mr8238007uak.79.1642447589189;
 Mon, 17 Jan 2022 11:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20220107153019.504124-1-sw@weilnetz.de>
 <CAFn=p-ZYr+D54GzYKt5cxuJQQTARGQTvkkgVfhLGEeLczFt-Tw@mail.gmail.com>
 <42ac8990-8733-fa68-c4b4-c54a82ce43f9@weilnetz.de>
 <CAFn=p-bgXrmUj9NXM3uKfi9V_YSDQA1_b8e-yGXrN5=G8eyYyw@mail.gmail.com>
 <8fe61f8b-bef8-1fde-6a7a-270a9b63b462@virtuozzo.com>
In-Reply-To: <8fe61f8b-bef8-1fde-6a7a-270a9b63b462@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 17 Jan 2022 14:26:18 -0500
Message-ID: <CAFn=p-bVSSjUO8_N8E6fAwnWM9-xafZmjAGycf_=SbGw+6aHJg@mail.gmail.com>
Subject: Re: [PATCH] simplebench: Fix Python syntax error (reported by LGTM)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 17, 2022 at 3:02 AM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> 10.01.2022 21:09, John Snow wrote:
> >
> >
> > On Mon, Jan 10, 2022 at 12:57 PM Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>> wrote:
> >
> >     Am 10.01.22 um 18:08 schrieb John Snow:
> >
> >>     On Fri, Jan 7, 2022 at 10:32 AM Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>> wrote:
> >>
> >>         Signed-off-by: Stefan Weil <sw@weilnetz.de <mailto:sw@weilnetz.de>>
> >>         ---
> >>          scripts/simplebench/bench-example.py | 2 +-
> >>          1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>         diff --git a/scripts/simplebench/bench-example.py b/scripts/simplebench/bench-example.py
> >>         index 4864435f39..fc370691e0 100644
> >>         --- a/scripts/simplebench/bench-example.py
> >>         +++ b/scripts/simplebench/bench-example.py
> >>         @@ -25,7 +25,7 @@
> >>
> >>          def bench_func(env, case):
> >>              """ Handle one "cell" of benchmarking table. """
> >>         -    return bench_block_copy(env['qemu_binary'], env['cmd'], {}
> >>         +    return bench_block_copy(env['qemu_binary'], env['cmd'], {},
> >>                                      case['source'], case['target'])
> >>
> >>
> >>         --
> >>         2.30.2
> >>
> >>
> >>     Good spot. If it's not too late and not a hassle, can you add a fixes: commit-id in the commit message? No big deal if not.
> >>
> >>     Reviewed-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
> >
> >
> >     Maybe that can be added locally to avoid a V2 patch. Here it is:
> >
> >     Fixes: b2fcb0c5754c2554b8406376e99a75e9e0a6b7bd
> >
> >     Thanks,
> >
> >     Stefan
> >
> >
> > Got it. I just got back from holiday today, so there's still lots of mail to catch up on. If nobody else has staged this, I will do so as part of my python fixes this week. Thanks!
> >
>
> It would be nice, thanks!
>

Should be in origin/master by now, I forgot to update this thread.

--js


