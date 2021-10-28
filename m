Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2FB43DF26
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 12:44:06 +0200 (CEST)
Received: from localhost ([::1]:53508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg2tB-0006gs-5O
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 06:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mg2jh-0001GW-FH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:34:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mg2jd-00047a-QE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 06:34:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635417251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ/rbhc1wpzfAV8rZcugxR5UQ5u31IEJ7MW5DYWYX98=;
 b=XblajDRUWExDONL1Rw3GV4fOqQGj4jrvSyZOOCzAqBOCo/DbcAy/sPgNRfCku/trvU4HeG
 9Pgsdx6KY/R3GQNcB+Cvsn43ujmLt16juZAn1JTyBhhnNrsagbjLR2Kn9s3O+jjvDgrLfB
 1r9Ym5aSgsw00xmS8f7gMvvWhd09Muc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-2gsADVI5OoqBOnL92f2fIw-1; Thu, 28 Oct 2021 06:34:09 -0400
X-MC-Unique: 2gsADVI5OoqBOnL92f2fIw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i2-20020adfefc2000000b001709de9b770so1993097wrp.16
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 03:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tZ/rbhc1wpzfAV8rZcugxR5UQ5u31IEJ7MW5DYWYX98=;
 b=rC0tb8N7dP7SDByA3pFPx4hK1VNs6K8ie4+Vx0cEeP9FjuxrISHlYQxBRoL7/cxTsT
 ls27ilIfUeLfJPdKkG6fBBJP5pDW68l64UNAdduRDf+FpU5F3cVmYCMs28WXj0h2g6g6
 V6WdFgd1Efm6gJNF9fOa/PNh2bfj0H3jtt2tU7RajjASpOI8GBTNMVD1SiHZLCh9xhJz
 UYEYeQ7rf32Y5tb8DF79dav1kKHRt6dec2qBIp/OZV8fPmgvDFdKVOgmJ01wxFJYS5tk
 XudKUZ5f0RCe/nXfs8AJzuNSDCtB+ZtfV+qUaDX+yGNqws5TwUigYuKta1+Gdf+1KGs2
 nxew==
X-Gm-Message-State: AOAM531AUB4KwL8bX5GmlbaHqJ3Wof3iBcefcHMBkC5fQ1iZ0GkA5/8U
 y03aWWxwIaaV+DcUXY8mInawxHf8Ja69YgG3ymVsnQreAdG5DT0LKneKAUpw6tIaL+qg9ieHnmw
 u+VloDvKHn76wH3A=
X-Received: by 2002:a7b:c103:: with SMTP id w3mr11513640wmi.179.1635417248075; 
 Thu, 28 Oct 2021 03:34:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMwD+t3BRJ8kGlIqtccDmwF7AFJLPcwEqMFA0QvIYZMl82yng9c8sKnY1B0KLmmiIw9PN0+Q==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr11513609wmi.179.1635417247715; 
 Thu, 28 Oct 2021 03:34:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l2sm6804635wmi.1.2021.10.28.03.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 03:34:07 -0700 (PDT)
Message-ID: <f9dd697b-02ef-7f67-32ff-595e9f2d9457@redhat.com>
Date: Thu, 28 Oct 2021 12:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 11/15] iotests: split linters.py out from 297
To: John Snow <jsnow@redhat.com>
References: <20211019144918.3159078-1-jsnow@redhat.com>
 <20211019144918.3159078-12-jsnow@redhat.com>
 <ebded478-63ee-a2d2-7b90-d6d6926d9291@redhat.com>
 <CAFn=p-agMGtbryADMxgiG5OLFSXyZd+Zf9YrJyyyRVXgN2UGgA@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <CAFn=p-agMGtbryADMxgiG5OLFSXyZd+Zf9YrJyyyRVXgN2UGgA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.10.21 20:30, John Snow wrote:
