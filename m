Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C52AD458
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:02:26 +0100 (CET)
Received: from localhost ([::1]:43300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRPt-0003m4-D1
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcRNc-00036J-Es
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:00:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcRNZ-00009v-L2
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mgUnwLRwwISkNDikgzJue6+cKFskuEp4mva022X13PY=;
 b=cE85q4INWu8Uxt2VNBo5xwqctKRbNiQZjsd9bkojL3jZAfsGnUYxvBEotQEixchsPi2T9K
 lUafPdlE+D9XNwK8m1XCqxt0Bp3KoDl9GLFZUQiMovacgvu5on+d6C2nUAtYXeZg++bcYF
 QAiwcQ/Il3ouQDUrHQvusSzcsC3ClOE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-1Yk9YYIqPY-82L6euB-SJg-1; Tue, 10 Nov 2020 05:59:58 -0500
X-MC-Unique: 1Yk9YYIqPY-82L6euB-SJg-1
Received: by mail-wr1-f69.google.com with SMTP id e11so5578504wrw.14
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgUnwLRwwISkNDikgzJue6+cKFskuEp4mva022X13PY=;
 b=PD1d6sd4qfqmeWz2nXkMH0m0jK5LieYrJRPueo+VFiELfDtRjgf3hBz/ZUpe/IVYtd
 nQGCS34ycdCiEpZO/DxRDqJCnPM9rp8Im/o8f+G1htajmPO/XhnLqf/nGgambdEB7YHF
 7n3ACrCHhwIUQTeTMdh2kOemgfXTuuIL3faQF1Nj6+RALPG0mHeYaVHrSq9IRrTN5aC9
 E0Yb5kK9hcmCa+qed3kV7WtfSss59rvtC3TguVTSWd9IdTScKWpINnkuZS4oNbu4hqHz
 6HCJp5aTwR5WlixCpeunkrLZU3QhjtKJa3LVdBlZejJ5j6BX0qcv3Im9z9GxFn2YmK1g
 h4Lg==
X-Gm-Message-State: AOAM533fTk9bz3DHjGjLx6NKq/URvizKlXtCjDvQM9pDhRtaNQ+PjmT3
 BiTXfbQ/fClERCV/X0FnxD8ZJSGHlLtyx+zDQzCyRKOfh4lwJACFmdhnsXJEOLgyt0TyY/1vokk
 FvVX9Wk74uB0LiRc=
X-Received: by 2002:a5d:6688:: with SMTP id l8mr24685721wru.360.1605005997595; 
 Tue, 10 Nov 2020 02:59:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx6VZbNhYWz9npZAAPTu2vg6lR6YSX4TNf3Exx56bdZrvqNzf8T1hPNE4JlJEcB1Dkk9zjNLA==
X-Received: by 2002:a5d:6688:: with SMTP id l8mr24685696wru.360.1605005997305; 
 Tue, 10 Nov 2020 02:59:57 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y4sm2511184wmj.2.2020.11.10.02.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:59:56 -0800 (PST)
Subject: Re: [PULL 5/7] gitlab-ci: Move edk2 and opensbi YAML files to
 .gitlab-ci.d folder
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20200528101039.24600-1-thuth@redhat.com>
 <20200528101039.24600-6-thuth@redhat.com>
 <955bad5e-51ca-5b3f-c68f-a0374fc00a43@redhat.com>
 <20201012140131.GH39408@redhat.com>
 <9bfcca65-7e22-3e23-b4e6-787ee5a006dd@redhat.com>
Message-ID: <67ffa82b-a842-d4a7-b276-2018bfe21e6b@redhat.com>
Date: Tue, 10 Nov 2020 11:59:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9bfcca65-7e22-3e23-b4e6-787ee5a006dd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/20 4:18 PM, Philippe Mathieu-Daudé wrote:
> On 10/12/20 4:01 PM, Daniel P. Berrangé wrote:
>> On Mon, Oct 12, 2020 at 03:44:00PM +0200, Philippe Mathieu-Daudé wrote:
>>> Hi Thomas, Alex,
>>>
>>> +Daniel
>>>
>>> On 5/28/20 12:10 PM, Thomas Huth wrote:
>>>> We have a dedicated folder for the gitlab-ci - so there is no need
>>>> to clutter the top directory with these .yml files.
>>>>
>>>> Message-Id: <20200525131823.715-5-thuth@redhat.com>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    .gitlab-ci-edk2.yml => .gitlab-ci.d/edk2.yml       | 0
>>>>    .gitlab-ci-opensbi.yml => .gitlab-ci.d/opensbi.yml | 0
>>>>    .gitlab-ci.yml                                     | 4 ++--
>>>>    MAINTAINERS                                        | 2 +-
>>>>    4 files changed, 3 insertions(+), 3 deletions(-)
>>>>    rename .gitlab-ci-edk2.yml => .gitlab-ci.d/edk2.yml (100%)
>>>>    rename .gitlab-ci-opensbi.yml => .gitlab-ci.d/opensbi.yml (100%)
>>>>
>>>> diff --git a/.gitlab-ci-edk2.yml b/.gitlab-ci.d/edk2.yml
>>>> similarity index 100%
>>>> rename from .gitlab-ci-edk2.yml
>>>> rename to .gitlab-ci.d/edk2.yml
>>>> diff --git a/.gitlab-ci-opensbi.yml b/.gitlab-ci.d/opensbi.yml
>>>> similarity index 100%
>>>> rename from .gitlab-ci-opensbi.yml
>>>> rename to .gitlab-ci.d/opensbi.yml
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index bc6aee6aba..5208d93ff8 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>>> @@ -1,6 +1,6 @@
>>>>    include:
>>>> -  - local: '/.gitlab-ci-edk2.yml'
>>>> -  - local: '/.gitlab-ci-opensbi.yml'
>>>> +  - local: '/.gitlab-ci.d/edk2.yml'
>>>> +  - local: '/.gitlab-ci.d/opensbi.yml'
>>>
>>> It seems these jobs are now always run, the "rules:changes"
>>> to restrict them is ignored.
>>>
>>> I searched a bit and found a plausible explanation here:
>>> https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges
>>>
>>> "Caution: In pipelines with sources other than the three above
>>> changes can’t
>>> determine if a given file is new or old and always returns true. This
>>> includes pipelines triggered by pushing new tags. Configuring jobs to
>>> use
>>> only: changes with other only: refs keywords is possible, but not
>>> recommended."
>>>
>>> I don't understand what they mean by "three", is a directory considered
>>> a three? Then that would explain the change.
>>
>> The edk2.yml file as a "when: always" clause attached to every rule,
>> so surely this negates the point of filtering by making it always
>> run ?

git show 71920809ceab
+docker-edk2:
+ stage: build
+ rules: # Only run this job when the Dockerfile is modified
+ - changes:
+   - .gitlab-ci-edk2.yml
+   - .gitlab-ci.d/edk2/Dockerfile
+   when: always

Per https://docs.gitlab.com/ee/ci/yaml/#rules-clauses

  Rules are evaluated in order until a match is found.

  The job is not added to the pipeline:

    If no rules match, and there is no standalone
    when: on_success, when: delayed or when: always.

For docker-edk2 the rule is "If .gitlab-ci-edk2.yml or
.gitlab-ci.d/edk2/Dockerfile changed, then always add;
else do not add".

> I understand it runs regardless a job in any previous stage failed.
> 
> From https://docs.gitlab.com/ee/ci/yaml/#when
> 
> * always - execute job regardless of the status of jobs from prior stages.
> * on_success - execute job only when all jobs from prior stages succeed
> (or are considered succeeding because they have allow_failure: true).
> This is the default.
> 
> I think I used that because at the time I sent that patch
> some docker image builds were failing. But we don't really
> need it, I'll remove.

Also because this is a long job burning free tier credits pointlessly.

(I'll also do it for the OpenSBI job).

> 
> Anyhow this used to work with "when: always", see:
> https://gitlab.com/qemu-project/qemu/-/pipelines/168158357
> 
>>
>> Regards,
>> Daniel
>>
> 


