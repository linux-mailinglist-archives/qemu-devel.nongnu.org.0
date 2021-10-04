Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC3B4207CE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:04:37 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJtk-00031v-TS
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJNZ-0001GJ-9Y
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJNW-0003ZD-CA
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:31:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BEq6HK5UkN6TmUHXpQdGU0S4wof2qQGwO1pymBMWs0=;
 b=MG1Bis+VzK6Bfs8V9dqykA3dWbLVuawkA8hdW8kZif11VhFmy3aFzco/xWCj8X75jgdmgL
 IuLavQe8f2EGTiExBlW0jC1YL2m9ZS0tUfQxQp0QfbTAcqyE+uEvhz+T/LyqdzUFDmLdF4
 C/PzKzdMr1B6POkK77T+UFm6JJwNFu8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-oizoI9hUO5-WLIc5Sqx1cA-1; Mon, 04 Oct 2021 04:31:13 -0400
X-MC-Unique: oizoI9hUO5-WLIc5Sqx1cA-1
Received: by mail-wm1-f71.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso1728311wmb.5
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:31:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1BEq6HK5UkN6TmUHXpQdGU0S4wof2qQGwO1pymBMWs0=;
 b=wppt3ynGrxKJRF3hnHzfK5DbWadZ5NIha7TDDRIg/LoqFVDgjwE160Y+1p73d5DkKw
 ZnrWplvikw+ynwg/p2IKwQUIUBxdHRkhhxBZhqfFAC6dR4gjNekDTjALfbkm6rTQf1eZ
 /Tepa5/H+M0eTV5840eZcSZH1Tux679wkIje8ADJZmlHajQuqRmluuriz0NTMFGDfeor
 fKTRsUGxGvXOgYzrlLEfJV5lmqa254jUNkKlUSYZFK+IqBKHtQBAkgijHlWe6QTNcHD8
 om0AhGLZni7rUQcUcaxSDSFCw2SZ7ArEeAcfW5vmlsrT06c1l6K2mJFu9LtQyHi36kff
 t00g==
X-Gm-Message-State: AOAM532cRZuHZPG/oD5Nt0meYrjgYCMFZ1uHk3Tf5hgUJoqozA5Uy9oz
 uxNLOmNbdwqpzJptqs50zxMshvuC/tFEHRHdu/RiLHEyuCzfS//WVPrtgdhUNqoIXbPudSfe1zo
 GYbMMw4GVAvL5x/I=
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr12720154wrw.87.1633336271893; 
 Mon, 04 Oct 2021 01:31:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGynEsL6McA1MSWrgo6dHqTBHSr7N7beiQ95xxD3Ix8WyxjgmJkUld59PadjqqGqzIy3GQmQ==
X-Received: by 2002:a5d:55c3:: with SMTP id i3mr12720121wrw.87.1633336271636; 
 Mon, 04 Oct 2021 01:31:11 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id k22sm13952469wrd.59.2021.10.04.01.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:31:11 -0700 (PDT)
Subject: Re: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug
 #9852
To: John Snow <jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-15-jsnow@redhat.com>
 <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
 <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <096c3dd6-192f-dd84-65e6-44d7bbd05a23@redhat.com>
