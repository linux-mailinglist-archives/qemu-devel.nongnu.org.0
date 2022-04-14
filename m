Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420885004EB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 06:04:42 +0200 (CEST)
Received: from localhost ([::1]:54754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neqin-0003ZC-5L
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 00:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1neqgT-0002Bp-Ej
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1neqgR-0007FB-0S
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 00:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649908932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JkNVCDc0TabIEZYYYpTp0up+R3+PeB+V7pw79AnN0M8=;
 b=Ty7MjXHDTNNbLHJbC9NM/XstFDKXaBWDAm0eSjS3o1oaw8vBxOVEpFx1QedHNtgXxD+UId
 94y2ciyKcOlogdJR52dfKitDf+GbYitD1LSqwR3AYMwwtOxSgeNW7EY+H/6zieQS42HZlR
 6xOzBEGw3ov2EL7oOoU1k4iOeADu6aA=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-HRU6GM41Pc26CC5lJvgypQ-1; Thu, 14 Apr 2022 00:00:18 -0400
X-MC-Unique: HRU6GM41Pc26CC5lJvgypQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 v13-20020ac2592d000000b0046bc30fe894so1826285lfi.14
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 21:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JkNVCDc0TabIEZYYYpTp0up+R3+PeB+V7pw79AnN0M8=;
 b=PmKIP/HmPByYJMZYbHdZP13mJAzyrJt2yL3Bt/y8YCbewoaha27K7kFC0t1+U1b/E/
 fzzzqT9auDoCYDEF09KXXGTIVPhXbIFoS5lYmYAnOwtBNaDsta+iGDCUJIBjOJIrt2R2
 BeNY6bLkwcaX0gbK2Ee9jNfVH0xNll4ke6WTccX6jMwWf9TT2n+rkfBMfnv01IJXkNQr
 coLMVraIfrzRb37TPBeXM4G7AX161ZrfPXj7lJ99Yjs6N3uwoa6PTEDfkT+lOh5Si1ZT
 v63QBg5JJ+P+bQTcNRfOzf4QXjR+ZQwkfsKNvn1CqBov65/MncilgFKj4ajKZtjo+d/n
 kmxg==
X-Gm-Message-State: AOAM5339oGnk4ZkCAoljtWjNMRjoKh7301anSSAytAoN6Gx6juUv902N
 kUx3jz/ASV3TSWgDObDI3fLCli0v9XOulcU8AiV5GEDIxyx6i5zg+/qayKA68x+uWcgU0D3UUVl
 84gix/Gt8UTB79WluQIAoceEP6WJFceI=
X-Received: by 2002:a05:651c:19ab:b0:24c:8f62:d9ae with SMTP id
 bx43-20020a05651c19ab00b0024c8f62d9aemr497581ljb.162.1649908816911; 
 Wed, 13 Apr 2022 21:00:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5C2rIaG4XT38ksWpujPLZFZ0gnIqI1KLI1M8CjVB05KwE+Js/6DMgxEaoE/nZspeh6JVjLpp8mxs0k4rIvM=
X-Received: by 2002:a05:651c:19ab:b0:24c:8f62:d9ae with SMTP id
 bx43-20020a05651c19ab00b0024c8f62d9aemr497561ljb.162.1649908816641; Wed, 13
 Apr 2022 21:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-4-leobras@redhat.com>
 <87sfwekabf.fsf@secure.mitica>
In-Reply-To: <87sfwekabf.fsf@secure.mitica>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 14 Apr 2022 01:00:05 -0300
Message-ID: <CAJ6HWG6CCJruX+7f8S9qbecArHyT+BqQ2+v8xwDodXFaYCmc7g@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] multifd: Implement zerocopy write in multifd
 migration (multifd-zerocopy)
To: Juan Quintela <quintela@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Juan,

Sorry to go back that early in discussion, but I was reviewing for v9
and I am not sure If I am unable to recall the reason, or I missed an
argument here.
Could you please help me with this?

On Tue, Nov 2, 2021 at 9:32 AM Juan Quintela <quintela@redhat.com> wrote:
>
> Leonardo Bras <leobras@redhat.com> wrote:
> > Implement zerocopy on nocomp_send_write(), by making use of QIOChannel
> > zerocopy interface.
> >
> > Change multifd_send_sync_main() so it can distinguish the last sync from
> > the setup and per-iteration ones, so a flush_zerocopy() can be called
> > at the last sync in order to make sure all RAM is sent before finishing
> > the migration.
>
> You need to do this after each iteration.  Otherwise it can happen that:
>
> channel 1:               channel 2:
>
>    send page 11
>
> next iteration
>                          send page 11
>
>                          this page arrives
>
> now arrives this old copy.
>
> After each iteration, one needs to be sure that no ram is inflight.
>
> This means that I think you don't need the last_sync parameter at all,
> as you have to do the flush() in every iteration.

The flush command is used to guarantee every packet queued before
flush is actually sent before flush returns.
I mean, flushing every iteration will not help with the situation
above, where the pages are sent in order, but arrive at target in a
different order.

There is a chance that in the above text you meant 'send page' as
"queue page for sending", and 'page arrives' as "actually send the
queued page".
It that is correct, then syncing every iteration should not be necessary:
- On page queue, Linux saves the page address and size for sending
- On actual send, Linux will send the current data in the page and send.

So, in this example, if page 11 from iteration 'i' happens to be
'actually sent' after page 11 from iteration 'i+1', it would not be an
issue:
###
channel 1:               channel 2:
Iteration i

queue page 11 (i)

iteration i+1
                          queue page 11 (i+1)
                          actually send page 11 (i+1)

actually send page 11 (i)
###

That's because page 11 (i) will contain a newer version compared to
page 11 (i+1)

tl;dr:
- The page content always depends on the send time, instead of queue time.
- The iteration count describes the queue time.
(on non-zerocopy it's the opposite: it will depend on queue time,
because it copies the memory content during enqueue)

>
[...]

Juan, could you please help me understand if I am missing a part of
your argument up there?
Also, syncing every iteration is still necessary / recommended?

Best regards,
Leo


