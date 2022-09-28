Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEABE5ED610
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:29:05 +0200 (CEST)
Received: from localhost ([::1]:41678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRVA-0006mV-6e
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odQce-0001xE-A3
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odQcZ-0001Qf-4G
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 02:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664346754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lI5RxcPBv5ak4Feru9FnsGQcpSQcQZ5wHtpwhHmcIiU=;
 b=RpWOVi5qNjjyKwfTGhYV4SZcxAV7qrfnM0iVshYDW9Qigg7RdW/ZBS28jOQrEMPtV7tSpR
 97dqDFyPQCXWFxxAK+S4sKLx20hSlM0WCGnCYleykL3lJeHlaH394KBqYtekUdMiCycMBB
 cC6pv4CQKWutO5T08ZuZYwi9r3zZtaw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-226-MxnGBKbkPMuySWguTw5g4Q-1; Wed, 28 Sep 2022 02:32:33 -0400
X-MC-Unique: MxnGBKbkPMuySWguTw5g4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so6663040wmn.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 23:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=lI5RxcPBv5ak4Feru9FnsGQcpSQcQZ5wHtpwhHmcIiU=;
 b=xGAEfasdEiemKbsB46YHR+d84dOElFXzVCYsf5S2M9TKbSwg+Z3IWh4WeFqcaU14Uo
 siwI1rs9oG9z6vIECXn5Wzl2K/hlRUg957ULQmo48SZN3KDIpj8YtOLDDN7Xvl8mym/O
 KsnfZivhsCY+l49Lb+NT58Wkl2A8PWgmlyD4uLstfEELCecqo1WHdx8CiK3do4TkjrMx
 axbAsIDN/8K9gkL790PLfctmsMgmxuFcMKo70qeO7GTSfrKWkrxT2Sn1ZUG6teOrz9qx
 JAizjyCa0Ql+8+x98H9YCP+U2dEJ/cEZb5LghWMNeLr3t0uE6WH2y7BCIWZ1YB9lPlyo
 TxEg==
X-Gm-Message-State: ACrzQf1R2dZssqptFO+A+cZzP9nAPAN4bwP6xlKTV8d3uAAYPI1xWnay
 BIFA2rozXIeVEFXo+MCMHnkzDdmJqUj7x1PZMhSXvDz8XXHM4jtjbhr8WL6Pro0+2oWBzuk6ENs
 hq0uZ6Ino0H7SK1I=
X-Received: by 2002:a05:6000:1204:b0:22b:3359:4112 with SMTP id
 e4-20020a056000120400b0022b33594112mr19257454wrx.700.1664346752400; 
 Tue, 27 Sep 2022 23:32:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6kdszRqoLgqQkMO5e5JTzJrQA8b3WkaUf56rZFm5QTeFtFIuwtZXHB3rWiyKGSmb7hJMNHyA==
X-Received: by 2002:a05:6000:1204:b0:22b:3359:4112 with SMTP id
 e4-20020a056000120400b0022b33594112mr19257432wrx.700.1664346752106; 
 Tue, 27 Sep 2022 23:32:32 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003b332a7bf15sm699400wms.7.2022.09.27.23.32.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 23:32:31 -0700 (PDT)
Message-ID: <a29540fa-eb8c-2976-2e12-67da38faa56e@redhat.com>
Date: Wed, 28 Sep 2022 08:32:29 +0200
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
 <8407a398-a006-b009-b48c-7814dc15c811@redhat.com>
 <CAJSP0QW7EQKWk7F5UP9gKWqpooEkqdOUbxiMW2ac-5YL5ytY5A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAJSP0QW7EQKWk7F5UP9gKWqpooEkqdOUbxiMW2ac-5YL5ytY5A@mail.gmail.com>
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

On 27/09/2022 21.10, Stefan Hajnoczi wrote:
> On Tue, 27 Sept 2022 at 15:04, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 27/09/2022 20.47, Stefan Hajnoczi wrote:
>>> On Tue, 27 Sept 2022 at 14:40, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 27/09/2022 19.57, Daniel P. Berrangé wrote:
>>>>> On Tue, Sep 27, 2022 at 01:36:20PM -0400, Stefan Hajnoczi wrote:
>>>>>> On Tue, 27 Sept 2022 at 11:54, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>>>>
>>>>>>> On Tue, Sep 27, 2022 at 11:44:45AM -0400, Stefan Hajnoczi wrote:
>>>>>>>> On Tue, 27 Sept 2022 at 05:02, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>> now that Gitlab is giving us pressure on the amount of free CI minutes, I
>>>>>>>>> wonder whether we should maybe move the Cirrus-CI jobs out of the gitlab-CI
>>>>>>>>> dashboard again? We could add the jobs to our .cirrus-ci.yml file instead,
>>>>>>>>> like we did it in former times...
>>>>>>>>>
>>>>>>>>> Big advantage would be of course that the time for those jobs would not
>>>>>>>>> count in the Gitlab-CI minutes anymore. Disadvantage is of course that they
>>>>>>>>> do not show up in the gitlab-CI dashboard anymore, so there is no more
>>>>>>>>> e-mail notification about failed jobs, and you have to push to github, too,
>>>>>>>>> and finally check the results manually on cirrus-ci.com ...
>>>>>>>>
>>>>>>>> My understanding is that .gitlab-ci.d/cirrus.yml uses a GitLab CI job
>>>>>>>> to run the cirrus-run container image that forwards jobs to Cirrus-CI.
>>>>>>>> So GitLab CI resources are consumed waiting for Cirrus-CI to finish.
>>>>>>>>
>>>>>>>> This shouldn't affect gitlab.com/qemu-project where there are private
>>>>>>>> runners that do not consume GitLab CI minutes.
>>>>>>>>
>>>>>>>> Individual developers are affected though because they most likely
>>>>>>>> rely on the GitLab shared runner minutes quota.
>>>>>>>
>>>>>>> NB, none of the jobs should ever be run automatically anymore in
>>>>>>> QEMU CI pipelines. It always requires the maintainer to set the
>>>>>>> env var when pushing to git, to explicitly create a pipeline.
>>>>>>> You can then selectively start each individual job as desired.
>>>>>>
>>>>>> Cirrus CI is not automatically started when pushing to a personal
>>>>>> GitLab repo? If starting it requires manual action anyway then I think
>>>>>> nothing needs to be changed here.
>>>>>
>>>>> No pipeline at all is created unless you do
>>>>>
>>>>>      git push -o ci.variable=QEMU_CI=1 <your-fork-remote>
>>>>>
>>>>> that creates the pipeliune but doesn't run any jobs - they're manual
>>>>> start.
>>>>
>>>> Yes, sure, the jobs are not started automatically. But I *do* want to run
>>>> the jobs before sending pull requests - but since the gitlab-CI minutes are
>>>> now very limited, I'd like to avoid burning these minutes via gitlab and
>>>> start those jobs directly on cirrus-ci.com again. For that the jobs would
>>>> need to be moved to our .cirrus-ci.yml file again.
>>>>
>>>> Well, maybe we could also have both, jobs via cirrus-run for those who want
>>>> to see them in their gitlab-CI dashboard, and via .cirrus-ci.yml for those
>>>> who want to avoid burning CI minutes on Gitlab. It's a little bit of
>>>> double-maintenance, but maybe acceptable?
>>>
>>> I just noticed that qemu.git/master doesn't run Cirrus-CI. I guess it
>>> hasn't been set up in our GitLab project.
>>>
>>> Since it's not enabled for qemu.git/master nothing will change from my
>>> perspective. Feel free to change it as you wish.
>>
>> It's only run for the "staging" branch, I think. The idea was that things
>> get tested before merge on the "staging" branch, then there is no need
>> anymore to rerun everything when it gets pushed into the "master" branch.
> 
> I don't see a cirrus job:
> https://gitlab.com/qemu-project/qemu/-/pipelines/652051335

That's likely because it had been disabled on github when we switched to 
cirrus-run via gitlab. I still have it enabled for my forked repo on github, 
so you can see runs here:

  https://cirrus-ci.com/github/huth/qemu/

  Thomas


