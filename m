Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C445ECC66
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:50:09 +0200 (CEST)
Received: from localhost ([::1]:40534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFei-0008Kt-Ue
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:50:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odFVl-00082M-Oj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odFVk-0004eq-45
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664304050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ld8pQcZ0l8th1kbzN//RetLDeL3isog+cA+BsMkQYME=;
 b=FjclLxptpPjFOHlfng77L2pZPZRujH/Ur5nPu89O7fwa55R8+/1S496Z+KBFpLWXVh1YUO
 zsGqdEUvN4du9jrGmTPcGfmxiakXFXgrxyfzvSBqs1UhWT4CFMMouwdyU0MbUGDthczVnQ
 ZhggNeWD6Xi50ckZ5pPtbcQEv4RfOl8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-EHJYKmy4MXKnI4FqALH-sg-1; Tue, 27 Sep 2022 14:40:48 -0400
X-MC-Unique: EHJYKmy4MXKnI4FqALH-sg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l15-20020a05600c4f0f00b003b4bec80edbso5914497wmq.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 11:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ld8pQcZ0l8th1kbzN//RetLDeL3isog+cA+BsMkQYME=;
 b=AflxCiSqM/8N6ACFYw6HQ/zvLI4CxfO7m4N5yffBnke3Pj8+e6zOpEQqowviWruIwR
 N1rcu93UTt6Vx4gASQaUcLowBfvyCZx9E94C+nDNv9Ki6rrLmNY/RGOhantaDOP94d99
 YX53pZLnMmSDp3psxxRb1R8FOpPa+dwYxx5S3sUyfm43S1QIg5dpBaJzHNvtyZkU39V2
 I8KTTT3uggUFxdRoTRHu9WiTdQeMpLpCjbZzCt0/aiDQJ/HCqtCP0SCG0/3pmrkLxQn5
 GMD1yhmJyswTXF3tNRqafCokTC8KpYxaIMqlMxzqZO/4SYYJBQf+dQFLNuStG7+U4CXM
 9e5w==
X-Gm-Message-State: ACrzQf1C7oiph8bfJIXjBGesvIoAOVXaXWu5qgcz32K6dMUKA/ELxmdx
 gmkfcJaq0QUHwEQMcVU3dIczcz9A/o/ioSHtijDRY0oWaRua6pcz9LvCS+3j4Cx6lU0jtFtaNsm
 eKCzE4qB6AbOuClY=
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id
 o5-20020a5d6485000000b00226ecf9359cmr18649105wri.17.1664304047647; 
 Tue, 27 Sep 2022 11:40:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Xxr+PB2vh8NIxCtTT/1d7LQzg1/NwgW34X+hQ/KPnyg5EJUl6/16GyaAfBkzj0o/jsOvrjg==
X-Received: by 2002:a5d:6485:0:b0:226:ecf9:359c with SMTP id
 o5-20020a5d6485000000b00226ecf9359cmr18649088wri.17.1664304047402; 
 Tue, 27 Sep 2022 11:40:47 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c0a0200b003b51a4c61aasm10315815wmp.40.2022.09.27.11.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 11:40:46 -0700 (PDT)
Message-ID: <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
Date: Tue, 27 Sep 2022 20:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
In-Reply-To: <YzM5i5QP7NQq4OHV@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 27/09/2022 19.57, Daniel P. Berrangé wrote:
> On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
>> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
>>>> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
>>>>> now that Gitlab is giving us pressure on the amount of free CI minutes, I
>>>>> wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
>>>>> dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
>>>>> like we did it in former times...
>>>>>
>>>>> Big advantage would be of course that the time for those jobs would not
>>>>> count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
>>>>> do not show up in the gitlab-CI dashboard anymore, so there is no more
>>>>> e-mail notification about failed jobs, and you have to push to github, too,
>>>>> and finally check the results manually on cirrus-ci.com ...
>>>>
>>>> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
>>>> to run the cirrus-run container image that forwards jobs to Cirrus-CI.
>>>> So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
>>>>
>>>> This shouldn't affect gitlab.com/qemu-project where there are private
>>>> runners that do not consume GitLab CI minutes.
>>>>
>>>> Individual developers are affected though because they most likely
>>>> rely on the GitLab shared runner minutes quota.
>>>
>>> NB, none of the jobs should ever be run automatically anymore in
>>> QEMU CI pipelines. It always requires the maintainer to set the
>>> env var when pushing to git, to explicitly create a pipeline.
>>> You can then selectively start each individual job as desired.
>>
>> Cirrus CI is not automatically started when pushing to a personal
>> GitLab repo? If starting it requires manual action anyway then I think
>> nothing needs to be changed here.
> 
> No pipeline at all is created unless you do
> 
>    git push -o ci.variable=QEMU_CI=1 <your-fork-remote>
> 
> that creates the pipeliune but doesn't run any jobs - they're manual
> start.

Yes, sure, the jobs are not started automatically. But I *do* want to run 
the jobs before sending pull requests - but since the gitlab-CI minutes are 
now very limited, I'd like to avoid burning these minutes via gitlab and 
start those jobs directly on cirrus-ci.com again. For that the jobs would 
need to be moved to our .cirrus-ci.yml file again.

Well, maybe we could also have both, jobs via cirrus-run for those who want 
to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for those 
who want to avoid burning CI minutes on Gitlab. It's a little bit of 
double-maintenance, but maybe acceptable?

  Thomas