Date: Mon, 4 Oct 2021 10:31:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.21 22:37, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 7:16 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:
>
>     On 16.09.21 06:09, John Snow wrote:
>     > This one is insidious: if you use the invocation
>     > "from {namespace} import {subpackage}" as mirror-top-perms does,
>     > mypy will fail on every-other invocation *if* the package being
>     > imported is a package.
>     >
>     > Now, I could just edit mirror-top-perms to avoid this
>     invocation, but
>     > since I tripped on a landmine, I might as well head it off at
>     the pass
>     > and make sure nobody else trips on the same landmine.
>     >
>     > It seems to have something to do with the order in which files are
>     > checked as well, meaning the random order in which set(os.listdir())
>     > produces the list of files to test will cause problems
>     intermittently.
>     >
>     > mypy >= 0.920 isn't released yet, so add this workaround for now.
>     >
>     > See also:
>     > https://github.com/python/mypy/issues/11010
>     <https://github.com/python/mypy/issues/11010>
>     > https://github.com/python/mypy/issues/9852
>     <https://github.com/python/mypy/issues/9852>
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com
>     <mailto:jsnow@redhat.com>>
>     > ---
>     >   tests/qemu-iotests/linters.py | 3 +++
>     >   1 file changed, 3 insertions(+)
>     >
>     > diff --git a/tests/qemu-iotests/linters.py
>     b/tests/qemu-iotests/linters.py
>     > index 4df062a973..9c97324e87 100755
>     > --- a/tests/qemu-iotests/linters.py
>     > +++ b/tests/qemu-iotests/linters.py
>     > @@ -100,6 +100,9 @@ def run_linters(
>     >                   '--warn-unused-ignores',
>     >                   '--no-implicit-reexport',
>     >                   '--namespace-packages',
>     > +                # Until we can use mypy >= 0.920, see
>     > +                # https://github.com/python/mypy/
>     <https://github.com/python/mypy/issues/9852>issues
>     <https://github.com/python/mypy/issues/9852>/9852
>     <https://github.com/python/mypy/issues/9852>
>     > +                '--no-incremental',
>     >                   filename,
>     >               ),
>
>     I’m afraid I still don’t really understand this, but I’m happy
>     with this
>     given as the reported workaround and you saying it works.
>
>     Reviewed-by: Hanna Reitz <hreitz@redhat.com
>     <mailto:hreitz@redhat.com>>
>
>     Question is, when “can we use” mypy >= 0.920?  Should we check the
>     version string and append this switch as required?
>
>
> The answer to that question depends on how the block maintainers feel 
> about what environments they expect this test to be runnable under. I 
> lightly teased kwolf once about an "ancient" version of pylint they 
> were running, but felt kind of bad about it in retrospect: the tests I 
> write should "just work" for everyone without them needing to really 
> know anything about python or setting up or managing their 
> dependencies, environments, etc.
>
> (1) We can use it the very moment it is released if you're OK with 
> running 'make check-dev' from the python/ directory. That script sets 
> up its own virtual environment and manages its own dependencies. If I 
> set a new minimum version, it will always use it. (Same story for 
> 'make check-tox', or 'make check-pipenv'. The differences between the 
> tests are primarily on what other dependencies they have on your 
> environment -- the details are boring, see python/Makefile for further 
> reading if desired.)
>
> (2) Otherwise, it depends on how people feel about being able to run 
> this test directly from iotests and what versions of mypy/pylint they 
> are using. Fedora 33 for instance has 0.782-2.fc33 still, so I can't 
> really "expect" people to have a bleeding-edge version of mypy unless 
> they went out of their way to install one themselves. (pip3 install 
> --user --upgrade mypy, by the way.) Since people are used to running 
> these python scripts *outside* of a managed environment (using their 
> OS packages directly), I have largely made every effort to support 
> versions as old as I reasonably can -- to avoid disruption whenever I 
> possibly can.
>
> So, basically, it kind of depends on if you want to keep 297 or not. 
> Keeping it implies some additional cost for the sake of maximizing 
> compatibility. If we ditch it, you can let the scripts in ./python do 
> their thing and set up their own environments to run tests that should 
> probably "just work" for everyone.297 could even just be updated to a 
> bash script that just hopped over to ./python and ran a special 
> avocado command that ran /only/ the iotest linters, if you wanted. I 
> just felt that step #1 was to change as little as possible, prove the 
> new approach worked, and then when folks were comfortable with it drop 
> the old approach.

Hm.  So the gist is, since we apparently want to keep 297, we have to 
wait for some indefinite time until in some years or so someone 
remembers this workaround and removes it?

Doesn’t sound quite ideal, but well...

Hanna


