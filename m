Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4153FC20C
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 07:09:09 +0200 (CEST)
Received: from localhost ([::1]:55250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKw14-0007y6-0N
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 01:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKvzb-0007Hf-Gu
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:07:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mKvzX-0005Wj-S7
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 01:07:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630386442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8032ZwJmdYMQdIVdLPLA1HSx5FXYpRI3cCjOht3gY+w=;
 b=KJEaprune7Eke8V6k6XmYRsomHpuQz15WEKTmlaTQigfKGnC3zX996YACNGhf3pT0hgMYl
 viaE07w1XAfofkU1VsCt4DauzW2PV4tglKW61kCFeLDZAJzKpXFq4iTKYb8+QU+3b0cL17
 btA3S+5e63WN6DaHLoTQKdFSMXyDVcw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-u3NuuJqTOGySuNJnZZSxXg-1; Tue, 31 Aug 2021 01:07:19 -0400
X-MC-Unique: u3NuuJqTOGySuNJnZZSxXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso727876wma.9
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 22:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8032ZwJmdYMQdIVdLPLA1HSx5FXYpRI3cCjOht3gY+w=;
 b=D+lqXJvfuYaDyuy9WH4HYPUVetAmajVWnjp+St+KJKnmYK4WXgE+9fZbxfZ6Smzi0g
 SfjPEcWcbxiwxeW/s8cBNi1FnsJ/RRuSk5LkT3LBFhS/2oI4xHDVSjHvJfASC7R7BtDk
 OZ95D9HjaGxv8z8WepLgD1b6993U7ECy4jMGjf+YRUrscCAzpGuxLtj6DfSoWGZVT6XL
 pldL2SSKzsuWJMPUsrCMJTnUoYVYQG4AeJISQNJx2fIawYCWzH7bxRvLUg3JUjQyDZXP
 RSp/VmuHW3GISQTqNpKHzIDvbIIT2gUZulqg7PcgWyuj4VniBxqJDJN+jO3xd+jEkCur
 +o9Q==
X-Gm-Message-State: AOAM533crkI94P6ApeZnZMddI+v9mJm/WtIKUtDxGI2MBQM7XsYQYGsi
 E6ydTcdjOXqO3eFIZUhJWvZygs0s+Ax0pze9oaG5RE9g7xgVCpeLAuig/9sxmxTz/1ll+xXEg6y
 ndzVV6BM5ZMK4H2I=
X-Received: by 2002:a1c:9a91:: with SMTP id c139mr2156695wme.106.1630386438135; 
 Mon, 30 Aug 2021 22:07:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlDsKrmf8eeS8UuhlJnd97e1hfypQe34JrXO4sb4c2YOUT9tuYrlMCzMiA1+4ENOkZ1t1Msg==
X-Received: by 2002:a1c:9a91:: with SMTP id c139mr2156675wme.106.1630386437901; 
 Mon, 30 Aug 2021 22:07:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9e830c4.dip0.t-ipconnect.de.
 [217.232.48.196])
 by smtp.gmail.com with ESMTPSA id c15sm1349564wmr.8.2021.08.30.22.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 22:07:17 -0700 (PDT)
Subject: Re: [PULL 5/6] docs: split the CI docs into two files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20210825110018.100913-1-thuth@redhat.com>
 <20210825110018.100913-6-thuth@redhat.com>
 <224f739e-96c6-0e14-e53d-d64a8ade64ca@redhat.com>
 <f09c711a-3d74-ca4f-05e4-0d6ebf380e5e@redhat.com>
 <4da56a6a-a3b6-f17b-a9a7-c81fe5b903d2@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1ee6270c-95f3-0f20-8c84-95207c0be378@redhat.com>
Date: Tue, 31 Aug 2021 07:07:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4da56a6a-a3b6-f17b-a9a7-c81fe5b903d2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/08/2021 23.15, Philippe Mathieu-Daudé wrote:
> On 8/30/21 6:02 PM, Thomas Huth wrote:
>> On 30/08/2021 15.33, Philippe Mathieu-Daudé wrote:
>>> Hi Thomas,
>>>
>>> On 8/25/21 1:00 PM, Thomas Huth wrote:
>>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>>
>>>> This splits the CI docs into one file talking about job setup and usage
>>>> and another file describing provisioning of custom runners.
>>>>
>>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>>> Message-Id: <20210812180403.4129067-2-berrange@redhat.com>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    docs/devel/ci-jobs.rst    |  40 ++++++++++
>>>>    docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>>>>    docs/devel/ci.rst         | 159 +-------------------------------------
>>>>    3 files changed, 159 insertions(+), 157 deletions(-)
>>>>    create mode 100644 docs/devel/ci-jobs.rst
>>>>    create mode 100644 docs/devel/ci-runners.rst
>>>
>>> You took this one but not the following "docs: add definitions of
>>> terms for CI/testing", is there something missing there?
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg830839.html
>>
>> I took the patch from Daniel's series here:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02102.html
>>
>> The second patch there did not apply anymore.
> 
> Willian can you respin it please?

No, you got it wrong. Daniel's second patch did not apply anymore. I didn't 
look at Willian's series at that point in time.

  Thomas


