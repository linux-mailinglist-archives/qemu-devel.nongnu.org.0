Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C04C651A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 09:56:43 +0100 (CET)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nObph-0006bT-Rv
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 03:56:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nObmt-0005Fo-ED
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:53:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nObmr-0004fm-71
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 03:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646038424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrPBLLmqE3ZJlzuEc9XKtGK9mWmEFgj/mKxDGkU5gbQ=;
 b=GDD2HRLmGwhLdX46x7Zc4chF1lY6k4rdsC5v5hSxnF4xYXC58zkosruZhplpMp4MgCUzBW
 T+uk+xT3/8gi4LTQoBZVEh0FAN9UKvpCq8ITqLbPOFsSDepbhnfkxuh5ALynX3K7sORR4M
 1Oc27Rll2krKzwJojzPoJLAe9emCxZE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-8CROl-8PNzWB-Ocss1Z66g-1; Mon, 28 Feb 2022 03:53:42 -0500
X-MC-Unique: 8CROl-8PNzWB-Ocss1Z66g-1
Received: by mail-wr1-f72.google.com with SMTP id
 b7-20020a05600003c700b001efac398af7so455639wrg.22
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 00:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yrPBLLmqE3ZJlzuEc9XKtGK9mWmEFgj/mKxDGkU5gbQ=;
 b=BlpChfRdpNPHc/6BKtjKHckE/xcSxUJSfO6Ek6vanzmaRoNeQZEtgNXszAPdjiv7VO
 GRR8uf2eTiX7z3NvTE918zFJHvVsOCQJdnjhXx/ZmZ49YK5XKR6JBlBIarzn7ee3+n6B
 rpIldESObq1qqtQj4zmd0c7M2lJuCWrS2fJ+sOaLOvcb6Qxc+FzSnc+Z2hS9OA0hBhf6
 iETVnIKmpYJdMRtt6yMfYUjaO15ZYSulxrV7CBMJ7QfRgHCt3zSh70Tdls8I7dPbO4B8
 deuBLkPVmBCOIPlaVXnM8TXMqp2zrNVpQdA4FFjgjooxwwAsfm450L2FMNBcRDLUr6SK
 beLw==
X-Gm-Message-State: AOAM532KTZZWk1o2VoaH1J4tU6N7udnu5c58nDamcKXlgcdNwAP3OVMM
 ScCCM2Rkr90PhgNSJt3R/tUwM/wyytvHBC9tHMjJEdjocXvX//wjtQTBpSXdQJ47yCJJPwHKDgD
 f0CaV+sBDVfWy4Vs=
X-Received: by 2002:a05:600c:2285:b0:381:431f:cdbd with SMTP id
 5-20020a05600c228500b00381431fcdbdmr8388299wmf.7.1646038421152; 
 Mon, 28 Feb 2022 00:53:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF8MlXj5HFg5iqmj3GARrnA/DvfuOZTrUO5fo2M3ofnSZQpGxJqiT2VncuImMsn+t+KL8dVg==
X-Received: by 2002:a05:600c:2285:b0:381:431f:cdbd with SMTP id
 5-20020a05600c228500b00381431fcdbdmr8388283wmf.7.1646038420890; 
 Mon, 28 Feb 2022 00:53:40 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:9700:f1d:e242:33b4:67f?
 (p200300cbc70297000f1de24233b4067f.dip0.t-ipconnect.de.
 [2003:cb:c702:9700:f1d:e242:33b4:67f])
 by smtp.gmail.com with ESMTPSA id
 m62-20020a1c2641000000b00380d0cff5f3sm14421918wmm.8.2022.02.28.00.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 00:53:40 -0800 (PST)
Message-ID: <7ae8a0aa-5633-221a-a47f-9b720d457ff8@redhat.com>
Date: Mon, 28 Feb 2022 09:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tests/tcg/s390x: Build tests with debian11
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220216115102.206129-1-david@redhat.com>
 <87wnhuc14w.fsf@linaro.org> <cf847c44-f60b-041c-9350-c51d1e73027f@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <cf847c44-f60b-041c-9350-c51d1e73027f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, David Miller <dmiller423@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.22 09:45, Thomas Huth wrote:
> On 16/02/2022 15.54, Alex Bennée wrote:
>>
>> David Hildenbrand <david@redhat.com> writes:
>>
>>> We need a newer compiler to build upcoming tests that test for z15
>>> features with -march=z15. So let's do it similar to arm64 and powerpc,
>>> using an environment based on debian11 to build tests only.
>>>
>>> Cc: Thomas Huth <thuth@redhat.com>
>>> Cc: Cornelia Huck <cohuck@redhat.com>
>>> Cc: Richard Henderson <richard.henderson@linaro.org>
>>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>>> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
>>> Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
>>> Cc: Beraldo Leal <bleal@redhat.com>
>>> Cc: David Miller <dmiller423@gmail.com>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>
>> Acked-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> for now... I'll update the s390x image on my next posting.
> 
> Ok, I saw that Alex now posted a patch "tests/docker: update 
> debian-s390x-cross with lcitool", so I'll skip this one here for my next 
> s390x pull request.

Yes, makes sense!


-- 
Thanks,

David / dhildenb


