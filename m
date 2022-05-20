Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C3D52E4EC
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 08:24:40 +0200 (CEST)
Received: from localhost ([::1]:50472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrw3y-0007Fh-Ts
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 02:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrw25-0006Uz-8i
 for qemu-devel@nongnu.org; Fri, 20 May 2022 02:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrw1w-0003xt-NY
 for qemu-devel@nongnu.org; Fri, 20 May 2022 02:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653027750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcjbrIIdYLuV5YPsgNRAEPKakdoVSz5FWX+E7Subbw8=;
 b=Xv5sWipfFpirTZlEUEZ7fqcXGM2VXe+vuR+UPUlgvLWE+HE2BBboiKyPXY2pAcmF3CPs5K
 P0/xS1z326efqg/z04KIOnaIvGDx9PdNqmibjgiD2hv33iQ+yXdsya55Iisx5WJ1z37MBs
 lehrvcqUSsSJAj56vXMpRw0MhI7syes=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-Qf2dF9RSMdmdeVv9vAFpEQ-1; Fri, 20 May 2022 02:22:29 -0400
X-MC-Unique: Qf2dF9RSMdmdeVv9vAFpEQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 n9-20020aa7d049000000b0042aab725949so5002850edo.23
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 23:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lcjbrIIdYLuV5YPsgNRAEPKakdoVSz5FWX+E7Subbw8=;
 b=FJMJs/IX1SdyRpHStCb6acBWLYHFTBM4Hrm+tZuJgVE1Y00kIpe6p9q+/TGR4JCwH9
 y5m+numCbiAIaLEO0iyErFTzbPzrwjoY4rNzwXrpyp7mbVwcChcLdjR3GfnkLOF5ANOl
 xL2Zwm+N9wu586o2wOiPTI5wg7LJ0gNkUWtqhwHuUqHPpX+L3zwJbYLOj3mHeTflZklw
 Nvy/sT8alkW0vUxCo8HDK/cgsEpe2zihrYq3IwfDCS/nH8rwzG4JXQTZJwT3k/MMkhi7
 YkFRtJ616G2dsL+kI+0HdUZQr7Sx1LkKN5+vHBmg/g3FlBA+yCbHRnjIdwfuvN95W7QV
 Dw4w==
X-Gm-Message-State: AOAM530PTK+7F1O6pxG6Wvgi9+l7nV5W01pAMCZiIqeQCdjtYJQc5ieJ
 SY4aeRf/37IQDmlEh7Z+HDvNMXDDcdhm1klGmrBqPJXIssMRbZ6JHw+h7NwI7D7UZpp2HJD1NPO
 fLfcE8BweQ7o1pB0=
X-Received: by 2002:a05:6402:3705:b0:42a:ba63:18b7 with SMTP id
 ek5-20020a056402370500b0042aba6318b7mr9120305edb.296.1653027747903; 
 Thu, 19 May 2022 23:22:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiS1PaIOuTomsLFEi6nWsWSIDr2Qb4DSB46NAokqBjL3WJzErCdiNFDkSP0McBb+RCMCXaAQ==
X-Received: by 2002:a05:6402:3705:b0:42a:ba63:18b7 with SMTP id
 ek5-20020a056402370500b0042aba6318b7mr9120283edb.296.1653027747668; 
 Thu, 19 May 2022 23:22:27 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 jx7-20020a170907760700b006fe978983f1sm1567670ejc.47.2022.05.19.23.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 23:22:26 -0700 (PDT)
Message-ID: <ffc1a4f6-5ef5-291e-c7aa-b392d4beffe6@redhat.com>
Date: Fri, 20 May 2022 08:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PULL 0/8] Misc patches (Gitlab-CI, qtest, Capstone, ...)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
 <c3fdc5fa-9bb1-dfb8-d763-1a0946f15aa5@linaro.org>
 <47c757d4-5576-cb24-6f90-027892a30720@redhat.com>
 <CAFEAcA9JjSy2BE5FHaGY+JVRX7QHQnA43i=sRndtADfBE1yWuw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA9JjSy2BE5FHaGY+JVRX7QHQnA43i=sRndtADfBE1yWuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 19/05/2022 13.55, Peter Maydell wrote:
> On Thu, 19 May 2022 at 07:32, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 18/05/2022 18.12, Richard Henderson wrote:
>>> On 5/18/22 02:04, Thomas Huth wrote:
>>>>    Hi Richard!
>>>>
>>>> The following changes since commit eec398119fc6911d99412c37af06a6bc27871f85:
>>>>
>>>>     Merge tag 'for_upstream' of
>>>> git://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2022-05-16
>>>> 16:31:01 -0700)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-18
>>>>
>>>> for you to fetch changes up to 83602083b4ada6ceb86bfb327e83556ebab120fc:
>>>>
>>>>     capstone: Remove the capstone submodule (2022-05-18 08:54:22 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> * Remove Ubuntu 18.04 containers (not supported anymore)
>>>> * Improve the cleanup of the QEMU binary in case of failing qtests
>>>> * Update the Windows support statement
>>>> * Remove the capstone submodule (and rely on Capstone of the distros instead)
>>>
>>> Fails centos-stream-8-x86_64 test,
>>>
>>> Run-time dependency capstone found: NO (tried pkgconfig)
>>> ../meson.build:2539:2: ERROR: Dependency "capstone" not found, tried pkgconfig
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/2473935684
>>
>> That's a custom runner ... who has access to that one? Cleber? Stefan? I
>> didn't spot an entry for it on https://wiki.qemu.org/AdminContacts ...
> 
> The 'Runner' string on the web page says:
> "(Managed by Red Hat - willianr/clebergnu)"

Willian left, Cleber seems to be currently away from keyboard ... but I 
found someone who has access, so capstone-devel should hopefully be there now.

Richard, could you please re-try to merge the pull request?

  Thanks,
   Thomas


