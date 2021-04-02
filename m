Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E86AE352DBC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:29:15 +0200 (CEST)
Received: from localhost ([::1]:36130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMfb-0001Xu-12
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMcr-000850-FL
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:26:25 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMco-0007xR-KB
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:26:25 -0400
Received: by mail-pl1-x632.google.com with SMTP id f17so2754729plr.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OBzTV85pM+VX0n/BT0uqEZd7CKzQtpZFOdp/PFr2Rpc=;
 b=hVwEZKv/0FIC7uCHpAAHKCGGK4o41Fp1fRMq2+mXn8zENRb7uZ+pTZ5fXtp3rKMU1O
 g3I/UpxiYjdEALEm/L9M/Ld/e8OJejhi57z4GmB0ZtG1DY2Fc12QYie+ZuwnbblAeFuf
 twBMYH2IhQkr163Ez11Z2ElbZ6aDMJvNTj7T+jearOvhv1avBrbhaBxLJTGI+UxwN1/G
 RwVj+dcARfSeku/LNBJjcIWBMJCCslR+1N5YjGHKLkzNruKOhKkUvKjhU9nKlIXN2rdF
 3YbjerkYZw/RY7sXtGAt2zDeW6rpQCJ/A7JLemxY8NQgY8ALJ8hm2v10WY06/LdRjgT9
 F4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OBzTV85pM+VX0n/BT0uqEZd7CKzQtpZFOdp/PFr2Rpc=;
 b=ENUyuAJIb+IaUyCBYE/mlIdX0yz9Dhtg+z3qu2YLDp9FaBAFORnAOFs0ehZqfnMYrY
 aCfcswTHf2gMRO911qU09fo9QUHRW7OgNC9jBKlDaql3Hcz4nDMPiSnx7r0JiE5hqM5A
 aO/PqnQc1niBqn7qtjUIxS1Fy+qo2LplN+43F06+4qverUWxwsUnTUIjWx6H603s4l37
 pUfdYBmEgDb3YUHWT8561nbaFm4PpsHE6DtgGrfJ798Che1a75hXKxQTfgih4R6nbz9Y
 n67cIMzxryn68Zim+As8Fhzc6m1dsFi8TJpUwgopPX1vb0Uu9ZlUaPhauMwdMab2+1j6
 IyAw==
X-Gm-Message-State: AOAM530dinGGsgykTPdEYbBGx4q6Hup/MVW4J1816vBI3RLX7BtkPT55
 imUQkhdHCER8GH0av2vDDhgj8w==
X-Google-Smtp-Source: ABdhPJwy1PudbzKEmSpytsWEXB1XksBo8K9P+a4yWBGKR0QVRW8icD6r9A2z8BgVXJLAddTlecDoWA==
X-Received: by 2002:a17:90a:6343:: with SMTP id
 v3mr14359793pjs.153.1617380780275; 
 Fri, 02 Apr 2021 09:26:20 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id p25sm8861376pfe.100.2021.04.02.09.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:26:19 -0700 (PDT)
Subject: Re: [PATCH v2 04/11] tests/tcg/configure.sh: make sure we pick up
 x86_64 cross compilers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b119958-38ec-3b61-8957-bd8a1113994c@linaro.org>
Date: Fri, 2 Apr 2021 09:26:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 3:25 AM, Alex Bennée wrote:
> While it's hard to find cross compilers packaged for arches other than
> x86_64 the same cannot be said for the x86_64 compiler which is
> available on Debians i386, arm64 and ppc64el release architectures.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/tcg/configure.sh | 5 +++++
>   1 file changed, 5 insertions(+)

Dunno why only these 3 hosts, but what you have matches the data in 
packages.debian.org.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

