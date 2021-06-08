Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7463A042B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:49:32 +0200 (CEST)
Received: from localhost ([::1]:49216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhj9-00048g-B7
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:49:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhhk-0002qh-Hs
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:48:04 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqhhi-0007t1-U0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:48:04 -0400
Received: by mail-pl1-x631.google.com with SMTP id h1so3620758plt.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Iv/WZNTSZF4p5fbPhVh2fXsqJ6Dvwr+xdh5Z7mSw7m8=;
 b=YK5f7nb9lgKSOHlPbl7fpC5KkVqbgq3xjbTX45vN7FnW6pSEWsjFUExSUhiTki5p43
 XdBNqLRvI3SlZmGDQh+YuPnKn+lzDltFMJ8pU5iPEuCWVXb0glFzXbR8Fo8QthYW0M5C
 HtcOEj0gTGLAl+5ITl6Nb01EfJ6ZRBCllS+7+ydZ1vG2s07JyfuAoicRL3n49AKXFM2r
 y3yGKeoSV17HqSaBI00WZQ5SQY6fTMY4lFTnezU3eZvgvvafjQRqd/CjQU9XuZ18HLQs
 7D1hC1cVp9rkOpwI8t1sVQysLhKN9ygdFr0JD3Az+qesHT0INawYS3O6Q1FIMpsRoAiU
 j2jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iv/WZNTSZF4p5fbPhVh2fXsqJ6Dvwr+xdh5Z7mSw7m8=;
 b=AWhml6dZBbx3EvEBRbQIr/bMgdRegSVlGgFhi0WS+9YOECH5Ja6vISUmY35QAZuURT
 CI4EXNysCn+1WK36AsCdYGUNJ1FLV4TE90MmpXrO0yvlRW0z7i7qfOHir9LE/FWpe0F4
 xUi3SAgl6t7KhgXDitMdacrqdMzAX+/+9NxAVMUW9lHXGJNZhZAOTF/GZEr5/UCjEfh2
 W5Dt0tZHLFxz5oQgTNvts1+8lsUkcsO3IUq4w05CxkgJ8j327Eumoez82Krk050d9dDY
 w9hbROcfS1fkZ7ZOt7Nw6wrzafahKzDdnvMiXat8jI2Y9Qn3NOF6DoOHbv5GNFGXQqcj
 eDvw==
X-Gm-Message-State: AOAM53136tLJOIdopuEwhXE/htj9xVpYpFkCn7OX/dHZf1CCZtySFCdg
 psCvEaNV3LbJ83PepEF4nDgrG+xoO3Rxqw==
X-Google-Smtp-Source: ABdhPJz5yC6ssdKxTctreUBGSNP0K/WDcApuZHTvpL9T5vR4tID+1ZziN+RqfBzZOrpszRencExoYw==
X-Received: by 2002:a17:90b:3ecb:: with SMTP id
 rm11mr27505668pjb.95.1623181681418; 
 Tue, 08 Jun 2021 12:48:01 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q4sm12800307pgg.0.2021.06.08.12.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:48:01 -0700 (PDT)
Subject: Re: [PATCH 05/26] configure, meson: convert pam detection to meson
From: Richard Henderson <richard.henderson@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210608112301.402434-1-pbonzini@redhat.com>
 <20210608112301.402434-6-pbonzini@redhat.com>
 <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
Message-ID: <0ac2088d-b840-68b7-d0af-f87c3e8bc9d0@linaro.org>
Date: Tue, 8 Jun 2021 12:47:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <08135c0f-ce6b-53ad-be57-eba428fbfbf5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 6/8/21 12:45 PM, Richard Henderson wrote:
> On 6/8/21 4:22 AM, Paolo Bonzini wrote:
>> +pam = not_found
>> +if not get_option('auth_pam').auto() or have_system
>> +  pam = cc.find_library('pam', has_headers: ['security/pam_appl.h'],
> 
> The condition doesn't look right.
> Why are we looking for pam if --disable-pam-auth?
> 
> Surely
> 
>    if not get_option('auth_pam').disabled() and have_system
> 
> ?

Actually, same question vs crypto in patch 3.

r~


