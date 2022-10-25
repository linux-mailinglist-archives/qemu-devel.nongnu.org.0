Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F560D730
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 00:35:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onSU4-000260-6P; Tue, 25 Oct 2022 18:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onSTw-0001rU-9J
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:33:14 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onSTt-0000sV-M1
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 18:33:10 -0400
Received: by mail-pl1-x632.google.com with SMTP id 4so6357434pli.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SmeFH8zEYHt4XXTH8xr6MKh9nrrpSZRDWKIKc9NNB2M=;
 b=buRyRqT9DFYQun2YGvdQgMpr4662O5cwJQnnV2XK0nsQL5F7rJfyrxkN05ZEQb8ebd
 isH8+mmlKhrw3er9jZe1VppDA5bJ33qG+5RV1QwZWzl5uu5TePasrPE9ynezEaLOsoqr
 8pag06Ci4DX8UyE0KvuXOSjmXwKimXsWhtAHglvMGcZo0dXiW97zFE9Y2LOWs1UOHXRL
 1ZVxrz+fTC0GjLig4xa36EJRpZN27OMSbiOsXOmKo6DIBzJVWBTpKCdPunJWYXnVQDGo
 0mJ2ow/z1CgezrAnlTTfumHEjEkgGz5NDR5gXok+V2mi7d6wq4x49+jPN98o91G4V+uZ
 Yrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SmeFH8zEYHt4XXTH8xr6MKh9nrrpSZRDWKIKc9NNB2M=;
 b=AUoWWwv4DTCAwJL95b71HfT8YhY63mjpVpka5c5R92uyOikMLRI99mffu5zO/mxrsS
 mOM8hTCffZIvbSMWRtwfOGhzIGisV/585Rf7YH9ZURK8qeyzaNraEWVYXHmZRKfqsDSI
 zoaBXHlk0vMz7E+TTQuIA5sN9SVzYwIgvrgducNRUA17e4DGn+KW8FSjs5ZQ9JWzQMh+
 iT7VjbhJhvht0HjBn6bd5lAVnKAuSRu0DidP0kp+EP1hm8RWoweme1rtui6EPa7uB0ws
 0V85TvU5svuBJRZHaT/jRmjVzlbwpteUkG9YFxl8OY7Io1SrB59VexnlIPV3ZaFwVgzG
 t7Qg==
X-Gm-Message-State: ACrzQf16ANFIdE3vS+wxJDdNTZ9cusBNwJ/HZE7FGMO/7+9pltdmz9QV
 zea2CQJTcRelKC/Z0FkRrUKZ/A==
X-Google-Smtp-Source: AMsMyM5bGUG3VUTGZyvSrYIb/UI/UGzeI6N5MSt8AfVxS6XbKOfbSMQTN1SpdTYnOUgA6cKPiTLvGQ==
X-Received: by 2002:a17:902:edc3:b0:172:8ae3:9778 with SMTP id
 q3-20020a170902edc300b001728ae39778mr40640159plk.72.1666737187669; 
 Tue, 25 Oct 2022 15:33:07 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a63f249000000b0044ed37dbca8sm1740449pgk.2.2022.10.25.15.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 15:33:07 -0700 (PDT)
Message-ID: <464365a2-72bd-ccb4-4c69-5defec55d625@linaro.org>
Date: Wed, 26 Oct 2022 08:33:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/4] atomic: Friendlier assertions, avoidance of __sync
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221024232435.3334600-1-richard.henderson@linaro.org>
 <2485e808-6115-1d18-0a4a-131c08cb4bed@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <2485e808-6115-1d18-0a4a-131c08cb4bed@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 22:43, Paolo Bonzini wrote:
> On 10/25/22 01:24, Richard Henderson wrote:
>> The current use of _Static_assert, via QEMU_BUILD_BUG_ON, requires
>> the user have #if conditionals to avoid the statement from appearing
>> in the preprocessed file at all.  Introduce a new primitive that
>> allows normal C conditionals and dead-code elimination.
>>
>> Remove all use of __sync* builtins in favor of __atomic*.
>> We have required them since 47345e71247, last year, and
>> should have removed these at that point.  My bad.
>>
>>
>> r~
>>
>>
>> Richard Henderson (4):
>>    include/qemu/osdep: Add qemu_build_assert
>>    include/qemu/atomic: Use qemu_build_assert
>>    include/qemu/thread: Use qatomic_* functions
>>    include/qemu/atomic128: Avoid __sync_val_compare_and_swap_16
>>
>>   include/qemu/atomic.h    | 16 ++++++++--------
>>   include/qemu/atomic128.h |  8 +-------
>>   include/qemu/osdep.h     |  8 ++++++++
>>   include/qemu/thread.h    |  8 ++++----
>>   meson.build              |  3 ++-
>>   5 files changed, 23 insertions(+), 20 deletions(-)
>>
> 
> For patches 1-3,
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Queuing patches 1-3 to tcg-next.


r~

