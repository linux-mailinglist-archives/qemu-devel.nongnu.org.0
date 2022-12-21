Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254AD652AAA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 01:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nP6-0006Jn-Qc; Tue, 20 Dec 2022 19:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nP3-0006JP-7Q
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:56:13 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7nP1-0002YW-Kp
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 19:56:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 130so9642310pfu.8
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 16:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lwO6XLNX1ENQH639u7NGSaaj+1MHousPLi7D6X4ptG4=;
 b=aIyk5qub1jc6Fp4p0n+t3A0tS1FpRP9f9o+usRN+uM/wO5vEfq1cziKrNBMeJZrks4
 qKcLWcDdJVPbEEvCJzX/GaH0xuHIylTsJorh6uy4TJwG0RlAw82RWG4skqk5UqnpCl2l
 GuysdqdlvRzjX8tKH4vnWtZP54SivL3beezDMXXQfrYKAKIANM2mQQ9yj1FnFhHfIajP
 M9tKsMKC/xaE1qnexZJyxYWuQ4Y6heEyxybyxedu7mFfs60k3CHbqKUGeCYuLlE/kPD9
 NpKFuJSAdif5ne2bo2vm8tD7KYl5ocf6zbbfV7jhPk/ToGBbE2oI3LPdaPNkJXbd12vP
 ufAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lwO6XLNX1ENQH639u7NGSaaj+1MHousPLi7D6X4ptG4=;
 b=j89GSWxdQqzjDMFZcuMnMYBGwLApSmX3SdySr9eG6YPPmFJG57Pwj+3DSMzq0+6Uau
 Itq2cl5GK5nSyMJgYlOEtFsaJFWYFjhYuOK/+QP5L6CXP5DVbwBdNLRW7Y7zDfXQ4Stt
 S2k8LdOH5hVl+j4q7fHwIvjS5LHnhcMchTaHsTYStZYZoUmPpFnMYaeUfuRh66PHdpAT
 q00JPY47nJ4WIBR+ueKT2RyVeVyWZbwikTfqXULijAz570Yteoxpow0lysutCXdAf0at
 GyRC2acp18nYyzLYE9FNcRwNRyUn834HpbUnNvqEg8Q1B54RVwbfClXe3o21VnEG5oAs
 BG3A==
X-Gm-Message-State: AFqh2kqRFZSC1yln2o2jrEmTopXvL6SAuom5Qgt3giI8xEedDpcjbfKz
 YlNCdZaWt5vG0VGJ/J1aooOj+Q==
X-Google-Smtp-Source: AMrXdXsYgEZIA2Q/R8vR/bbYoO1KjQr6lKxrUcpkfC2nm5sjQRIep5aJAERX+uMEK6yT7fXls8oz/A==
X-Received: by 2002:a05:6a00:1d23:b0:57f:faa9:2de with SMTP id
 a35-20020a056a001d2300b0057ffaa902demr273243pfx.27.1671584170028; 
 Tue, 20 Dec 2022 16:56:10 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 h18-20020aa79f52000000b00576df4543d4sm9183698pfr.166.2022.12.20.16.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 16:56:09 -0800 (PST)
Message-ID: <3374dc9c-e9a0-c185-0699-c5bdb897d566@linaro.org>
Date: Tue, 20 Dec 2022 16:56:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 4/7] hw/mips/gt64xxx_pci: Add a 'cpu-little-endian'
 qdev property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221220113436.14299-1-philmd@linaro.org>
 <20221220113436.14299-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221220113436.14299-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 12/20/22 03:34, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> This device does not have to be TARGET-dependent.
> Add a 'cpu_big_endian' property which sets the byte-swapping
> options if required.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20221209151533.69516-5-philmd@linaro.org>
> ---
>   hw/mips/gt64xxx_pci.c | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

