Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2210F4B8F03
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 18:18:59 +0100 (CET)
Received: from localhost ([::1]:57872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKNxB-0002Sy-ED
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 12:18:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKNa6-0000qC-Nq
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:55:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKNa3-0006pj-A9
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645030502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcXe9Qwj9p95bYc1+iRLg48oDaUUpLdeWTPapsLWVWY=;
 b=ghDmtjtd9rYd/CatbiVd3OjyYXyDqHdCa0peQ2CTDl3V4xEHv+8146toNBNqAlEkzI4spB
 3c7U01zFq3g8xtYcNUaaVdFLDYmHiX4FLPTOi/er/rSvRywwLzV5ffEn0qIaEsP2WPQ6Oh
 V1PqLE4dMI2+7Mg/WG177djdk/KnxJ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-8ks0Kt1lPVOFTnnDGWJpbQ-1; Wed, 16 Feb 2022 11:55:01 -0500
X-MC-Unique: 8ks0Kt1lPVOFTnnDGWJpbQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 j9-20020a056402238900b004128085d906so1088031eda.19
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 08:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TcXe9Qwj9p95bYc1+iRLg48oDaUUpLdeWTPapsLWVWY=;
 b=nFCQ/QIS1gg2Ordh/TT/6AWpItfS/N/bfmOTJ1Oa21XcZsUgZlontFSXYtIKrV5njf
 PoGI4S++JZc8kdeScOWJsMguJIKQBZ2L4gZTga9pspZYpW3/hVX3a4ZTuwdKsPOM3CxV
 GF/ij1LncOP5y3qv4J8Kl99Zn5zb+03svVD1T6jauFx4Xt1+Efkp6u96zUlcooPe1Oqo
 fMim2RiIHcjIu3x9uu/Erj0bTeQqZP6jKoRxD2Kod74pA0EKMAgJS2FJSQURm6IxQoKD
 vxGOYLu3AtkjgTVk6g7ThAVEX0q8pWM4dB6mZeAQ+3EW3AmOz1Uc9QZ5uZhqTBrsutB4
 qxJQ==
X-Gm-Message-State: AOAM533mwyITSUi/OYLDp1+YO2bNVafLt/NcZlVc3M5bE6Z8bsB73j6V
 uKq2Z0UslNZhw9vH5umql9NOUE2MVqKqF7lPEh2mNDHqKgtQbyo9Kf1nBlqdMTznwN2BmvkOkIT
 147un3oKjLIwgkwU=
X-Received: by 2002:a17:906:6d12:b0:6cd:6970:2d4c with SMTP id
 m18-20020a1709066d1200b006cd69702d4cmr3040612ejr.323.1645030499939; 
 Wed, 16 Feb 2022 08:54:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybKV59rFnfxwaLIlEGZrOMvkfUsEP3sLr8TISG+VxlSIQ095qg4OvKkwzNwrrCJpzEY7H8LA==
X-Received: by 2002:a17:906:6d12:b0:6cd:6970:2d4c with SMTP id
 m18-20020a1709066d1200b006cd69702d4cmr3040584ejr.323.1645030499623; 
 Wed, 16 Feb 2022 08:54:59 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id vs2sm104998ejb.64.2022.02.16.08.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 08:54:59 -0800 (PST)
Message-ID: <1e6fbbaa-b595-2d2d-bb2e-268a6927c045@redhat.com>
Date: Wed, 16 Feb 2022 17:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] python/utils: add enboxify() text decoration utility
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Eric Blake <eblake@redhat.com>
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-2-jsnow@redhat.com>
 <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
 <CAFn=p-be7D7DW3cxti3oC60EjhgPAeXyDhHW4owcEWb_Mvf-gQ@mail.gmail.com>
 <bb420d6b-02f1-b8b8-2f53-680bd765a323@amsat.org>
 <CAFn=p-ZEWubCO+cGL19vo3esdPHux5KT3OO1V9=TGjYX5AfFPA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-ZEWubCO+cGL19vo3esdPHux5KT3OO1V9=TGjYX5AfFPA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.02.22 17:16, John Snow wrote:
