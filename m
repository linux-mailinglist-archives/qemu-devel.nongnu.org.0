Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C6F58B0CF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 22:22:34 +0200 (CEST)
Received: from localhost ([::1]:35186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK3q3-0001ns-0x
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 16:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3nR-0007ug-3k
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 16:19:49 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:55079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK3nP-0007rT-Gq
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 16:19:48 -0400
Received: by mail-pj1-x1032.google.com with SMTP id b4so3719704pji.4
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 13:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/e8mvhzByVmkPfweWrNPUzCwe46gTI8xmQCLqNfQxa4=;
 b=cBb+5cfDouzQbXA2zhjWc+sNG5kYQigh6Qd1ZlnFOqvkudNJgTCbz2FT2ZsK0WxSlu
 tbUIj2p4xpCwN4BRdt55UjZZmKRRn/p9cXFpCAs9Nea6cvMugGM0+em66ZAS7krBwCet
 leYsDY9fngErBXFJw76EIQdMEx6qjir0ia0E7NLauc5OFfIgU2mUzKwOAwLxq+kXmq0d
 LEJC4whk/w9RVKSF8I9bUIBFS8wxxYnoQt82C4RiNzsrYv65PqHGL/HT1Ma0n3ypuwut
 vTI2KBIuWPFZqJdPUBlYYuEiXKO6nHSoX6tGi0AGVuFLw0hCB3+4uDRGDmu8rnz8gjPa
 6XxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/e8mvhzByVmkPfweWrNPUzCwe46gTI8xmQCLqNfQxa4=;
 b=RyBcotVkCUoeJhjnWH3tHe+6VNh7gtl4JRVxTg9hvZtMiK6RUQivuo4Gf5ohQK3z5h
 /wl4Cons2tGzM5ZIOEl3JUn+IdP370HwaQ/VVMg2Mz8E+vavX/hbgQarE/OquCJoJMzI
 GZip8bwlEEVba1Km4QZx51z2lUsA3ya5uGn0MoynqcVbN8fD3Ooqk/4Xj98ERB2z4/D7
 4Dbd2gn7K6lJvQ3+7crcazeCz+tIF5fS+ZJtJu47jg7Pt20v0zk53z6lWuAstghS3nlP
 ii9/ppITGXi+1fkLnGyXuCtxUARoA2Gs5WADjIEfxhil4VlzSfJsWCU6t47HuoUYQ21B
 5u5g==
X-Gm-Message-State: ACgBeo3DeOKr6hgmwJ2clHTXKBxj3zb+MgLAWpB1yykcoo0W+FpN5epq
 zBDUyTIhMBwMVvZ77QVl1o9xEg==
X-Google-Smtp-Source: AA6agR4sbzkagdFOaegCpyf3KKiYM9YQ0bf+WCQwhTRctNMd2Am/yxB/D6+juUd7sKQV6AfwUNwJwA==
X-Received: by 2002:a17:903:2041:b0:16d:a78a:efd9 with SMTP id
 q1-20020a170903204100b0016da78aefd9mr8355454pla.71.1659730785823; 
 Fri, 05 Aug 2022 13:19:45 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a170902768500b0016d4f05eb95sm3354043pll.272.2022.08.05.13.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 13:19:45 -0700 (PDT)
Message-ID: <574ceb2a-8e5d-dabc-b019-6f0af7b70714@linaro.org>
Date: Fri, 5 Aug 2022 13:19:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] target/i386: Make translator stop before the end
 of a page
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220805160914.1106091-1-iii@linux.ibm.com>
 <20220805160914.1106091-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220805160914.1106091-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/5/22 09:09, Ilya Leoshkevich wrote:
> @@ -4568,9 +4598,19 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>       s->rip_offset = 0; /* for relative ip address */
>       s->vex_l = 0;
>       s->vex_v = 0;
> -    if (sigsetjmp(s->jmpbuf, 0) != 0) {
> +    disas_save(&snapshot, s);
> +    switch (sigsetjmp(s->jmpbuf, 0)) {
> +    case 0:
> +        break;
> +    case 1:
>           gen_exception_gpf(s);
>           return s->pc;
> +    case 2:
> +        disas_restore(&snapshot, s);
> +        s->base.is_jmp = DISAS_TOO_MANY;
> +        return pc_start;
> +    default:

Similarly, this is too late for DISAS_TOO_MANY.

It will be more difficult to fix this for x86, since unlike s390x (or arm for that 
matter), we cannot probe for the total insn length within the first few bits of the insn.

The simplest possibility would to force single-stepping when we're within 16 bytes of the 
end of the page, as that's a hard maximum on the number of bytes within an x86 insn.

We could probably still use this sort of longjmp thing, but we'd need to unwind more than 
you're doing here.  We'd need to discard the insn_start opcode (which is before the 
last_op that you're currently saving), and decrement s->base.num_insns.


r~