>
>
> On Tue, Oct 26, 2021 at 6:51 AM Hanna Reitz <hreitz@redhat.com> wrote:
>
>     On 19.10.21 16:49, John Snow wrote:
>     > Now, 297 is just the iotests-specific incantations and
>     linters.py is as
>     > minimal as I can think to make it. The only remaining element in
>     here
>     > that ought to be configuration and not code is the list of skip
>     files,
>     > but they're still numerous enough that repeating them for mypy and
>     > pylint configurations both would be ... a hassle.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com>
>     > ---
>     >   tests/qemu-iotests/297        | 72
>     +++++----------------------------
>     >   tests/qemu-iotests/linters.py | 76
>     +++++++++++++++++++++++++++++++++++
>     >   2 files changed, 87 insertions(+), 61 deletions(-)
>     >   create mode 100644 tests/qemu-iotests/linters.py
>
>     Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>
>
> Thanks!
>
>     I wonder about `check_linter()`, though.  By not moving it to
>     linters.py, we can’t use it in its entry point, and so the Python
>     test
>     infrastructure will have a strong dependency on these linters. Though
>     then again, it probably already does, and I suppose that’s one of the
>     points hindering us from running this from make check?
>
>
> That one is left behind because it uses iotests API to skip a test. 
> Environment setup that guarantees we won't *need* to skip the test is 
> handled by the virtual environment setup magic in qemu/python/Makefile.
>
>     Hanna
>
>
> More info than you require:
>
> There's maybe about four ways you could run the python tests that 
> might make sense depending on who you are and what you're trying to 
> accomplish; they're documented in "make help" and again in 
> qemu/python/README.rst;
>
> (1) make check-dev -- makes a venv with whatever python you happen to 
> have, installs the latest packages, runs the tests
> (2) make check-pipenv -- requires python 3.6 specifically, installs 
> the *oldest* packages, runs the tests
> (3) make check-tox -- requires python 3.6 through 3.10, installs the 
> newest packages, runs the tests per each python version
> (4) make check -- perform no setup at all, just run the tests in the 
> current environment. (Used directly by all three prior invocations)

AFAIU these are all to be run in build/python?  Isn’t any of them hooked 
up to the global `make check` in build?  Because...

> In general, I assume that human beings that aren't working on Python 
> stuff actively will be using (1) at their interactive console, if they 
> decide to run any of these at all.

...I’m just running `make check` in the build directory.

I would have hoped that this is hooked up to something that won’t fail 
because I don’t have some necessary tools installed or perhaps even 
because I have the wrong version of some tools installed (although the 
latter would be kind of questionable...).  Would be nice if the global 
`make check` had a summary on what was skipped...

> It imposes the least pre-requirements while still endeavoring to be a 
> target that will "just work".
> Options (2) and (3) are what power the CI tests 'check-python-pipenv' 
> and 'check-python-tox', respectively; with(2) being the one that 
> actually gates the CI.
> Option (4) is only really a convenience for bypassing the venv-setup 
> stuff if you want to construct your own (or not use one at all). So 
> the tests just assume that the tools they have available will work. 
> It's kind of a 'power user' target.
>
> The way the CI works at the moment is that it uses a "fedora:latest" 
> base image and installs python interpreters 3.6 through 3.10 
> inclusive, pipenv, and tox. From there, it has enough juice to run the 
> makefile targets which take care of all of the actual linting 
> dependencies and their different versions to get a wider matrix on the 
> version testing to ensure we're still keeping compatibility with the 
> 3.6 platform while also checking for new problems that show up on the 
> bleeding edge.

Perhaps it’s unreasonable, but I’d prefer if a local `make check` would 
already run most tests in some form or another and that I don’t have to 
push to gitlab and wait for the CI there.

I mean, I can of course also integrate a `cd python && make check-dev` 
invocation into my test scripts, but it doesn’t feel right to 
special-case one test area.

> iotests 297 right now doesn't do any python environment setup at all, 
> so we can't guarantee that the linters are present, so we decide to 
> allow the test to be skipped. My big hesitation of adding this test 
> directly into 'make check' is that I will need to do some environment 
> probing to make sure that the 'pylint' version isn't too old -- or 
> otherwise set up a venv in the build directory that can be used to run 
> tests. I know we already set one up for the acceptance tests, so maybe 
> there's an opportunity to re-use that venv, but I need to make sure 
> that the dependencies between the two sets of tests are aligned. I 
> don't know if they agree, currently.

I see.

> I think I probably want to minimize the number of different virtual 
> python environments we create during the build, so I will look into 
> what problems might exist in re-purposing the acceptance test venv. If 
> that can get squared away easily, there's likely no real big barrier 
> to adding more tests that rely on a python venv to get cooking during 
> the normal build/check process, including iotest 297.

OK, thanks for the explanation!

Hanna


