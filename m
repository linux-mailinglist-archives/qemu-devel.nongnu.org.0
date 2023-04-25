Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62B6EE3DA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 16:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prJZw-0003ZR-12; Tue, 25 Apr 2023 10:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJZU-0003VA-90
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:23:10 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prJZR-0004TS-73
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 10:23:07 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so47420675e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 07:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682432578; x=1685024578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0xPpJstq4gxueLzwpnuqz+z/PsoC6LFXV3Er/3MKPf8=;
 b=CR4XLKrSvlXTEFFnTJE3HePn+QdOgTOB0JzaykcEwHB/jMn+iVIwes0yeDy/PxRlru
 lQzTHdytEcjNDRMwnseXio7ZZrI0JGZN/ayvisiJ0/4BgZd+w7MYVQCPR8+hPeZSytkb
 hspeYHsRvbPXsDl+rzdPeUV+xdn+JDPnfUfn/YD02kMlU839rvWSs9PCvQxWzLI7uEYe
 WK7hRt8Mq2gAHBk1WTFJVjNF4O1uPTe0CzqlbEHU0qlN6KmFoSpF9YYpa88fUz6+kQCq
 ZTIrKxdG+K9XtaWXn7SWGaqXOufq1+XC0HDRk82W437B7wv7tDH9IQnDIUz6tJK/s7RV
 OeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682432578; x=1685024578;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0xPpJstq4gxueLzwpnuqz+z/PsoC6LFXV3Er/3MKPf8=;
 b=XiKf4dbdPBT9swViNQUrXBU16b4sP5jLPqp51g12jIDVzzaCkLE5V9xS2NSCRlkHA2
 wpUXjJLL2aHt8pei+wWZuZphOA5zUSeQs1zdTCaqKHTpoHbWnYAQ+KwvPfgccz7w+/iZ
 UJbSmmbp16Z29frD1xK0/LBUVk8hwxOE4QfMKgyIYT/aDfC9F4EdfxcMcIpagJyzuQRi
 cF4SvuGIWE1gwULlfUqC0WRKPbbJpTbPetDJmL/FFRtazPUrOvlda+MiTSKKpp6qfy+8
 rloLtsLrz4IaE1e8p+H69Mzh1iJlyPoZ6rW7oo2Wih9E7+b1x1zhNwKTfDegyWjCcS1g
 Bz3Q==
X-Gm-Message-State: AAQBX9fj76i6fJBqffsmQTVI+kstsWnf0nD4Dt0/88+3cxtOIy3NxdBr
 Uyc2h/o9liSsw65/AqHM4vnIOg==
X-Google-Smtp-Source: AKy350biscki8LBGWsgdcZ0nFQsHsTi7hxQ2bDGBqbB5bxZYE9hUCVZrj65tF5cjisOQagTUBqHrHA==
X-Received: by 2002:a1c:7404:0:b0:3f1:8b0f:96ea with SMTP id
 p4-20020a1c7404000000b003f18b0f96eamr10602634wmc.37.1682432578129; 
 Tue, 25 Apr 2023 07:22:58 -0700 (PDT)
Received: from [172.27.248.56] ([212.187.182.164])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003f173a2b2f6sm18593760wmo.12.2023.04.25.07.22.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 07:22:57 -0700 (PDT)
Message-ID: <b446927b-ba56-d8f8-d806-d016b84d19d7@linaro.org>
Date: Tue, 25 Apr 2023 15:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 13/57] tcg/aarch64: Introduce HostAddress
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/4/23 07:40, Richard Henderson wrote:
> Collect the 3 potential parts of the host address into a struct.
> Reorg tcg_out_qemu_{ld,st}_direct to use it.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 86 +++++++++++++++++++++++++-----------
>   1 file changed, 59 insertions(+), 27 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


