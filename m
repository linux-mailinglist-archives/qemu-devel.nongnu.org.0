Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0ED62BA7E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 11:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovG8A-0000bV-Vc; Wed, 16 Nov 2022 05:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovG87-0000b8-LJ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovG85-0001Mw-Q1
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 05:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668596332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCtRh7NSSlctjITQPVW/4G8g5I431i7LQ/ZD1xacR0c=;
 b=YAOKvfF18NglHGSADp0Gph/aS/uOYXfg9/FA1zKGidp1FcuxT1k56vYOmbTHcB3cCuDJ+n
 mbt3GqU7c6iwkXX4CVkhC03lnjh1fkcyf2/8o7c1lQ3Y7eH2RkYl8rsatxWCHnBuFXa774
 ZGC/gBcTDEqNl5APRsneiR65aNK4zs0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-tGE2-jojOK-L5EIe7FjcCw-1; Wed, 16 Nov 2022 05:58:50 -0500
X-MC-Unique: tGE2-jojOK-L5EIe7FjcCw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b13-20020a056402350d00b00464175c3f1eso11982386edd.11
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 02:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yCtRh7NSSlctjITQPVW/4G8g5I431i7LQ/ZD1xacR0c=;
 b=G36lyuRLzaeeXrjyWSKeqRKcGhtMvqUKJosYcHExbftm35sUUgxyIiHbXlBkQFlm/C
 c5SSVPyvh2kCQyL1IfRQtbe46Jz/P3F1aXTmZdJZyz4ypEZj5tTkXmUFsDBrFzsrR68l
 nBuUcueL6o/80r2i7dFu+RX5Rmz33yIjh2g8HMMCQKUJiuYrilBd/LRQlyZ0aQBJPj0K
 9U+Hd+cBGImuJZtOl2yJDT6vCLThJ+zEwNArgeU4lRWd0jR6JFDQodc5b8goUTg4Tlw+
 xGiO0KIVZtCeO2U6dnUitz1BJ5qGd8DUGNuDn2syNSaWSuviRWG6JSlJx0CclwMPhMZE
 wOBQ==
X-Gm-Message-State: ANoB5pkq5xQ/oAHYmHuNajT4XS1utOcWmbSE1pTUoHGeSizoS44a62u9
 Sy/WFHumo47/wAi10KelnqzRF+t6ASb4/R7I16SPM8ZvR98b1fbC4tfaMkLBlF38hNssff6EzT7
 qarhPjppODc8y8zM=
X-Received: by 2002:a05:6402:3787:b0:45c:55f8:4fbf with SMTP id
 et7-20020a056402378700b0045c55f84fbfmr17960500edb.277.1668596329570; 
 Wed, 16 Nov 2022 02:58:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QKQIcEWWKqJXZAZmekhFiK77lf/lUhk9g7cVhNbgnaspSXC6E/3bAexMHTMN2yCHr76X4pA==
X-Received: by 2002:a05:6402:3787:b0:45c:55f8:4fbf with SMTP id
 et7-20020a056402378700b0045c55f84fbfmr17960435edb.277.1668596329367; 
 Wed, 16 Nov 2022 02:58:49 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-177-25.web.vodafone.de.
 [109.43.177.25]) by smtp.gmail.com with ESMTPSA id
 3-20020a170906308300b0073de0506745sm6686249ejv.197.2022.11.16.02.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 02:58:48 -0800 (PST)
Message-ID: <4b6e726c-55aa-cc44-7c95-1f31655ff37a@redhat.com>
Date: Wed, 16 Nov 2022 11:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: tests/avocado/machine_s390_ccw_virtio: Fedora test failing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Cornelia Huck
 <cohuck@redhat.com>, "open list:S390 general arch..."
 <qemu-s390x@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Jan Richter <jarichte@redhat.com>
References: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
 <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
 <d984ce52-4fc3-8c22-83bb-93e901a67ce6@linaro.org>
 <731fb01a-b9ce-c68e-e0d7-2e3602955502@redhat.com>
 <1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <1d0baf8b-c757-265c-b206-07ca3f218b2a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 16/11/2022 11.23, Philippe Mathieu-Daudé wrote:
> Cc'ing Jan/Cleber/Beraldo.
> 
> On 16/11/22 10:43, Thomas Huth wrote:
>> On 15/11/2022 12.13, Philippe Mathieu-Daudé wrote:
>>> On 15/11/22 12:05, Thomas Huth wrote:
>>>> On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
>>>>> Hi,
>>>>>
>>>>> As of v7.2.0-rc0 I am getting:
>>>>>
>>>>>   (101/198) 
>>>>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
>>>>> FAIL (23.51 s)
>>>>
>>>> Is it 100% reproducible? ... the test is known to be a little bit shaky, 
>>>> that's also why it is disabled in the gitlab CI.
>>>
>>> I am running it on my workstation, not GitLab.
>>
>> I just double-checked and for me, it's working fine an my laptop, with 
>> both, rc0 and rc1.
>>
>>> 5/5 failures. I'll skip it locally (no need to send a patch) and we can
>>> have a look after the release.
>>
>> If it is a real bug, we should fix it before the release. Could you maybe 
>> bisect it, please?
>>
>> Also, what do you get when dumping the console? I.e.:
>>
>> ./tests/venv/bin/avocado --show=console run -t arch:s390x \
>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora 
>>
> 
> When running with the current (old) Avocado runner I get:
> 
> Avocado crashed: TypeError: cannot pickle '_thread.RLock' object
> Please include the traceback info and command line used on your bug report
> Report bugs visiting https://github.com/avocado-framework/avocado/issues/new
> 
> I can use the 'new' runner:
> 
> $ TMPDIR=/tmp ./tests/venv/bin/avocado --show=app,console run 
> --test-runner=nrunner -t arch:s390x 

Uh, don't do that. nrunner does not seem to be able to execute that test 
yet. Or did you also upgrade your avocado to a newer installation? ... in 
that case it sounds like you might have messed up your installation? Maybe 
try again with a fresh and clean checkout of the QEMU repository / a new 
build folder.

  Thomas


