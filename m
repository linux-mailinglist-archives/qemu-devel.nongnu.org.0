Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E4B6EA26F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 05:45:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pphhC-0002P8-CJ; Thu, 20 Apr 2023 23:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphh1-0002Oi-MB
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:44:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphgz-0008F5-OO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:44:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682048652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xk6HCcJiU+bo+Qk84bw97dT3+zwOiBm65JfZksJjPmk=;
 b=cDpfzCKvW8q9F3X9OMGjEyBCukyPYZa1aeVstMRNo1daIw2rc0A7xZExTemnS6wdu1l9Y2
 o9wWILBk24fyPd/DVAEEvD3Ymrw9wYDJ+Qu50Pob0eyEnSOgzSRGobVbWqGmuKUKSKF9SJ
 Xe0jDkFFV0DePl1Y1Q97Vvig3xeeNOE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-dbTEN3ezP8OqbS8DUgW6sA-1; Thu, 20 Apr 2023 23:42:59 -0400
X-MC-Unique: dbTEN3ezP8OqbS8DUgW6sA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef7c6b44b0so9139306d6.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 20:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682048579; x=1684640579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xk6HCcJiU+bo+Qk84bw97dT3+zwOiBm65JfZksJjPmk=;
 b=Hib6yuEG9XiHn0bY3NSUdmDTz2v7Sx6RVWUxyVkG5cmV5tDU9aarhyOoMzDYbMfTRo
 i9hne4FrWb0+0yYlmelWcaOo0HChcqazUfiWGHizU74+KVjkzcOrxt82bw5LA9iJVoVG
 jFcmUPunl75cgkXYKRr/WTZsaV8VtlcdyCqr2BZGE/tMEC2pi9MP/hezGfhrLa4svOUF
 jguV3vI0F9cax4ynYHbJq1rTScLwRQ8W9p/BGsltkPYgjh4AHopGEKWJoYgmBhLpqHO2
 d/5IBdsxQw8nfZleg7+fxGweeLFHD/AoeV9uVGeof9z5CYxQ0JhBK5iVKV0J8llFYlwV
 9hIw==
X-Gm-Message-State: AAQBX9fVmT+kEvELHtAi79shSt8NBwNqTb+GRzbjJm7o8XHhg+vw4BkV
 yMUyXOMgw/e79PMU+CchoVi4r204cy/ulM6DGbB9frukhxDkCdm3pLLW4mAAD71E5BTro8qmReZ
 udrCGFAoeoOyhKQw=
X-Received: by 2002:a05:6214:496:b0:605:648b:2adc with SMTP id
 pt22-20020a056214049600b00605648b2adcmr1289629qvb.19.1682048578862; 
 Thu, 20 Apr 2023 20:42:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350YP1N9m7XpAdH8M4at2cC7tZQGeZBOxFmn3K+gc5yg6YdA9K3uR8D7T0c/W3HXitoPsYBFzaQ==
X-Received: by 2002:a05:6214:496:b0:605:648b:2adc with SMTP id
 pt22-20020a056214049600b00605648b2adcmr1289611qvb.19.1682048578606; 
 Thu, 20 Apr 2023 20:42:58 -0700 (PDT)
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5?
 ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a0ce005000000b00605b0553ae7sm150832qvk.120.2023.04.20.20.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 20:42:58 -0700 (PDT)
Message-ID: <713d87d4-0080-e5df-7910-43d11f117f1d@redhat.com>
Date: Thu, 20 Apr 2023 23:42:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org, Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230327115030.3418323-1-kconsul@linux.vnet.ibm.com>
 <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 3/27/23 07:50, Kautuk Consul wrote:
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

Hi Kautuk,

First of all, thanks for working on this, and thanks to Hariharan for 
testing it.

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



