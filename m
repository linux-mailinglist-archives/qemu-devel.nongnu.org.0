Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FAD5ECC9E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 21:07:26 +0200 (CEST)
Received: from localhost ([::1]:46480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odFvQ-0005Hg-Hz
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 15:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odFsk-0003LV-7j
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odFsf-0008Pq-Pm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 15:04:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664305471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nLyN6B/R8yug10v16rhL+l71nERjgcqzOzl4V1N1iuE=;
 b=GtxWH1eeGkd+NjEUI0GwS5Hy/ZK4oGsSLQKWjhDUpSaaWz9Slg0K8eYYal4ZfSRJhm4rpR
 /JqfhBAi65KaDpLcFpPm1Go9MKF5Fx1KjWvQ/nXVH+4z0NDPkDRNnnqBY+e40wRndmPCdc
 zoEFEFirC9zfDCg+6SHlmVY7cfnT2Qs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-57-fGuqy2nWP4-ri0nBdGBScw-1; Tue, 27 Sep 2022 15:04:30 -0400
X-MC-Unique: fGuqy2nWP4-ri0nBdGBScw-1
Received: by mail-wr1-f71.google.com with SMTP id
 o7-20020adfba07000000b00228663f217fso2435108wrg.20
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 12:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=nLyN6B/R8yug10v16rhL+l71nERjgcqzOzl4V1N1iuE=;
 b=kSH0WiItBDuJoqWaqD9wfSnioUslOIrN0Q4ihHZjrnzNtcPARCycMZ5jv+GUPRW5vx
 x9QI6ESZ24WxKkgamZkRo/OCk7PmXAyOPXBYu4KnoA0L2K/KzWP3dkeGLAIgh8KO6H32
 3lpcv+M5NEyADAX2EhB3q7OYRUTaaQNckp56rsrZ0fZYg8buznLnaDmCUp/krpZ+SyWZ
 BXn7LsO9q5ODgM8vu8c3EVqZIXuBL0DX/2sLQmsYkpNPCDx8lBJQ2jU83Imyb66Yq7Um
 FGxLckDzRuU1RA3GoSrFBpRZEsMlqTdgHtN+zPuwec3Sges4SlVfG2mhcXDucUJ3sbco
 56Cg==
X-Gm-Message-State: ACrzQf2BomqcscPFrRpG0HiA2LJTd+gvOb6igoHnbCNWcgQ0Q0vbb18W
 B5j84SDU2ftWA7nHaujsG0IGTrGFyTUjERwpBaFII7jH1tp5oyfLzXvS+tndasxoijEsCq+C7Lk
 Mfh33fHs9l7iAt1I=
X-Received: by 2002:a05:600c:3ac9:b0:3b4:bed4:d69 with SMTP id
 d9-20020a05600c3ac900b003b4bed40d69mr3912175wms.131.1664305469453; 
 Tue, 27 Sep 2022 12:04:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4vJxKTvqKdT+2tPdCBidJ0LD4lmNO4rt/zTnelOa1sDi2CZQ+pmde9r24kAAtQPffHc8wrqw==
X-Received: by 2002:a05:600c:3ac9:b0:3b4:bed4:d69 with SMTP id
 d9-20020a05600c3ac900b003b4bed40d69mr3912152wms.131.1664305469156; 
 Tue, 27 Sep 2022 12:04:29 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 e12-20020adffc4c000000b0022ad393ba3csm2320936wrs.107.2022.09.27.12.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 12:04:28 -0700 (PDT)
Message-ID: <8407a398-a006-b009-b48c-7814dc15c811@redhat.com>
Date: Tue, 27 Sep 2022 21:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Should we maybe move Cirrus-CI jobs away from Gitlab again?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <285e1375-82c4-556d-54fa-abba6b8e8e77@redhat.com>
 <CAJSP0QX13hF2_qSvO0Hfh=DtyurhkXyJKnrzWTSsTtURueTV6A@mail.gmail.com>
 <YzMcobeWVAnHUkNu@redhat.com>
 <CAJSP0QW_An5ypmsaXaVeHNKKzW0+x2Pmp8bQtPfVxPCqgAwFCA@mail.gmail.com>
 <YzM5i5QP7NQq4OHV@redhat.com>
 <dc108d7d-297b-5a84-68dd-12da3a0e68d0@redhat.com>
 <CAJSP0QVX8Q5Cg2rr7ee19Wvbghpx8FXyPBratjQi6D4mqHW8pQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QVX8Q5Cg2rr7ee19Wvbghpx8FXyPBratjQi6D4mqHW8pQ@mail.gmail.com>
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

On 27/09/2022 20.47, Stefan Hajnoczi wrote:
> On Tue, 27 Sept 2022 at 14:40, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 27/09/2022 19.57, Daniel P. Berrangé wrote:
>>> On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
>>>> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>
>>>>> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
>>>>>> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>> now that Gitlab is giving us pressure on the amount of free CI minutes, I
>>>>>>> wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
>>>>>>> dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
>>>>>>> like we did it in former times...
>>>>>>>
>>>>>>> Big advantage would be of course that the time for those jobs would not
>>>>>>> count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
>>>>>>> do not show up in the gitlab-CI dashboard anymore, so there is no more
>>>>>>> e-mail notification about failed jobs, and you have to push to github, too,
>>>>>>> and finally check the results manually on cirrus-ci.com ...
>>>>>>
>>>>>> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
>>>>>> to run the cirrus-run container image that forwards jobs to Cirrus-CI.
>>>>>> So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
>>>>>>
>>>>>> This shouldn't affect gitlab.com/qemu-project where there are private
>>>>>> runners that do not consume GitLab CI minutes.
>>>>>>
>>>>>> Individual developers are affected though because they most likely
>>>>>> rely on the GitLab shared runner minutes quota.
>>>>>
>>>>> NB, none of the jobs should ever be run automatically anymore in
>>>>> QEMU CI pipelines. It always requires the maintainer to set the
>>>>> env var when pushing to git, to explicitly create a pipeline.
>>>>> You can then selectively start each individual job as desired.
>>>>
>>>> Cirrus CI is not automatically started when pushing to a personal
>>>> GitLab repo? If starting it requires manual action anyway then I think
>>>> nothing needs to be changed here.
>>>
>>> No pipeline at all is created unless you do
>>>
>>>     git push -o ci.variable=QEMU_CI=1 <your-fork-remote>
>>>
>>> that creates the pipeliune but doesn't run any jobs - they're manual
>>> start.
>>
>> Yes, sure, the jobs are not started automatically. But I *do* want to run
>> the jobs before sending pull requests - but since the gitlab-CI minutes are
>> now very limited, I'd like to avoid burning these minutes via gitlab and
>> start those jobs directly on cirrus-ci.com again. For that the jobs would
>> need to be moved to our .cirrus-ci.yml file again.
>>
>> Well, maybe we could also have both, jobs via cirrus-run for those who want
>> to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for those
>> who want to avoid burning CI minutes on Gitlab. It's a little bit of
>> double-maintenance, but maybe acceptable?
> 
> I just noticed that qemu.git/master doesn't run Cirrus-CI. I guess it
> hasn't been set up in our GitLab project.
> 
> Since it's not enabled for qemu.git/master nothing will change from my
> perspective. Feel free to change it as you wish.

It's only run for the "staging" branch, I think. The idea was that things 
get tested before merge on the "staging" branch, then there is no need 
anymore to rerun everything when it gets pushed into the "master" branch.

  Thomas



