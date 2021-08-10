Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DAD3E83CE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 21:34:31 +0200 (CEST)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDXWA-0002tq-Pw
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 15:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDXUR-00021T-2O; Tue, 10 Aug 2021 15:32:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mDXUP-00076w-Aw; Tue, 10 Aug 2021 15:32:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id nt11so11388830pjb.2;
 Tue, 10 Aug 2021 12:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jvsgXpXO9ckoZxD1rzRDuhyUYPpY30cV0Cxe9uTYs78=;
 b=LAPI/hnAgZKxqRsEajA0ajaUSwAqluznhwe3fea4/q6/Q64A051CQ5txfIacv+y7kR
 gGSQ95T418X81avcRvkkwC81k8g4AHY+cQr8xRYEq+pHF9UBaxiPYnduBk37u0x0lMZX
 kgICsr3rh19hknnLOIFmYCr4owMgTqkl/gW75oOhxvXgU1SitoMECeG8L2WHysw8uR+g
 BEcGdzcdRwbAKOX0ecQ/bLO4L2jufGvs8VKqFRk5HVEnsR0jccmVRm9bYN/xVIgiMH+9
 6TGsItbZpsVb/kGZBzUim8+31Dyb7F4y9pisiWdZCSaOu/IUJ4waPf3h96Meqacm1Sy/
 gAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvsgXpXO9ckoZxD1rzRDuhyUYPpY30cV0Cxe9uTYs78=;
 b=AVAlajO33AjcIQT4SUrsu5DF3naCpouB2kiFNkmP6M8NgNBXSF0tWPsOBWu6ROjAo6
 VIw7tI+aDRHXF81AUJgQTUqYVxh2WbJoOA+voaCDwDRn+RiqKn63djCM2InBJjATOVbn
 9oEZXn25q/xV4k9WS1VRM1X0ERCJYTlM5TdiUjrR35rsQ57vyGCE+ql39qVKdZPEuUvW
 lXpQgX06EVj+c9gVpyctWxQIVC0jrKUzUYoBcUXBxgIJrTcUtsKXPjSXvxGfHnN7uPPx
 cCxnL6NSCLbRqJSy6DMwFb6YEPJ1tEhnZrNEDsRuSj4vIb6Anru0pbMr7dG8rfpYQoLa
 lijg==
X-Gm-Message-State: AOAM531Rops8Y2tvWLJ5OenQHLNrVJDOv/sIhaGiAQebaVLkrrXsAn2n
 Uem53HGQaKDF8Fz58JFnJPI=
X-Google-Smtp-Source: ABdhPJyPdmGHq7f2JmoN71gsCKm0y3/i7zCcc2u7JRi9kn43uf+aelxpdOx19cDqYXMLQrKCWxcBAw==
X-Received: by 2002:a17:90a:29a4:: with SMTP id
 h33mr31969271pjd.98.1628623959612; 
 Tue, 10 Aug 2021 12:32:39 -0700 (PDT)
