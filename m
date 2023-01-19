Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87667441F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIcE2-0006s9-39; Thu, 19 Jan 2023 16:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcDx-0006rk-Kv
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:13:29 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIcDv-0005vo-CG
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:13:29 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 a9-20020a17090a740900b0022a0e51fb17so446534pjg.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gYOAKdUc34+oyv1St+sQblHP3QxPEQcRA+T28x4WVLw=;
 b=Rs3H/l8sxF2SDaMYlWA+jMVa8RF7hK/R2KafGz09v0w9ciHCZiy9jGacuOZpGDbjJn
 BOTITn9zU70BiYVbUoPnVMwwOR47VBDzFXlstisBu+HqrcaoXru+uYXqxDs9agF7hz94
 YygcxPmU+g91IlRha7Agga4IxeEEYCSXpKtM+LeNnFwvfDAviHQIvzfeNxNJK06npmDB
 Pek4URB00THM8tMhVUbD9DUiBDjRO4ES7PGiKLGmRXgareL2sNaEs3Fkx4jvANeFdXNK
 p//bjoPEfbdtB+Wafs5jlZou4eFTqur62L8ukBgS/l+84FMCPCtqt6KeF3GGCa8svYVb
 9cyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gYOAKdUc34+oyv1St+sQblHP3QxPEQcRA+T28x4WVLw=;
 b=Dz84GkfaGNARfR53/zRcOt3Bod7XR1oR1uPmzVsNLwCdvCMjg4Xk+1HJqovQMj9Ltj
 O23v3Md8aokXfAsEROE8DYOczIxrJp7KN+w7STHUtqSoSXTDfakmkUuGU9qpcIKMh/Qb
 4139TNSZ4X3lVoUAilvQxyvrIW+hWzCZ0MlYiKgVPkj1/WE0WrX3yUC5eEaHxC6XWXN+
 cyLQCVM1mBh1/X/ZPxHTDHCyG6J73l+tFXguwTIDYR/E6sBo+qVkHOZdpIIegZ34LABW
 MGqynzX7Ez8BZvH1N7dzWrBIV9vzj/oMFDxaWnSf+tFy0VT8LnMOoePjZD/N0X06vPj2
 UlGw==
X-Gm-Message-State: AFqh2kphoN9BrnsiXTsdep/zKw8JVNMjIPSa0V8Fu5te7ZzrxB7IkmEA
 nujUSztjNJlNpCLZtv6gjPIbcA==
X-Google-Smtp-Source: AMrXdXs1iXtBG5KJGOqFjyxqiH5tQHMwEXizejfRsC9AamdPYuUIkOou2DVGKYlr0YdKfqkqgIDHFA==
X-Received: by 2002:a17:902:e892:b0:194:d2c7:ea46 with SMTP id
 w18-20020a170902e89200b00194d2c7ea46mr3825286plg.68.1674162805257; 
 Thu, 19 Jan 2023 13:13:25 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c19-20020a170902c1d300b00186b138706fsm25701360plc.13.2023.01.19.13.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:13:24 -0800 (PST)
Message-ID: <597b7d7c-7a45-2f66-7bcf-bfc2dcdbb3fb@linaro.org>
Date: Thu, 19 Jan 2023 11:13:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 08/11] tests/qtest/migration-test: Build command line
 using GString API (2/4)
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-9-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Part 2/4: Convert shmem option.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 16 +++++-----------
>   1 file changed, 5 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

