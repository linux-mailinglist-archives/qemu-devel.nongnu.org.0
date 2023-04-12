Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A63026DF19F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:07:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXNC-0006eE-5K; Wed, 12 Apr 2023 06:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXN8-0006dj-BG
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:06:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmXN6-000605-64
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 06:06:37 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 d8-20020a05600c3ac800b003ee6e324b19so5830425wms.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681293994; x=1683885994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nodu07HKidxKPxvOg7xbv/1Polhi/238wioQUMdq6YU=;
 b=Xk3y6DXBeCFFzJr+vithiTz5Beg0CXzofhffIWROJNMLkIZ7q26zdzFL4KJtA4YxyU
 Il4dRd58xoKO29XLYhdAiWdEM4huVsdPW7tera/P7GyqMzKKr5sQFUsTfalIJ40UoLt5
 RZNqZzfSgstPdGFJ4R0YX5dBPr8yhN791OWpFaBmqSRZApEh4jrE+bwym33YTPmGkOEI
 7gr68QxBAS8wdpi6KH/Bcx+0ZH++esjWqvsINZI9qV3ixkUf50FIyXp6LuCXItCKkmpu
 w95X1V7K9gFRCUDsJeIqJJ4IrgOgZWYJ5NN9Uve6hEwbGvxbD9cVhTlpHNiW7ruAt4Ob
 FUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681293994; x=1683885994;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nodu07HKidxKPxvOg7xbv/1Polhi/238wioQUMdq6YU=;
 b=eufKfWNkmqzrc598WEKet09MzWeLwaQLqyq9zAoIePmWkh4Z1Bnwr8f5uI+4DPGd8B
 VM1U5TV35QM3DctaAgGnoP8ID2AOzTUhUBP2zuB//AQO7Bih4HhhgesSbETVDqkIDq5I
 lg4lR3TA4uM55eN1m86II4ptJoE65A/E9qCYvpvyrb9wzZFgiLl8cbqhrIFXIJrLthLC
 sL6yB0aq67XymJasxsaSLbPZpc11uRXWczT+8yD1r40+1XA7KphvGNPwzZhS169eCu+6
 4KZ3csjFzav2VRXr2z6gHEAUtJQJmbbGfod02D/2NgiCST4WaneMYCVWEvMjss4OP1h1
 ke2g==
X-Gm-Message-State: AAQBX9f7Wf+k2d10ruUOMdOSLo0Q67izJeyZm5pHhTF4FeY93za6Dbcu
 kaAWXE/yxOJAa6OlR13J9MAKcw==
X-Google-Smtp-Source: AKy350a38QzxrOG40N/FCLtmNOZJ6NWu2hOiFQSQbZsWgPAmb1mo1As6jLt15bkoB1132d1qV+yodA==
X-Received: by 2002:a05:600c:b56:b0:3ee:7e12:f50 with SMTP id
 k22-20020a05600c0b5600b003ee7e120f50mr1516825wmr.8.1681293994158; 
 Wed, 12 Apr 2023 03:06:34 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.216.226])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c3b0200b003f0652084b8sm1865060wms.20.2023.04.12.03.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 03:06:33 -0700 (PDT)
Message-ID: <72ee7e72-5ec1-d53b-94fa-e88f68880c2f@linaro.org>
Date: Wed, 12 Apr 2023 12:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [QEMU][PATCH] gitlab-ci.d/crossbuilds: Drop the '--disable-tcg'
 configuration for xen
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Vikram Garhwal <vikram.garhwal@amd.com>,
 qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230411210422.24255-1-vikram.garhwal@amd.com>
 <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <895bcdd3-350d-38e7-1982-899948072b93@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/4/23 07:39, Thomas Huth wrote:
> On 11/04/2023 23.04, Vikram Garhwal wrote:
>> Xen is supported for aarch64 via xenpvh machine. disable-tcg option 
>> fails the
>> build for aarch64 target.
>>
>> Link for xen on arm patch series: 
>> https://mail.gnu.org/archive/html/qemu-devel/2023-02/msg03979.html
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   .gitlab-ci.d/crossbuilds.yml | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 61b8ac86ee..6867839248 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -186,7 +186,7 @@ cross-amd64-xen-only:
>>     variables:
>>       IMAGE: debian-amd64-cross
>>       ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
>>   cross-arm64-xen-only:
>>     extends: .cross_accel_build_job
>> @@ -195,4 +195,4 @@ cross-arm64-xen-only:
>>     variables:
>>       IMAGE: debian-arm64-cross
>>       ACCEL: xen
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg --disable-kvm
>> +    EXTRA_CONFIGURE_OPTS: --disable-kvm
> 
> This patch looks wrong. I'm pretty sure we wanted to test the build 
> without TCG here. Building with TCG enabled is already done in other 
> jobs. So instead of removing "--disable-tcg" here the question is 
> rather: Why does it not build with this flag anymore? Can those problems 
> be fixed instead?

I concur, this used to work. Did this config bit-rotted?
The latest /master job succeeded:
https://gitlab.com/qemu-project/qemu/-/jobs/4094506462

