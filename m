Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C968C517B2B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 02:14:14 +0200 (CEST)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlgBB-0000Qu-Bj
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 20:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nlgAC-0008Bt-D7
 for qemu-devel@nongnu.org; Mon, 02 May 2022 20:13:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nlgA8-0006ra-4U
 for qemu-devel@nongnu.org; Mon, 02 May 2022 20:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651536786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDaIusHQhzDj3fvBNDUs6Z1z6vWmSmNhBiIenSBST4I=;
 b=PTO4jdSvAXVmBH+c8fCQ3YAgJEC06l/yztE4GZ/m9J+tFMsxbfp+NVxswDR615u6PsPUXw
 uSr5JnR2r328fVsxMJ2pwe+PkeA6pA7o5nyC7rT7380eQml8ebnP4hCJyBJk9bSEbghr1Z
 CMRXMnX52WNt0+1LeBOQh7wpddox++w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-NJQqsilzOtCCFFvtoSviDQ-1; Mon, 02 May 2022 20:13:05 -0400
X-MC-Unique: NJQqsilzOtCCFFvtoSviDQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso7627528ejs.12
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 17:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDaIusHQhzDj3fvBNDUs6Z1z6vWmSmNhBiIenSBST4I=;
 b=BwjQIJPTWJWyiJM2HFAfsCaM3pT4gGjpOFrwY5ZLTWU/msxhABxy/eH0xiGehDdvx6
 qOvnkzu8a4mDyOgQlgGpiY11ya0hkif1WMJmJEa1ZDKFpkDT639N+hjt65ncuR/f3K6q
 Jq++XfCofevcTsT8Lzl6ZeLXhTvg71rdMQTAKsCu0Wsu2HV70JYx8iiVrKUGUNygvQ4X
 H2w1wTX/abPAcUS5UZBBG1xmLnTHbR7WC1jNYs9LfAyUkHDN+zpIXYdbhkK1E4o04K4G
 bhgU3fPv2Eo6Mt+9IXt8Rh88zhpfzrVAkOJuIw4faFt0SZUx+ziE0d91kGWxuTKHVBLn
 vrrA==
X-Gm-Message-State: AOAM530ebJs+yGCUvegIDXnXQV7C3Yn14swQwvDMLQKUjU/JQIBRPSKO
 wNqdRSGONeKJXfK/mcPxvGz/h/yZ7mZYh5qsCNDIafnbFaIWN0wmvc9kRI2OdZkYoCVwH9kt+AN
 iAVR6IuGsjFfJRfHCNDJrO4JT5/F//R8=
X-Received: by 2002:a17:906:7684:b0:6e8:5d05:196b with SMTP id
 o4-20020a170906768400b006e85d05196bmr13442907ejm.209.1651536784378; 
 Mon, 02 May 2022 17:13:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWRCWymQRuAuGZZIGeoubKXA/wnagL5sJxP/N1EInRWQaPquG1opeyaYqPa3oNQ5nZVUC/Yx86ZxWzWg6RGDo=
X-Received: by 2002:a17:906:7684:b0:6e8:5d05:196b with SMTP id
 o4-20020a170906768400b006e85d05196bmr13442892ejm.209.1651536784185; Mon, 02
 May 2022 17:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
 <Ymq+5bPaYTyUHF6L@work-vm>
 <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
 <YnBunLRaqmkZh3Re@xz-m1.local>
In-Reply-To: <YnBunLRaqmkZh3Re@xz-m1.local>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Mon, 2 May 2022 21:12:53 -0300
Message-ID: <CAJ6HWG4r8p_K1WFCXgGrifKTVSHtm-vHES7NQ-A4U99bzv7_6w@mail.gmail.com>
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy flag
 & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Daniel Berrange <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
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

Hello Peter,

On Mon, May 2, 2022 at 8:52 PM Peter Xu <peterx@redhat.com> wrote:
>
> Leo,
>
> On Fri, Apr 29, 2022 at 11:40:44PM -0300, Leonardo Bras Soares Passos wrote:
> > Does anyone else have any further suggestions, or know how this kind of issue
> > is generally solved in qemu?
>
> I've no solid idea why it can't see MSG_ZEROCOPY defined in the specific
> environment, but when I was looking at bits/socket.h I saw this:
>
> #ifndef _SYS_SOCKET_H
> # error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
> #endif
>
> Maybe worth a shot to do a replacement in all cases?
>

Sure, no problem with this, I will update for v11.
(Or should I send a different patch since Dave has already merged in his tree?)

But it should not interfere in MSG_ZEROCOPY definition:

> > I tracked down how the test happened, downloaded the same docker image from the
> > tests(opensuse-leap-15.2), and took a look at the filesystem for the
> > MSG_ZEROCOPY define, which I could not find anywhere.

By this, I mean I did a 'grep MSG_ZEROCOPY -r /' and could not find anything, so
it's probably not defined anywhere in the fs.

> --
> Peter Xu
>

Thanks Peter!

Best regards,
Leo


