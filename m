Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FCC34805E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:22:55 +0100 (CET)
Received: from localhost ([::1]:34744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP89e-0000us-On
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP868-0007n4-Ox
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:19:16 -0400
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP866-0003L9-K2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:19:16 -0400
Received: by mail-oo1-xc2d.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so6050488ook.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hIUsmeAM5xqHZTM4cvWaE1hnDg0SmrT+GZrhS/aJd00=;
 b=BTlKJlHu98yHCdHMvATfa75pxP4Rpvg5koBphPYcWqFRJV8zCrVDNHIB2NLVoGQY2+
 KAjNuc1Kz2m6X6W4ftqd6qEXzxOkDXIGJ64iojDsygdppKvDZg8K35ZnbXA2qPFTrpfQ
 hOmvX9v8Onl/fICkrNg6iWz+6PQwG9rddlIoJbsOmgndZoipWK3/C0eZJ32EyN9Ztqdy
 2Mds9wQOvj/yvQdzNHpZmFuJtJ6wEOnB6IZ4R+ZqEgpA0KypPBuaWD8cnKpNPD3MxyQn
 p7F805f6Gw4X59hYlO04to7G1BssTT7qpyYwkZ+tAyJ0xc0+1hMZBXu0jnnR4CJhhm/j
 sl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hIUsmeAM5xqHZTM4cvWaE1hnDg0SmrT+GZrhS/aJd00=;
 b=E8qmUsu3vjqjyRNFi6H/vYrx+DiXfnAbRg7fjmTiivYzT/P4uuYOCUTFLhHnjwM2q3
 o0tsCzlgjO5On+09QWx3/LyYVA6er2ZgbmLFttqgiOBzwD0opjZFhtc1kTfBUC90klAn
 y1mD8vwUz+SK0apBzSwLhqgFtTCC60jMLqTDcZ87dshsx3dW63nZ6Q5MXEPzl5263Oau
 3MyPf7s96UgZjWE6opvRLVZBhHcsRk/6xFMg0SanQu0A5n5XE32yfxOIfDHYgzlc6/4O
 wyPP8YbxzfJSbDTogVGEVwYt7470FrvrmRMOj0pSsCyImm5owopLl/ArNQGhH8AJ75YJ
 7yow==
X-Gm-Message-State: AOAM530DhPjhcDbpbNdvh9leq2dzR/ubTRvL5MGhubD7R89lXXOJwaOA
 +5WkCP7Jor52TKWOGBhsf1ZIcg==
X-Google-Smtp-Source: ABdhPJwIyUj9psCGgLCmgj8/uQXgiCdmJTMpDcc1LwiCMiLddmm7q5WQKHc3PyOFEQnve3PNEaJlhQ==
X-Received: by 2002:a4a:424c:: with SMTP id i12mr3888933ooj.85.1616609952902; 
 Wed, 24 Mar 2021 11:19:12 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id y10sm538762oih.37.2021.03.24.11.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:19:12 -0700 (PDT)
Subject: Re: [RFC v11 06/55] target/arm: tcg: move sysemu-only parts of
 debug_helper
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323151749.21299-7-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7abc6ad0-0e1d-1c8e-d9c3-4a83313340cd@linaro.org>
Date: Wed, 24 Mar 2021 12:19:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323151749.21299-7-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:17 AM, Claudio Fontana wrote:
> --- a/target/arm/tcg/sysemu/meson.build
> +++ b/target/arm/tcg/sysemu/meson.build
> @@ -1,4 +1,5 @@
>   
>   arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
>     'mte_helper.c',
> +  'debug_helper.c',
>   ))

Sort the files as you add them.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

