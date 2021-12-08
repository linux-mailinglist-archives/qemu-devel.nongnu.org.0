Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5146D59D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 15:27:02 +0100 (CET)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muxuP-0001Bx-GK
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 09:27:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxsx-0000Ow-Dx
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 09:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muxss-00022K-9F
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 09:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638973525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2/CImcrYA5ZiJHiVj0y4gFhS9OJEBYYkpmqSSB2aIk=;
 b=ef98aaLDkc2GgCJ3A/HANAmgMTfCUuyaqgnfwjGw87oZArL+zY0YBEFJm4zIPKLYajBw88
 k6kKduUrbU6fkfrFwYaEq9OUrMvDFcCaa6hLy+9NlbhFDj4OGAQlMsXaHxRaGfYvmr39tM
 xC0uLA6zUof3OYEvOnMdL4YoDcc/I9k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-ZI5R5rcrO2uxb0sfl8DtuA-1; Wed, 08 Dec 2021 09:25:22 -0500
X-MC-Unique: ZI5R5rcrO2uxb0sfl8DtuA-1
Received: by mail-wr1-f72.google.com with SMTP id
 u4-20020a5d4684000000b0017c8c1de97dso417829wrq.16
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 06:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=C2/CImcrYA5ZiJHiVj0y4gFhS9OJEBYYkpmqSSB2aIk=;
 b=IzvZDabiBZUnq1fYRorHp7c7PltUz5lTJnuj81M54YHS/GQSZCugvt7vVuj7wF+Ux5
 h4qyObgCTrTjnWLjzP6YFnS9F5tWe/pCUqlEvn5cFJ/QY6wz+clK3ztKOmUuVyDykfB2
 vBwvtSfa7G8IpLdhS5etGGUhY/P7QEM6wTPsUDBdmEyd9PijjpPH2T6R/7j3rme0khqn
 Q52ew+zxYhGN3muKuu0kbv3DoSQPbHiJPatFY/JHVmvp6+7XhqKtZN1fsKgKnFjC8VoY
 x2bHoqIb3BXKKlb4qxRKocppxy9VddPJ8vILsdFFrY1zwMlhc9i72Cm6aMOTqoDB4jyV
 JOOg==
X-Gm-Message-State: AOAM530Ct5ibelgbpk7VTBC+6XRUFotv3nBIY2CQ4Iq/FtP3ryr3vB3a
 Ha0uqmlKpEmzIL1vwRCbo85OyvD7Ts3Q7ev9TKyrpDbnHegrC5cmelntklgxp03ND3iWYilE30V
 MiWkHYKvFvwBPFrY=
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr62936472wrg.45.1638973520564; 
 Wed, 08 Dec 2021 06:25:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfXdC9FgmiqxOmhyQAtMxYMm7qKxYlDukFnXHooIoCoh6ofqYaIpv9/oLy+act7eF2sbMG5w==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr62936417wrg.45.1638973520180; 
 Wed, 08 Dec 2021 06:25:20 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id t11sm2872229wrz.97.2021.12.08.06.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 06:25:19 -0800 (PST)
Message-ID: <70b11526-e808-20ad-a862-bb4638a8c125@redhat.com>
Date: Wed, 8 Dec 2021 15:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211206141427.2395324-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH v2] blog post: how to get your new feature up-streamed
In-Reply-To: <20211206141427.2395324-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 15.14, Alex Bennée wrote:
> Experience has shown that getting new functionality up-streamed can be
> a somewhat painful process. Lets see if we can collect some of our

s/Lets/Let's/

> community knowledge into a blog post describing some best practices
> for getting code accepted.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - tweak the title
>    - expand on requirements for series of patches
>    - wrote a conclusion
> ---
>   ...26-so-you-want-to-add-something-to-qemu.md | 150 ++++++++++++++++++
>   1 file changed, 150 insertions(+)
>   create mode 100644 _posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
> 
> diff --git a/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
> new file mode 100644
> index 0000000..6d855d9
> --- /dev/null
> +++ b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
> @@ -0,0 +1,150 @@
> +---
> +layout: post
> +title:  "So you want to add a new feature to QEMU?"
> +date:   2021-11-26 19:43:45

