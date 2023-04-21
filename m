Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E66EA279
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 05:50:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pphmj-0003po-MA; Thu, 20 Apr 2023 23:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphmg-0003p8-Kz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:50:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphme-0001Iz-W9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682049003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6OLeGyBZAJYP/ReCsjoFBsGEm2axluUmkFazXbl6C8g=;
 b=Pul71zSSOxVkFvNNV/a3rlqQ0j5UXbx9OgqTt33bHSmKzn22cHppI1RaEb5DIMZ0NkjNFz
 M1mquZRBAI/b9UCsWWHy2BLrvyr9n6gyk7/mjD7ehXpKZMxLiyLgAUuEokfN0WQFIH8s4+
 C5Uzu0/Fql+3DwGkv2wUaZHWaWI8+ZQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-J3QEkasfOjOWpICvYRWIWQ-1; Thu, 20 Apr 2023 23:50:01 -0400
X-MC-Unique: J3QEkasfOjOWpICvYRWIWQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3e7182d5544so9495751cf.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 20:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682049001; x=1684641001;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6OLeGyBZAJYP/ReCsjoFBsGEm2axluUmkFazXbl6C8g=;
 b=jXtq2JvNuRV2zkPI3YH+33is3tAnitgmjO3PsRJB1YarYjuKgprCSPWVGptCrV+DM9
 3XhID2evN0EIdGApoiZaEG6pd9LuwMp+2uyQq1SMfCvANk6H7j4aijZw7ISMlGTUeXpv
 HMEaJQtGOBXv/C9Lcnx8F+D3XfYENuWbijUJMwg8++JS67p3sMMMCv3mSTr/GkHScm+9
 xTbWUrU/dIPKVVyVceZda66guuxxmpNADOEWxaLhUV8Ysb0kyBD2RjsdB3k2TijXO761
 rh2oh8v9GXQUPsDNcj8H8x+iKOm0mHs8S59zKxQAHtXob0w2jAjFlicIYp2nvCYI+Mcw
 fSCA==
X-Gm-Message-State: AAQBX9cPQJB+s6zxR6WChGkYViPlKXWGLHUwpVwS+keMDCkT3ncSfdDG
 935uGCCqcPxWoIho69op6/yg3JKWUNEcvPvQrZDh0l9uxCOj8l8sOlGLJJ1faQ3cRwZwZ5Hsg5Q
 KT3NCWp1Z3E8Wm24=
X-Received: by 2002:ac8:5f92:0:b0:3b9:bf83:d5de with SMTP id
 j18-20020ac85f92000000b003b9bf83d5demr6067285qta.26.1682049001282; 
 Thu, 20 Apr 2023 20:50:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZnoOm16x9Xb4HG1BnAWfAMkf0YACAlwMlbdWqQsGAShzpIaq07TEXzUd1wUixjeYE1CquSVg==
X-Received: by 2002:ac8:5f92:0:b0:3b9:bf83:d5de with SMTP id
 j18-20020ac85f92000000b003b9bf83d5demr6067251qta.26.1682049000957; 
 Thu, 20 Apr 2023 20:50:00 -0700 (PDT)
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5?
 ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
 by smtp.gmail.com with ESMTPSA id
 b2-20020ac812c2000000b003e8160cf93asm995629qtj.80.2023.04.20.20.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 20:50:00 -0700 (PDT)
Message-ID: <e9d0f20a-4ca8-7622-0171-2cb56b75821b@redhat.com>
Date: Thu, 20 Apr 2023 23:49:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <20230417134321.3627231-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/17/23 09:43, Alex Bennée wrote:
> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>
> Avocado version 101.0 has a fix to re-compute the checksum
> of an asset file if the algorithm used in the *-CHECKSUM
> file isn't the same as the one being passed to it by the
> avocado user (i.e. the avocado_qemu python module).
> In the earlier avocado versions this fix wasn't there due
> to which if the checksum wouldn't match the earlier
> checksum (calculated by a different algorithm), the avocado
> code would start downloading a fresh image from the internet
> URL thus making the test-cases take longer to execute.
>
> Bump up the avocado-framework version to 101.0.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>
> ---
> v2
>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
> ---
>   tests/Makefile.include | 18 +++++++++++-------
>   tests/requirements.txt |  2 +-
>   2 files changed, 12 insertions(+), 8 deletions(-)

Hi everyone,

Looks like I've mistakenly replied to the earlier thread, so here's 
pretty much the same message on a better location.

First of all, thanks to Kautuk for sending this and thanks to Hariharan 
for further testing it.

I'd like to give some context which not everyone may be aware of. 
Avocado 101.0 is a very different when compared with 88.1. Everything 
related to the execution of tests is brand new.  To be more precise, on 
version 91.0[1], this new runner[2] became the default. On version 97.0, 
the old runner implementation (currently in use in QEMU) was finally 
removed.

On most releases since then, I've been running the QEMU tests with the 
latest Avocado, and finding issues that are (as resources allow) 
addressed in later versions.   As you probably noticed, Avocado 101.0 
runs the QEMU tests without much (or any) visible issues for most 
people.  But, I'm aware of two pending issues that may or may not be a 
big deal to users:

I) The logging behavior is a bit different since Avocado 88.1. At a 
given point it was considered that Avocado should not mess around 
inadvertently with Python's root logger, and should be more picky about 
it includes in logs.  For most cases, a simple workaround[4] does the 
trick.  But, for some other use cases (say for 3rd party libraries' logs 
you want logged alongside Avocado's logs) there's a pending PR[5] that 
will take care of all known limitations.

II) The support for killing tests (internally in Avocado represented as 
more generic "tasks") and all its children is a bit lacking.  This is an 
issue I'm actively working on[6].  This may leave some processes (such 
as "qemu-system-*") running even after a test was interrupted.

Fixes for both of these issues are due to be in version 102.0. The ETA 
for version 102.0 is 1-2 weeks.

With that being said, I'm more than OK with this patch (alongside PATCH 
2, without which havoc ensues :) provided people understand the two 
pending issues above.  If this patch is taken before Avocado 102.0 is 
released, the delta from 101.0 would be much smaller, so it should be an 
easier change to test.

Cheers,

- Cleber.


[1] - https://avocado-framework.readthedocs.io/en/101.0/releases/91_0.html

[2] - The new runner is called "nrunner" and I am to be blamed for the 
naming lacking any originality

[3] - 
https://avocado-framework.readthedocs.io/en/101.0/releases/97_0.html#users-test-writers

[4] - 
https://gitlab.com/cleber.gnu/qemu/-/commit/a9f39c4f6671b756196a185c7275eb7ebd13e588

[5] - https://github.com/avocado-framework/avocado/pull/5645

[6] - https://github.com/avocado-framework/avocado/issues/4994



