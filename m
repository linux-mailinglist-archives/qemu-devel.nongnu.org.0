Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A193E5EDBD3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:33:59 +0200 (CEST)
Received: from localhost ([::1]:39422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odVKA-00047c-Ne
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTuU-0000mz-Q0
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:03:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTuR-00079W-SV
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 06:03:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664359398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgRbXjpW1XLVuxlCZQUp/YcUUZEskjKt1Z0sQHEyibo=;
 b=EfRwekqajpwAKl+9lTAeX/a4um0GbxsT+bxMvRSAd8ElbhMHMGGVmIeyWA79I45W1GjNML
 Q4Gha4sfhABkpuSPqBRW7MNcGiXbZjj5lJ5aDSl/G7+YG+Q2DvgJrayTXp95ppdWV6gnTJ
 BTPZ9HeZx3sPP+uOlKFszIOHfklAGLk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-yvSJxEVtPsWu_aP_tPYZuA-1; Wed, 28 Sep 2022 06:03:17 -0400
X-MC-Unique: yvSJxEVtPsWu_aP_tPYZuA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g8-20020a05600c4ec800b003b4bcbdb63cso6887792wmq.7
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 03:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=LgRbXjpW1XLVuxlCZQUp/YcUUZEskjKt1Z0sQHEyibo=;
 b=Do+OVfZW7GXyQ5hCdf2aF6I4p4ULrayyE0RjpEGSnljKSmHJ8TcIJBgP1fSzOTXQLt
 7GRjU2dNC3wZXzgH5mLBYzUI6Rjn7KQt/DyLyM5ZZcHfFNDfVw0wFNIZ+3Q7ErEMV1Ky
 3smC1p3eYu+TtHk7G36v1mziqYM8eRAE2gCauxcw0YZ8K7it9FiL5xHag7nhYNAozPt2
 w4lqVAC11GzOUMmmHgjmMIpSmcw7l1q1iy1d/45tkNyTzBB39gNlDQLJee+kpTVPYkMc
 OQUOvfhlLbvL42ammH2Fbj5M3IBQ143assn2fEG2knE03l0UnNrfFsxuG+NEHViGMcvj
 Di6w==
X-Gm-Message-State: ACrzQf1Ufq9daJnRDZMbd9D4VMarHnFzA7+zulE3+OPIbWjd8gOVqZgI
 K8dFiN/3fHkKRZv+deVFrhhLB4FRo1QowixgrvTt7LDtDrNrDtz0UiCadzHokzJCHm63+3fuyPw
 20xxRwAhlTvMqAEo=
X-Received: by 2002:a5d:64cf:0:b0:22a:b61d:875e with SMTP id
 f15-20020a5d64cf000000b0022ab61d875emr19094550wri.100.1664359396465; 
 Wed, 28 Sep 2022 03:03:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7qNO4DpQwMuDEFWzGmUHC3pWRblygYBLzyOP+peev+00W8gSBHrYZOEw8a6msx93DlAEKpuA==
X-Received: by 2002:a5d:64cf:0:b0:22a:b61d:875e with SMTP id
 f15-20020a5d64cf000000b0022ab61d875emr19094529wri.100.1664359396260; 
 Wed, 28 Sep 2022 03:03:16 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 u4-20020adff884000000b0022a2dbc80fdsm3774507wrp.10.2022.09.28.03.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 03:03:15 -0700 (PDT)
Message-ID: <fd7dad24-0725-8c0f-067b-7ae99aca8d80@redhat.com>
Date: Wed, 28 Sep 2022 12:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 35/54] tests/qtest: libqtest: Install signal handler
 via signal()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-36-bmeng.cn@gmail.com>
 <8b15887b-686f-3b59-ce2a-899c22b53458@redhat.com>
 <CAEUhbmWLMfLGJvH+aMV-w0mBaH16vp+2Foxj1Mm-xGMhmg86gw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAEUhbmWLMfLGJvH+aMV-w0mBaH16vp+2Foxj1Mm-xGMhmg86gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2022 11.57, Bin Meng wrote:
> On Wed, Sep 28, 2022 at 5:43 PM Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 27/09/2022 13.06, Bin Meng wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> At present the codes uses sigaction() to install signal handler with
>>> a flag SA_RESETHAND. Such usage can be covered by the signal() API
>>> that is a simplified interface to the general sigaction() facility.
>>>
>>> Update to use signal() to install the signal handler, as it is
>>> available on Windows which we are going to support.
>>>
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>    tests/qtest/libqtest.c | 14 +++-----------
>>>    1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>>> index 269d622fe3..f0ac467903 100644
>>> --- a/tests/qtest/libqtest.c
>>> +++ b/tests/qtest/libqtest.c
>>> @@ -66,7 +66,7 @@ struct QTestState
>>>    };
>>>
>>>    static GHookList abrt_hooks;
>>> -static struct sigaction sigact_old;
>>> +static sighandler_t sighandler_old;
>>
>> This seems to break compilation on NetBSD (which you can test via "make
>> vm-build-netbsd" on a Linux KVM host):
> 
> Oops, so this means this test is not covered by GitLab CI ...

You can enable the NetBSD tests in the Gitlab-CI by setting up Cirrus-CI for 
your account. The information hides here:

  .gitlab-ci.d/cirrus/README.rst

... but since this is running NetBSD in a KVM-enabled container on Cirrus-CI 
via a script from Gitlab-CI, it's a little bit fragile, so it might be 
easier to simply type "make vm-build-netbsd" on your local KVM-capable Linux 
host.

  Thomas


