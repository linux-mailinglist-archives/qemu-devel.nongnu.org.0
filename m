Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7CC570C0B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 22:35:22 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB07l-0008Jz-1B
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 16:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB04l-0004u8-At
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:32:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB04h-00032a-Vv
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 16:32:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657571531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7HG9eHXoE/+meVQfmCQ1igxAVZE16X/PlscuL2I1tNE=;
 b=fsf2Co6/KUo3SYODoZlYscdsjmoFKc1eBKV7EAPx9q+Y/avgLbs0wbKDHPAx/2NxvNimhj
 vzYxbGUpyMATDfGQukx1Fqub8H1TsSzP4/T99J3BUXOOjgSzZtTXNtwBFYkbuqoPGbc3c8
 JV8lchA4Q0ePfxwsqb8nfXT1enC9p/g=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-fFOGHE8DNh6qzAAJm5gtkQ-1; Mon, 11 Jul 2022 16:32:10 -0400
X-MC-Unique: fFOGHE8DNh6qzAAJm5gtkQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 y38-20020ab048e9000000b00382bd73d02bso1242149uac.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 13:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HG9eHXoE/+meVQfmCQ1igxAVZE16X/PlscuL2I1tNE=;
 b=RSQiPR8sExnu8P1VwffAKEcLa9KPpOcqHRLLSnnphyKHiFlG/kCFbXAispKpUKpA3l
 1DYVR9SsX6bEmTM3uCiDvIstBw1+WncYcMg98gt/ka+dzPhiRdJsfojs7jWzJuPezZyR
 /j09f2GmABXfLAnROnRXV2nJCRz0DPO7Rqr1dvOPukmEe8ZcDOzvG/cs7LoH1vEfObY3
 fvVleQRfLdyMi7TdYifTfmBq5hFS/yYsnHMGWcPIMOYMYP0gsSc+rUBTSvH3OxYpjWtc
 qkp+oxLzQAAXQM46k5xi+Cpx8qy80ByWK/0oHLhoF2rjpWZA7AZ9a+VpnUHn6hC2XXdE
 E8lw==
X-Gm-Message-State: AJIora9Yw06+k3ZGBRtHCqY7zu73Vy5uZMEDmnN88NMzi9ziLz+wddIg
 7CZDtb4KoL58+lli+AJHqF73rLx814PALj9xK6MHO5jml7qfH/bLPIgI1TRMQaeE8kOe9IkVljA
 kFfcyatT8+Gh6VJ09ODL57vQGAfaeZ1A=
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3150886vsh.38.1657571529161; 
 Mon, 11 Jul 2022 13:32:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stgBxUAHkbS5fDRwhEP/3w1TJQkxoV5MFg6TBiwXcxIEHRtukQo6/lqbrMk0mwYahHwBOytH2X7adcCfbYUAM=
X-Received: by 2002:a05:6102:31ac:b0:357:530e:6496 with SMTP id
 d12-20020a05610231ac00b00357530e6496mr3150880vsh.38.1657571528925; Mon, 11
 Jul 2022 13:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220711095721.61280-1-thuth@redhat.com>
 <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
In-Reply-To: <CAFn=p-ZKR-1W-4yuXSEh10mu5M-PEZdf693vpWsEtEAOHL2gaw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 16:31:58 -0400
Message-ID: <CAFn=p-Y3FPBnDOxs38SAaPnorPsgdWz_77iC5da-dtUAapZq-g@mail.gmail.com>
Subject: Re: [PATCH] python/qemu/qmp/legacy: Replace 'returns-whitelist' with
 the correct type
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Mon, Jul 11, 2022 at 4:30 PM John Snow <jsnow@redhat.com> wrote:
>
> On Mon, Jul 11, 2022 at 5:57 AM Thomas Huth <thuth@redhat.com> wrote:
> >
> > 'returns-whitelist' has been renamed to 'command-returns-exceptions' in
> > commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  python/qemu/qmp/legacy.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
> > index 03b5574618..1951754455 100644
> > --- a/python/qemu/qmp/legacy.py
> > +++ b/python/qemu/qmp/legacy.py
> > @@ -50,7 +50,7 @@
> >
> >  # QMPMessage can be outgoing commands or incoming events/returns.
> >  # QMPReturnValue is usually a dict/json object, but due to QAPI's
> > -# 'returns-whitelist', it can actually be anything.
> > +# 'command-returns-exceptions', it can actually be anything.
> >  #
> >  # {'return': {}} is a QMPMessage,
> >  # {} is the QMPReturnValue.
> > --
> > 2.31.1
> >
>
> May I cajole you to send a MR to
> https://gitlab.com/qemu-project/python-qemu-qmp ?
>
> (Sorry for the duplicated effort while the library isn't 100% split
> out of the tree yet.)
>
> In this case, for qemu.git:
>
> Reviewed-by: John Snow <jsnow@redhat.com>

Queued.

--js


