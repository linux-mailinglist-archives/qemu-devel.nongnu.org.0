Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD43D9D6D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:03:54 +0200 (CEST)
Received: from localhost ([::1]:51110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8z97-0002x4-K9
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8z8C-0002Ia-Nu
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8z8A-0007F5-0V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627538573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMHiTBXENiopoyz8iOC9L/yq4L59vwne3f0mU/Ac8Ug=;
 b=Xj2Dc2OuMfor7tUXlqqK4gdGrAY5fVfR1fYGWHJ4VDnIA3comfbF3OIQ75OVDD0xLOsX3S
 59vRjf5fyyzL/4LSyj6FJN/4DUldrwOsUpIVDX4w8HK5ZpUb1fhNPm++k+2+aQOo5nC39T
 qdqxfJpZOkGpiQn8uIX/nDmFY87Gxmo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-2TArBAR4N2ik5OitGbo9eQ-1; Thu, 29 Jul 2021 02:02:51 -0400
X-MC-Unique: 2TArBAR4N2ik5OitGbo9eQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 o32-20020a05600c5120b0290225ef65c35dso1869620wms.2
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uMHiTBXENiopoyz8iOC9L/yq4L59vwne3f0mU/Ac8Ug=;
 b=PAi5vT2soZ3fb9CXSPhYx9VmO27GIIW7amPBEBcnKQ6UVRAGqfOhuUf8Z6OnrimMV6
 rgTl+I1Kzx5F/a7kjF619ERLJ5NfLl+rSG1zGM3PX/sQHKsQ9LlyljcSFRRcsnCd1Gg6
 FQPqgl2g3ZsjDE/Y8Gekvg4SAhZMaqLc8zaV/T6Tf4UuSxUxq901rC+zEtXVDHZlLPUY
 xZujk1MVUkm0Yy4esYnbmwpTJ1Hq8rKJJ8WQBiq5zdJYqX5dxnGXvVM9zHaLgjNDNh7Y
 bw6baD9l1sxZ5kFOWWTNTplyNxnoBYJzhd6BKvR+x2K/drKU5qnqHa0+WgwgxhL0aFzx
 7uNA==
X-Gm-Message-State: AOAM530tzOiY/LXVgjw39SIhHvNnew70sgQ9LaTPd3PeNXbNduI1cgIf
 g+PDiwLdb3blsanfYCdLE+U9I1FU9EuMDaCybW6rxNGs6OyAN+Qh/WxLaVLwxda42ylt6FBAsaW
 0SZOkrvdZh0DHZis=
X-Received: by 2002:adf:eccf:: with SMTP id s15mr2760793wro.176.1627538570655; 
 Wed, 28 Jul 2021 23:02:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcg6O4Es2HXPz7F9IEbf1Bcyfx/sM3qkVuAVzYplvWjr5XQwsjT08hNhR/eS4TwdI8WFRxIw==
X-Received: by 2002:adf:eccf:: with SMTP id s15mr2760767wro.176.1627538570415; 
 Wed, 28 Jul 2021 23:02:50 -0700 (PDT)
Received: from thuth.remote.csb (p5791d475.dip0.t-ipconnect.de.
 [87.145.212.117])
 by smtp.gmail.com with ESMTPSA id d14sm1960990wrs.49.2021.07.28.23.02.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:02:49 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci.d/custom-runners: Improve rules for the staging
 branch
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210728173857.497523-1-thuth@redhat.com>
 <42b2acfc-cf8e-5b9c-22af-0e3cd1d80283@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <24ab43b4-5994-2ae9-9e0d-5e219c56b0c1@redhat.com>
Date: Thu, 29 Jul 2021 08:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <42b2acfc-cf8e-5b9c-22af-0e3cd1d80283@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/2021 20.26, Philippe Mathieu-Daudé wrote:
> On 7/28/21 7:38 PM, Thomas Huth wrote:
>> If maintainers are currently pushing to a branch called "staging"
>> in their repository, they are ending up with some stuck jobs - unless
>> they have a s390x CI runner machine available. That's ugly, we should
>> make sure that the related jobs are really only started if such a
>> runner is available. So let's only run these jobs if it's the
>> "staging" branch of the main repository of the QEMU project (where
>> we can be sure that the s390x runner is available), or if the user
>> explicitly set a S390X_RUNNER_AVAILABLE variable in their CI configs
>> to declare that they have such a runner available, too.
>>
>> Fixes: 4799c21023 ("Jobs based on custom runners: add job definitions ...")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/custom-runners.yml | 40 +++++++++++++++++++++++----------
>>   1 file changed, 28 insertions(+), 12 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
>> index 061d3cdfed..564b94565d 100644
>> --- a/.gitlab-ci.d/custom-runners.yml
>> +++ b/.gitlab-ci.d/custom-runners.yml
>> @@ -24,7 +24,8 @@ ubuntu-18.04-s390x-all-linux-static:
>>    - ubuntu_18.04
>>    - s390x
>>    rules:
>> - - if: '$CI_COMMIT_BRANCH =~ /^staging/'
>> + - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
>> + - if: "$S390X_RUNNER_AVAILABLE"
> 
> If you base this patch on top of "docs: Document GitLab
> custom CI/CD variables" that you already queued, you can
> directly add a description for S390X_RUNNER_AVAILABLE in
> docs/devel/ci.rst, but this can be done later too.

Good idea! But I really want to get this out of the door to finally get a 
usable gitlab-CI again, so I'll rather send a patch for this later.

  Thanks,
   Thomas


