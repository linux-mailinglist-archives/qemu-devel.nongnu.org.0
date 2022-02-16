Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACF4B7B91
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 01:05:42 +0100 (CET)
Received: from localhost ([::1]:43612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK7pE-0005Sh-Ok
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 19:05:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7mr-0004QG-Rx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 19:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nK7mo-0006dg-FG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 19:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644969788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQ76Nz5VJCmjPcDha0yj8fQOO8vgDRuOB/nqP7ASE1Y=;
 b=OFuKp7qpIvIlxLOCAZ1atABuCKd22tB+9CUCj1IovaqhDt7Z2DyyLOlcRPlrPBVQ28ru4c
 gEbHrCXfaj5trgNqrKK1gOcom9tZciUNGnEYWfzPT09Zcb37uit1BXiayefYDxWp9+ecQy
 0g2qVhn/9r0jXH4EsBYwv/EIRAgwLqs=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597--ULWHw0ENWim_40N-P8_WQ-1; Tue, 15 Feb 2022 19:03:07 -0500
X-MC-Unique: -ULWHw0ENWim_40N-P8_WQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 47-20020ab00132000000b0033c71a5f48dso293124uak.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 16:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IQ76Nz5VJCmjPcDha0yj8fQOO8vgDRuOB/nqP7ASE1Y=;
 b=suFejXv2z5HHQ/ghX4C26BveFzYOC+MJ1YCEHNUwSHoTUs7bga961VWAsk27hDXue6
 Gs43dId0uiJvWkwAShsTThRU8DDdP2WRkkO0eUzerW4EkImyh7Bb1LKskhlPf6LRR0Se
 corYVLMcn5NUBqxQb9XlrYidJZYHfysc2aveVk4C9XHxfGwhv1Os0B+4L5PzOsZ3+wEg
 yL0xKV7Cv7qdSSfBSJskxXEJA39FZK3ZhLWy3IaIdJcfuYHon3IPZ3m2lKTKAHAJcFU2
 YE5iICcnqlDrfaTWCzg7O3Nh/9pwCKtnly/Pg3zc4USSrL5g/eq8I98vfcTLQmfk1seo
 VPIg==
X-Gm-Message-State: AOAM5317i+s2oVP8OLR8ommwez61JN35frW46fHb2/bQMqLbGhgkaBsv
 DvrH5vjl7ePUbHFWU3zNmNvi9MnetGvYtgbcX20TF20pxy0UB+a3ZvX1KS0VGX4PWcTbTeRuJip
 ezIm8jEF6Smro7rGBBIjDm9zL5GhBa3E=
X-Received: by 2002:a67:c00a:0:b0:31a:fc72:451d with SMTP id
 v10-20020a67c00a000000b0031afc72451dmr56118vsi.38.1644969787094; 
 Tue, 15 Feb 2022 16:03:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmGKYwSmLlTd6H8r7L/bLF+YMBLUSZ56qCL1FkXHuhlnFe//7/Ngcf5vE67SyvPTlk/2MC4AM484kt6wZ+0zQ=
X-Received: by 2002:a67:c00a:0:b0:31a:fc72:451d with SMTP id
 v10-20020a67c00a000000b0031afc72451dmr56105vsi.38.1644969786841; Tue, 15 Feb
 2022 16:03:06 -0800 (PST)
MIME-Version: 1.0
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-5-jsnow@redhat.com>
 <20220215230909.qaih2j2mu5au4ys6@redhat.com>
In-Reply-To: <20220215230909.qaih2j2mu5au4ys6@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 15 Feb 2022 19:02:56 -0500
Message-ID: <CAFn=p-aqerBvHs2SJYKAE=GQhi0_b0YKSjN3beQbN1HjgVqNhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] iotests: make qemu_img raise on non-zero rc by default
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 6:09 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 05:08:53PM -0500, John Snow wrote:
> > re-configure qemu_img() into a function that will by default raise a
> > VerboseProcessException (extended from CalledProcessException) on
> > non-zero return codes. This will produce a stack trace that will show
> > the command line arguments and return code from the failed process run.
> >
> > Users that want something more flexible (There appears to be only one)
>
> s/There/there/
>
> > can use check=False and manage the return themselves.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/qemu-iotests/257        |  8 ++++--
> >  tests/qemu-iotests/iotests.py | 53 +++++++++++++++++++++++++++++++----
> >  2 files changed, 53 insertions(+), 8 deletions(-)
> >
>
> > +def qemu_img(*args: str, check: bool = True, combine_stdio: bool = True
> > +             ) -> subprocess.CompletedProcess[str]:
> > +    """
> > +    Run qemu_img, returning a CompletedProcess instance.
> > +
> > +    The CompletedProcess object has args, returncode, and output properties.
> > +    If streams are not combined, It will also have stdout/stderr properties.
>
> s/It/it/
>
> > +
> > +    :param args: command-line arguments to qemu_img.
> > +    :param check: set to False to suppress VerboseProcessError.
> > +    :param combine_stdio: set to False to keep stdout/stderr separated.
> > +
> > +    :raise VerboseProcessError:
> > +        On non-zero exit code, when 'check=True' was provided. This
> > +        exception has 'stderr', 'stdout' and 'returncode' properties
> > +        that may be inspected to show greater detail. If this exception
> > +        is not handled, The command-line, return code, and all console
>
> s/The/the/
>
> > +        output will be included at the bottom of the stack trace.
> > +    """
>
> > @@ -469,8 +511,9 @@ def qemu_nbd_popen(*args):
> >
> >  def compare_images(img1, img2, fmt1=imgfmt, fmt2=imgfmt):
> >      '''Return True if two image files are identical'''
> > -    return qemu_img('compare', '-f', fmt1,
> > -                    '-F', fmt2, img1, img2) == 0
> > +    res = qemu_img('compare', '-f', fmt1,
> > +                   '-F', fmt2, img1, img2, check=False)
> > +    return res.returncode == 0
>
> Not sure why there was so much Mid-sentence capitalization ;)

Mostly the result of editing a few different drafts together and
failing to fix the casing. Oopsie.

>
> Seems useful, although it is at the limits of my python review skills,
> so this is a weak:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>

Understood, thanks!

--js


