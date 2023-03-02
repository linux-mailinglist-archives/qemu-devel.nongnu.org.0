Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72046A831C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 14:03:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiaj-0008DO-AL; Thu, 02 Mar 2023 08:03:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXiag-00089Z-LA
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXiae-00023J-AL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 08:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677762199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uIA/mwg4RT+cMA6uY+XfNBVL0Pu5j3m3Dstbpcto7Qk=;
 b=C7T8UfoJgqiOhfjU3z5sW36M/QmsNCw4rOSX6ah8GSzUZX9mzWlITYpFVQVKdUOw1FuFd6
 MMcSWMvqYO9IX7J5NBs15JtG5gnkPJ+UpqyUxp+67km986TOsNVCq1+Su4e5aYNNDgwAt0
 C/996wjylICQjlTYCNdBt8ByEZUd5jw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-rDDDtHYON6KYdHa6pFCqQw-1; Thu, 02 Mar 2023 08:03:18 -0500
X-MC-Unique: rDDDtHYON6KYdHa6pFCqQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 15-20020a056000156f00b002ca79db6d42so2966787wrz.18
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 05:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIA/mwg4RT+cMA6uY+XfNBVL0Pu5j3m3Dstbpcto7Qk=;
 b=maNa1IaUza0OZhaNtldKgdwowABIPyIkCdyUlLjgprW9V8VTzTLUfq7ujFsAwWp/gm
 jkpmgOpuu6OBjt0J2SzvXLunGqetIsPTCqyt2kEIZBbCe6FLI6pvO1RVFkJS/wqICV6k
 PL7V1UqQO0uIiicl5YCv6bkheR4uVgwe2eD4TnMQyHCyPtRnzUXKQBalz4kNAxTv6anq
 oAthm22fWj7qZjpAo5dLhVifyHQ3k8LhZiIkVfeZPBCg02Sb8cAxdGaC/eQFwNaUtQIc
 udG7OU/wTbvBurktZgweLuLRz3KX6GzOyeyPQ/oGGkxyI05bI1Ba1TGq2vsIULCyxgvv
 f4OQ==
X-Gm-Message-State: AO0yUKUCUw3tY8JPlqJeo/co68L3YxCAoLO9+ZL1vZmlcu/oF312VeC5
 U0Z5uwtWKSH68CD77SW7xyd7elEpEs+Smi96IuPNu5a9kWbqTfoX5znHe/QH7mxqLXpRJ2mv440
 FswxgUsDiK4Bu0Ss=
X-Received: by 2002:a05:600c:3ca5:b0:3e8:490b:e286 with SMTP id
 bg37-20020a05600c3ca500b003e8490be286mr7558430wmb.14.1677762196960; 
 Thu, 02 Mar 2023 05:03:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9ar5KAgFPVHCozR7JHEje8Ee7oyUtVtwGMbbX27PcyhEQbnHYJKfZwCKUFa9oT5VqHiO3/Xw==
X-Received: by 2002:a05:600c:3ca5:b0:3e8:490b:e286 with SMTP id
 bg37-20020a05600c3ca500b003e8490be286mr7558398wmb.14.1677762196522; 
 Thu, 02 Mar 2023 05:03:16 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-83.web.vodafone.de.
 [109.43.179.83]) by smtp.gmail.com with ESMTPSA id
 f13-20020a7bcd0d000000b003db01178b62sm2867238wmj.40.2023.03.02.05.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 05:03:15 -0800 (PST)
Message-ID: <5b5522c0-7a14-a5c6-506c-bc2895c3a8e7@redhat.com>
Date: Thu, 2 Mar 2023 14:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 27/27] target/s390x: Enable TARGET_TB_PCREL
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
 <20230220184052.163465-28-richard.henderson@linaro.org>
 <0a437546-3b18-3a3a-6ffb-afa93a93c170@redhat.com>
 <6840da18-ca5f-db7c-a60a-1f2fb45d806d@redhat.com>
In-Reply-To: <6840da18-ca5f-db7c-a60a-1f2fb45d806d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/02/2023 12.41, Thomas Huth wrote:
> On 21/02/2023 15.35, Thomas Huth wrote:
>> On 20/02/2023 19.40, Richard Henderson wrote:
>>> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   target/s390x/cpu-param.h     |  4 ++
>>>   target/s390x/cpu.c           | 12 +++++
>>>   target/s390x/tcg/translate.c | 86 +++++++++++++++++++++++-------------
>>>   3 files changed, 71 insertions(+), 31 deletions(-)
...
> FYI, I've unqueued this series from my current pull request again since it's 
> causing trouble with the avocado-system-centos and avocado-system-opensuse 
> CI jobs ... I'll try to pin-point the failing patch later, but since the 
> rest of my current queue is quite long already, I really want to get that 
> big queue merged first.

  Hi Richard,

I've bisected the issue with the failing CI jobs now, and it is indeed this 
last patch here ("Enable TARGET_TB_PCREL") that is causing the failure.

Everything is still green with "Pass original r2 register to BCR":

  https://gitlab.com/thuth/qemu/-/pipelines/794022206

But as soon as I queue "Enable TARGET_TB_PCREL", the avocado jobs start failing:

  https://gitlab.com/thuth/qemu/-/pipelines/793154874

Could you please have a look at the last patch to see what's going wrong here?

... and since soft freeze is approaching: Do you want me to queue the 
remaining patches except the last one, or does the series only make sense as 
a whole?

  Thomas



