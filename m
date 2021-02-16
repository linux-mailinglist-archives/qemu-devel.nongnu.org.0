Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9120131CAD8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:04:46 +0100 (CET)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC021-00048B-2T
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lC000-0003Ml-5Y
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:02:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lBzzw-0001Ft-TS
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613480556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRyR9BwuBMR6RrHKTqgBjeeuSykg88Wmk98wkCW48DM=;
 b=YN7dD4lfIbVDwkLHMBQTWoXHlL19JxJwUp4vLi9whwgOSkz10VZf9mVb0T5vxMSzJ3CGc/
 wna9usL5QoRPFqZec4NTyFS75QtpPnDZueTeu9NmJzSZ54fTAbJtUCuHa+Gt5M498cM9VD
 B9jvINOLDK2ST+bXilgGdZILThoGgg0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-T6xfbVIzPn6BasFCG_34ww-1; Tue, 16 Feb 2021 08:02:34 -0500
X-MC-Unique: T6xfbVIzPn6BasFCG_34ww-1
Received: by mail-wr1-f72.google.com with SMTP id u15so13112229wrn.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dRyR9BwuBMR6RrHKTqgBjeeuSykg88Wmk98wkCW48DM=;
 b=Sa8cJKDVFJluo3VwDdUfw7Fj/rWQS58uswa8p/O9nHOSuI5TNRG7YRtb4KHDFvQNJO
 DnmwamQOpdCifcom9uWQk9Ln2QUahgHEmwB6y4yt5mX1kjp0TsqdjtuDqklhH50EhUMk
 rv6kD1b7gJ6LuSrvJG4pfUX/cze/xnSsDAb5/G+JRZYkvNXovHW31RF+wN2NbpLIojsC
 GA8Lwf9jPWKxL+5IQRZPEzP7KmS1b1VXTvmXoakITX4DHUPNLKeKA9yfTASdJ5pKqwEK
 F+D4YhAVO9pEaAiCAAegcf1OQPByVd9dCAB3tsTJ2wV+UV7dmBcX3+ipzjGmars2CaGM
 yl1A==
X-Gm-Message-State: AOAM533zF/+NjNoh+mMgmpv5G/E1iZ0Gm8wzp+nLxzeQlI/JbPb12aaz
 6EodPiDtvuz695fPmZWEmi5knkq018wrgWs9RQJWO0ILmLKR6gL+Pb8n4CFGAobFMl9X5UIVaVa
 lz8OizNMEgd8LNnQ=
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr24335684wrq.121.1613480553387; 
 Tue, 16 Feb 2021 05:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxFx+qhBL5pOP/0iByI3tcpXl8eU4CCdKY5cc/oeGCvbbDFGI6zcKsX3VbLnIfPCgYuNVZd2w==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr24335669wrq.121.1613480553190; 
 Tue, 16 Feb 2021 05:02:33 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id w4sm3225649wmc.13.2021.02.16.05.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 05:02:32 -0800 (PST)
Subject: Re: [PATCH 1/3] gitlab: always build container images
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208163339.1159514-2-berrange@redhat.com>
 <a0dd7611-6b35-0a4f-4522-58c8c4add6d5@redhat.com>
 <20210209095829.GC1166421@redhat.com> <20210210111700.GE1240644@redhat.com>
 <YCu+Ct3gMYetnVYT@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f51c705b-56fc-a14c-2a18-6faf04bb3f43@redhat.com>
