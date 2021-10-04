Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE953420720
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:14:17 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJ71-0001AN-Vu
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXIf5-0004iA-2S
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mXIf0-0005Pt-8M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 03:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633333517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nARG/siZu0p8R1PGwu/7BUGOoz8ZvNx6eN7UmPuxzVE=;
 b=DXTV6UVjzZTvjsEPegfnsQNTg09jihapH94HHOdXZyA7CAt+EPB/wyqipTpoBuntc3Sefm
 CzunLljanvrJpMEDYpuVxhlkUM6vFYjoHs6lRjoMXSIr2L1z1KRP53vMNOSHMwZytUlo2p
 AW/WMHhSVOik08rp7etbGTlKHVjpGUo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-lpTIy_GlNgm6ixO-nlCvBw-1; Mon, 04 Oct 2021 03:45:13 -0400
X-MC-Unique: lpTIy_GlNgm6ixO-nlCvBw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n17-20020a7bc5d1000000b0030d4041f73eso2688054wmk.4
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 00:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nARG/siZu0p8R1PGwu/7BUGOoz8ZvNx6eN7UmPuxzVE=;
 b=bFePToqqVXOru5I4Fz53w3Llsie+EMjOfgCJ+7BXTqj4FYUkcFR2wR3CVel50W6CKV
 8EkteAtM/PA2i7uAo6IdKufRktUNSctwYdZd6jDoIgJkCmoFkHWc0VY9mzwFVlZbmW50
 HuqnDUsumFLpSK74iVTa+MPvImq9LWXZ36xlMxZuxM03dwdRhD32TCh7wtZiqXGLzDQr
 rTb/eDbA1BpfbXuM4BgH00M1h97/GE18Ky1MfMcU/Y+2bOCz2hMl+BUdbTESVqL4fhg1
 ea/EPK1SZDfq/JhOeQzPPXqrewqd9xKCb9GVLBzYrqqeBUyPZ5vKR7KGmn8cThOD/Hnl
 hUjA==
X-Gm-Message-State: AOAM531UNaeQUtIXarFnlJmldzD1AgTUS+lv9uoMGe07nZb7zZZDTykt
 AbBQ43ExrVd8iprrfkGp9AjTwcvNRoyczfJbjkjC+DshnqcnAlMnfPwrUW+2J2HqkDUcODNkxbo
 0wvTYmfD65+1Ipk8=
X-Received: by 2002:adf:c7c2:: with SMTP id y2mr12810539wrg.248.1633333512686; 
 Mon, 04 Oct 2021 00:45:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLIPVgoMnEoHnmiumnF6u9L/YEusVK6zu6gE5TICkmrGNDiGtrbgF7mHNW9u/5I1dvWLDsHQ==
X-Received: by 2002:adf:c7c2:: with SMTP id y2mr12810497wrg.248.1633333512435; 
 Mon, 04 Oct 2021 00:45:12 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e48:3780:4451:9a65:d4e9:9bb6])
 by smtp.gmail.com with ESMTPSA id o19sm14226161wrg.60.2021.10.04.00.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 00:45:11 -0700 (PDT)
Subject: Re: [PATCH v3 11/16] iotests/297: return error code from run_linters()
To: John Snow <jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-12-jsnow@redhat.com>
 <f3d43e69-4719-d0b9-79c1-03a7732839ed@redhat.com>
 <CAFn=p-ZXxKDQUxUtupC+arC7_faMFvoJm9XxwxSPDxGRC2Ku=Q@mail.gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <f5004230-4295-61eb-6a0a-25719a545db3@redhat.com>
Date: Mon, 4 Oct 2021 09:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZXxKDQUxUtupC+arC7_faMFvoJm9XxwxSPDxGRC2Ku=Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.09.21 22:18, John Snow wrote:
>
>
> On Fri, Sep 17, 2021 at 7:00 AM Hanna Reitz <hreitz@redhat.com 
> <mailto:hreitz@redhat.com>> wrote:

[...]

