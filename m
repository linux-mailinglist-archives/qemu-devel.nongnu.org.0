Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C55A606B1B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:16:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldq0-0006ih-My
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:16:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldlF-0000ST-Mj
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldl8-0000K1-0A
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:11:27 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oldl6-0003LI-IM
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:11:25 -0400
Received: by mail-pf1-x429.google.com with SMTP id d10so814477pfh.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P71Aixtzuc7xTG3C9iv7rqkrJj3azJm24+WVMu1Jknw=;
 b=Wa2AWZ/YGMvQEQM5C5q+9G0bmpXZ/tslJe0ROQf5eI6hinVaakQsRFu+dUZgttg6Va
 93K7dzlLgYdxS0X+mnZJ2ibpb79Zz927BM/7QG+CR4pgw+3RNUreoIJK9vZQkqT1ILIG
 8vTpkuKLvQx8uv2uTTZdBpQRomVB2Rmn4ZVSqG0amoe7ZmDmVsDY5O0jB7PSiQqRLlRs
 VnWerUXM9pEB1UXQZS0mvAoMsqmkA9pxuQgHj8cnI232sTT7vH9TEz7PxoHOV8qDLvgE
 sM+2S9YPG0fUv09QLTiLZ2cKk6YC6J5ar6zf/2SsoqumVoXHAF1nVt1K78tr2YHnq2sd
 mISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P71Aixtzuc7xTG3C9iv7rqkrJj3azJm24+WVMu1Jknw=;
 b=Zsw19tjq//hqyS1cPdqgGq9LdRQ0KD5d+PKKoDUBet0gT0xSTIlYaMIK1+G49jOL7D
 J8qagvtFUCBNkSpEMKj8S9ljzBQ5LmdQspoqe98W/ZlQppEVpcF8mZVgYV6DlGmh4tbG
 bXHj8GiSmjmtNiAZcLOHsD6BYkFDOfywTicByTVzfx7Qd2BCuYrXOymhtxWhctNnJEY0
 Yd2ZbF45MROzpn+Q2Km4ry+w+xRcI60v1Q+p09glPxesScndBphY2SHC3PbVJkI2kfhI
 7fk+wulz6KdHPuhLlw3PXtoeA9FF4iyAjPgaGyFenlpr5o3AEVQMfNWrVSfzeTBYs3ol
 5X+w==
X-Gm-Message-State: ACrzQf1WogFlb1dnbGdfNmr+rL/30vAhDQoUARuWIfcFABL35AQdFRJE
 xcB2v7h7FyJOVZLlDczOIijA9g==
X-Google-Smtp-Source: AMsMyM5DppwSEknWymL25M2qLEBBvD6G8SuPqGLabH8B+88LDeANdF2YiABzMqWmfiirhnDYzYlZNQ==
X-Received: by 2002:a05:6a00:10c8:b0:563:1bd1:2ce4 with SMTP id
 d8-20020a056a0010c800b005631bd12ce4mr15965590pfu.6.1666303883018; 
 Thu, 20 Oct 2022 15:11:23 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a170902780e00b0017d7e5a9fa7sm9019963pll.92.2022.10.20.15.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:11:22 -0700 (PDT)
Message-ID: <1908886a-0715-b183-a95d-c226ab83a646@linaro.org>
Date: Fri, 21 Oct 2022 08:11:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 06/26] tests/avocado: extend the timeout for x86_64 tcg
 tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020115209.1761864-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 21:51, Alex Bennée wrote:
> These are timeing out on gitlab.

timing.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
> index b7522ad3a1..571d33882a 100644
> --- a/tests/avocado/boot_linux.py
> +++ b/tests/avocado/boot_linux.py
> @@ -19,6 +19,7 @@ class BootLinuxX8664(LinuxTest):
>       """
>       :avocado: tags=arch:x86_64
>       """
> +    timeout = 480
>   
>       def test_pc_i440fx_tcg(self):
>           """


