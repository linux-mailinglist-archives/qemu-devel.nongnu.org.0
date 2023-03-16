Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 900BD6BD4E9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 17:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcqGu-0004bz-T7; Thu, 16 Mar 2023 12:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqGs-0004Vm-80
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:16:06 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pcqGp-0005Rm-DQ
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 12:16:05 -0400
Received: by mail-pl1-x62d.google.com with SMTP id a2so2305747plm.4
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678983362;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n776JlXS32H5zi0cQ+/f16U/jd5aAGCKE1D1qs3kEZg=;
 b=vESoCJFB/0s07Pe4E4zLM2XzTrD3maRRXpm1M9vkXz3+S4NjLVFTXMdVU9jaFNTX8y
 mfIzoZHa2TuS16s9K7DfbLfAX8BeO/8puvROzbMHAc0MEd1GoRLcaxveB6gBrAK1G18L
 cfyQD0NKRlS3b93H/hHTwgk8kv/vuTngIOARQbHqJJdo7IiDjPJYZc7LN4dtMleA2eb9
 lqklGe5qDkbG1sfj+ciTTFfLceskFXpTGW57erg5jjk1xCPqVmHfDoJkXiGDugU/DFqa
 lfufrvGLYfQ9YHW+f5+xQ2pnkvv4eJr0eWxNiZZq7AQ+nwqbXJPZqeswK3g4ogi5sNUe
 H3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678983362;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n776JlXS32H5zi0cQ+/f16U/jd5aAGCKE1D1qs3kEZg=;
 b=XwtWXY3mRBXZKdlU36p/lFUerfJyLJKOWrCL9mACWItZ1xxSH9/nr9ADtJgCM9Tmml
 glIgSaEZ0Wvoymn7EklWiEcBpNEnoq4p9opL7OZkBkhK1vWuRhs/+05kj/k3bCJtzIbA
 nPlIB12oIMixtnvH20YIGpTC+ql7MXNSC9CkaWzzBdQckk3K4aWJAknf173M7djnHmjg
 9VDuKVV41Ix4k2tyOT7F7/1dShQwKk2p23Nj7Nfkq31fqAk3A3KLamWWQyts1XikAMan
 6MgnQPwr086kcxGo33TBSHf3sYceh2QQi4zWWFZXJ1MOo1olb9VGHfmNSWn1avMTn4zr
 M/mA==
X-Gm-Message-State: AO0yUKXNsH4uFYEIxRRYXAkDtYMVw+ufEWp31QLjv7G62QwL1Z5nBth+
 G6eXh93Z5OPRPrS0EbJCO27qPlkO9Dyg9eOEm8I=
X-Google-Smtp-Source: AK7set86+oIYQeeFtjIQ6RXJa+v/BOB6O7aNS0u5YvOu7wOnuq0liDIhZ2l4j3CpG5JfS0r/Eo13RQ==
X-Received: by 2002:a17:903:1389:b0:1a0:4423:b1bd with SMTP id
 jx9-20020a170903138900b001a04423b1bdmr3478223plb.7.1678983361924; 
 Thu, 16 Mar 2023 09:16:01 -0700 (PDT)
Received: from [192.168.57.227] (96-82-119-43-static.hfc.comcastbusiness.net.
 [96.82.119.43]) by smtp.gmail.com with ESMTPSA id
 ij9-20020a170902ab4900b0019e76a99cdbsm5739034plb.243.2023.03.16.09.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 09:16:01 -0700 (PDT)
Message-ID: <6d86ef3a-a436-9b82-1aa5-4f8df5d6502f@linaro.org>
Date: Thu, 16 Mar 2023 09:15:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 09/32] include/exec: fix kerneldoc definition
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230315174331.2959-1-alex.bennee@linaro.org>
 <20230315174331.2959-10-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230315174331.2959-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/15/23 10:43, Alex Bennée wrote:
> The kerneldoc processor complains about the mismatched variable name.
> Fix it.
> 
> Message-Id:<20230310103123.2118519-11-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/exec/memory.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