Date: Tue, 16 Feb 2021 14:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCu+Ct3gMYetnVYT@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 1:43 PM, Daniel P. Berrangé wrote:
> On Wed, Feb 10, 2021 at 11:17:00AM +0000, Daniel P. Berrangé wrote:
>> On Tue, Feb 09, 2021 at 09:58:29AM +0000, Daniel P. Berrangé wrote:
>>> On Tue, Feb 09, 2021 at 07:37:51AM +0100, Thomas Huth wrote:
>>>> On 08/02/2021 17.33, Daniel P. Berrangé wrote:
>>>> [...]
>>>>> For example, consider pushing 5 commits, one of which contains a
>>>>> dockerfile change. This will trigger a CI pipeline for the
>>>>> containers. Now consider you do some more work on the branch and push 3
>>>>> further commits, so you now have a branch of 8 commits. For the second
>>>>> push GitLab will only look at the 3 most recent commits, the other 5
>>>>> were already present. Thus GitLab will not realize that the branch has
>>>>> dockerfile changes that need to trigger the container build.
>>>>>
>>>>> This can cause real world problems:
>>>>>
>>>>>   - Push 5 commits to branch "foo", including a dockerfile change
>>>>>
>>>>>      => rebuilds the container images with content from "foo"
>>>>>      => build jobs runs against containers from "foo"
>>>>>
>>>>>   - Refresh your master branch with latest upstream master
>>>>>
>>>>>      => rebuilds the container images with content from "master"
>>>>>      => build jobs runs against containers from "master"
>>>>>
>>>>>   - Push 3 more commits to branch "foo", with no dockerfile change
>>>>>
>>>>>      => no container rebuild triggers
>>>>>      => build jobs runs against containers from "master"
>>>>>
>>>>> The "changes" conditional in gitlab is OK, *provided* your build
>>>>> jobs are not relying on any external state from previous builds.
>>>>>
>>>>> This is NOT the case in QEMU, because we are building container
>>>>> images and these are cached. This is a scenario in which the
>>>>> "changes" conditional is not usuable.
>>>>>
>>>>> The only other way to avoid this problem would be to use the git
>>>>> branch name as the container image tag, instead of always using
>>>>> "latest".
>>>> I'm basically fine with your patch, but let me ask one more thing: Won't we
>>>> still have the problem if the user pushes to different branches
>>>> simultaneously? E.g. the user pushes to "foo" with changes to dockerfiles,
>>>> containers start to get rebuild, then pushes to master without waiting for
>>>> the previous CI to finish, then the containers get rebuild from the "master"
>>>> job without the local changes to the dockerfiles. Then in the "foo" CI
>>>> pipelines the following jobs might run with the containers that have been
>>>> built by the "master" job...
>>>
>>> Yes,  this is the issue I describe in the cover letter.
>>>
>>>> So if we really want to get it bulletproof, do we have to use the git branch
>>>> name as the container image tag?
>>>
>>> That is possible, but I'm somewhat loathe to do that, as it means the
>>> container registry in developers forks will accumulate a growing list
>>> of image tags. I know gitlab will force expire once it gets beyond a
>>> certain number of tags, but it still felt pretty wasteful of space
>>> to create so many tags.
>>>
>>> Having said that, maybe this is not actually wasteful if we always
>>> use the "master" as a cache for docker, then the "new" images we
>>> build on each branch will just re-use existing docker layers and
>>> thus not add to disk usage. We'd only see extra usage if the branch
>>> contained changes to dockerfiles.
>>
>> The challenge here is that I need the docker tag name to be in an env
>> variable in the gitlab-ci.yml file.
>>
>> I can directly use $CI_COMMIT_REF_NAME  to get the branch name but
>> the list of valid characters for a git branch is way more permissive
>> than valid characters for a docker tag.
>>
>> So we need to filter the git branch name to form a valid docker tag,
>> and AFAICT, there's no way todo that when setting a global env variable
>> in the gitlab-ci.yml.  I can only do filtering once in the before_script:
>> stage, and that's too late to use it in the image name for the job.
> 
> I've thought of a solution here.
> 
> We can tag the images with $CI_COMMIT_SHORT_SHA , and the build jobs
> can reference them with 
> 
>   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:$CI_COMMIT_SHORT_SHA
> 
> In the continer build script, we then *also* tag them with a sanitized
> version of $CI_COMMIT_REF_NAME, and also use this as the cache to pull
> from when building the image.
> 
> The main downside here is that we'll end up creating alot of tags, but
> most will have the same content so shouldn't be too bad.

This could be automated (for forks):

https://docs.gitlab.com/ee/user/packages/container_registry/#delete-images-by-using-a-cleanup-policy

Not yet to the qemu-project registry because:

  Cleanup policies can be run on all projects, with these exceptions:

    For GitLab.com, the project must have been created after 2020-02-22.

Regards,

Phil.


