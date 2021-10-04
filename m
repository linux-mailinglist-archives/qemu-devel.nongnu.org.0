Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164944207A1
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:54:51 +0200 (CEST)
Received: from localhost ([::1]:39616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJkI-00038f-4O
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJSB-00062n-TQ
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:36:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXJS6-0001ic-Cg
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633336561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPCHQRWitGh87fRQEvOjKmn+Q29C9hXSsTFib48wn14=;
 b=D9gFv/KLqWOnyUcCUN+PWiOlIc4QbLavVvNcJppBIo7uXHw2g8Jn9jUQnHrAO4YNL/Btf9
 I6nRmJK7OHpGGTRO5OR8CXW/OFkK7laRWAciPXLlZhrdRKecdh/b+L1BAm4vqKU3kS6OUR
 STSc3kwfBumRu2ksln0Ly+YkKjYIFJE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-1c1-OrAjOVmeG5b6e-L7xg-1; Mon, 04 Oct 2021 04:36:00 -0400
X-MC-Unique: 1c1-OrAjOVmeG5b6e-L7xg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso3824194wrr.15
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SPCHQRWitGh87fRQEvOjKmn+Q29C9hXSsTFib48wn14=;
 b=oiTHOsDdEIz6etPdEPG9lkGniWGVEguwYwHWiGXNbqAyJ54aXZodzN2xhChF9axaYJ
 Su3HVHkXkXCtN3FH3Y+Nza2LcMIqH2sf91e9+AgTk4IXXQdWFhHkwKahdz0HcWAa+lgW
 DUvV+Gh/5MeV+iUz4uoxFPvlnPQvoxQOmB03HGzfbG4aHZEWfQGgTjAIWcPUOjq0nAut
 ms6zTUudD9If7wxbtL2EFFtNk+C2sycLugRbmYgsDwDEW1oBx1NUHAK5pPtSi3wstbms
 +E3YrbxxQCckq1uQspBp5GCPBS7ekLLDWInvaZdEn8teDt4e+57H58+ztm6riscyrf8i
 Otgg==
X-Gm-Message-State: AOAM531Fb3xFHwNxS9j0kvSAOapm9XIDAcqRDHhHEGjRS2SbH99nFQab
 Po1n2b6bQlhtIg7mP4pXyAjWPcG77Y7OlN7tmDZ4SgVNFmYkGJQi2j9/JVC5IzkNiwXsIU3z/xI
 r5D+DFD62XJbX74Y=
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr12527619wry.19.1633336559336; 
 Mon, 04 Oct 2021 01:35:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysN/fx/miKGEgCBKUtO5V7v5EHy+8M2ugOT0PSA8IWV5sNlv86hxOZKkVdsVcyr07OU5CTnw==
X-Received: by 2002:a05:6000:1a89:: with SMTP id
 f9mr12527606wry.19.1633336559182; 
 Mon, 04 Oct 2021 01:35:59 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o5sm13491536wrf.85.2021.10.04.01.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:35:58 -0700 (PDT)
Subject: Re: [PATCH v3 14/16] iotests/linters: Add workaround for mypy bug
 #9852
To: John Snow <jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-15-jsnow@redhat.com>
 <78ba9506-5c79-8018-3f73-a2701d313429@redhat.com>
 <CAFn=p-aAVq6MEHtrsfw3aV0y5eQzN8OpLWJjtZZ6RGXH1geTUQ@mail.gmail.com>
 <CAFn=p-a910VFGYeoDQpVxTwhpVJKz3Tym9cvaZ17SVyuvWbwpQ@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <6fae621f-d1b7-8ab4-ae74-cf7f61c4b5de@redhat.com>
Date: Mon, 4 Oct 2021 10:35:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-a910VFGYeoDQpVxTwhpVJKz3Tym9cvaZ17SVyuvWbwpQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On 22.09.21 22:38, John Snow wrote:
>
>
> On Wed, Sep 22, 2021 at 4:37 PM John Snow <jsnow@redhat.com 
> <mailto:jsnow@redhat.com>> wrote:
>
>
>     On Fri, Sep 17, 2021 at 7:16 AM Hanna Reitz <hreitz@redhat.com
>     <mailto:hreitz@redhat.com>> wrote:
>
>
>         Question is, when “can we use” mypy >= 0.920? Should we check the
>         version string and append this switch as required?
>
>
>     The answer to that question depends on how the block maintainers
>     feel about what environments they expect this test to be runnable
>     under. I lightly teased kwolf once about an "ancient" version of
>     pylint they were running, but felt kind of bad about it in
>     retrospect: the tests I write should "just work" for everyone
>     without them needing to really know anything about python or
>     setting up or managing their dependencies, environments, etc.
>
>     (1) We can use it the very moment it is released if you're OK with
>     running 'make check-dev' from the python/ directory. That script
>     sets up its own virtual environment and manages its own
>     dependencies. If I set a new minimum version, it will always use
>     it. (Same story for 'make check-tox', or 'make check-pipenv'. The
>     differences between the tests are primarily on what other
>     dependencies they have on your environment -- the details are
>     boring, see python/Makefile for further reading if desired.)
>
>     (2) Otherwise, it depends on how people feel about being able to
>     run this test directly from iotests and what versions of
>     mypy/pylint they are using. Fedora 33 for instance has
>     0.782-2.fc33 still, so I can't really "expect" people to have a
>     bleeding-edge version of mypy unless they went out of their way to
>     install one themselves. (pip3 install --user --upgrade mypy, by
>     the way.) Since people are used to running these python scripts
>     *outside* of a managed environment (using their OS packages
>     directly), I have largely made every effort to support versions as
>     old as I reasonably can -- to avoid disruption whenever I possibly
>     can.
>
>     So, basically, it kind of depends on if you want to keep 297 or
>     not. Keeping it implies some additional cost for the sake of
>     maximizing compatibility. If we ditch it, you can let the scripts
>     in ./python do their thing and set up their own environments to
>     run tests that should probably "just work" for everyone.297 could
>     even just be updated to a bash script that just hopped over to
>     ./python and ran a special avocado command that ran /only/ the
>     iotest linters, if you wanted. I just felt that step #1 was to
>     change as little as possible, prove the new approach worked, and
>     then when folks were comfortable with it drop the old approach.
>
>
> Oh, uh, and to answer your more concrete question: Nah, we don't need 
> to conditionally append this workaround. The speed lost from making 
> the check incremental is made up for by not invoking the tool 20 
> times, so it's OK to just unconditionally add it for now.

Well, yes, but it could be even faster!

And also it would save us from the pain of waiting and judging when it’s 
reasonable to drop `--no-incremental`, and/or just forgetting that this 
workaround even exists.  If we checked the version string, it would be 
OK to just forget about it, I think.

Hanna