Please refresh the date in the next version (also in the file name)

> +author: Alex Bennée
> +categories: [blog, process, development]
> +---
> +
> +From time to time I hear of frustrations from potential new
> +contributors who have tried to get new features up-streamed into the
> +QEMU repository. After having read [our patch
> +guidelines](https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html)

Maybe better use https://www.qemu.org/contribute/submit-a-patch/ instead.

> +they post them to [qemu-devel](https://lore.kernel.org/qemu-devel/).

Maybe better use https://lists.nongnu.org/mailman/listinfo/qemu-devel ?

> +Often the patches sit there seemingly unread and unloved. The
> +developer is left wandering if they missed out the secret hand shake

s/wandering/wondering/ ?

> +required to move the process forward. My hope is that this blog post
> +will help.
> +
> +New features != Fixing a bug

Want to use ≠ instead of != in case a non-developer reads this blog entry, too?

> +Adding a new feature is not the same as fixing a bug. For an area of
> +code that is supported for Odd Fixes or above there will be a

Please remove the "a" at the end of the line.

> +someone listed in the
> +[MAINTAINERS](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS)
> +file. A properly configured `git-send-email` will even automatically
> +add them to the patches as they are sent out.

add them to the CC: list when the patches are sent out ?

> The maintainer will
> +review the code and if no changes are requested they ensure the
> +patch flows through the appropriate trees and eventually makes it into
> +the master branch.
> +
> +This doesn't usually happen for new code unless your patches happen to
> +touch a directory that is marked as maintained. Without a maintainer
> +to look at and apply your patches how will it ever get merged?
> +
> +Adding new code to a project is not a free activity. Code that isn't
> +actively maintained has a tendency to [bit
> +rot](http://www.catb.org/jargon/html/B/bit-rot.html) and become a drag
> +on the rest of the code base. The QEMU code base is quite large and
> +none of the developers are knowledgeable about the all of it. If
> +features aren't
> +[documented](https://qemu.readthedocs.io/en/latest/devel/submitting-a-patch.html)

Use https://www.qemu.org/contribute/submit-a-patch/ again?

> +they tend to remain unused as users struggle to enable them. If an
> +unused feature becomes a drag on the rest of the code base by preventing
> +re-factoring and other clean ups it is likely to be deprecated.
> +Eventually deprecated code gets removed from the code base never to be
> +seen again.

I think I'd either drop thatpart about deprecation, or add another sentence 
to conclude this paragraph ("Thus there is a natural hesitation to add new 
features where the usefulness is not fully clear, e.g. due to missing 
documentation" maybe?)

> +Fortunately there is a way to avoid the ignominy of ignored new features
> +and that is to become a maintainer of your own code!
> +
> +The maintainers path
> +--------------------
> +
> +There is perhaps an unfortunate stereotype in the open source world of
> +maintainers being grumpy old experts who spend their time dismissively
> +rejecting the patches of new contributors. Having done their time in
> +the metaphorical trenches of the project they must ingest the email
> +archive to prove their encyclopedic mastery. Eventually they then
> +ascend to the status of maintainer having completed the dark key
> +signing ritual.
> +
> +In reality the process is much more prosaic - you simply need to send
> +a patch to the MAINTAINERS file with your email address, the areas you
> +are going to cover and the level of support you expect to give.

Well, there is a little bit more to this. We now have a Code of Conduct, 
too, for example. And you should be at least a little bit active on the 
mailing list first to show that you basically know what you're doing - I 
don't think we will accept a patch changing MAINTAINERS from somebody who 
never ever wrote a mail to the mailing list before.

> +I won't pretend there isn't some commitment required when becoming a
> +maintainer. However if you were motivated enough to write the code for
> +a new feature you should be up to keeping it running smoothly in the
> +upstream. The level of effort required is also proportional to the
> +popularity of the feature - there is a world of difference between
> +maintaining an individual device and a core subsystem. If the feature
> +grows in popularity and you find it difficult to keep up with the
> +maintainer effort then you can always ask for someone else to take
> +over.
> +
> +Practically you will probably want to get yourself a
> +[GitLab](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS)

Why do you reference MAINTAINERS here?

> +account so you can run the CI tests on your pull requests. While
> +membership of `qemu-devel` is recommended no one is expecting you to
> +read every message sent to it as long as you look at those where you
> +are explicitly Cc'd.
> +
> +Now if you are convinced to become a maintainer for your new feature
> +lets discuss how you can improve the chances of getting it merged.
> +
> +A practically perfect set of patches
> +------------------------------------
> +
> +I don't want to repeat all the valuable information from the
> +submitting patches document but I do want to emphasise the importance
> +of responding to comments and collecting review and testing tags.
> +While it usual to expect a maintainer `Reviewed-by` or `Acked-by` tags
> +for any patches that touches another sub-system there is still the
> +problem of getting reviews for your brand new code. Fortunately there
> +is no approved reviewer list for QEMU. The purpose of review is to
> +show that someone else has at least applied the patches and run the
> +code. Even if they are not confident in reviewing the source a
> +`Tested-by` tag gives confidence that the code works.
> +
> +Any feature that only gets manually tested from time to time is very
> +likely to break. If you are the only person who knows how to test
> +something you will be the one left to identify when it broke. For this
> +reason we have a wide arrange of testing approaches in the source
> +tree. The guiding principle of our testing system is to make it easy
> +for *any* developer to run a test from their command line using the
> +existing build system. There are two types of test that are probably
> +most important for a new feature.
> +
> +The qtest target (`make check-qtest-ARCH`) invokes a device emulation
> +testing framework that involve starting an instance of QEMU and then
> +controlling it via the QMP protocol. These tests allow you to ensure
> +that QEMU can be started up cleanly with your new device model added.
> +You can even trigger behaviour by sending a series of commands to the
> +backend. Usually there is only a minimal amount of guest code running
> +on the emulation itself.
> +
> +Our avocado tests are more of a black box whole system test. Here a
> +QEMU instance is booted up with a full software stack (e.g. a
> +distribution kernel and userspace). A lot of tests just check the
> +combination successfully boots up although it is possible to trigger
> +additional steps after the fact. Generally we prefer to use upstream
> +distro kernels because it simplifies the hosting of artefacts but if
> +custom images are needed that can be done to. We deliberately avoid
> +hosting binary blobs in the QEMU infrastructure to avoid complications
> +with licensing requirements so please ensure there are instructions
> +for how to build them if needed.
> +
> +Finally any new machine or device should come with some documentation
> +on how to enable and use it. QEMU's command line interface presents a
> +dazzlingly large array of options and features which often require
> +frontend and backend options to work together. If you want your
> +feature to be usable by other users your series should include an
> +addition to the fine manual describing some common configurations with
> +some example command lines.
> +
> +In conclusion
> +-------------
> +
> +QEMU is a large multi-featured open source project with its fair share
> +of dusty corners and a large amount of folk knowledge spread between
> +over a hundred sub-system maintainers. While the project is keen to
> +incorporate new features doing so has implications for the long term
> +maintainability of the project. Incorporating those new features is
> +easier when the project can be assured that the feature is well
> +documented and easy to test for regressions. The ideal is for features
> +to come with an active and engaged maintainer who can address patches
> +and help get changes up-streamed in a timely manner. It's through the
> +efforts of it's maintainers that QEMU remains the active and useful
> +project that it is today.
> 

  Thomas


