Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04247981C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 03:09:02 +0100 (CET)
Received: from localhost ([::1]:54158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myP9h-0001Br-Gt
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 21:09:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP8g-0000JH-Dt
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:07:58 -0500
Received: from [2607:f8b0:4864:20::429] (port=34706
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myP8e-0006i3-W1
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 21:07:58 -0500
Received: by mail-pf1-x429.google.com with SMTP id c2so3653939pfc.1
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 18:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gZQj35JrnBLu2nfN6mp1WdU+TyPCDpgpwwepktWrsWI=;
 b=FaT69HZrh714Hx85vcqYPq/PEzfg5GL9rWtOuUytNm5r9H9sbL+/9ZNjZCeHL2Bmdp
 jU6q9q9JdJVVAYxe+pWBLUUvzjK2N5PQDHMFfXpyNScnR1CUkIFJrmBwgBq5KO8U1zgq
 /sN0SMsnQCujijC9WFOJbAL23K/QnvCYqRDO+y5dVjdfyMUf4MViRxpaxdDobVjeMujh
 CaOnvoRt9MPt3CosQL+UYIuXo391XC/C9rtvoDoys7r4YPRQdSGbn5mKs9V5qPl0Z5LV
 92AEfUsMO3vMkjBIUPdQTIRNXehjhPQec02zv8ozcWFSJq2c4b039BiWRe8vwrvJyp9C
 hwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gZQj35JrnBLu2nfN6mp1WdU+TyPCDpgpwwepktWrsWI=;
 b=OO1As0rrMDR4h7QZezpdKnI4TmNM3dob4Vt8qnzVG3dxTl0shjh8bFX1WiwYQg+Yus
 RBkcDSSCUM3h9t4mxq5Vf4SB2VHOdWBe5ivpb5rq4xHyH4Ge+2AcTQXxX4MflnpFWAsk
 /s5Vzn7UCNJDtCxhMe0eNO3XfTlLGDGZHY+uNlU84Nk6WIvHT9Ur9DV6zAkFpTJ5IyQp
 epGlGOGoU4qL1T8kCXI5KiP31Tnf+cXjq56SK47G+gWX4REmlYTJvnPSttIrPncwemjZ
 16HapelXWEpDlEY1eFi5ihsJ/uFBtF/OnB+hA+khHnvjbgmZmU3vjW40eANQuKbEYK9t
 6hyA==
X-Gm-Message-State: AOAM532vqZM6QdgjjpSvbc4Tnh8/0AEGaf8IWTcQvDF58HsZp6+vukKT
 wQZVTtWf31P11dw++AQs3W9DrQ==
X-Google-Smtp-Source: ABdhPJxTigFsCrqkOXx7oP/NEOJkbUTDTiXv3aSYavMHMLCOQqR781aczU6LswmRNloMt0T0PIEI+A==
X-Received: by 2002:a63:4720:: with SMTP id u32mr5383831pga.539.1639793275699; 
 Fri, 17 Dec 2021 18:07:55 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d15sm10957584pfl.126.2021.12.17.18.07.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 18:07:55 -0800 (PST)
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
 <CAFEAcA_UKFHT=PbwNtyqV4G2Vdw7LVUjUj_X_DZ5Kk6=yF+EBg@mail.gmail.com>
 <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <65d60871-31dc-1e59-3cb4-34a27e7af339@linaro.org>
Date: Fri, 17 Dec 2021 18:07:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <f07f6b9c-ac81-62a1-be71-6c82267bdaf7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 3:18 PM, Philippe Mathieu-Daudé wrote:
>>>   #define MEMTX_OK 0
>>>   #define MEMTX_ERROR             (1U << 0) /* device returned an error */
>>>   #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
>>> +#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
>>
>> This is kind of odd naming, because MEMTX_DECODE_ERROR already means
>> "bus/interconnect returned an error" and it generally translates
>> into what at the OS level gets called a "bus error"...
> 
> MEMTX_DECODE_ERROR is "nothing at that address". We want a name
> for "there is something, but you don't have access to it".
> Maybe MEMTX_ILLEGAL_ERROR?

ILLEGAL doesn't convey much.  MEMTX_ACCESS_ERROR?

r~

