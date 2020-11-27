Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C92C6BB3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 19:48:30 +0100 (CET)
Received: from localhost ([::1]:43458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiinF-0007AZ-6z
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 13:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kiilV-0005xp-3Q
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:46:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kiilQ-0004Kn-Qa
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606502795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVqSjE9c+/tyMS0MiWMK0bpxkJtty11guPKEacl8KgU=;
 b=Foj0rmJsayaoCzq0PMM+yeAgNfIfVF/XwmPQolhifElLDNuGfMvxRNFLWFvgFueiEW9cOA
 5mfbVZxGZKN0ajs8U3NZek77jitH1yiQOqeNiOPzC4TSDC3RBhWjGHaGt63qMRm1Gy1KNW
 45HSC6LMv7kBwo+3KFkoJ2Uxpxcds4k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Qj03nl4dNbyUa73biXK5Eg-1; Fri, 27 Nov 2020 13:46:32 -0500
X-MC-Unique: Qj03nl4dNbyUa73biXK5Eg-1
Received: by mail-wr1-f70.google.com with SMTP id l5so3808709wrn.18
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 10:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hVqSjE9c+/tyMS0MiWMK0bpxkJtty11guPKEacl8KgU=;
 b=QYiUmhKEJS/QnwAQJsLw1rePg7GH4/O9kiBdZ5zOKsnuz5iA/itdgerxypCBRvc2Dq
 T18C0SXSswcYXyCmkSHZfiXkS8CzAWRhenwLh3sxO4S7zEiAW4PYQFjxui8ErFm2gzmX
 ToAuX33qqDdrl6skI7L59VZaFVY1sihVeznTp0DF6DNXB8pTYAVWxTXAmvyglcB9v7LM
 G9Dw1LA5lTBgp5bg0jYVO3ureyPS55SFTjdkx5t9skHSho9KxVKrdBQRn/ss43kLvJHa
 PHMKwgEd13abCQeQs2ae+tyJ6p4rVwIYbSuoDpPxJsPLykXuNvt4AgFbHh6+EA1ODy1N
 D3dA==
X-Gm-Message-State: AOAM533l0cc7elS07Ur346M609MtkQWl3q6OdUy8VT7ljNuWCqxBJ7w1
 duFRmlKOC87silwQQj7h1lD+fE9G+Y9Es31OlpiJu1ubtKvtA3PPjU+vm4wJbol38PFYKqT1QPv
 YYhAjLmhtxo67ccI=
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr12139907wrx.331.1606502791403; 
 Fri, 27 Nov 2020 10:46:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNsgsgxnaSSkc/DKEpHzO2fYKgME/3L1aOy3DfouNPp5pipqdr9riT+19mF6uRQmtmmnlXAQ==
X-Received: by 2002:a05:6000:143:: with SMTP id
 r3mr12139888wrx.331.1606502791148; 
 Fri, 27 Nov 2020 10:46:31 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id n10sm15577120wrv.77.2020.11.27.10.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 10:46:30 -0800 (PST)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
 <b08db31b-1411-6936-f737-0d6c8f98ebb8@redhat.com>
 <f32a1db5-5231-fc4d-1741-0b5ee13f618f@redhat.com>
 <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ec7e0016-7d10-49bf-0af2-69de8356bbed@redhat.com>
Date: Fri, 27 Nov 2020 19:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9157dce0-4f5d-3f1e-ce75-3e9da9252203@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/27/20 7:29 PM, Thomas Huth wrote:
> On 27/11/2020 18.57, Philippe Mathieu-Daudé wrote:
>> On 11/27/20 6:47 PM, Thomas Huth wrote:
>>> On 27/11/2020 18.41, Philippe Mathieu-Daudé wrote:
>>>> We lately realized that the Avocado framework was not designed
>>>> to be regularly run on CI environments. Therefore, as of 5.2
>>>> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
>>>> current users, it is possible to keep the current behavior by
>>>> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
>>>> (see [*]).
>>>> From now on, using these jobs (or adding new tests to them)
>>>> is strongly discouraged.
>>>>
>>>> Tests based on Avocado will be ported to new job schemes during
>>>> the next releases, with better documentation and templates.
>>>
>>> Why should we disable the jobs by default as long as there is no replacement
>>> available yet?
>>
>> Why keep it enabled if it is failing randomly
> 
> We can still disable single jobs if they are not stable, but that's no
> reason to disable all of them by default, is it?
> 
>> if images hardcoded
>> in tests are being removed from public servers, etc...?
> 
> That's independent from Avocado, you'll always have that problem if you want
> to test with external images, unless you mirror them into a repository on
> the same server (ie. gitlab), which, however, might not always be possible...
> 
>> They are not disabled, they are still runnable manually or setting
>> QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE...
> 
> And who do you think is going to set that variable? Hardly anybody, I guess.

Does that mean nobody cares about these tests?

> So you could also simply remove the stuff from the yml file completely instead.

Yes, I'd prefer that too, but Alex objected.

>> We realized by default Avocado runs all tests on the CI jobs,
>> triggering failures and complains. Developer stopped to contribute/
>> review integration tests because of that.
> 
> Did anybody really stop contributing "acceptance" test since they were
> afraid of the gitlab-CI running them? That's new to me, do you have a pointer?

No, but alternatively, how many tests were contributed / reviewed
last year?

>> We want developers be
>> able to contribute tests to the repository fearlessly.
> 
> You can always mark your test with @skipIf(os.getenv('GITLAB_CI')) if you
> don't want to see it running in the gitlab-CI, so that's not a reason to be
> afraid.

This was the idea here (opposite, tag jobs with 'gating-ci' to run
them on GitLab):
https://www.mail-archive.com/qemu-devel@nongnu.org/msg756464.html

> 
>> If we don't change anything, we'll keep having CI failures due
>> to Avocado design issues (artifacts removed from remote servers,
>> etc...).
> 
> I fail to see the relation between Avocado and vanishing artifacts from 3rd
> party servers... what do you plan to do instead if something gets (re-)moved
> from a server that is not under our control?

Avocado tests and CI are orthogonal, but it will be painful to
fix Avocado tests with the current Avocado CI jobs.

> 
>> I haven't seen any attempt on this list to improve the current
>> fragile situation, but better suggestions are certainly welcome.
> 
> At least I am hoping that the "check-acceptance" tests will break a little
> bit less often once Peter uses the gitlab-CI for his gating tests, too. That
> will at least prevent that one of the tests gets completely broken by a new
> merged pull request. Of course there's still the risk that tests only fail
> occasionally due to new bugs, but that can also happen for all other test
> suites (unit, qtest, iotests, ...), too.

Or Peter (as other users) will get grumpy at these tests because they
are unreliable, hard to understand what fail and debug.

Thus the removal suggestion, so we can "fix" the missing Avocado parts
before it is used heavily.

Phil.


