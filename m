Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBA242075B
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:35:15 +0200 (CEST)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJRK-0003B4-0C
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJ9o-00074h-5t
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJ9l-0004Ub-4Z
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633335423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0ZVMZGrbKNv1KZ4Fsnx7t0IVBOodiqHlzCAsKjq/e8=;
 b=CiGrkDq5nHuUuqXhIEJOqtM2xUMJ2NrqcggXFhPj+x1xRcQK7EACDBLNA9iVE18PpSj9ss
 1ktN62TkByl9wOtoVavzSFDeUNVwSj9RSRqYVVUi3sw/Nvo7ZJ6eQIx0d+t9MYcHvM9dqp
 AALJXkhCVe8Ggm/qIx6lrGSpkD+gO20=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-RSQ9GkZQMxiUny9QrZhCmA-1; Mon, 04 Oct 2021 04:17:00 -0400
X-MC-Unique: RSQ9GkZQMxiUny9QrZhCmA-1
Received: by mail-wm1-f72.google.com with SMTP id
 z194-20020a1c7ecb000000b0030b7ccea080so9630409wmc.8
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=n0ZVMZGrbKNv1KZ4Fsnx7t0IVBOodiqHlzCAsKjq/e8=;
 b=TIYkSsC0mNrXu54/0iNHHiq5fOpLEmxnonTFNFdiJJcBUO77UZRnQCku3Px8cPlvrg
 cw8IOpIKfsP59vPkOGgUfdXRFzpRxNlH8MDQ74tT2H5r/c6cYlYVuXAT5VrxFrrzUAzM
 38JbOerCkU8oPK1Dl86aCx+DFy+KS5Gi4GyFPy2rY44nvEjWcDd9wM/4df6A9V937rpi
 W/LWU94E70XWBBYw7/sRvLtoCFCTOAItLHADTtAaH+UxZZGQkAyKjLiHMevh2D/FxR2W
 E7wPmtuuXuUxmzeXuS9Tw0igm+MyPRHe9xjhZ4lPDblsXJ/0QtU/9nBj/X6P75S4LoUQ
 4Nuw==
X-Gm-Message-State: AOAM530+pzzS/kj98JVKy6i9kwpeOg0oFvOIG9gAnwWTcQ9qzlDE5oX4
 tVfF2N8o3HeZbEO0YBQU0+/NYONIgn+sYpqtzANY5zi9O10lTZh7ILhtBzqsus+0q9bZjHn5poV
 tjTT2LUWx0axKBlk=
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr12454154wrm.181.1633335418851; 
 Mon, 04 Oct 2021 01:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv5bgxEZ+RetnFW8jCAwaHSYyXKxriASjf+orVBrI46hOfqXSflXilz9vnRviQKm28RggMzg==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr12454120wrm.181.1633335418519; 
 Mon, 04 Oct 2021 01:16:58 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id r18sm7634360wrs.47.2021.10.04.01.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:16:58 -0700 (PDT)
Subject: Re: [PATCH v3 07/16] iotests/297: Don't rely on distro-specific
 linter binaries
To: John Snow <jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-8-jsnow@redhat.com>
 <374eff9f-0e9e-a2da-19ab-1c39a63191b0@redhat.com>
 <CAFn=p-aVEvHXwZWroz2DitNw6-f0YdfJqsqkxBfKNfHzrB4DOw@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <58254219-d4a5-c4c2-20ab-21e33e034ce5@redhat.com>
