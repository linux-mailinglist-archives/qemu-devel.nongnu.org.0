Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072D12F9BE1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:28:33 +0100 (CET)
Received: from localhost ([::1]:47700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Qps-000655-4A
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:28:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Qnm-0005Qj-Vn
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:26:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1Qnk-0007Y9-R6
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610961979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghExVL23RtxyrKBnxldYC1+AF2/yyApUT1LJvw0/W+I=;
 b=GrhOwWQi2UsXR4NQp6QZq+rYQ8JxYsTx63qQAOVnq9Hjjw/DVH5J7p1BIucSXKp6SmfLSL
 Z+t0ob20DqvN2T27GabwYa9eWv5Ww6ZwB0MB8x/eGW56ekLr+AvEU6fdVMiCYQGcscqirw
 oHDie4h+ZEl6hhOrs9V3GqhPWcj3tm4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-L7VHy3ONN5idYWphiylk1w-1; Mon, 18 Jan 2021 04:26:17 -0500
X-MC-Unique: L7VHy3ONN5idYWphiylk1w-1
Received: by mail-wr1-f70.google.com with SMTP id v5so8014266wrr.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 01:26:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghExVL23RtxyrKBnxldYC1+AF2/yyApUT1LJvw0/W+I=;
 b=idMT/VMQC+QuEuSMJIwLhDlodC8kJiW+WeLY0ChcMP/qVDV+WQWTjc3NskmDTwiBzG
 JmAvcyhCFh0/NHVLTM1thZ+LV7pyn4i386sru0zxrq98ryvr60w5nlAk9u1q93kToPAW
 ofiHMqLhbtbmtxDkf37h4DiM3/d7LW4j/qPB3h0MRGpNiz+6926bLyTmAlzp4mR6xNH3
 rmtHmacMJi1wwWnriOFB/BxAP++mPD42SV8frt9G3mylL9+dPIFTqe6Y+f9xsvU4LlRS
 VZIeOK4QTb5jsb7D59TV4/FvnVQwaDoiQd25kS8YQKrb3xKeE3VI65B20/zHq6EtlkRt
 tLMA==
X-Gm-Message-State: AOAM530zVghkYOVlM2wofrB4NVduBVSLB6V075StgYMNNSKVoq9G8oDa
 Z5cSk17b4HtrjwGh7i1JnLDLwLEAmp0Q3E8bJlAezfcdM6NtMS0cUUaQ55Rns3G+AvkyYs6+Y0Z
 8UNC1K0wLtL/TZ0k=
X-Received: by 2002:adf:e60f:: with SMTP id p15mr24552977wrm.60.1610961976751; 
 Mon, 18 Jan 2021 01:26:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAt/ZSYnBlR2STtILDNZoOFT7Aw5P7L4VGSrleHYQ5gaHXW0Djv8k6Vp38xc2gp6vv3xW5Fg==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr24552968wrm.60.1610961976616; 
 Mon, 18 Jan 2021 01:26:16 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o23sm30666887wro.57.2021.01.18.01.26.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 01:26:16 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
 <20201110153505.GH869656@redhat.com>
 <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
 <1d3ef711-9509-f43b-11e0-d9ead8cc95af@redhat.com>
 <b0268ed2-0347-1c00-265c-910b2dc0f870@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <93d7aa9e-4916-4c71-b017-36ccb5e410c8@redhat.com>
Date: Mon, 18 Jan 2021 10:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b0268ed2-0347-1c00-265c-910b2dc0f870@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/21 9:30 AM, Thomas Huth wrote:
> On 17/01/2021 19.48, Philippe Mathieu-Daudé wrote:
>> On 11/11/20 10:18 AM, Philippe Mathieu-Daudé wrote:
>>> On 11/10/20 4:35 PM, Daniel P. Berrangé wrote:
>>>> On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> The EDK2 jobs use the 'changes' keyword, which "makes it
>>>>> possible to define if a job should be created based on files
>>>>> modified by a Git push event." (see [1]). This keyword comes
>>>>> with a warning:
>>>>>
>>>>>    Caution:
>>>>>
>>>>>      In pipelines with sources other than the three above
>>>>>      changes can’t determine if a given file is new or old
>>>>>      and always returns true."
>>>>>
>>>>> In commit 922febe2af we moved the YAML config file from the
>>>>> repository root directory to the .gitlab-ci.d/ directory.
>>>>>
>>>>> We didn't respect the previous warning and disabled the
>>>>> 'changes' filter rule, as the files are now in a (directory)
>>>>> three above the YAML config file.
>>>>
>>>> This description is a bit wierd. I don't see how the location
>>>> in the directory tree has any relevance here.
>>>>
>>>> IIUC the caution docs quoted above are referring to what triggered
>>>> the pipeline. They're saying that if the trigger was not a "branch",
>>>> "merge request", or "external pull request", then the "changes" rule
>>>> always evaluates true.
>>>>
>>>> The "branch" source us a bit wierd though, as I'm not seeing
>>>> how gitlab figures out which commits are "new" to the pipeline
>>>> and thus whether the files were modified or not.
>>>>
>>>> Strangely qemu-project/qemu CI for master seems to be behaving
>>>> correctly and skipping the jobs.
>>>
>>> What about this one?
>>>
>>> https://gitlab.com/berrange/qemu/-/jobs/827459510
>>
>> Ping?
> 
> Daniel's comment sounded like there are some changes required here, at
> least to improve the commit message? So I was expecting a v2 here.
> Please clarify Daniel's concerns, then I can either pick up this version
> here or the v2 (in case you send one).

Sorry, this "ping" was for Daniel. I'm not sure how to continue,
so shared an example in his namespace of "incorrect behavior".

Meanwhile I'm tempted to put those jobs in Manual mode (2 months now),
until we settle this with Daniel.

Thanks,

Phil.


