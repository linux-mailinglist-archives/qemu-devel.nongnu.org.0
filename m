Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11F269FCEB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 21:14:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUvUg-0004X2-5F; Wed, 22 Feb 2023 15:13:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pUvUd-0004UM-FN; Wed, 22 Feb 2023 15:13:35 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idryomov@gmail.com>)
 id 1pUvUb-0004NX-ET; Wed, 22 Feb 2023 15:13:35 -0500
Received: by mail-ed1-x52a.google.com with SMTP id cy6so29795957edb.5;
 Wed, 22 Feb 2023 12:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jPYn1FE3BZvR/rnDkpQit9Aj81lY2omR8EqDcIFHWQk=;
 b=W2aJSGmm7IZr5XMocbPkryobfqVuX5D3smCN6kVn2Z1iAiVJy8yg5gPQzULLvbRI9+
 sa8QBjn1sOphsamgV3sGkFj3qEfXof0rbBs68MRb9PjsHWbw1tSlfk6wpxJ3WsCtldu+
 FWR7B9WvUkbxetp3RAzTfQRElLLBEFcmP9zDnOY3oRKdJlyeTmdlg5MG2Qnprp2nVkV0
 Qiko6ccHs5RabCPMdKHXp6fUF3VjdhJbr/sDzMxhoOTgElgszez/+p4hzUfyLJ3PcEXJ
 KE4GTuuXbNyWUQItbuHqZHHz3psL52yST7xL5Prcdv7w5XZsTN9V2izs51mXIYYqTfF7
 MyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jPYn1FE3BZvR/rnDkpQit9Aj81lY2omR8EqDcIFHWQk=;
 b=eEC3qFrVhqPk4sBX/Pqacw6qBZj2TgKLl16j4hUMaOPGsWpCnbRuFsg4fHZgv4H3ca
 sUHdKMfGDZuJw6HL2Q/okSpGA/P3rP5uvypBkw7s4yBjNC9X5GdVpRznGlTG/FB/WlPw
 /5+DP4Yh6DrHUfRq8zkES02he53z4FYk0IIM6Q7i6rQKjLCf706xR8H4e6jPm3XZqaXS
 jPJEEnX+LeS/Ohde8kq7P14l3DFfmGIZXPoE/mkipkWeoaAZ+OJmQ8Ywldwg2RGmH4jo
 EwltujKjm6SvMyIafNV6rnKwPYPsI6W215tSM0nDV+x+OFthBY2I4Ao5f7q7p7jkckGo
 BoFQ==
X-Gm-Message-State: AO0yUKWFBB3m99+SZUoyTH/czF4QakFKDAOR7ps2jpk70HUbnVydwF3v
 8QaKQ0oByKPZu0UIR0mx8ku9ntvNR3pgwGJPUOg=
X-Google-Smtp-Source: AK7set/OGx07H8LMw2jUAqTNjkeoT0JP/Km/MQPWBFe4TB3gxCVmdnZ1Esk+682KBLRX0xlhlu0KwlTujeifAClE2sA=
X-Received: by 2002:a17:906:b16:b0:8af:7efc:84af with SMTP id
 u22-20020a1709060b1600b008af7efc84afmr8144882ejg.11.1677096809846; Wed, 22
 Feb 2023 12:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com>
 <CAOi1vP_G3zYFRGwKnuRiTsvu+Y1FKjSBJTTt_Mq_JDvFV+rchw@mail.gmail.com>
In-Reply-To: <CAOi1vP_G3zYFRGwKnuRiTsvu+Y1FKjSBJTTt_Mq_JDvFV+rchw@mail.gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 22 Feb 2023 21:13:17 +0100
Message-ID: <CAOi1vP-KrzLpb4FOBvSjC0r90W02+JJThA0voOc0iWOrbc=iXA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] block/rbd: Add support for layered encryption
To: oro@oro.sl.cloud9.ibm.com, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, oro@il.ibm.com, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=idryomov@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jan 30, 2023 at 2:16 PM Ilya Dryomov <idryomov@gmail.com> wrote:
>
> On Sun, Jan 29, 2023 at 12:31 PM ORO@il.ibm.com
> <oro@oro.sl.cloud9.ibm.com> wrote:
> >
> > v6: nit fixes
> > v5: nit fixes
> > v4: split to multiple commits
> >     add support for more than just luks-any in layered encryption
> >     nit fixes
> > v3: further nit fixes suggested by @idryomov
> > v2: nit fixes suggested by @idryomov
> >
> > Or Ozeri (3):
> >   block/rbd: Remove redundant stack variable passphrase_len
> >   block/rbd: Add luks-any encryption opening option
> >   block/rbd: Add support for layered encryption
> >
> >  block/rbd.c          | 188 ++++++++++++++++++++++++++++++++++++++++---
> >  qapi/block-core.json |  31 ++++++-
> >  2 files changed, 205 insertions(+), 14 deletions(-)
> >
> > --
> > 2.25.1
> >
>
> Reviewed-by: Ilya Dryomov <idryomov@gmail.com>

Hi Kevin, Hanna,

What is the status of this set?  I see it on patchw and also see that
my review got picked up but it's not clear whether there is something
else to do here:

https://patchew.org/QEMU/20230129113120.722708-1-oro@oro.sl.cloud9.ibm.com/

I'm CCing Daniel who commented on previous postings of this set in case
an additional review is needed.

Thanks,

                Ilya

