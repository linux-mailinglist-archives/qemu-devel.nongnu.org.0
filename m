Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5D25F1889
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 03:52:52 +0200 (CEST)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeRgQ-0003EZ-St
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 21:52:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeRfP-0001nG-FR
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 21:51:47 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeRfN-0001sE-Ut
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 21:51:47 -0400
Received: by mail-qk1-x72d.google.com with SMTP id x18so3873077qkn.6
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 18:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=qyUrMffRXMJgL2CLVCnYQxAa2toiS/OzoHc0SuL9Gaw=;
 b=c53/j9dyVM8u89weDcAcrROq1cNVvvnl5+dyPS/QrMCiRrB+W6trzUqCrPwvm1zVo3
 9jGp4UurSMpFeiEO30Adif8db17HOxQ+ZR5TNKTmvNo1/kLiMaiVZhxKeN8yAfzTOxkI
 A7/0pjJGL6wEWkLIIo/HAWKk9+TaC6SGEiBd2yRgNEeGB3wB212MscFCQMUYWCEgyfbN
 AQYWTf3mNgNXURoG/5qjT6a0AJVZRsvQVd8E1XXGG3IyqC6BG1EgFWQiabn7fwDBF6JJ
 5d2gf3/if2VXqQDJaXJzUPsqb7nDunqDUEOoYFkM5bEJ7nNbrHof0QCASofDzO9XHiMB
 3fBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=qyUrMffRXMJgL2CLVCnYQxAa2toiS/OzoHc0SuL9Gaw=;
 b=hdKaQe1RgZKmN/DzoJLsW+gP2Ww0pExlppiDZa/+3gXAblRv+LKhIhR3VGRcBDqOY/
 gd+q4Dk2DxZ3BXLX8+du2Mqhjnv0OgMI6S9HRy22svZFJauik2hpkvdHeypXTqwEy4bS
 dx/gz06WNYYexf6CwdGw7k/LNa4+nP610ChzljhmN3SWi1Y7211mKvyNsGLhYeD1Velh
 otuf94Qn0Z4R0P3Wk7mFNclcGefYOuKfIpmD6ViH6cyt4+06ppMrRKKPNJl1Il1qk1eH
 o2Qzj0AA5NeMxBkkxQ35IsgFkfcsVlPICLr+Iv40DQUIwK60LGKzsgftbdlmsS502Tx3
 Ffvg==
X-Gm-Message-State: ACrzQf0csf/Ek6aMiQHznwon4j4pSc/WmMWTX80e3PIfXyUwHzTwPiik
 J7M0/ZaudPaeaKZKzZMutpPLbQ==
X-Google-Smtp-Source: AMsMyM6plYQ/ZekN6xozcKJctPMFdgoBJ1yAlWmPU7KtAERrosHgjrxl0Te0fUk/Kt8NfqWX6KMyUg==
X-Received: by 2002:a05:620a:1aa3:b0:6ce:3c85:d9d7 with SMTP id
 bl35-20020a05620a1aa300b006ce3c85d9d7mr8091148qkb.225.1664589104654; 
 Fri, 30 Sep 2022 18:51:44 -0700 (PDT)
Received: from ?IPV6:2605:ef80:8093:866e:708f:f41c:9c24:8383?
 ([2605:ef80:8093:866e:708f:f41c:9c24:8383])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05620a25cf00b006ce515196a7sm4338292qko.8.2022.09.30.18.51.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 18:51:44 -0700 (PDT)
Message-ID: <16fc3a92-b4f0-a3a6-0159-903f14c9dfff@linaro.org>
Date: Fri, 30 Sep 2022 18:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 23/23] target/i386: Enable TARGET_TB_PCREL
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <20220906100932.343523-1-richard.henderson@linaro.org>
 <20220906100932.343523-24-richard.henderson@linaro.org>
 <CABgObfan_71HjR5L4qsE3r4Paq_=XRQa9Z0tN02fitzX=JBTtQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CABgObfan_71HjR5L4qsE3r4Paq_=XRQa9Z0tN02fitzX=JBTtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/22 06:31, Paolo Bonzini wrote:
> On Tue, Sep 6, 2022 at 12:10 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>   static void gen_update_eip_cur(DisasContext *s)
>>   {
>>       gen_jmp_im(s, s->base.pc_next - s->cs_base);
>> +    s->pc_save = s->base.pc_next;
> 
> s->pc_save is not valid after all gen_jmp_im() calls. Is it worth
> noting after each call to gen_jmp_im() why this is not a problem?
> 
>>   }
>>
>>   static void gen_update_eip_next(DisasContext *s)
>>   {
>>       gen_jmp_im(s, s->pc - s->cs_base);
>> +    s->pc_save = s->pc;
>> +}
>> +
>> +static TCGv gen_eip_cur(DisasContext *s)
>> +{
>> +    if (TARGET_TB_PCREL) {
>> +        gen_update_eip_cur(s);
>> +        return cpu_eip;
>> +    } else {
>> +        return tcg_constant_tl(s->base.pc_next - s->cs_base);
>> +    }
> 
> Ok, now I see why you called it gen_eip_cur(), but it's still a bit
> disconcerting to see the difference in behavior between the
> TARGET_TB_PCREL and !TARGET_TB_PCREL cases, one of them updating
> cpu_eip and other not.
> 
> Perhaps gen_jmp_im() and gen_update_eip_cur() could be rewritten to
> return the destination instead:
> 
> static TCGv gen_jmp_im(DisasContext *s, target_ulong eip)
> {
>      if (TARGET_TB_PCREL) {
>          target_ulong eip_save = s->pc_save - s->cs_base;
>          tcg_gen_addi_tl(cpu_eip, cpu_eip, eip - eip_save);
>          return cpu_eip;
>      } else {
>          TCGv dest = tcg_constant_tl(eip);
>          tcg_gen_mov_tl(cpu_eip, dest);
>          return dest;
>      }
> }
> 
> static TCGv gen_update_eip_cur(DisasContext *s)
> {
>      TCGv dest = gen_jmp_im(s, s->base.pc_next - s->cs_base);
>      s->pc_save = s->base.pc_next;
>      return dest;
> }

I don't see what I'd do with the return values.  But I see your point about gen_eip_cur 
only updating eip sometimes.  I have changed the name to eip_cur_tl, as suggested, and it 
writes to a temporary, like eip_next_tl.


r~

