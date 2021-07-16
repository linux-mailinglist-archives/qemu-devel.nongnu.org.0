Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013373CB914
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 16:52:20 +0200 (CEST)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4PCN-0005vz-35
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4PBJ-00059U-CC
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:51:13 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4PBH-0004ai-U9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 10:51:13 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bt15so6586513pjb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yj0J8kxo3V+SefKQ4JqTNMHKUso2PJ2tSYu05VP9xa4=;
 b=QYiXOod0jR/xbHHl1daky8+zPyOlO84DCy41MCfnsyrxsmfNWo6kyWQgWJsZ3cEZ/q
 gH4Ws2c6BHo/afJBBZ6QW0DLM9EImiC+TLfFwndk/2aALUVxE1Ep7Ce9oOF4YrwWKd0b
 LP59kht1P8FHXnKNP5O+OOSqbNUFaAprXuAADyvHkUEagUf3cNNMnlAdhi2v4VcLuA3b
 JlyihoSXPeJGko5y5L7XHa42Lh9ElKYnLnPovqf+lUu0QOOjBnJzMX4ukfXugIhclK9a
 ZWTB6CIbCVZICSxVmCVAUXzXSuolF+BwjtJc87fwnWGS402C/suxJbZ3re/3pPa5tBL+
 +HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yj0J8kxo3V+SefKQ4JqTNMHKUso2PJ2tSYu05VP9xa4=;
 b=gRkKBYLOhp/qaBl7YNaJ2lvX0XR2Rf8K2S9ssMOw2e+cBUjhBuRoKQjtReZiy2ixaO
 t1au7HBHfHzl+94IUYoqsJHHxtB4F7K2AzZkYoIM8c3qXBsOUVbcknNQTnbuMFH4Xrdd
 j95Jt/9J+HCZfTJoik9gxT4rCyCSJMeln+nagw7JqI/zlxR+X8SPhNjUettKUYeuS6Gx
 v2EDbjyyQUhII4kjS/EPjJlGX2zGcKCVD6V5AMcft6xjGWEwuEwkJF4PJXw6+awFRNbZ
 /QHSspTbWSUHmSymHCGTi+1C84BjBTGGjk6Usw4u2UZLwvSYjUEnrP5lASWwAcOWK1x/
 upcQ==
X-Gm-Message-State: AOAM530MKRiZEiUUXRkZ54qsie51TKuE2VI9XTrq3YnYVVlGf44w2h5k
 xRwg8G9cBKjMgnId9NOsA/v/UQ==
X-Google-Smtp-Source: ABdhPJztbP4obB6a2TzxW3jMctRsEmBkS1zaHMEapbBlaiDeFlQuvFm5NO+GBFcwIg4w1tC8eMy45A==
X-Received: by 2002:a17:90a:df04:: with SMTP id
 gp4mr16088784pjb.164.1626447069744; 
 Fri, 16 Jul 2021 07:51:09 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id c12sm10601828pfl.27.2021.07.16.07.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 07:51:09 -0700 (PDT)
Subject: Re: [PULL 32/40] tcg/plugins: enable by default for most TCG builds
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20210712122653.11354-1-alex.bennee@linaro.org>
 <20210712122653.11354-33-alex.bennee@linaro.org>
 <530cf27c-13cb-906e-6b86-90c23d0c3656@de.ibm.com>
 <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79250303-5d6d-3acc-2ae3-94dacb5041f4@linaro.org>
Date: Fri, 16 Jul 2021 07:51:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a3f05bc9-808d-0572-3e17-df9cf9418b4e@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/21 4:28 AM, Christian Borntraeger wrote:
>   --extra-ldflags="-Wl,--build-id -pie -Wl,-z,relro -Wl,-z,now"

FWIW, -pie should not be buried in --extra-ldflags, but as --enable-pie on the normal 
configure line.


r~

