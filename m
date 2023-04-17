Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFD26E4B51
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 16:21:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poPi1-0003qE-D8; Mon, 17 Apr 2023 10:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poPhz-0003q4-AG
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:19:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1poPhr-00073O-Kp
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 10:19:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681741186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1sVIEU7MrE5g2ycNiwnhc/kQ5Okgxe47LCGDT6CArik=;
 b=iXxvrnuK3+4XjHzQAM/UFq9GzjeEgqLkHN1SnDh+A7wW6Ua7PfMKKkLeiU1xHRjLn1yhED
 2SoOg+uR2WB2y4kh5JvIYMi8gRiryJbT/YN3frI8VF75d+hSoLFYFObIOhzVgUDg715X8i
 iP6OuLHr3+8c6MHuA70yWWYm7iqGvKs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-HCXUM8jSPVm8etbsKzgYaA-1; Mon, 17 Apr 2023 10:19:45 -0400
X-MC-Unique: HCXUM8jSPVm8etbsKzgYaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 fl8-20020a05600c0b8800b003f16fe94249so2875059wmb.9
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681741184; x=1684333184;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1sVIEU7MrE5g2ycNiwnhc/kQ5Okgxe47LCGDT6CArik=;
 b=KZZSTg/XIv/PTl2gK287A2JfzomVQkWeWUujtJPJAVtWER8irqVe7T/nOn7Bh2F/IY
 nIxLSSTocQIfu+ZgQPvyrx0qN92jcbSb0Ph+9PzABjPzfCzTzS4V2HNRKuXCTcbM2Be5
 IWzmyJn0ldnmDIhJjtSP5IfuQyn2z+Eri38wyfW6utBeM1LGEekSiZFsB5AvLDnglvHP
 tV5fA31/WdVn7qopEAoEaszSqOTfV+9y1QV4yyEvKWcj3MgXBNEqe96wm3dpcVOp4YMj
 1Xh7/9Uv37yiLowPRkC8wgFd1E8eTnVOjCM5ufWaYfRVniJElJ6gMitJwpdswJT5oXtK
 USXA==
X-Gm-Message-State: AAQBX9dwwwGIh/wfO1FvJ+BShJF8kD9ziKJ9dB0QcvEyIphrVdP9mMVT
 37IqbiuP9TYxT5qIOQr/cQ8i6V7ciBMtFxuyygecxUPPcrT3G9ojW7LoXT7DSAVdRUhtdCJrl9G
 TbxEkaKzyFrnvaZo=
X-Received: by 2002:a05:600c:2105:b0:3f1:7581:bba3 with SMTP id
 u5-20020a05600c210500b003f17581bba3mr1548419wml.10.1681741184518; 
 Mon, 17 Apr 2023 07:19:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMFP6sj2IXCSf9/vWJhpZKZPvGTSEACo6/Oy+TogjPrzhepWC/VYgiv8BrzY0Gx8WyZyX7lA==
X-Received: by 2002:a05:600c:2105:b0:3f1:7581:bba3 with SMTP id
 u5-20020a05600c210500b003f17581bba3mr1548401wml.10.1681741184239; 
 Mon, 17 Apr 2023 07:19:44 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-194.web.vodafone.de.
 [109.43.177.194]) by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c205600b003f16f362ae7sm6184055wmg.21.2023.04.17.07.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 07:19:43 -0700 (PDT)
Message-ID: <65b4a324-0ce4-3df5-bbb9-15630133cc9d@redhat.com>
Date: Mon, 17 Apr 2023 16:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230414210645.820204-1-vaibhav@linux.ibm.com>
 <2be2ca90-15bd-9ac8-5dba-68740386e1b5@redhat.com>
 <87a5z6egyk.fsf@vajain21.in.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] travis.yml: Add missing clang-10 package to the
 'Clang (disable-tcg)' job
In-Reply-To: <87a5z6egyk.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 17/04/2023 16.11, Vaibhav Jain wrote:
> Hi Thomas,
> Thanks for reviewing this patch. My responses inline below:
...
> Travis documentation at [1] mentions clang 7.0.0 to be the default
> compiler for Ubuntu 20.04 (Focal and Jammy). That is what I see in my travis
> environment also with Focal.
> 
> [1] -
> https://docs.travis-ci.com/user/reference/focal/#environment-common-to-all-ubuntu-2004-images
> 
>>
>> So how did you end up with Clang v7.0 in your run?
> Running this job on an internal Travis CI Enterprise instance.
> 
> I see the build info reported by app.travis-ci.com for focal is
> different from what I am seeing for "focal" distro indicating different
> builder images being used.

OK, thanks for the explanation, that makes sense now. I'll queue your patch 
for my next pull request.

>> PS: We should maybe rather update the Travis jobs to Jammy nowadays instead.
> Yes, that can be another way to address this. However depends on
> availablity of Jammy image on the Travis Enterprise instance. Right now
> we dont have support for it in our Travis Enterprise instance.

I gave it a try now in the public Travis instance, too, but it apparently 
also does not work there yet. So never mind, updating to Jammy is not an 
option yet.

  Thomas


