Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406973EE718
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 09:24:11 +0200 (CEST)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFtSD-0001Ax-RH
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 03:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtRN-0000Tp-44
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mFtRJ-0000Vz-Le
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 03:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629184991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PHsdkK9YKGo4FnYGHafNUecdeeOiDo8nYC6vLsJ/ThE=;
 b=HpjivuuG+lh0IzLt5iG+tQdQSP8UfmnKworqxTjaTkLcub5wJ2YM+uSRoDxCK46Ex17418
 7iwnbiqsHC9xDgfwI0grE4/K4EclMaU1Wo69tmSt92YgYjH9jILMs0tGoIotEarClR7W2P
 9wESayA3bir0steY9RFAcuDAD61Tlk4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-2Jg4vBASOrO20eOlRidj9Q-1; Tue, 17 Aug 2021 03:23:08 -0400
X-MC-Unique: 2Jg4vBASOrO20eOlRidj9Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 e3-20020a50ec830000b02903be5be2fc73so10086867edr.16
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 00:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PHsdkK9YKGo4FnYGHafNUecdeeOiDo8nYC6vLsJ/ThE=;
 b=E0PmecoUB6QV1w9hcOiRQXn1iRBqPeY5waU5UDHK7Yti6VC6EbQrLmdit4/9J0jlgp
 hH7tzAKm97+g6dOy5yrnGEvuTcW8AahGomhATsr9YILopjbUza9zIrujgrUzz1KF84cu
 i2xmOnpW0YBxpqOMKs/RHef7kEwWMVkLnUTGpY5/K9isATTz5h/pQpfMlehdrqqtZYR2
 oV5e9bOfMdL2q/CUd0XdWr/ASj700jqUt0cIvxfRTJVTZauTK6hzEma8jyoDA454Bi88
 YCPPm8WgLUOfxMimF58aRAN/UgE1bDSWYqbL5ctkHMF1fnn8Rt0sH/G8mOtSoThjiYK2
 gxSg==
X-Gm-Message-State: AOAM530xEWSn1dGwfrFlu9jZ3s0lBnywJY74pSmK7mUIsWGnUhEHWd53
 N1NXiynKcL+BJmP24bEyQVxa+rnt1CXLbb+bkHTi5m6Dah9t77ZnvF16AFXsv4U/0eJsncV/IHu
 R6RNxAi0UQpWTPrG9bmOKUMs6sEZ4h92/pqZaCClrhe2qja1zOj2KoWBd0x4DQXU=
X-Received: by 2002:a17:906:ca47:: with SMTP id
 jx7mr2488428ejb.286.1629184987491; 
 Tue, 17 Aug 2021 00:23:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9clvCST0xcSYCg5jNqklROCQ5/43+tts+Dn1VNQ6z8A2h+HIFjAvbfeD8gRflbaiGQzxJ0A==
X-Received: by 2002:a17:906:ca47:: with SMTP id
 jx7mr2488406ejb.286.1629184987250; 
 Tue, 17 Aug 2021 00:23:07 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83fdd.dip0.t-ipconnect.de.
 [217.232.63.221])
 by smtp.gmail.com with ESMTPSA id z8sm367279ejd.94.2021.08.17.00.23.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 00:23:06 -0700 (PDT)
Subject: Re: [PULL 00/11] Optional gitlab-CI and doc fixes for -rc4
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20210814060956.12852-1-thuth@redhat.com>
 <CAFEAcA9ur-HX4r30QgEAL73VEgA+=XXpWW6v9arKcM=ijEsHvA@mail.gmail.com>
 <20210816102246.z4ybsgpmrn4isdoj@mozz.bu.edu> <YRpHxjyz8+Su4ziA@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <54c043cf-87c3-199d-69d3-d35befe952cd@redhat.com>
Date: Tue, 17 Aug 2021 09:23:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRpHxjyz8+Su4ziA@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/2021 13.11, Daniel P. Berrangé wrote:
> On Mon, Aug 16, 2021 at 06:22:46AM -0400, Alexander Bulekov wrote:
>> On 210816 1001, Peter Maydell wrote:
>>> On Sat, 14 Aug 2021 at 07:10, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>>   Hi Peter,
>>>>
>>>> in case we're going to have an -rc4, here's a pull request that contains
>>>> the fixes for getting the gitlab-CI green again. I also added some doc
>>>> updates since they should be completely riskless. But if we won't have an
>>>> rc4 due to other reasons, this pull request here certainly also does not
>>>> justify another RC, so please ignore this PR in that case.
>>>>
>>>> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>>>>
>>>>    Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>    https://gitlab.com/thuth/qemu.git tags/pull-request-2021-08-11
>>>>
>>>> for you to fetch changes up to 36b508993c4dcc6b3ef4b5c00e293ee9560926ee:
>>>>
>>>>    docs/about/removed-features: Document removed machines from older QEMU versions (2021-08-11 15:39:09 +0200)
>>>>
>>>> CI run can be seen here:
>>>>
>>>>   https://gitlab.com/thuth/qemu/-/pipelines/351602605
>>>>
>>>> ----------------------------------------------------------------
>>>> * Fixes for the gitlab-CI (fix the hanging  build-oss-fuzz pipeline)
>>>> * Add documentation about features that have been removed in older versions
>>>>
>>>
>>>
>>> Applied, thanks.
>>>
>>> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
>>> for any user-visible changes.
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/1505950978
>> Looks like build-oss-fuzz is still timing out, even without the issue
>> in the vhost-usr-blk test.

It worked fine in the staging branch, finished within 40 minutes:

  https://gitlab.com/qemu-project/qemu/-/jobs/1504868929

>> At this point the job should essentially just
>> build + test qemu-system-i386 with some extra time spent on linking
>> the fuzzer and briefly running through all the fuzzer configs. Maybe the
>> only way to make this work is to split the job into a build + test
>> stage?
> 
> At this point I think we should just disable the job in gitlab entirely.
> We've spent too long debugging this, while leaving CI red for everyone.

I don't think so. That seems to be a new, unrelated problem:

Running test qtest-i386/usb-hcd-ehci-test
socket_accept failed: Resource temporarily unavailable
**
ERROR:../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
ERROR qtest-i386/usb-hcd-ehci-test - Bail out! ERROR:../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)

That "socket_accept failed: Resource temporarily unavailable" sounds like
the build machine was maybe temporarily overloaded?

Question is why the test framework was running into a timeout afterwards
here instead of bailing out immediately?

  Thomas


