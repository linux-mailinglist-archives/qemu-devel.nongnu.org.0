Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC04F397A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 16:48:33 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbkTw-00040y-Am
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 10:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbkSz-0003E5-Ry
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:47:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1nbkSy-0001PP-BZ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 10:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649170051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ENnlo0bXb26TTaLbzkaroFnASbHO7VrHORdtbf5Yi3w=;
 b=jGGbJe3vSH7yqUvlchvqlaauhpwVnN1udIH2g6rscYmlrClFIIYAhdUH7jGap/kwrK7RlD
 d27obEcx1AYY5j1l+oI4X1IKirwJdnkMtUDCAb2nIrCeBkUQzN30IlirBerYSK9seTKf+n
 7B1+q/DydJulqVF32MPfQu2qYiLaWp4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-FgspGa13PBSfqj6--N9o7w-1; Tue, 05 Apr 2022 10:47:30 -0400
X-MC-Unique: FgspGa13PBSfqj6--N9o7w-1
Received: by mail-pl1-f197.google.com with SMTP id
 o6-20020a170902778600b00153a7c44e4bso5082406pll.13
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 07:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ENnlo0bXb26TTaLbzkaroFnASbHO7VrHORdtbf5Yi3w=;
 b=naLh6dtXzzmc382BI40Q27Q7p+DdI1y/zYFkEEWeGkmq1zUeoYI8fxnVjqFKSrsIR7
 PZK68BThp0W8lKWan4SAC7unl4TLaLjuQFGLdZjGh766BfNmT8JIyo2yivNUbDJXZNcW
 WBetDlLJe6THIUyAxnvmaSD5HuZ8wPr6T2+ytoAIMIwFcvZUUusqVcOOOZkKVWn1Y/Kv
 xTs4BNA6DqrWeZUwHgY4Pja868+NOg7Ta1sep0IKhNSw5eO0jlY4DvxiDXSebml7tqoJ
 81O1XvPGYvPJ6csYzOYulDbfm3tBvpg1aU37e4HFoGI3L2dEoY0fTGzLAaVPFnjIdXch
 tBcA==
X-Gm-Message-State: AOAM533evu1/fTBn++GXG4pigw+/1fYaXl1lfOTZk605v8nvMtc80ZUK
 oQc+yLam0WuYoDoXGueYJGWU6XdjUeLU6mUOPpwtjgI6E/C+66jO3Kfna6pj6ws1pT3yRqFPvqH
 1eSvH0rDE/+14a1lLt9rze29YAVsyp7g=
X-Received: by 2002:a17:90b:4b01:b0:1c7:8a37:bfd3 with SMTP id
 lx1-20020a17090b4b0100b001c78a37bfd3mr4431676pjb.115.1649170049549; 
 Tue, 05 Apr 2022 07:47:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSGrEQRmPeIW+p5xRxmy6azHkXWBVb1OAAU2TZG2SyW1qg5ROi9rzJF75T1I9fGCNWN1Yi5NbMGNrLwFRaAXc=
X-Received: by 2002:a17:90b:4b01:b0:1c7:8a37:bfd3 with SMTP id
 lx1-20020a17090b4b0100b001c78a37bfd3mr4431659pjb.115.1649170049304; Tue, 05
 Apr 2022 07:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220405103258.105701-1-mcascell@redhat.com>
 <CAJ+F1CKKyAg-d+3F_H+Q9gBTT0fz5txXkg0bsaRgu=qGkxRN1Q@mail.gmail.com>
 <20220405111010.kpjlfvtow7jxzk7w@sirius.home.kraxel.org>
In-Reply-To: <20220405111010.kpjlfvtow7jxzk7w@sirius.home.kraxel.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 5 Apr 2022 16:47:18 +0200
Message-ID: <CAA8xKjVX0BsosHQNOrfOemOhgv03qqVK0NFVAoCZa-3v4XWSxg@mail.gmail.com>
Subject: Re: [PATCH] ui/cursor: fix integer overflow in cursor_alloc
 (CVE-2022-4206)
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 5, 2022 at 1:10 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > +++ b/ui/cursor.c
> > > @@ -46,6 +46,13 @@ static QEMUCursor *cursor_parse_xpm(const char *xpm[])
> > >
> > >      /* parse pixel data */
> > >      c = cursor_alloc(width, height);
> > > +
> > > +    if (!c) {
> > > +        fprintf(stderr, "%s: cursor %ux%u alloc error\n",
> > > +                __func__, width, height);
> > > +        return NULL;
> > > +    }
> > >
> >
> > I think you could simply abort() in this function. It is used with static
> > data (ui/cursor*.xpm)
>
> Yes, that should never happen.
>
> Missing: vmsvga_cursor_define() calls cursor_alloc() with guest-supplied
> values too.

I skipped that because the check (cursor.width > 256 || cursor.height
> 256) is already done in vmsvga_fifo_run before calling
vmsvga_cursor_define. You want me to add another check in
vmsvga_cursor_define and return NULL if cursor_alloc fails?

> take care,
>   Gerd
>


--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


