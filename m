Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D54453856
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:11:28 +0100 (CET)
Received: from localhost ([::1]:46926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1zS-0000Dg-T1
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:11:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn1xW-0007GR-OI
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn1xT-00028S-9Q
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 12:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637082562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tksoeZ18iFXQIaMb2lEcun62QWijgtS4Ywh1WCiCbw=;
 b=Iq5sOGQv4MytDqjAcZBc9YP33VnmctoS4MLr3Pwa2tRP6AzQt1Xeken4d09tjcWsWNq8Wt
 qcko3YjxztWPZNrZBN9/Io9hFrs1WhM+VW1gvHyaGW6gBKIHzVxXTMczsvi79ruMfPVsOQ
 +Vkd8uX1Y6mQU9bP5jWcGLwiJ5VUlD8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-Y6YaAbWzMxayC1xXzZeHSQ-1; Tue, 16 Nov 2021 12:09:18 -0500
X-MC-Unique: Y6YaAbWzMxayC1xXzZeHSQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso4546210wrh.20
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 09:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/tksoeZ18iFXQIaMb2lEcun62QWijgtS4Ywh1WCiCbw=;
 b=P6xnsBXlv4wzSfj1S9infHJYv4ouSh903HakWeCg+JUCcofr1YirBmRLmIcPwraUrP
 LKKG8M7eehfox2V5O3AfXAzrkHwfVSv46xmCjpgjFiuDhiZkpM8B1EJSaPJIftkGhZRS
 rS+9tzvBSMj9SeW+OwlWbV2me7jOAMdoVerCBS8W7NMTSITaG3azxBMiqrB82Wbq+GR7
 Ojty383osxyXkElb9ZUpHI4eUeIiqsJrRie8Fn668LegRhqTeMTz8j1y/++u3tcItzXd
 iJNFqt75dd3g1+slMlUUEtX+6+2Rc55c7yN3Uwz/y6MTiqoq29JX3U3GoAg/oouFjjdv
 Qp9g==
X-Gm-Message-State: AOAM531YitzEuEKugI9skw03VueUX9sCOGuBVdlUpA5JJU9Mr3E2ldMo
 AvjeniRh3kjbHSfjHwxDhNO1Dt/VddcRJ2MxUaC/exbsZaIsfmXwIrwQPcV+XT0CBIR9suYA6XZ
 Kq0h39p1X6QHVQ94=
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr9539840wmh.164.1637082557305; 
 Tue, 16 Nov 2021 09:09:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEzBRiJArAmYqal5dCsxfdX25xboUudStvmzLzTfXOc1LG+3BpXDLdylbCeSKIXDkMokoN6g==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr9539792wmh.164.1637082557005; 
 Tue, 16 Nov 2021 09:09:17 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 8sm2857153wmg.24.2021.11.16.09.09.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 09:09:16 -0800 (PST)
Message-ID: <3b48a20f-c8db-9ebf-f179-f1843782c229@redhat.com>
Date: Tue, 16 Nov 2021 18:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] gitlab-ci/cirrus: Increase timeout to 80 minutes
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20211116163309.246602-1-thuth@redhat.com>
 <YZPhHt4JFcz41YFJ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YZPhHt4JFcz41YFJ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 17:49, Daniel P. Berrangé wrote:
> On Tue, Nov 16, 2021 at 05:33:09PM +0100, Thomas Huth wrote:
>> The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
>> be scheduled, so while the build test itself finishes within 60 minutes,
>> the total run time of the jobs can be longer due to this waiting time.
>> Thus let's increase the timeout on the gitlab side a little bit, so
>> that these jobs are not marked as failing just because of the delay.
> 
> On a successful pipeline I see
> 
>  freebsd-11  - 28 minutes
>  freebsd-12  - 57 minutes
>  macos       - 30 minutes
> 
> We know cirrus allows 2 concurrent jobs, so from that I infer
> that the freebsd-12 job was queued for ~30 minutes waiting for
> either the freebsd-11 or macos job to finish, and then it
> ran in 30 minutes, giving the ~60 minute total.
> 
> That's too close to the 60 minute gitlab default job timeout
> for comfort - it can easily slip over 60 minutes by just a
> small amount.
> 
> 80 minutes will certainly help in the case where we
> randomly take a little longer than 30 minutes to build,
> and have 1 of the 3 jobs queued.
> 
> When we're running jobs on both master + staging, we can
> have 2 jobs running and 4 more queued - 2 of those queued
> might just finish in time, but 2 will definitely fail.
> My patch will cut these extra jobs on master, so in common
> case we only ever get 1 queued, which should work well in
> combo with your patch here. That should be good enough
> for the qemu-project namespace, unless someone is triggering
> pipelines for stable branch staging at the same time as
> the master branch staging.
> 
> If we do want to worry about more than 2 queued jobs
> again for that reason, we might consider putting
> it upto 100 minutes. That would give us enough slack to
> have 4 queued jobs behind two running jobs and have
> them all succeed
> 
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  .gitlab-ci.d/cirrus.yml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
>> index e7b25e7427..22d42585e4 100644
>> --- a/.gitlab-ci.d/cirrus.yml
>> +++ b/.gitlab-ci.d/cirrus.yml
>> @@ -14,6 +14,7 @@
>>    stage: build
>>    image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
>>    needs: []
>> +  timeout: 80m
>>    allow_failure: true
>>    script:
>>      - source .gitlab-ci.d/cirrus/$NAME.vars
> 
> Whether 80 or 100 minute, consider it
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

This pipeline took 1h51m09s:
https://gitlab.com/qemu-project/qemu/-/pipelines/409666733/builds
But Richard restarted unstable jobs, which probably added time
to the total.

IIRC from a maintainer perspective 1h15 is the upper limit.
80m fits, 100m is over. Up to the project maintainers
(personally I don't have any objection, in particular if
this reduces the failures rate).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