>
> On Tue, Feb 15, 2022, 6:57 PM Philippe Mathieu-Daudé <f4bug@amsat.org> 
> wrote:
>
>     On 16/2/22 00:53, John Snow wrote:
>     > On Tue, Feb 15, 2022 at 5:55 PM Eric Blake <eblake@redhat.com>
>     wrote:
>     >>
>     >> On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:
>     >>>>>> print(enboxify(msg, width=72, name="commit message"))
>     >>> ┏━ commit message
>     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
>     >>> ┃ enboxify() takes a chunk of text and wraps it in a text art
>     box that ┃
>     >>> ┃  adheres to a specified width. An optional title label may
>     be given, ┃
>     >>> ┃  and any of the individual glyphs used to draw the box may
>     be        ┃
>     >>
>     >> Why do these two lines have a leading space,
>     >>
>     >>> ┃ replaced or specified as well.                          ┃
>     >>
>     >> but this one doesn't?  It must be an off-by-one corner case
>     when your
>     >> choice of space to wrap on is exactly at the wrap column.
>     >>
>     >
>     > Right, you're probably witnessing the right-pad *and* the actual
>     space.
>     >
>     >>>
>     ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
>     >>>
>     >>> Signed-off-by: John Snow <jsnow@redhat.com>
>     >>> ---
>     >>>   python/qemu/utils/__init__.py | 58
>     +++++++++++++++++++++++++++++++++++
>     >>>   1 file changed, 58 insertions(+)
>
>     >>> +    def _wrap(line: str) -> str:
>     >>> +        return os.linesep.join([
>     >>> +            wrapped_line.ljust(lwidth) + suffix
>     >>> +            for wrapped_line in textwrap.wrap(
>     >>> +                    line, width=lwidth, initial_indent=prefix,
>     >>> + subsequent_indent=prefix, replace_whitespace=False,
>     >>> +                    drop_whitespace=False,
>     break_on_hyphens=False)
>     >>
>     >> Always nice when someone else has written the cool library
>     function to
>     >> do all the hard work for you ;)  But this is probably where you
>     have the off-by-one I called out above.
>     >>
>     >
>     > Yeah, I just didn't want it to eat multiple spaces if they were
>     > present -- I wanted it to reproduce them faithfully. The tradeoff is
>     > some silliness near the margins.
>     >
>     > Realistically, if I want something any better than what I've done
>     > here, I should find a library to do it for me instead -- but for the
>     > sake of highlighting some important information, this may be
>     > just-enough-juice.
>
>     's/^┃  /┃ /' on top ;D
>
>
> I have to admit that this function is actually very fragile. Last 
> night, I did some reading on unicode and emoji encodings and 
> discovered that it's *basically impossible* to predict the "visual 
> width" of a sequence of unicode codepoints.

Jumping it at random without knowing any of the history (that’s my forte!):

*Clippy face*

It sounds like you want to put a bar to the right of some text in a 
terminal, but you can’t predict the texts horizontal width, and so you 
can’t work out the number of spaces needed to pad the text with before 
the bar.

Two things come to my mind, if we’re talking about TTY output:
(A) printf '%79s┃\r%s\n' '' "$text"
(B) printf '%s\e[80G┃\n' "$text"

I.e. either printing the bar first, then printing the text over the 
line; or using an ANSI escape sequence to have the TTY position the 
bar.  Both seem to work for me in both konsole and xterm.

Or perhaps you’re really trying to find out how long a piece of text is 
visually (so you can break the line when this exceeds some limit), which 
you can also technically do with ANSI escape sequences, because "\e[6n" 
will return the cursor position to stdin (as "\e[{Y};{X}R").  But 
reading from stdin when there’s no newline is always really stupid, so I 
don’t know if you really want that.

(And you also need to print the text first before you can find out how 
long it is, which is kind of not great.)

Now that I wrote this all it feels like I didn’t help at all, but I put 
work into this mail, so I’ll send it anyway!

Hanna


