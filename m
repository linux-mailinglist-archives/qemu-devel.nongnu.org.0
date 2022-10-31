Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AA0613F1D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:41:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbab-0004WF-JL; Mon, 31 Oct 2022 16:40:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opbaX-0004M8-7B
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:40:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opbaV-0001xj-F7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:40:52 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v17so8759943plo.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=unc6q5ktRpGcEZEx9jK5v11ruj4ekKQEtqHs+t0pNjk=;
 b=PF5rglsT8XhkjEKfDQayfGNbMSip1agn/lsJBbn1XtQCFFsKu9K83NLD2bISEMWobm
 HEEZC9SmuI012K0UOggKeyVp3RcGHBt43ixvvqsfrDfJ50sMmDpyYXUhOjd8r5uf6/8l
 QpZDDAdaLvbOpIr9itkXHAcMHjlAH6Y12ZJsNHdP4qbm7+r4iBS0ewrQ2YrM+/xtuok5
 m+UtNPzrIWnLAUiNZb1/FG4rv7gLrYBi0Bny7fmSXHD1pGgxI1AJdbEcFmP3mAJiRNhT
 cvT8ogXpMMIn7L93I6URGLWKbxScEPuEHgKeIvSJjNUhRQ1C7RaeNuwQBJw02glZbczi
 CNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=unc6q5ktRpGcEZEx9jK5v11ruj4ekKQEtqHs+t0pNjk=;
 b=zEQEJ994FrHiXFfIkhETztVeCv7pjAjNHzJuImMMDLi+6Mm2r//U3bbSxNa1ronOv4
 skuPQpFy73o+weyra4l16EH6eYDqd0ezpei3xVzjOKnk+clkizSohLtjDxIIlqiJXyQD
 xwuGFkEkq6qQTUIvQfXPjEi2uAOuYiLg+F+pDNo+dG5tnwu0iYCw00vHWQgnrKeW6JLx
 GxpDtOua5u/ENgjndMcXoeG6sTrdwzvILec4TyfoR5wzIwS7yMXIcz6ZueitYRtoLqtC
 Pq7tuqevnniXpgTjnscGcPP96EU0DH2Dg9C0HoE2QBAPFZvFrOiKX5bo+qm1KnrKeZtw
 RrVg==
X-Gm-Message-State: ACrzQf0aWAsCPnKq4QAzwVKOdJxxXPUHjkgyoyHKSFkdQ7h32i6sVROt
 z9/kBVNap2SJ9u8EpRaU2Ryx4Q==
X-Google-Smtp-Source: AMsMyM6Jy5z7QVyOx44BqAyukfUOM210LpQr4AsgXdnqqE43SsKjheANgJc9e3p6oNKBhjkMOF5Log==
X-Received: by 2002:a17:903:246:b0:179:b6d0:f8fd with SMTP id
 j6-20020a170903024600b00179b6d0f8fdmr15931717plh.124.1667248849731; 
 Mon, 31 Oct 2022 13:40:49 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.27.250])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a17090a088800b0020087d7e778sm4560061pjc.37.2022.10.31.13.40.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 13:40:49 -0700 (PDT)
Message-ID: <4c5f0a3a-18bb-dfca-61f6-28b48538b42c@linaro.org>
Date: Tue, 1 Nov 2022 07:35:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
 <1792277.8fnDRLUPHX@silver>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <1792277.8fnDRLUPHX@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 11/1/22 04:56, Christian Schoenebeck wrote:
> On Wednesday, October 26, 2022 4:10:54 AM CET Richard Henderson wrote:
>> Add a tcg_ops hook to replace the restore_state_to_opc
>> function call.  Because these generic hooks cannot depend
>> on target-specific types, temporarily, copy the current
>> target_ulong data[] into uint64_t d64[].
>>
>> Reviewed-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> [...]
>> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
>> index 433fa247f4..4d8783efc7 100644
>> --- a/accel/tcg/translate-all.c
>> +++ b/accel/tcg/translate-all.c
> [...]
>>   bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
>>   {
>> +    /*
>> +     * The pc update associated with restore without exit will
>> +     * break the relative pc adjustments performed by TARGET_TB_PCREL.
>> +     */
>> +    if (TARGET_TB_PCREL) {
>> +        assert(will_exit);
>> +    }
>> +
>>       /*
>>        * The host_pc has to be in the rx region of the code buffer.
>>        * If it is not we will not be able to resolve it here.
> 
> This patch appears to break macOS host. This assertion always triggers on
> Apple Silicon. Previous patch 8269c01417 runs fine. Any ideas?

It does not previously work fine.  See

https://gitlab.com/qemu-project/qemu/-/issues/1269

which also contains a link to the in-flight patches.


> BTW Richard, could you add a message-id tag to your queued TCG patches?

Sometimes I remember, but I don't use the same tooling for my own work as I do for queuing 
other people's.  I haven't found much value in it.


> If you
> are using patchwork client then it suffices to add "msgid=on" to .pwclientrc

I am not.


r~



