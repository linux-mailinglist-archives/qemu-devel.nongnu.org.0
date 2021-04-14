Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A8335F18B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:37:24 +0200 (CEST)
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWctg-0007Y4-2S
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcs6-0006l8-69
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:35:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWcs4-0000QP-93
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:35:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id g9so3341199wrx.0
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 03:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Tb/ZeNcUzZBiqD3Rx9NXx86GEQ16LFOiGQjmMtGyP0w=;
 b=StxiUrQk05vMDsye6hi1pcxiQ28imGEScOG8Zd1msicI9L7yzkl8MOy/JGrlegOUoe
 RatvT7ajM2sRXV+Oyhhqg4ilo0SdKmpFZpmJ8mLLb5u3KZ8yt8MyeO/D6zYssEHNqc9X
 Z162V0N41rrt6W61nNPwzpqgUJGixxY9WECvtrMgPBBEvYdSTM4xA6Yl+zSelEdmEIMd
 5y5/PQPxMKmtk6fDE9Krx4Yb/Q1wsYtooz5PtFrzxb+4Wa1l+oEGbbDPg8xwcYemLmiY
 CDCQroVVJx9T+rstH8osMLjhtoutBLj45P8L/C6qK028U+czrTKpgnreOvXIlfzVeP8c
 ateg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Tb/ZeNcUzZBiqD3Rx9NXx86GEQ16LFOiGQjmMtGyP0w=;
 b=bNH5qtzGeO0kQRw6Oxuag35lLKZYM9eq9DBS4/wJSfc/Od8xpThS7oHUtavlHEbqW9
 wZcQd07zeYOSqF8gjel4imn8oVBt9btr12RkprBpFPih1RtlYmkyiCljU+ksfvvQOpIl
 EglP0PTVFJUFnO7MhzaaGTvAQpxexX/Jp+pXpw6XqYXNe59AyRIe2vvWfHA09Y4FPEac
 B7kCP9GspKdmlwVvUKN7CDtlMqWVmc6144BuQx7NqYVX+lyLq7BUtKig1HxoAln5aL20
 QgKK/gZZfB3EOXqfCpoTy9jdauLH5fTYCxNaQuAKrFvzplh+uAPoEIox9wxQDG+UoXyL
 uMVA==
X-Gm-Message-State: AOAM5316yiJEExd+jMOZ6wCvYEj3Q/Ar7l+Y5BIoPvsSMn4t7l3isSjo
 jAUYk4bffcGkgvOsP7D3EY4=
X-Google-Smtp-Source: ABdhPJz8+y+kEE3afSSYG5SEwFRd0LuPuSBJ/20gntfnr907M48ujTMjAVkzqEqWpyVNqgPmFoKdpA==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr17030296wro.180.1618396542554; 
 Wed, 14 Apr 2021 03:35:42 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v7sm4992440wme.47.2021.04.14.03.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:35:41 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] gitlab-ci.d/crossbuilds.yml: Enable compilation
 with ccache
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20210414081907.871437-1-thuth@redhat.com>
 <20210414081907.871437-6-thuth@redhat.com>
 <e8f0accf-2aaa-38c9-c2b5-802ceff4d21e@amsat.org>
Message-ID: <178300e4-c1e1-4b5f-ae2e-1f390e2fff5e@amsat.org>
Date: Wed, 14 Apr 2021 12:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e8f0accf-2aaa-38c9-c2b5-802ceff4d21e@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/14/21 12:29 PM, Philippe Mathieu-Daudé wrote:
> On 4/14/21 10:19 AM, Thomas Huth wrote:
>> Ccache can speed up the compilation in some cases, so enable it for
>> our cross-compilation CI builds, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  .gitlab-ci.d/crossbuilds.yml | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 017731a894..dee327a936 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -1,4 +1,26 @@
>> +
>> +.ccache_cross_setup:
>> +  cache:
>> +    key: "$CI_JOB_NAME"
>> +    paths:
>> +      - ccache
> 
> I discovered last month the cache/artifact passing feature is useful
> when all runners are in the same premises, but when you used runner
> in different locations it become slower (except if all your runners
> are in very fast clouds probably).
> 
> Not a short term problem, but can hit us long term. I haven't looked
> if GitLab already figured how to manage this globally, like registering
> runners with affinity, or assigning them to pools.
> 
> If we decide to stick with the free-tier runners, then this is a great
> improvement.
> 
> For custom runners, a simple kludge is to assert they do *not* use
> cache/artifacts (from free-tier runners).
> 
> We could restrict this to free-tier runners but these runners tag aren't
> standardized, and AFAIK we can not (yet?) use the "ANY" word to "select
> runners with any of this tag list". So far I noticed gitlab uses these:
> - shared docker
> - gce docker
> - gitlab-org
> - gitlab-org-docker
> 
> The last 2 are recent, and seem to help with the problem I reported
> that some runners don't have Docker installed:
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg02213.html

Actually found the doc for the last 2:
https://docs.gitlab.com/ee/user/gitlab_com/#linux-shared-runners

- gitlab-org-docker

All your CI/CD jobs run on n1-standard-1 instances with 3.75GB of RAM,
CoreOS and the latest Docker Engine installed. Instances provide 1 vCPU
and 25GB of HDD disk space. The default region of the VMs is US East1.
Each instance is used only for one job, this ensures any sensitive data
left on the system can’t be accessed by other people their CI jobs.

- gitlab-org

The gitlab-shared-runners-manager-X.gitlab.com fleet of runners are
dedicated for GitLab projects as well as community forks of them. They
use a slightly larger machine type (n1-standard-2) and have a bigger SSD
disk size. They don’t run untagged jobs and unlike the general fleet of
shared runners, the instances are re-used up to 40 times.

