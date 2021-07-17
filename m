Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37B03CC43E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 17:42:36 +0200 (CEST)
Received: from localhost ([::1]:39004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4mSZ-0000Cf-9i
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 11:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4mRc-0007rB-EA
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 11:41:36 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4mRa-0006iI-RW
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 11:41:36 -0400
Received: by mail-pl1-x62c.google.com with SMTP id o8so6949692plg.11
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 08:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ULVRfsxn9kNZ1MznUMGZUkQ7HGRS2VJ4gYEawkH3Rto=;
 b=X7Qp8Skzjch3KzlEN5HG1a4mLQxt4tvr48q+I6xitObqeK9XuIMAPwbrX8KX7Had3p
 7332VOTOSJ4NDdFtDLV1cRc2kzx/ulK1+/IC5YJogCyLJzUcm/4aB8ZIx1TI/L7JHWss
 myxXCXSetVmnyAOkI/33zsC+fFoyIOUvn5QILHaSiLBOBOxZCbkCeVq9FSk9kd0rYJOu
 yMYXGANbCd5fzb/NbusCfrHsjFVj6Nq/TLswqjbOE6J7FND63+AGSqEkcrWZCkIHfXA0
 RSUFW3LjDp2bmdO69D02WAuPsk2ewEV9m969fI159jIEQTrq9KeKevRe6t9/WJG0X5jc
 1ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ULVRfsxn9kNZ1MznUMGZUkQ7HGRS2VJ4gYEawkH3Rto=;
 b=ei4NUJIWpvJbyFU9/7QAPHjWLTrnzmSrfteBCPT4rAcTtMUhD4j6sLt/2KGi5Ry/tV
 1c3FDcWNkfK4pBSz8uwW3QgrSjDk/uw5jAmsSfBVxMAtGKVu1fA/cpDJn5Ms/3o3bcz+
 klL2LLCKUVMS41zWEoaadu24HgsBZID9z2eNsB1DKGfYt19/woOx+mZzATZZvDYGAFYo
 S/etxRT0A0o9OZXeuEENamDsXuqSMrKyEj8a2xgT5dMVOut5IG3ivx9krhwtmmwd1/k4
 ZOzMEhJIQAxanSVDKC02voksbz19tpnth6M22CT/IMfmxExDo9Pvf0lh5MzDLad+r/2B
 L5nA==
X-Gm-Message-State: AOAM530CK2gFumRl+tKYjetLZ6PvuaYka22Td/xRTvUCMFokisq5tTqp
 vesxAwhfVEWawEViO/9G96PJ4w==
X-Google-Smtp-Source: ABdhPJwF4F9FkqYiJB0lSEFYglDumcq9XyeAmoTW0uPNLnj/dW39p4FjvML9zFauRxXvplKvVvGXpw==
X-Received: by 2002:a17:902:c94e:b029:12b:45b8:a7f7 with SMTP id
 i14-20020a170902c94eb029012b45b8a7f7mr12022470pla.78.1626536492802; 
 Sat, 17 Jul 2021 08:41:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id f11sm15859765pga.61.2021.07.17.08.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 08:41:32 -0700 (PDT)
Subject: Re: [PATCH 00/17] target/riscv: Use tcg_constant_*
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org
References: <20210709042608.883256-1-richard.henderson@linaro.org>
 <2a5cfe45-3fdf-9a2f-c0f3-682d30d521a3@c-sky.com>
 <0b70aaf7-b337-3b73-cdbf-c5693a826204@linaro.org>
 <2933aae8-75f5-d912-4e0b-a38cb72b8f0e@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <945a6b34-4594-3abb-c4b8-0ad7fb187a24@linaro.org>
Date: Sat, 17 Jul 2021 08:41:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2933aae8-75f5-d912-4e0b-a38cb72b8f0e@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/16/21 8:59 PM, LIU Zhiwei wrote:
> If we want to strictly obey the spec, we should
> 1) Ignore MSB 32bits for source register, and sign-extend the destination register.
> 2) Always use 32bit operation(TCG 32bit OP).
> 
> I want to still use TCG 64bit OP and just extend the source to 64bit by ext32s or ext32u.
> 
> Is is OK?

Yes, that sounds right.


r~