>
>     As you say, run_linters() to me seems very iotests-specific still: It
>     emits a specific output that is compared against a reference output.
>     Fine for 297, but not fine for a function provided by a
>     linters.py, I’d say.
>
>     I’d prefer run_linters() to return something like a Map[str,
>     Optional[str]], that would map a tool to its output in case of error,
>     i.e. ideally:
>
>     `{'pylint': None, 'mypy': None}`
>
>
> Splitting the test apart into two sub-tests is completely reasonable. 
> Python CI right now has individual tests for pylint, mypy, etc.
>
>     297 could format it something like
>
>     ```
>     for tool, output in run_linters().items():
>          print(f'=== {tool} ===')
>          if output is not None:
>              print(output)
>     ```
>
>     Or something.
>
>     To check for error, you could put a Python script in python/tests
>     that
>     checks `any(output is not None for output in
>     run_linters().values())` or
>     something (and on error print the output).
>
>
>     Pulling out run_linters() into an external file and having it print
>     something to stdout just seems too iotests-centric to me.  I
>     suppose as
>     long as the return code is right (which this patch is for) it should
>     work for Avocado’s simple tests, too (which I don’t like very much
>     either, by the way, because they too seem archaic to me), but,
>     well.  It
>     almost seems like the Avocado test should just run ./check then.
>
>
> Yeh. Ideally, we'd just have a mypy.ini and a pylintrc that configures 
> the tests adequately, and then 297 (or whomever else) would just call 
> the linters which would in turn read the same configuration. This 
> series is somewhat of a stop-gap to measure the temperature of the 
> room to see how important it was to leave 297 inside of iotests. So, I 
> did the conservative thing that's faster to review even if it now 
> looks *slightly* fishy.
>
> As for things being archaic or not ... possibly, but why involve extra 
> complexity if it isn't warranted?

My opinion is that I find an interface of “prints something to stdout 
and returns an integer status code” to be non-intuitive and thus rather 
complex actually.  That’s why I’d prefer different complexity, namely 
one which has a more intuitive interface.

I’m also not sure where the extra complexity would be for a 
`run_linters() -> Map[str, Optional[str]]`, because 297 just needs the 
loop suggested above over `run_linters().items()`, and as for the 
Avocado test...

> a simple pass/fail works perfectly well.

I don’t find `any(error_msg for error_msg in run_linters().values())` 
much more complex than pass/fail.

(Note: Above, I called it `output`.  Probably should have called it 
`error_msg` like I did now to clarify that it’s `None` in case of 
success and a string otherwise.)

> (And the human can read the output to understand WHY it failed.) If 
> you want more rigorous analytics for some reason, we can discuss the 
> use cases and figure out how to represent that information, but that's 
> definitely a bit beyond scope here.

[...]

>     Like, can’t we have a Python script in python/tests that imports
>     linters.py, invokes run_linters() and sensibly checks the output? Or,
>     you know, at the very least not have run_linters() print anything to
>     stdout and not have it return an integer code. linters.py:main()
>     can do
>     that conversion.
>
>
> Well, I certainly don't want to bother parsing output from python 
> tools and trying to make sure that it works sensibly cross-version and 
> cross-distro. The return code being 0/non-zero is vastly simpler. Let 
> the human read the output log on failure cases to get a sense of what 
> exactly went wrong. Is there some reason why parsing the output would 
> be beneficial to anyone?

Perhaps there was a misunderstanding here, because there’s no need to 
parse the output in my suggestion.  `run_linters() -> Map[str, 
Optional[str]]` would map a tool name to its potential error output; if 
the tool exited successfully (exit code 0), then that `Optional[str]` 
error output would be `None`.  It would only be something if there was 
an error.

> (The Python GitLab CI hooks don't even bother printing output to the 
> console unless it returns non-zero, and then it will just print 
> whatever it saw. Seems to work well in practice.)
>
>
>     Or, something completely different, perhaps my problem is that you
>     put
>     linters.py as a fully standalone test into the iotests directory,
>     without it being an iotest.  So, I think I could also agree on
>     putting
>     linters.py into python/tests, and then having 297 execute that. 
>     Or you
>     know, we just drop 297 altogether, as you suggest in patch 13 – if
>     that’s what it takes, then so be it.
>
>
> I can definitely drop 297 if you'd like, and work on making the linter 
> configuration more declarative. I erred on the side of less movement 
> instead of more so that disruption would be minimal. It might take me 
> some extra time to work out how to un-scriptify the test, though. I'd 
> like to get a quick temperature check from kwolf on this before I put 
> the work in.

So since we seem to want to keep 297, would it be possible to have 297 
run a linters.py that’s in python/tests?

>     Hanna
>
>
>     PS: Also, summing up processes’ return codes makes me feel not good.
>
>
> That's the part Vladimir didn't like. There was no real reason for it, 
> other than it was "easy".

I very much don’t find it easy, because it’s semantically wrong and thus 
comparatively hard to understand.

> I can make it a binary 0/1 return instead, if that'd grease the wheels.

Well, while I consider it necessary, it doesn’t really make the patch 
more palatable to me.

Hanna


