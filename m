Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 214D43DC417
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 08:40:58 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ig5-00010E-6H
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 02:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9ieo-0008El-8r
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m9iek-0002Qq-UY
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 02:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627713572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8SKtKnbejM2m6RyRiT+nyi6RiWKs260tt/gK9jIXoU=;
 b=GsROCfyiaYKzBMbcdg8HKgVkyq3882f9l/jlltJmxxQhcxrV+BquNmyWjb+jXXar8fVdWs
 ZT/oRQvVfeg1D5XLChg8UxDy9lvLZbJ0ctQBAy/jHQ5eRE5SQedQx0RCtqDjj3ouXtDygC
 G/WvVCgPxegBsoxmQym9Z6Njr5bGn0U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-SAcvx3J6NhuiCtisieVJrA-1; Sat, 31 Jul 2021 02:39:31 -0400
X-MC-Unique: SAcvx3J6NhuiCtisieVJrA-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so3905097wmj.6
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 23:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P8SKtKnbejM2m6RyRiT+nyi6RiWKs260tt/gK9jIXoU=;
 b=pqAOq8qo41NkA2PZhST685bFifAtOy/aM5PQliiT+MI0ohxKaUn2iEfCLEypdrmMJD
 14PtLe8Osnc0hSagzspCMI39alKIGLNwbuJ3yVN6v7M51P6xpTDOhO1xxlV28iyR3cMd
 P5AVU5d1rSzS6SDE5PCVYNAxWG2SJRVrQ4LENSMl4s1g+nIwnKCXQxMfur+OjTj2NcEx
 id7537ewExHK6RnvO0Sa67gZeZTGI4yZlbVQmtRe4MEGm0IPKga0xMY/ZrB2uSLh4pG8
 szHmgftdAD1WzeW3oaqIfl9WrtA/MvLJdNpb3wuApFXiI6VXWPuUkYUfJQw8f14KQaiN
 9vxg==
X-Gm-Message-State: AOAM530LzG+9EOaPZfTR4kvBOMJzg1UmZtTCbsnVZdFfReX7ecQITrtH
 rGo24flhCyHKUATIX0zqTfW5ejoTdi91TFsMHfjncfsO/m5DOt0Ojgx41pjDGm3LJSD+A/+/sGP
 WGmwnSm8wAAeDZE62kNXoHpkWBr0Caoigd0LURizBFUTcAsPl/LL2S2D8kkoBF9k=
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr6659902wrt.383.1627713570027; 
 Fri, 30 Jul 2021 23:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJyzCIXGEkplZu8rq5Z0PQPjqGC+lsOPlEvRtSPmpi3lA0DRYTJMLoKkmIBEWnU7b1LasnHg==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr6659611wrt.383.1627713564767; 
 Fri, 30 Jul 2021 23:39:24 -0700 (PDT)
Received: from thuth.remote.csb (p5791d280.dip0.t-ipconnect.de.
 [87.145.210.128])
 by smtp.gmail.com with ESMTPSA id k17sm399665wmj.0.2021.07.30.23.39.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 23:39:24 -0700 (PDT)
Subject: Re: "make check-acceptance" takes way too long
To: qemu-devel@nongnu.org
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <CAFEAcA8DX+OJQ7UnWhYLmUOgpa_mTCmvppRdHhZOE+n7HGPKZw@mail.gmail.com>
 <CA+bd_6JESu=ygwfSNe5BSzpy9WgYd_Ug0OFX6KeB=ut40hpwWw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <20afa6d3-2ecb-c4f4-398b-08f298ae82d7@redhat.com>
Date: Sat, 31 Jul 2021 08:39:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CA+bd_6JESu=ygwfSNe5BSzpy9WgYd_Ug0OFX6KeB=ut40hpwWw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.125, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/07/2021 00.04, Cleber Rosa wrote:
> On Fri, Jul 30, 2021 at 11:43 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 30 Jul 2021 at 16:12, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> "make check-acceptance" takes way way too long. I just did a run
>>> on an arm-and-aarch64-targets-only debug build and it took over
>>> half an hour, and this despite it skipping or cancelling 26 out
>>> of 58 tests!
>>>
>>> I think that ~10 minutes runtime is reasonable. 30 is not;
>>> ideally no individual test would take more than a minute or so.
>>
>> Side note, can check-acceptance run multiple tests in parallel?
> 
> Yes, it can, but it's not currently enabled to do so, but I'm planning
> to.  As a matter of fact, Yesterday I was trying out Avocado's
> parallel capable runner on a GitLab CI pipeline[1] and it went well.

Was this one of the shared gitlab CI runners? ... well, those feature only a 
single CPU, so the run was likely not very different compared to a single run.

> But the environment on GitLab CI is fluid, and I bet there's already
> some level of overcommit of (at least) CPUs there.  The only pipeline
> I ran there with tests running in parallel, resulted in some jobs with
> improvements, and others with regressions in runtime.  Additionally,
> lack of adequate resources can make more tests time out, and thus give
> out false negatives.

It certainly does not make sense to enable parallel tests for the shared 
runners there.

  Thomas


