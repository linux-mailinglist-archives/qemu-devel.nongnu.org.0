Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA50A6A1694
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 07:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVRU1-0007QQ-9s; Fri, 24 Feb 2023 01:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVRTy-0007QE-Oy
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:23:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVRTw-00071N-Lb
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 01:23:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677219779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Riw5hRuXL8TvhCKRVphl1zXkndXRaziI3ktVGnBscjU=;
 b=f8f+jZ4GmUPc5CEYGwlbQCcWSfqu0oizIKXil38pcxRYjry68fRprjFLnMfrBnLZAWgFrV
 zO7r+5joHNfo+d1riSwMgkeiOI7UOSM8RWDxqJumLiFVqp6XbpvEU6b/az9W6JJTz492Om
 ohVA+pI3elFUlocd4I/77sRV2yY34/g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-Xc2C1rGaPn25Gytb1vP22g-1; Fri, 24 Feb 2023 01:22:57 -0500
X-MC-Unique: Xc2C1rGaPn25Gytb1vP22g-1
Received: by mail-wr1-f72.google.com with SMTP id
 a7-20020a056000188700b002c53d342406so2772872wri.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 22:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Riw5hRuXL8TvhCKRVphl1zXkndXRaziI3ktVGnBscjU=;
 b=Rp4Hn8wNPeomuOf36M8GsbWxuIbSkT2BHqvFY/K7r2R+u38TouRhVYjo5gCi/5MqjY
 CG7gFUeSRZO1xvrCJYwaQnBcgkzRRbhNwZc+wVQz7uGjTPLrw5ayyRTzd67PoqP6sBGl
 2XI2dBWjNbyibPWq9lBLzlvjCiFS1rKLlKAXabQZPfY8TssSDnxCQq1P17gs6VZ7Xhbe
 RXKS1flN92GgFuP7RPbjN9HxpptZSNlAW37lCE16eQ3YqWx5qjt5ZbAenDxRXK4IjIEn
 bXHDgFnm8gMqiTv8ItI8zTQQcSOt/xvexJvN6cLkxqYiF7p8yU6QNgBTdRl7iZGP8+bi
 HKlg==
X-Gm-Message-State: AO0yUKWHRmGvwv82w7DDvPlJKdbSGTvy0/9cP0S87E2H64kxq9B0+Sf/
 hq31LMt5xpONeDIxKy+lGzqq9b2PAmVT7qC7Q9QQEUnaDPYJaRjyizvdlaZI1KVZA5SNIbl9HQw
 yHbvCXptXnghiCPI=
X-Received: by 2002:a5d:6605:0:b0:2c7:156c:affd with SMTP id
 n5-20020a5d6605000000b002c7156caffdmr3242258wru.9.1677219776928; 
 Thu, 23 Feb 2023 22:22:56 -0800 (PST)
X-Google-Smtp-Source: AK7set+g9dVW61TNIHsAA+BTQq758XfY3P8yzASkJIrXEqTmrDNCPq2SArHZBUPoOdy5NlN8ucqtRA==
X-Received: by 2002:a5d:6605:0:b0:2c7:156c:affd with SMTP id
 n5-20020a5d6605000000b002c7156caffdmr3242247wru.9.1677219776593; 
 Thu, 23 Feb 2023 22:22:56 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003e20970175dsm1670168wms.32.2023.02.23.22.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 22:22:56 -0800 (PST)
Message-ID: <56bf3f6b-92bd-0c89-b17b-1056ba02c4df@redhat.com>
Date: Fri, 24 Feb 2023 07:22:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
References: <20230223191343.1064274-1-thuth@redhat.com>
 <584c71cb-02e1-9386-44d7-ca2ce1c3253e@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <584c71cb-02e1-9386-44d7-ca2ce1c3253e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 23/02/2023 21.23, Philippe Mathieu-Daudé wrote:
> On 23/2/23 20:13, Thomas Huth wrote:
>> When handling pull requests in the staging branch, it often happens
>> that one of the job fails due to a problem, so that the pull request
>> can't be merged. Peter/Richard/Stefan then informs the sender of the
>> pull request and continues by pushing the next pending pull request
>> from another subsystem maintainer. Now the problem is that there might
>> still be lots of other running jobs in the pipeline of the first pull
>> request, eating up precious CI minutes though the pipeline is not
>> needed anymore. We can avoid this by marking the jobs as "interruptible".
>> With this setting, the jobs from previous pipelines are automatically
>> terminated when pushing a new one. If someone does not like this auto-
>> matic termination, it can still be disabled in the settings of the
>> repository. See this URL for details:
>>
>>   https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/base.yml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
>> index 50fb59e147..0274228de8 100644
>> --- a/.gitlab-ci.d/base.yml
>> +++ b/.gitlab-ci.d/base.yml
>> @@ -11,6 +11,8 @@
>>       # and show the duration of each line.
>>       FF_SCRIPT_SECTIONS: 1
>> +  interruptible: true
> 
> It makes sense for mainstream, but seems counter-productive in forks.
> At least in my maintainer use case.
> 
> Is it possible to add a 'default' in .gitlab-ci.d/qemu-project.yml,
> so we can overwrite with a different namespace? 'interruptible' is
> listed in https://docs.gitlab.com/ee/ci/yaml/index.html#default.

As I wrote in the commit description: "If someone does not like this 
automatic termination, it can still be disabled in the settings of the 
repository."

See here for how to change the setting:

 
https://docs.gitlab.com/ee/ci/pipelines/settings.html#auto-cancel-redundant-pipelines

  Thomas



