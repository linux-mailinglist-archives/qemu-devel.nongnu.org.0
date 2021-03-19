Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84475341A8D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:00:31 +0100 (CET)
Received: from localhost ([::1]:50592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCrm-00066Z-Le
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:00:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCql-0005da-1f
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:59:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNCqj-00030W-AC
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616151564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZDQNYL0VQWKTReBnLGjNA6X6/l5g4xiPHcnQc4cQpg=;
 b=KXkonHYKbJWGrfGR9WDg//fUeVZC7RUV+8DWKY3b+/O2yzaVfGflt4dSD7oUOXr+NXwW1t
 OvbbRpqhy3DqxxIi9AZCjoEN3SSM40r73rru8otchAfcOfcb22wC5wFxasBScDUaS9+qIf
 qfDCgn1Xzno+MnILE2pArAJCQEdIRuU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-k7AdJ_70NAi-cG7kZUPTbw-1; Fri, 19 Mar 2021 06:59:22 -0400
X-MC-Unique: k7AdJ_70NAi-cG7kZUPTbw-1
Received: by mail-wr1-f70.google.com with SMTP id 75so21476321wrl.3
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 03:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tZDQNYL0VQWKTReBnLGjNA6X6/l5g4xiPHcnQc4cQpg=;
 b=UvqJGSTh+AxovqrkkOFyGsEb+zZafH3ArARrdkStF3sOSBytzZPdg93Cg3Sffv4RZL
 fWN8FqNDAKJlTKwqPJEw8/+XTbByegTl0VvzLfCQIBGbRdjkKoM9Akplk0ds9HYAN7Oq
 XWXanjUyQ9F1l+fnQuGPDmEmClm/37IuV5kvlS6NhtQOMW/T7FkzXzpIRHIebOHCcwSE
 cINYqeC4HQK4Qi3U9vT2Bc7xYISCpZUZ9juDS52s7BUNcjgE2JUNUYCJCrjmHQbxae7T
 KNHRWQhdS+SKb8dSnsgTiaRIoWneIsV2E0e8N+dFSmZR7dWWHOi1iu2DuD5bUsACr40d
 jjoA==
X-Gm-Message-State: AOAM530L2kP23wvO0S4kX7VUI/eD8psO/SkHo7nTiCxshnrmfOxBBGnK
 yf1pTDS4hr4LyL4TJ9D+xFAy1EtmOK0OxHUrbXDFIOmnhOLwKS5ItpKijnlu9cFmjIvKPJ8SJ0u
 Q1eKsDHs07wJ8rN0=
X-Received: by 2002:a5d:4523:: with SMTP id j3mr4058489wra.288.1616151561779; 
 Fri, 19 Mar 2021 03:59:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYihqJlHzUx91s9gpp1n1A44nO/H7Vw1y/pkOblluOalcfV3w1S1LOcYgdLZaGnng62tICeA==
X-Received: by 2002:a5d:4523:: with SMTP id j3mr4058469wra.288.1616151561541; 
 Fri, 19 Mar 2021 03:59:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m132sm5788538wmf.45.2021.03.19.03.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 03:59:20 -0700 (PDT)
Subject: Re: Serious doubts about Gitlab CI
To: Andrew Jones <drjones@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
 <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
 <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <cad173cb-7715-1286-eba2-75e9816e6177@redhat.com>
Date: Fri, 19 Mar 2021 11:59:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210319101848.ebdwkfttay73jajr@kamzik.brq.redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/03/21 11:18, Andrew Jones wrote:
>> Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
>> on slow machines or if we'll hit the same issue with dedicated runners.
>> It seems like CI optimization will be necessary...
>>
> We need to reduce the amount of CI we do, not only because we can't afford
> it, but because it's wasteful. I hate to think of all the kWhs spent
> testing the exact same code in the exact same way, since everyone runs
> everything with a simple 'git push'.

Yes, I thought the same.

> IMHO, 'git push' shouldn't trigger
> anything. Starting CI should be an explicit step.

It is possible to do that on a project that uses merge requests, for 
example like this:

workflow:
   rules:
     - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
     - if: '$CI_COMMIT_BRANCH
       when: never

For us it's a bit more complicated (no merge requests).

Another common feature is failing the pipeline immediately if one of the 
jobs fail, but GitLab does not support it 
(https://gitlab.com/gitlab-org/gitlab/-/issues/23605).

> Also, the default CI
> should only trigger tests associated with the code changed. One should
> have to explicitly trigger a complete CI when they deem it worthwhile.

This is interesting.  We could add a stage that looks for changed files 
using "git diff" and sets some variables (e.g. softmmu, user, TCG, 
various targets) based on the results.  Then you use those to skip some 
jobs or some tests, for example skipping check-tcg.  See 
https://docs.gitlab.com/ee/ci/variables/#inherit-cicd-variables for more 
information.

Paolo


