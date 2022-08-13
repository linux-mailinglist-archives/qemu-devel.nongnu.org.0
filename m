Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B71705918E3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 07:39:41 +0200 (CEST)
Received: from localhost ([::1]:44156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMjs4-0005t3-Rc
	for lists+qemu-devel@lfdr.de; Sat, 13 Aug 2022 01:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMjmj-00033D-L9
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:34:09 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:34472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMjmh-000460-Uj
 for qemu-devel@nongnu.org; Sat, 13 Aug 2022 01:34:09 -0400
Received: by mail-io1-f51.google.com with SMTP id x64so2332884iof.1
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 22:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=AW4MhRtB/7NGuHPbTdC3VjnMggvUoiurG19L7ckOTwU=;
 b=CHN72V2UVAZp4Y/Z/oN+FCKisP4V+N21u2tsztLqzxFf+AhcSAz4M8EErR5txYpmlZ
 Z6s4WURjLVjhoq5FRehVMtoRdTrcxqi133ekQKxHpV0QYdV13mAoKzcvBno2zfYLUouH
 N+8SLcgR6IHB+qzfDIKqDyWH87sn47VIftGDXOKMRcZDzJ6E7sBmwcwgTIZXOgFc4clA
 X1gPglTX9DboCshWhxsswGYHtKZUORI5WB6jw9fRfJzNgYJxYiE15IcL6w14ZdWq00H8
 +qmz/S7PMcvsxVzXC8wXO/5SkESyBRi9a3dU6fi2rt7YbvXwH6NPrXooCw3I4eGth5Xc
 tGVA==
X-Gm-Message-State: ACgBeo2f0b7TfoZDuZGNT4l887QFqU75x0l2x7hrnFUO5gW1TdrSzS0V
 vhOaTw0ME/RlB4ows6V4yUehEIxVI4g=
X-Google-Smtp-Source: AA6agR4Uoj+c7psMakBYaoAPcnX1gjHrPAhiCXLL09SEQsZUh8VVRe3HpdJ/ZVaQ0gopgggZr5ZC6w==
X-Received: by 2002:a05:6638:3489:b0:343:75a:71b1 with SMTP id
 t9-20020a056638348900b00343075a71b1mr3112356jal.157.1660368846851; 
 Fri, 12 Aug 2022 22:34:06 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com.
 [209.85.166.170]) by smtp.gmail.com with ESMTPSA id
 a11-20020a92a30b000000b002e4d61ca3e2sm624086ili.0.2022.08.12.22.34.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 22:34:05 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id d4so1464704ilc.8
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 22:34:05 -0700 (PDT)
X-Received: by 2002:a05:6e02:144f:b0:2de:6a5d:fdca with SMTP id
 p15-20020a056e02144f00b002de6a5dfdcamr3358774ilo.137.1660368845381; Fri, 12
 Aug 2022 22:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220813011031.3744-1-j@getutm.app>
 <20220813011031.3744-4-j@getutm.app>
 <20220813052956.vnnvukb5xt7f4p6i@tapioca>
In-Reply-To: <20220813052956.vnnvukb5xt7f4p6i@tapioca>
From: Joelle van Dyne <j@getutm.app>
Date: Fri, 12 Aug 2022 22:33:54 -0700
X-Gmail-Original-Message-ID: <CA+E+eSAzY6ZVJ-1qqTRs9a-Z5OaxGyhs1R8Jj0H21d2jyo5JPQ@mail.gmail.com>
Message-ID: <CA+E+eSAzY6ZVJ-1qqTRs9a-Z5OaxGyhs1R8Jj0H21d2jyo5JPQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usbredir: avoid queuing hello packet on snapshot
 restore
To: Victor Toso <victortoso@redhat.com>
Cc: Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.51; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Fri, Aug 12, 2022 at 10:30 PM Victor Toso <victortoso@redhat.com> wrote:
>
> Hi,
>
> On Fri, Aug 12, 2022 at 06:10:31PM -0700, Joelle van Dyne wrote:
> > When launching QEMU with "-loadvm", usbredir_create_parser() should avoid
> > setting up the hello packet (just as with "-incoming". On the latest version
> > of libusbredir, usbredirparser_unserialize() will return error if the parser
> > is not "pristine."
>
> That was wrong in the usbredir side. The fix [0] was merged and
> included in the latest 0.13.0 release

This is good to know. Should the entire runstate_check in
usbredir_create_parser be removed?

>
> [0] https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/61
>
> > Signed-off-by: Joelle van Dyne <j@getutm.app>
> > ---
> >  hw/usb/redirect.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> > index fd7df599bc..47fac3895a 100644
> > --- a/hw/usb/redirect.c
> > +++ b/hw/usb/redirect.c
> > @@ -1280,7 +1280,8 @@ static void usbredir_create_parser(USBRedirDevice *dev)
> >      }
> >  #endif
> >
> > -    if (runstate_check(RUN_STATE_INMIGRATE)) {
> > +    if (runstate_check(RUN_STATE_INMIGRATE) ||
> > +        runstate_check(RUN_STATE_RESTORE_VM)) {
> >          flags |= usbredirparser_fl_no_hello;
> >      }
> >      usbredirparser_init(dev->parser, VERSION, caps, USB_REDIR_CAPS_SIZE,
> > --
> > 2.28.0
> >
> >
>
> Cheers,
> Victor
>