Date: Mon, 4 Oct 2021 10:16:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aVEvHXwZWroz2DitNw6-f0YdfJqsqkxBfKNfHzrB4DOw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.21 21:53, John Snow wrote:
> (This email just explains python packaging stuff. No action items in 
> here. Skim away.)
>
> On Fri, Sep 17, 2021 at 5:43 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 16.09.21 06:09, John Snow wrote:
>     > 'pylint-3' is another Fedora-ism. Use "python3 -m pylint" or
>     "python3 -m
>     > mypy" to access these scripts instead. This style of invocation will
>     > prefer the "correct" tool when run in a virtual environment.
>     >
>     > Note that we still check for "pylint-3" before the test begins
>     -- this
>     > check is now "overly strict", but shouldn't cause anything that was
>     > already running correctly to start failing.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > Reviewed-by: Vladimir Sementsov-Ogievskiy
>     <vsementsov@virtuozzo.com <mailto:vsementsov@virtuozzo.com>>
>     > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com
>     <mailto:philmd@redhat.com>>
>     > ---
>     >   tests/qemu-iotests/297 | 45
>     ++++++++++++++++++++++++------------------
>     >   1 file changed, 26 insertions(+), 19 deletions(-)
>
>     I know it sounds silly, but to be honest I have no idea if replacing
>     `mypy` by `python3 -m mypy` is correct, because no mypy documentation
>     seems to suggest it.
>
>
> Right, I don't think it's necessarily documented that you can do this. 
> It just happens to be a very convenient way to invoke the same script 
> without needing to know *where* mypy is. You let python figure out 
> where it's going to import mypy from, and it handles the rest.
>
> (This also makes it easier to use things like mypy, pylint etc with an 
> explicitly specified PYTHON interpreter. I don't happen to do that in 
> this patch, but ... we could.)
>
>      From what I understand, that’s generally how Python “binaries” work,
>     though (i.e., installed as a module invokable with `python -m`,
>     and then
>     providing some stub binary that, well, effectively does this, but
>     kind
>     of in a weird way, I just don’t understand it), and none of the
>     parameters seem to be hurt in this conversion, so:
>
>
> Right. Technically, any python package can ask for any number of 
> executables to be installed, but the setuptools packaging ecosystem 
> provides a way to "generate" these based on package configuration. I 
> use a few in our own Python packages. If you look in python/setup.cfg, 
> you'll see stuff like this:
>
> [options.entry_points]
> console_scripts =
>     qom = qemu.qmp.qom:main
>     qom-set = qemu.qmp.qom:QOMSet.entry_point
>     qom-get = qemu.qmp.qom:QOMGet.entry_point
>     qom-list = qemu.qmp.qom:QOMList.entry_point
>     qom-tree = qemu.qmp.qom:QOMTree.entry_point
>     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
>     qemu-ga-client = qemu.qmp.qemu_ga_client:main
>     qmp-shell = qemu.qmp.qmp_shell:main
>
> These entries cause those weird little binary wrapper scripts to be 
> generated for you when the package is *installed*. So our packages 
> will put 'qmp-shell' and 'qom-tree' into your $PATH*.The stuff to the 
> right of the equals sign is just a pointer to a function that can be 
> executed that implements the CLI command. qemu.qmp.qmp_shell points to 
> the module to import, and ':main' points to the function to run.
>
> The last bit of this is that many, though not all (and there's zero 
> requirement this has to be true), python packages that implement CLI 
> commands will often have a stanza in their __init__.py module that 
> says something like this:
>
> if __name__ == '__main__':
>     do_the_command_line_stuff()
>
> Alternatively, a package can include a literal __main__.py file that 
> python knows to check for, and this module is the one that gets 
> executed for `python3 -m mypackage` invocations. This is what mypy does.
>
> Those are the magical blurbs that allow you to execute a module as if 
> it were a script by running "python3 -m mymodule" -- that hooks 
> directly into that little execution stanza. For python code 
> distributed as packages, that's the real reason to have that little 
> magic stanza -- it provides a convenient way to run stuff without 
> needing to write the incredibly more tedious:
>
> python3 -c "from mypy.__main__ import console_entry; console_entry();"
>
> ... which is quite a bit more porcelain too, depending on how they 
> re/factor the code inside of the package.
>
> Seeing as how mypy explicitly includes a __main__.py file: 
> https://github.com/python/mypy/blob/master/mypy/__main__.py 
> <https://github.com/python/mypy/blob/master/mypy/__main__.py>, I am 
> taking it as a given that they are fully aware of invoking mypy in 
> this fashion, and believe it safe to rely on.

Wow, thanks a lot for this detailed explanation!
> There will be a quiz later.
> (There will not be a quiz.)

I’m ready to fail any test on Python so one day I can get a “Officially 
knows nothing about Python” badge.

Hanna


