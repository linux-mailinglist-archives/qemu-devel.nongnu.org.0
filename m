Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069EB65F464
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 20:26:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDVrw-0006GL-1o; Thu, 05 Jan 2023 14:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDVro-0006Fs-UE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 14:25:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDVrn-0002Zn-2O
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 14:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672946730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5alDkbCf9xCyM4/PnSwPQA/DYUlx5wAVYkMckoEp8o=;
 b=cPfWZ+vF1ONSCgr7RTTCqQfE0pKT3YNfqOpmjNqvT0uCf/JiV6zil1hW+DxkHVoI1GVUp8
 kvrJtigQzFUlw/264m+OqdM5cxI8LlBbzNyKfF97gUT82yv40Q+qlhBl/FwQ6c36/UMWDg
 pkW+QlZ/mwM5y65cPr8Uj5m8Wo5WVdw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-145-ln7UNZAIN1irUapq0Gyqww-1; Thu, 05 Jan 2023 14:25:28 -0500
X-MC-Unique: ln7UNZAIN1irUapq0Gyqww-1
Received: by mail-qt1-f200.google.com with SMTP id
 fg11-20020a05622a580b00b003a7eaa5cb47so13569755qtb.15
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 11:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5alDkbCf9xCyM4/PnSwPQA/DYUlx5wAVYkMckoEp8o=;
 b=GBIuA66X+UbxW+nqcIFGduVkMRcjldrZMg2sZLpYE8wC4K89wMWwmeS/m+Yd4od4zT
 ZJwvQKDCMyrRH+ZAzr8Qn7DveeHHfbDAhn+aUecmGkkWX1YcuczJtP+P8U9aeoQWVemm
 rU6XzzEWV95zpyh92nis9gx4irZm5q6aixLi8MMITOwOq9ja2WOoL10aePdG5b08B78f
 7YCCfvOoHnXgRhcaKzAtAt9S+zJx8VN9ZLI9bQe/H7hHgIn3n7v+GpwRIIbYHR9eclwZ
 uu0TvNoGb2AtR3zKKVeBbM/nWPHtY0G18+Zxf4fjhf1jdPpjjBAGOLVHD9xvz636ig4U
 b9kA==
X-Gm-Message-State: AFqh2kqOrtOJWcw01JeqJNXszY7q1GqP/IXEUOcEpa1arpET5lamVISq
 C+jGncB6cVIcntfDicBtGaCovANME4v01ZjvrN36fqRM6DUzpEGFKFl55eHI2/JUAPZXhTKECH3
 IE7H74TvtTaYsyx0=
X-Received: by 2002:a05:622a:2509:b0:3a9:80bf:83c0 with SMTP id
 cm9-20020a05622a250900b003a980bf83c0mr75971978qtb.2.1672946728401; 
 Thu, 05 Jan 2023 11:25:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtbAQua333QDVZ/gdC9OPJi+u0o3UY9WXVNSQ4op4g+Fqo+1Uk+zPE2aB+E8vO4cWUzEMtGMQ==
X-Received: by 2002:a05:622a:2509:b0:3a9:80bf:83c0 with SMTP id
 cm9-20020a05622a250900b003a980bf83c0mr75971963qtb.2.1672946728168; 
 Thu, 05 Jan 2023 11:25:28 -0800 (PST)
Received: from [192.168.8.105] (tmo-097-240.customers.d1-online.com.
 [80.187.97.240]) by smtp.gmail.com with ESMTPSA id
 bp13-20020a05620a458d00b006fefa5f7fc9sm25840631qkb.134.2023.01.05.11.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 11:25:27 -0800 (PST)
Message-ID: <b3fe53d9-67c5-9e22-d5e7-fa98cac5cd58@redhat.com>
Date: Thu, 5 Jan 2023 20:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Stefan Weil <sw@weilnetz.de>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>
References: <20230104123559.277586-1-thuth@redhat.com>
 <CAFEAcA-1-CBVd9FRYHS5_KTjC9UfTUz6E7qDz0g7xYjsA7PC=w@mail.gmail.com>
 <46726378-d075-e77a-5439-bbfa822f70fd@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Work-around timeout and OpenGL
 problems of the MSYS2 jobs
In-Reply-To: <46726378-d075-e77a-5439-bbfa822f70fd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/01/2023 09.34, Thomas Huth wrote:
> On 04/01/2023 23.01, Peter Maydell wrote:
>> On Wed, 4 Jan 2023 at 12:36, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> The windows jobs (especially the 32-bit job) recently started to
>>> hit the timeout limit. Bump it a little bit to ease the situation
>>> (80 minutes is quite long already - OTOH, these jobs do not have to
>>> wait for a job from the container stage to finish, so this should
>>> still be OK).
>>>
>>> Additionally, some update on the container side recently enabled
>>> OpenGL in these jobs - but the corresponding code fails to compile.
>>> Thus disable OpenGL here for the time being until someone figured
>>> out the proper fix in the shader code for this.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   Now that the timeout and OpenGL problems are gone, the 64-bit is
>>>   working fine for me again. However, I'm still seeing random issues
>>>   with the 32-bit job ... not sure whether it's a problem on the
>>>   QEMU side or whether the builders are currently instable, since
>>>   the issues do not reproduce reliably...
>>>
>>>   .gitlab-ci.d/windows.yml | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> Thanks; applied to master on the assumption it will improve the
>> CI situation. I found that the msys2-32bit job still timed out
>> at 1h20, though:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3555245586
> 
> I just gave it a try again, too, and for me, it finished within 65 minutes:
> 
>   https://gitlab.com/thuth/qemu/-/jobs/3557600268
> 
> ... let's keep looking for a while, maybe it's ok in most cases now, but if 
> not, we have to consider something else.

Ok, so after I've been struggling with a failing msys2-32bit job for my new 
upcoming pull request the last two days (I thought I had a bad patch in 
there), where I had some problems with the test-hmp and qom-test qtests, 
I've come up with a new theory after looking at this CI run from the 
qemu-project staging branch and seeing that these tests are also failing there:

  https://gitlab.com/qemu-project/qemu/-/jobs/3558798544
  https://gitlab.com/qemu-project/qemu/-/jobs/3560870904

That might also explain the timed-out job that you have seen earlier, Peter, 
it was likely a hanging qom-test since that seems to be the first test to be 
executed during the "make check" there.

So the qtests for Windows are definitely not ready for the CI yet (after 
we've enabled them just in December). I think it's best to disable them 
there again completely until the issues are understood and fixed.

  Thomas


