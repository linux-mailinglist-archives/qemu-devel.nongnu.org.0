Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54263EBB65
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 19:25:29 +0200 (CEST)
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEavw-0001rL-FH
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 13:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEav0-0001Cs-19
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 13:24:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEauy-0006TM-HN
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 13:24:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id nt11so16319964pjb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 10:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kr1pgfaA2SZ1vvctuYrfMeqa2y+hXZn1SIvqWbgWbnw=;
 b=f+9FxJZ3OzE51qxH52EDMn04qyMzTEteUm1BcvZssVwRxMYfXJ81h39RjNL/vxUx9m
 Uum5eO/iXTtSrqOGLIMfFJEa+8VriJ0QiWmbPzFtNdGa4nTM2hF7/tuRFqb6U44cmoW1
 zlccCzk3FgPXvOGSHusPqp8rnNT2L6FHzc3bwxp5daWTqTXgAokgK7125bBKxdOIBfFu
 Rj0PdG2/e8wEqp/EmAdcJOoLHT9BfNxdqKQ7/kbweUUVDbxmgM+5Zn118qGi6rKPz1M1
 jHoV5IbIchqnxP5sjT5lv2H+CLTUlBPlCjhY3DvliC4vFOtxqMYrsChsXNkWf9P87Cmc
 gdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kr1pgfaA2SZ1vvctuYrfMeqa2y+hXZn1SIvqWbgWbnw=;
 b=i1EGoN8eLCAS3MigXGhH83PcgRvtIJ/w2v8Eeq3STIq5ZIdhTDDP7Y/zVTBznbO0KB
 sAoC+eyJVaC/l0cVSi+5WQ7IJgGOfn0sQnp528iy5D4PRbgkGY9Xl+VCX68d3ac+GkDr
 hOPggFpoMD7EXWIPKez4euJ5Sesv1nmy1hS/LIGcC0fx2jMCEG4tXd4HZiopJ1vePpex
 fEa7BsrjZZh80Y00G+2nDwjc20YFYrojR7YdvzUbtWj0+rSS20EfNEf//cEPJVIUaohC
 YPVHLg3YO9I/qQurzh421V23BY6kqJdrP39XSlu7ldUGKAq9PLFOnFc76gFGoZOAtNz1
 ppLQ==
X-Gm-Message-State: AOAM533MKCzoyRScMqtwna8GwFcWjvyhNJJcHKFWQun0HUp4MGQzWRZS
 dao29nlue3wI47TlszE8UN6EWHrLkUuDQA==
X-Google-Smtp-Source: ABdhPJwfpcTWF14QIRaFJR14MugHBnNczQDl1jag8pPOoM19UpJiiqsw7p9mnwFwUXd/8i3GanviFg==
X-Received: by 2002:a17:90a:db09:: with SMTP id
 g9mr3616789pjv.205.1628875466925; 
 Fri, 13 Aug 2021 10:24:26 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id o9sm3101191pfh.217.2021.08.13.10.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 10:24:26 -0700 (PDT)
Subject: Re: [PATCH for-6.1] tcg/i386: Split P_VEXW from P_REXW
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210810232530.1033519-1-richard.henderson@linaro.org>
 <CAFEAcA8J4WBFiLUTJAXduST4v+cz7-5s3KPJJY05LVizN_9PcA@mail.gmail.com>
 <184409c8-a983-8581-d263-9119607dc55d@linaro.org>
Message-ID: <fb2d8fb1-92b9-8714-e5b5-e49e3a26db28@linaro.org>
Date: Fri, 13 Aug 2021 07:24:23 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <184409c8-a983-8581-d263-9119607dc55d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/21 6:59 AM, Richard Henderson wrote:
> On 8/13/21 12:37 AM, Peter Maydell wrote:
>> These changes look OK as far as they go, but it's not clear to
>> me why the other places that set P_REXW are all OK to use P_REXW
>> and not P_VEXW. For instance tcg_out_mov() sets rexw = P_REXW
>> and some of the codepaths there will then pass that into
>> tcg_out_vex_modrm() which ends up in tcg_out_vex_opc().
> 
> This distinguishes between 32-bit and 64-bit transfer between vector and general register. 
>   Which of course doesn't make sense for i386.

I read this again and realized it doesn't really clear things up.

The older opcodes which originated with SSE used completely separate opcodes to talk about 
64-bit quantities within the vector registers.  E.g.

#define OPC_PSLLW       (0xf1 | P_EXT | P_DATA16)
#define OPC_PSLLD       (0xf2 | P_EXT | P_DATA16)
#define OPC_PSLLQ       (0xf3 | P_EXT | P_DATA16)

or even

#define OPC_MOVQ_VqWq   (0x7e | P_EXT | P_SIMDF3)
#define OPC_MOVQ_WqVq   (0xd6 | P_EXT | P_DATA16)

It's only with the newest AVX2 instructions that they decided to use VEX.W to talk about 
the size of the vector element as opposed to the size of the general register on the other 
end.  Which includes the two vector shift with the shift amount coming from a vector 
argument (as opposed to immediate):

#define OPC_VPSLLVD     (0x47 | P_EXT38 | P_DATA16)
#define OPC_VPSLLVQ     (0x47 | P_EXT38 | P_DATA16 | P_VEXW)
#define OPC_VPSRLVD     (0x45 | P_EXT38 | P_DATA16)
#define OPC_VPSRLVQ     (0x45 | P_EXT38 | P_DATA16 | P_VEXW)

I guess I can add
Fixes: a2ce146a068 ("tcg/i386: Support vector variable shift opcodes")

because I failed to consider that P_REXW was always 0 for 32-bit.


r~

