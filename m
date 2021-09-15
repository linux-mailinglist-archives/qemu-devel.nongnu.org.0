Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1330C40C1EB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 10:42:25 +0200 (CEST)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQQUq-0001cj-4S
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 04:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQQTE-0000WZ-Mu
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:40:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQQTD-0001M4-0T
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 04:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631695242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ICY6YKQBWKhzWlriVRdXH1eQgxlE35y3CXcudm8xNvA=;
 b=JzPLltrGVvj0hjud4K66bhoWCzYL6GXaHxRXbGaX0/pkG7aHE1pMjSz6JtzBi3qjNc1yPM
 TDqMsXOZxtW+Bz4JV/6f+yCk7TjLmzZkcldcB+eGiTfJGxzNog4unEHAs4twEvhxLqkMmg
 jNlg9646gQG8bdKdFRsEmIxIJQ2vmXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-OHigjq6WPOGqPTyVYYw3BA-1; Wed, 15 Sep 2021 04:40:39 -0400
X-MC-Unique: OHigjq6WPOGqPTyVYYw3BA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f17-20020a05600c155100b002f05f30ff03so1396214wmg.3
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 01:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ICY6YKQBWKhzWlriVRdXH1eQgxlE35y3CXcudm8xNvA=;
 b=QdtluvYPD3rImKXSYBFBxqar/+2rq16u1O1WDPRNHLo/DtCzgngrRLpwbNqIJGUmVi
 J5tlsGgzw0Id6xSgeeIfN+mKRz5lupcApTm57BC+X/yadPoTnqM5rb9l/vesHC8GbvjM
 Z4kvoG+9LUZA5LVnSTs3hYo8tmrVu4qbU8bcS/98t2K1eb92zukf/HXx1Ri+GiG/YvZy
 sFqeJhbcLfahT7mO+7XrPeDKNjEnci0WdITQn4eVW4tQiQxuS4YfjKZ6SkaYKRbaYtiF
 7khMp82yOb1nxbxilKgCvWV9q9usHpMctywtDhIBTsogq3lfJECceMTTnlDfCGerz0cS
 Mzjw==
X-Gm-Message-State: AOAM531EhMQeAI7ftZ80I8C9nlXAPHOIWUIx2mCXg0wVpQPUJSYairSV
 5DjDSalwVWi7aHZ4AAg/GdkLsl7ySy+Tb53uXEP8HvUj557hyPKHlRjmjbxOTiBhiImQqHG6aQ1
 zJKTJFxKle2lEhpg=
X-Received: by 2002:adf:f183:: with SMTP id h3mr3643973wro.32.1631695237790;
 Wed, 15 Sep 2021 01:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhnyThkKgrVZeQKGBxjIiqY5THrI3JZdSFDfHHJ1HrSlKXfYC2yNUClzeXo75mduQH6zAt8Q==
X-Received: by 2002:adf:f183:: with SMTP id h3mr3643943wro.32.1631695237422;
 Wed, 15 Sep 2021 01:40:37 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o13sm11448042wri.53.2021.09.15.01.40.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 01:40:36 -0700 (PDT)
Subject: Re: [PATCH] gitlab-ci: Make more custom runner jobs manual, and don't
 allow failure
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210913101948.12600-1-peter.maydell@linaro.org>
 <CAFEAcA86yjW8oeif4tY7WWzGfXYYV0VuqY+4RV9f_NqAApeeeg@mail.gmail.com>
 <YUGu1PbzB+pzZdjf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7e9ad0c4-e27f-42f4-fc82-56d16d3d3953@redhat.com>
Date: Wed, 15 Sep 2021 10:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUGu1PbzB+pzZdjf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 10:29 AM, Daniel P. Berrangé wrote:
> On Tue, Sep 14, 2021 at 08:17:19PM +0100, Peter Maydell wrote:
>> On Mon, 13 Sept 2021 at 11:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> Currently we define a lot of jobs for our custom runners:
>>> for both aarch64 and s390x we have
>>>  - all-linux-static
>>>  - all
>>>  - alldbg
>>>  - clang (manual)
>>>  - tci
>>>  - notcg (manual)
>>>
>>> This is overkill.  The main reason to run on these hosts is to get
>>> coverage for the host architecture; we can leave the handling of
>>> differences like debug vs non-debug to the x86 CI jobs.
>>>
>>> The jobs are also generally running OK; they occasionally fail due to
>>> timeouts, which is likely because we're overloading the machine by
>>> asking it to run 4 CI jobs at once plus the ad-hoc CI.
>>>
>>> Remove the 'allow_failure' tag from all these jobs, and switch the
>>> s390x-alldbg, aarch64-all, s390x-tci and aarch64-tci jobs to manual.
>>> This will let us make the switch for s390x and aarch64 hosts from
>>> the ad-hoc CI to gitlab.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> It looks like this change has resulted in pipelines ending
>> up in a "blocked" state:
>>
>> https://gitlab.com/qemu-project/qemu/-/pipelines
>>
>> I'm not sure why this is -- is it perhaps because there were
>> other jobs that depended on the now-manual-only jobs ?
>> Can somebody suggest a fix ?
> 
> Urgh, my bad, I completely forget this behaviour when reviewing.
> When we only have
> 
>   when: manual
> 
> then the job has to be manually started, and it still contributes
> to pipeline status, so it /must/ triggered manually.
> 
> If we want it to be manually started and not contribute to the
> pipeline status we need:
> 
>  rules:
>    ...
>    when: manual
>    allow_failure: true

Reminds me of the following commits:
- d3a4e41da25 ("gitlab-ci: Fix 'when:' condition in acceptance...")
- 59e8b62b220 ("gitlab-ci: Fix 'when:' condition in EDK2 jobs")
- c217fd8e36a ("gitlab-ci: Fix 'when:' condition in OpenSBI jobs")


