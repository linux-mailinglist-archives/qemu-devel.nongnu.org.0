Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DAD63EA4C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 08:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dut-0001QA-F9; Thu, 01 Dec 2022 02:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0duI-0001OT-CB
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:23:01 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0duG-0001xO-0c
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 02:22:53 -0500
Received: by mail-pf1-x429.google.com with SMTP id o1so1050921pfp.12
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 23:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=50dd6UuqH6fxcrOaJg/I2Npc8i8qhPbyQbt2RWeBsCc=;
 b=C9HNy/tXKHUd5GzwxRXRlZD5bbyyrjUo3g9KbJDHGCfxmhD2WpFCTVUZ0tkE3h44qc
 qf3/6eDeAMe0QmtG5Sbjk6b7gQKSM/W9K/erjRatVSienw1anvIDHhh1QincITltWwrf
 0R3C5bQsuD40jKuxY74SRAO8ZQPS2EGgedpzTKkzX78iRA2/Kr6HXbdzO8Xa9NNA1F6O
 ggCBq73dI6UNAeMsY/MpMAfjU729YOPnPNrB0Xbxb6oCVq6C/oH7HntgWrtr/Yeqh4dQ
 q2Jnb6zajNy8PuXjVa+nbGfZDDHB8bpfhji283nuEGhIZe2NTEyfD+39ErKKrYfa7aLm
 w6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=50dd6UuqH6fxcrOaJg/I2Npc8i8qhPbyQbt2RWeBsCc=;
 b=xkIjDGZgTQ6j2KRhpf/CQlL2vPkG8PZ+NbFN/18ZUCaAQqiERzve8yMxd3TayyMsjr
 8vnosJn3FdrAUiPURM5AaQ707S5FzFgqyNgJCa0apuDtGIn3V22Ve+RbCFOf5iIlhJis
 /Q+2hE0RbmZfK3UdjZZt440gKK0KYhcb4aonQ+nHgyIJRHnZQPO1TxmCRotfjHYUKX1b
 br5G1/gQjIdIH8nC2N5pY7gkxID8oGKiJWMknvAwmK4ypHnV5Ezae/NZJK02y+PtBO43
 +z0NQJv5NJn1QtuQ5cXSH8JK8OxfYEosmyuQQWTF6ISDtTqPXCRsBhiJ3FGx5OFqzRkn
 7s4A==
X-Gm-Message-State: ANoB5pnt58kcGTrdOzjKQ+1aRDhMGlcVZilQE0l9B/CwkYfeYhp5Hjgl
 9cD+OHFDCFTXuhqkbF5Bfw4ybg==
X-Google-Smtp-Source: AA0mqf5R62SaTRowBX6V3bAcYSL19eYylWPLOFWlJp84HRlqfHLsPEX2ru8FeNQxIDTfg5sljDHtUg==
X-Received: by 2002:a63:fd47:0:b0:477:1a2b:762e with SMTP id
 m7-20020a63fd47000000b004771a2b762emr47285920pgj.240.1669879369367; 
 Wed, 30 Nov 2022 23:22:49 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 x28-20020aa79a5c000000b0056b8181861esm2627429pfj.19.2022.11.30.23.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 23:22:48 -0800 (PST)
Message-ID: <47b8c1ea-d479-ced7-a37b-d6830335f219@linaro.org>
Date: Wed, 30 Nov 2022 23:22:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/i386: allow MMX instructions with CR4.OSFXSR=0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
References: <20221130141917.29667-1-pbonzini@redhat.com>
 <b500f723-4d03-fb42-c2a5-67599d518010@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <b500f723-4d03-fb42-c2a5-67599d518010@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 11/30/22 22:43, Thomas Huth wrote:
> On 30/11/2022 15.19, Paolo Bonzini wrote:
>> MMX state is saved/restored by FSAVE/FRSTOR so the instructions are
>> not illegal opcodes even if CR4.OSFXSR=0.  Make sure that validate_vex
>> takes into account the prefix and only checks HF_OSFXSR_MASK in the
>> presence of an SSE instruction.
>>
>> Fixes: 20581aadec5e ("target/i386: validate VEX prefixes via the instructions' exception 
>> classes", 2022-10-18)
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1350
>> Reported-by: Helge Konetzka (@hejko on gitlab.com)
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   target/i386/tcg/decode-new.c.inc | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
>> index e4878b967f0e..80c579164ff2 100644
>> --- a/target/i386/tcg/decode-new.c.inc
>> +++ b/target/i386/tcg/decode-new.c.inc
>> @@ -1488,7 +1488,8 @@ static bool validate_vex(DisasContext *s, X86DecodedInsn *decode)
>>               if (!(s->flags & HF_AVX_EN_MASK)) {
>>                   goto illegal;
>>               }
>> -        } else {
>> +        } else if (e->special != X86_SPECIAL_MMX ||
>> +                   (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ | PREFIX_DATA))) {
>>               if (!(s->flags & HF_OSFXSR_MASK)) {
>>                   goto illegal;
>>               }
> 
> This fixes the MicroSnow image, indeed, thus:
> 
> Tested-by: Thomas Huth <thuth@redhat.com>
> 
> Should this patch still be included in QEMU 7.2 ? ... since it fixes a regression?

Yes.


r~


