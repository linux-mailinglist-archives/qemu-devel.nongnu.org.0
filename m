Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F640BAEC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 00:04:47 +0200 (CEST)
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQGXm-0005ph-DH
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 18:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGVf-0004Gc-TV
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:02:37 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQGVe-00031r-C2
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 18:02:35 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y8so701517pfa.7
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 15:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sOFGnApUgxjzCugrS8v+IMIWKXl/+k+NHzbxEpcIIe0=;
 b=Z7fs4WM1TUoQDjGQZySmCzcs1J2tw2BMEv8R8mC3tIY2q6jtZsEruDBZlMtIUTr3/r
 I9A3IEom//2/UdjAlD+FcCmA3AfKv5loE6JFhvSNVvYvwsdhuxFROExB+pdFt1guVg5o
 eIp1zpcd9W1I2U7sTXzju5WQrFr1+Kg8fgLjELqYl/GUqbaPMxlsUiNFYDGXaIqELhcU
 CdTniQynb4s4erWW922ibjCyd+xg21I7OzQUjCWwgkjT7Hrl3K+MxKULZASGrVUHW5Kp
 nwKarbeO7ZRovP3mZC+DH9Q+jKIRf02pzBG90hka3qr/KkKf52bwYh2CNXCjtddJO5Sn
 gS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sOFGnApUgxjzCugrS8v+IMIWKXl/+k+NHzbxEpcIIe0=;
 b=pcBItfMxeVtgdJOrFzzMvhB1U32JbSKzrSZk0J+CIKwMbdwFdZomFIqnNGsGY+PJXH
 wNb+ybktW/pZtTLRjw/8uTu3Etk64o5wSkt2Ny43y5mkAePTwEqAsDpoXTmpQnkneH4q
 TT4BO8Pj/ObWKzvbuAxDU/MvXnPMiM8vEsU+UXNS8GgggfQEhYHZDMaZd0RMLvOW3AAS
 AK9x7cfmSL/dfHSg91ls75/FgpWhaHhBhoKlb2pGs8QwqDxvqu7JgsXVms1xyqm+mbFW
 fy2OYZvx5u+6i4IptXqqef3RIpE8Kv9ltux8H7QURWr/k4sBhAh4TWMP85j8nT+V3RVD
 /STg==
X-Gm-Message-State: AOAM532T1icIfaCyvHL9KbJtw5VVan32MsvbRne+hDbwh0voRuoz4yA9
 CFiqt6dUc0HGgLZeUQ39LuCTk0biYY7T5Q==
X-Google-Smtp-Source: ABdhPJxhxhxC42O+m5COC6DzSYFFxpv3fNSz9+qYUZbnC/nxse96MU0PX4vv/Nq44TwwxJe7oQb3vQ==
X-Received: by 2002:aa7:8dca:0:b0:40e:807:5036 with SMTP id
 j10-20020aa78dca000000b0040e08075036mr7020977pfr.2.1631656952758; 
 Tue, 14 Sep 2021 15:02:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z17sm2994395pfh.110.2021.09.14.15.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 15:02:32 -0700 (PDT)
Subject: Re: [PATCH v4 05/16] tcg/s390x: Implement tcg_out_ld/st for vector
 types
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210626050307.2408505-1-richard.henderson@linaro.org>
 <20210626050307.2408505-6-richard.henderson@linaro.org>
 <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c7688a2-ad86-56e9-f4d7-2d4b428e0a77@linaro.org>
Date: Tue, 14 Sep 2021 15:02:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7bd6c9a6-6b0f-5a0c-f9a2-be8a37102196@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 9:46 AM, David Hildenbrand wrote:
>> +static void tcg_out_insn_VRX(TCGContext *s, S390Opcode op, TCGReg v1,
>> +                             TCGReg b2, TCGReg x2, intptr_t d2, int m3)
> 
> Is intptr_t really the right type here? Just curious ... I'd have used an uint16_t and 
> asserted "!(d1 & 0xf000)".

It does come from upstream, as part of a host address. If you use uint16_t, the assert 
misses the upper bits being zero because they've been truncated.


r~

