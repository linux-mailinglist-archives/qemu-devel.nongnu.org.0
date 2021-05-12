Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EDA37CBFA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:02:58 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsG9-0006PE-3a
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsDt-0005Oy-1c
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:00:37 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgsDp-0006M6-D0
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:00:36 -0400
Received: by mail-qk1-x732.google.com with SMTP id x8so22885655qkl.2
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j6JnrqHLyOZnfREg7yIMLIp9nrSsTMmoCh7+gw4x8FA=;
 b=pQsy0R+8G/tsUvKIC6xjc9ZeVyT2mGGh5HbyJHHMbOOy5Q6hNtNPePylK6Ofk4m7/o
 auKB0Pur+emCNKHZ3tUOuRhIj+3Fmxyme2wh1jaX2k93R8YBK3Snzi8VWiw8C1l/o1Nd
 5N34ZvPY3bzoX4+VCOB8NmkKKm0wED9NjOILhFvUybHbcQNEy5C9X/UKmleHAEyKBsYh
 aikD6DW5AuN3Ntc9SpNL1P1d8o6VR2xU3F3WlRKEFT4uoCaBw1feg/Fosi02Ar9TWSB+
 liREel33a3lNSBRfqaNiiMkPBIi6bZmnkjAUBvbnIQBscfY71icShnEdcj47ezSeYtCq
 xygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j6JnrqHLyOZnfREg7yIMLIp9nrSsTMmoCh7+gw4x8FA=;
 b=VBQVnkmBSB80AduTMfkjvlV1RoubAEMmjjTltIM+V9dEBlNJZ6pUHZl2S3kqOWFOfv
 hEw7ygo4rt89JqOUnZvqivJIIUf/LxEoct39jnDSotQ+q/fMn8yhWlr4FD5J7MBDXpBS
 sDFBHO5nzcQ1Z38JQN0cSyLFRZivwYzbUg2ziOCb5qjqDevObk0/jrJNjp6Tpnq8Q+Ub
 e10UeGiKrQqQ0NFGFxwhv/XEfmLBtp/2TsqHK18K4QS8xhtJjL03Kn7/hsDm4Ww2rXFr
 1Oi9K2ZgJbjZFjIhQA7UNlnb7OuBYRjgjmS26Rb5p0L2Ov4jk1RjKMml2K8BC9AuJBw2
 X67Q==
X-Gm-Message-State: AOAM531gu97Ktldbnenx6gbdhqAl9wsDaV3ympf1XqnleciUWpFozY1V
 RFrGrM8GD6WghnVdjv5DvnQt1Q==
X-Google-Smtp-Source: ABdhPJzaRU1lKtuP3K1p/DyDmWD0kOzAtFY3U1TK7+Iz4CVyjTgYtpOAznVzVoSHSeWUiZOC+cdJ4w==
X-Received: by 2002:a37:6891:: with SMTP id
 d139mr34316492qkc.466.1620838832308; 
 Wed, 12 May 2021 10:00:32 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j10sm343626qtn.89.2021.05.12.10.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 10:00:32 -0700 (PDT)
Subject: Re: [PATCH 03/11] target/ppc: moved ppc_cpu_dump_state to cpu_init.c
From: Richard Henderson <richard.henderson@linaro.org>
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-4-bruno.larsen@eldorado.org.br>
 <44ea8f63-4b6d-a06c-1c0b-4ab119a07115@linaro.org>
Message-ID: <2e02b9a1-9559-7e8a-a934-81af512a86f3@linaro.org>
Date: Wed, 12 May 2021 12:00:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <44ea8f63-4b6d-a06c-1c0b-4ab119a07115@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 11:58 AM, Richard Henderson wrote:
> On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
>> This function was forgotten in the cpu_init code motion series, but it
>> seems to be used regardless of TCG, and so needs to be moved to support
>> disabling TCG.
>>
>> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
>> ---
>>   target/ppc/cpu_init.c  | 182 +++++++++++++++++++++++++++++++++++++++
>>   target/ppc/translate.c | 187 -----------------------------------------
>>   2 files changed, 182 insertions(+), 187 deletions(-)
> 
> Not just "seems to be" -- "is".
> 
> Indeed, cpu_dump_state is called from accel/kvm/kvm-all.c, and the monitor.

... and I meant to include

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

