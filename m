Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89310440C60
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 01:49:36 +0200 (CEST)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgy6R-0008K4-K0
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 19:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy3Q-0006bU-2e
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:46:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy3N-0006yF-Mo
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 19:46:27 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s136so13584551pgs.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=87JqwG2Fiy2GPUx732R+tmA6/cg9AclRHYISrMS9vDM=;
 b=k2tLZU1B37z7YOFo1A9HymNr5GiOJsBZH7JNGlv2bac4eo5tAiFOtnIX2brkVFK2rS
 RtETjP5xdXXbSLhcTaecMsPOWgp0jtLs7ASr4zz/xC5i6F7tq2ufjDId77RkbikjwVjh
 dg5Vnt0ceYxizUvDayeTAca3CDt2yUKc1htqzxNJ/ucOfoLWezntHWFOyxgeUwjatKON
 wWJgJI26fKfDumnS34KG203HvMFx+UzFoEpOY/J3xqRKdChT8WBGuktn70qkvtqjAAid
 /WQViPYQtYZiGLY0JpdQtdpkLfRwORpOUR4rRjd3tJy6hdC97aW1Kv0Ra5iotlSyQ7Y/
 s+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=87JqwG2Fiy2GPUx732R+tmA6/cg9AclRHYISrMS9vDM=;
 b=lINbCyDV0fLmp2gw9FpBQNpXmXPjYvyiGylEqC/SoRBjPATAZ09GOf8/7r9MM1V4yy
 Vt7TpEDSA83A7kk0REi8IUE78zkdv4r07TCwUaaklXRDTg92IaI1J5NMyEu39LfCpI4n
 9BohzYXrciRp7xFXeVdvBR+4QgGIWSudD6PwuiKktWpdJes/3hCCq5OltdlixclGq892
 3lSWpmuOa6+91tGAKTNXR9ILh2UfoYHPpcL6djCo7KXdDFxjMVlNZo/OFs+bvf8xfARQ
 dgMeaU8EMiXBgNaIy1vO/lE5B/ppwUnvKhNnqtfH7rOuvifJhQCLVelZ7jRXsjBBS42G
 /BVg==
X-Gm-Message-State: AOAM533O0aa1fHkFYwTbUWcQTCqbhuoF1ltO4xidkzWQ9qiRsH5xDYdt
 4PqifOHZqoXS/mEL+XnpXOauSg==
X-Google-Smtp-Source: ABdhPJypypUYJcn2w4RCJb6CG+F+l2hqQDH1o0rgKzLpIFSSeqh5LjfC2SGZmI/WyLTUGnXmq+NZDA==
X-Received: by 2002:a05:6a00:1503:b0:47c:2928:328f with SMTP id
 q3-20020a056a00150300b0047c2928328fmr19118465pfu.14.1635637583334; 
 Sat, 30 Oct 2021 16:46:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a20sm10535068pfn.136.2021.10.30.16.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:46:22 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] target/arm: Use tcg_constant_i32() in gen_rev16()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
 <20211029231834.2476117-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa87da95-cef8-2e6c-7351-c6339673fe57@linaro.org>
Date: Sat, 30 Oct 2021 16:46:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 4:18 PM, Philippe Mathieu-Daudé wrote:
> Since the mask is a constant value, use tcg_constant_i32()
> instead of a TCG temporary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