Received: from [192.168.10.222] ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id p23sm25013633pff.158.2021.08.10.12.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 12:32:39 -0700 (PDT)
Subject: Re: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-10-danielhb413@gmail.com> <YRH3dJG5iKPGvrel@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <df15bc5c-ee71-9cd2-bf20-77da9ec7cc11@gmail.com>
Date: Tue, 10 Aug 2021 16:32:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRH3dJG5iKPGvrel@yekko>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/10/21 12:50 AM, David Gibson wrote:
> On Mon, Aug 09, 2021 at 10:10:47AM -0300, Daniel Henrique Barboza wrote:
>> From: Gustavo Romero <gromero@linux.ibm.com>
>>
>> An Event-Based Branch (EBB) allows applications to change the NIA when a
>> event-based exception occurs. Event-based exceptions are enabled by
>> setting the Branch Event Status and Control Register (BESCR). If the
>> event-based exception is enabled when the exception occurs, an EBB
>> happens.
>>
>> The EBB will:
>>
>> - set the Global Enable (GE) bit of BESCR to 0;
>> - set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to the
>>    effective address of the NIA that would have executed if the EBB
>>    didn't happen;
>> - Instruction fetch and execution will continue in the effective address
>>    contained in the Event-Based Branch Handler Register (EBBHR).
>>
>> The EBB Handler will process the event and then execute the Return From
>> Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
>> redirects execution to the address pointed in EBBRR. This process is
>> described in the PowerISA v3.1, Book II, Chapter 6 [1].
>>
>> This patch implements the rfebb instruction. Descriptions of all
>> relevant BESCR bits are also added - this patch is only using BESCR_GE,
>> but next patches will use the remaining bits.
>>
>> Note that we're implementing the extended rfebb mnemonic (BESCR_GE is
>> being always set to 1). The basic rfebb instruction would accept an
>> operand that would be used to set GE.
>>
>> [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
>>
>> CC: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   target/ppc/cpu.h       | 12 ++++++++++++
>>   target/ppc/translate.c | 21 +++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>> index afd9cd402b..ae431e65be 100644
>> --- a/target/ppc/cpu.h
>> +++ b/target/ppc/cpu.h
>> @@ -358,6 +358,18 @@ typedef struct ppc_v3_pate_t {
>>   #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
>>   #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
>>   
>> +/* EBB/BESCR bits */
>> +/* Global Enable */
>> +#define BESCR_GE PPC_BIT(0)
>> +/* External Event-based Exception Enable */
>> +#define BESCR_EE PPC_BIT(30)
>> +/* Performance Monitor Event-based Exception Enable */
>> +#define BESCR_PME PPC_BIT(31)
>> +/* External Event-based Exception Occurred */
>> +#define BESCR_EEO PPC_BIT(62)
>> +/* Performance Monitor Event-based Exception Occurred */
>> +#define BESCR_PMEO PPC_BIT(63)
>> +
>>   /* LPCR bits */
>>   #define LPCR_VPM0         PPC_BIT(0)
>>   #define LPCR_VPM1         PPC_BIT(1)
>> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
>> index 62356cfadf..afc254a03f 100644
>> --- a/target/ppc/translate.c
>> +++ b/target/ppc/translate.c
>> @@ -2701,6 +2701,26 @@ static void gen_darn(DisasContext *ctx)
>>           }
>>       }
>>   }
>> +
>> +/* rfebb */
>> +static void gen_rfebb(DisasContext *ctx)
> 
> Oof.. not necessarily a nack, but it would be nice to implement any
> new instructions using the disastree path rather than the old ppc
> specific decode logic.


I'm not sure what is the disastree path. Is it similar to how rfscv is
implemented?




Daniel




> 
>> +{
>> +    TCGv target = tcg_temp_new();
>> +    TCGv bescr = tcg_temp_new();
>> +
>> +    gen_load_spr(target, SPR_EBBRR);
>> +    tcg_gen_mov_tl(cpu_nip, target);
>> +
>> +    gen_load_spr(bescr, SPR_BESCR);
>> +    tcg_gen_ori_tl(bescr, bescr, BESCR_GE);
>> +    gen_store_spr(SPR_BESCR, bescr);
>> +
>> +    ctx->base.is_jmp = DISAS_EXIT;
>> +
>> +    tcg_temp_free(target);
>> +    tcg_temp_free(bescr);
>> +}
>> +
>>   #endif
>>   
>>   /***                             Integer rotate                            ***/
>> @@ -7724,6 +7744,7 @@ GEN_HANDLER(popcntd, 0x1F, 0x1A, 0x0F, 0x0000F801, PPC_POPCNTWD),
>>   GEN_HANDLER(cntlzd, 0x1F, 0x1A, 0x01, 0x00000000, PPC_64B),
>>   GEN_HANDLER_E(cnttzd, 0x1F, 0x1A, 0x11, 0x00000000, PPC_NONE, PPC2_ISA300),
>>   GEN_HANDLER_E(darn, 0x1F, 0x13, 0x17, 0x001CF801, PPC_NONE, PPC2_ISA300),
>> +GEN_HANDLER_E(rfebb, 0x13, 0x12, 0x04, 0x03FFF001, PPC_NONE, PPC2_ISA207S),
>>   GEN_HANDLER_E(prtyd, 0x1F, 0x1A, 0x05, 0x0000F801, PPC_NONE, PPC2_ISA205),
>>   GEN_HANDLER_E(bpermd, 0x1F, 0x1C, 0x07, 0x00000001, PPC_NONE, PPC2_PERM_ISA206),
>>   #endif
> 

