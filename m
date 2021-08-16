Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113A03ED305
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 13:21:14 +0200 (CEST)
Received: from localhost ([::1]:45458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFag4-0003b5-RB
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 07:21:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFafE-0002pa-9n
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:20:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFafC-000542-Fa
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 07:20:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id x12so23027016wrr.11
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2W6dJn38Z+OrW17s7tsRmH/Dvz0gCXqbhoyNpKYTyfc=;
 b=VA7nX9VUV+irtKYwhyVCsKkmsKWlx9tT25KqCutmXpCXQVl/IHtr9p7ymKFBXaRkLN
 x7b+1KppqMJX0ZsfXlA7qAbEYp/coozghmphKvEygCnCL5VP99VXDV10xzlRBwJWQtm/
 IzMYZT02Zi5RDQ9t6VztROrloDj3OFwE1rhWyB7qx7nWyDjYvTCtSxjNMCpGeDxugJ4o
 +uzAeghq3OJtsxXzLZ9lPQ8p/h7xylH1Nv+G6tYkU3S3UXoOJMnCJ5tUAvGnQerdAvHL
 XF3ljB5RqHNiP6qNbgSM9ytAQ0EFEtT3U/Z4F+Up6q1viIcwFTNSXo9ZW95ivnhYtpTt
 Mi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2W6dJn38Z+OrW17s7tsRmH/Dvz0gCXqbhoyNpKYTyfc=;
 b=rg1c8677IOVUObAW+g76TB9G8VnUEUB0fDelPDXxgX/ag5+XEY+/zFiZaiANd+DHo6
 tk7jZpwYbbUWZOn6XGi7yX94xOiKcOyiBb3oe/r/6fHvOpkGE9OP0IVS1Q4NdqRgvU6X
 0x9PRaft3YSuWsps5xcxESAkTfVhO3kobJjfUCpkkYoCky7N/zk+Z64ErvNq7CnBiEBY
 /Orh+TcmzcfiYvT2FV1napYsppvU3crGhFk16X9ukMxH/67Zs+FQJdeTDIA175P4TCuO
 QcB38qwlmEv9M5aFZRGbJp0UlAzgu3pkdT+lsbg0slzUZ7meQOYEjvJ6QzppWnu9vnZX
 rlCA==
X-Gm-Message-State: AOAM531cuFxCsYF1Hc4qL8J5vqLmV/4ebeub40yt3mnVJKukBT8wRBno
 962QdTF9DElf3x8qN6+zjqI=
X-Google-Smtp-Source: ABdhPJyEEXcUYnF4HdT5i9YigRf+/ccVJUQOHESediEaPIU1H7KWp+Kv5VEDWzvyz7BAhFP12Nw5mA==
X-Received: by 2002:adf:e101:: with SMTP id t1mr17921555wrz.215.1629112816817; 
 Mon, 16 Aug 2021 04:20:16 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id q11sm10457203wmc.41.2021.08.16.04.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 04:20:16 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com> <87y291u0st.fsf@redhat.com>
 <YRpGFnvZznlU9RKQ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3062c8e9-b7f1-30ef-ddfa-006f4ea4f7e7@amsat.org>
Date: Mon, 16 Aug 2021 13:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRpGFnvZznlU9RKQ@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 1:03 PM, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 12:44:02PM +0200, Cornelia Huck wrote:
>> On Thu, Aug 12 2021, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>> The minimal job set covers:
>>>
>>>   * Fedora, CentOS, Ubuntu & Debian system emulator builds
>>>     to cover all arch targets.
>>>   * Linux user static build
>>>   * Cross build i386 (to identify any 32-bit build issues)
>>>   * Cross build s390x (to identify any big endian build issues)
>>>   * Containers needed for the above
>>>   * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
>>>   * Simple checks - python unittests, DCO check, checkpatch.pl, etc
>>>
>>> This gives about 30 jobs instead of 120 from the "Full" group. It
>>> is likely reasonable to cut the minimal set down even more, as IMHO
>>> there are too many system emulator jobs there.
>>
>> Where do you think we should start to cut them down? Limit the set of
>> tested arch targets to the most common ones?
> 
> Some of our targets are obviously much more important and
> frequently changed than others.  For contributors our goal is
> to mimimize breakage after patches are submitted. Most of our
> contributors changes will be well covered by x86-64 + aarch64
> alone. Other targets give varying degrees of extra benefit.
> 
> On the other hand the contributors are likely to have tested
> x86_64 or aarch64 themselves since that'll be their dev
> platform. So the benefit of CI is testing bits that they
> didnt bother to test.
> 
> No clear easy answer here, but I feel like we could benefit
> from classifying our target archs tier 1/2/3 and tailoring
> our default testing matrix accordingly.

[*]

> The other way to cut down the "minimal" set is to reduce
> the OS containers that we build. The jobs above end up
> requiring something like 8 container builds - we should
> try to cut this down to perhaps 2-3 container builds
> 
>> Generally speaking, this makes sense; but I think we have different
>> situations which need different kinds of testing, and we should make it
>> as easy as possible to run the right set of tests.
>>
>> (a) an individual contributor is doing some changes
>>
>> In that case, I assume (hope?) that the contributor has actually
>> compiled the code for the relevant targets and has done some manual
>> testing. Running acceptance tests locally would also be good, or things
>> like iotests or check-tcg, when applicable.
> 
> With my contributor hat on, I like GitLab CI to validate the platforms
> I always forget. Changes I do are 95% tested on Fedora x86_64. I have
> often broken stuff for non-Linux builds (Windows in particular), or
> have broken non-x86_64 target arches. CI lets me see this before
> sending patches.  Unfortunately this means I benefit most from the
> "full" set, but this won't be sustainable with limited CI minutes :-(

Hmmm somehow. What we said 2 years ago was "if a vendor is interested
in have QEMU working on a target, it should provide hardware to the
project, otherwise it can't be considered a tier 1 platform" [*].
Some did, but we have been wasting their resources doing almost nothing,
mostly because we were not ready / organized to use them. Hopefully this
might change soon.

> When I'm working on changing gitlab CI rules, then I burn loads of
> minutes which is especially troubling - limited CI minutes will make
> it very hard for me to debug future CI rule changes :-(

Which is why I stopped doing gitlab-related patches and reduced
my testing (or even worst for me, before I was simply doing
'git-push' and wait for the pipeline result, now I'm back
running 6 different scripts locally).

>> (c) a subsystem maintainer is preparing a pull request
>>
>> Ideally, that should run the 'gating' set, to eliminate needless bounces
>> of the pull request; plus some subsystem-specific manual testing on
>> top. In practice, the 'full' set might be good enough.
> 
> Yeah, the full/gating set is what I would thing subsys maintainers
> would want to use, to minimize risk that Peter's tests throw back
> the merge due to failure. The only difference of gating vs full
> is whether the acceptance tests run.

"run" or "pass"?

> Of course this relies on us being able to use GitLab for 100% of
> merge time gating. Cleber's custom runners recently enabled get
> us closer, but I think Peter still uses some other hardware
> outside of GitLab for some testing.

There is hope!

