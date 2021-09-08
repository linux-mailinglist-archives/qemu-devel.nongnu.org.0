Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC8F404071
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 23:11:28 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO4qt-0000ji-Ce
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 17:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO4pC-0008H2-Ua
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:09:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mO4p8-0008Hy-81
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 17:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631135377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D3bGGYDO5bHcMuVtU9sZgEGv4sXyU8RACnLB5eCr2Zs=;
 b=SXxh32IL15ecxMuAkMZakknzWsE1VW7UEUx7Hj9h1uNdLPhuZLPc+sJq7oahrss7zg3+Nq
 D3VA1RUn++EDx8sE2/WmYOSdRT4WnMbpDUxYXEY6zAvd1jZQiXgGatNhMFxrWIkVahIASl
 MrGfAAsRyYHUjn1F2reaHGKhZta/Dbs=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-B3BTYm9_MGOHvlelMH49-w-1; Wed, 08 Sep 2021 17:09:36 -0400
X-MC-Unique: B3BTYm9_MGOHvlelMH49-w-1
Received: by mail-io1-f69.google.com with SMTP id
 g2-20020a6b7602000000b005be59530196so3048117iom.0
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 14:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D3bGGYDO5bHcMuVtU9sZgEGv4sXyU8RACnLB5eCr2Zs=;
 b=ULqUVey/NI4x3567gOyYJEmj+rnswXuEtvxNmEhMBmC+TxiLz8EKQC3Cn/My8UHXTh
 svBBZlZI5EYIiSczJEJsuvtbsoscEL/S4VqRhfDCVR8F94CnqgyWZLg5G31lLpoUIs7F
 7f3uNYWLUGVAWZi9J0yTzOb2bUuUmrX0ekfjz03YlQbYGmxp6hrhad4VPznMZN1GTzHH
 sTL9gq4I5gDUQ/kSEIU0YQji3ioXygq7stoBjJLKspxneeMDd7KTqC3i5HtrU6D9iu7A
 okekTXBzohcEHDhBAX72AwGQ1nE0AUWXsyIJ9Ze/sJipqCxf5Tx/GuQI9WcPG7JNsZjk
 DZfg==
X-Gm-Message-State: AOAM531ZoaD0/YG+ACkdOdD6e1X64ysQqBNj9iiuqf963uiLnbHR27nL
 iL5czG3tPZ7Jyq7dY8ZpSfIsYgEteJnH/CRQqFY04MYUEULnZMWiwYL6lIL75+2zAF78viqy2xw
 /36+X3/iezinRK04=
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr232347iob.90.1631135375749;
 Wed, 08 Sep 2021 14:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfgUFaWtlFQPGZD7hxgCosN/shYwnse9CmxqpxbxapZ4P6F63D8lbPuLGL9SAdVqDKUgO22A==
X-Received: by 2002:a6b:ce17:: with SMTP id p23mr232320iob.90.1631135375402;
 Wed, 08 Sep 2021 14:09:35 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id c23sm138583ioi.31.2021.09.08.14.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 14:09:34 -0700 (PDT)
Date: Wed, 8 Sep 2021 17:09:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 2/3] io: Add zerocopy and errqueue
Message-ID: <YTkmjdsY1ZkBnVdS@t490s>
References: <20210831110238.299458-3-leobras@redhat.com>
 <YS4nPfEBCy9IC3rd@redhat.com>
 <CAJ6HWG75NDzaRAoHvM6FkFoB+sQvTpmdR8+AdMkoY6TsP06ZhA@mail.gmail.com>
 <YTCPngNB+l70sl06@redhat.com>
 <CAJ6HWG6dd+timQM27-NTumvwDM2bFawRsnmrZumdzGZ8hCR3dQ@mail.gmail.com>
 <YTCeNCEmr3NsQEPR@redhat.com>
 <CAJ6HWG6D61K49gyvfLo2c5=cZpkYh96ciZjO5V=wiPdG+wB5zQ@mail.gmail.com>
 <YTCnP9J/JINhg4h8@redhat.com> <YTdHpx263WNe7nuZ@work-vm>
 <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG6L1LOec6yMY1oxFjbjhAv4LK6beS5FmU=g_s4h2+7ouA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 05:25:50PM -0300, Leonardo Bras Soares Passos wrote:
> On Tue, Sep 7, 2021 at 8:06 AM Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> > > Possibly, yes. This really need David G's input since he understands
> > > the code in way more detail than me.
> >
> > Hmm I'm not entirely sure why we have the sync after each iteration;
> > the case I can think of is if we're doing async sending, we could have
> > two versions of the same page in flight (one from each iteration) -
> > you'd want those to get there in the right order.
> >
> > Dave
> 
> Well, that's the thing: as we don't copy the buffer in MSG_ZEROCOPY,  we will in
> fact have the same page in flight twice, instead of two versions,
> given the buffer is
> sent as it is during transmission.

That's an interesting point, which looks even valid... :)

There can still be two versions depending on when the page is read and feed to
the NICs as the page can be changing during the window, but as long as the
latter sent page always lands later than the former page on dest node then it
looks ok.

-- 
Peter Xu


