Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BA351A4EB
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 18:08:27 +0200 (CEST)
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmHY9-0001NC-OJ
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 12:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nmHVR-0007gJ-4S
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:05:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1nmHVO-000162-TH
 for qemu-devel@nongnu.org; Wed, 04 May 2022 12:05:36 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e24so1635168pjt.2
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+NLDS4EZu61x3v/SjJrPioK6zycLVtiUsckr5wbiwUU=;
 b=on74iK5xi7EQ0PNpDpmEzS5flAtxSffAyf2tnx06S9DvzhMehWUMJ/22UsbMSpO2co
 0dbaR4GbMdbML1de71jh/tcY4/ISBbkdyCcyo6RzgDeFpFPx3rXYN4sK5kqIkBX9txEb
 2ILhJRbCbeVu9E56PW3biAlu0eVNHKIrXKLW8zx6secFFl2b3dYFE1ELmtzDQhM5z4pO
 zucsLh8sDDuPrUnoeEA09dmkMIZ/Fccyozv0PNMji7RNT3NynbhBQ9s/i1ynpF2WFzjX
 /pSQanZvHcJ5H6oJCEg3a5M0f0sgv0IlO31pY+eKcVz5Aromfd6qwBrJGKs+zrhYjY21
 r19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+NLDS4EZu61x3v/SjJrPioK6zycLVtiUsckr5wbiwUU=;
 b=x+T+oDUSacwx85OQ29XQpthzrDRCZaxLCGJZjv55ur3gBiMGr4adejUSqV/8iBTm8h
 FGoO5FCw/BS7K9md3FHwPFm1Kif2E6Xc8MO52iNEYXyhGtxorGOvjAMCKM3zpETlBDC9
 BdzH4aMYgTIHP6ba+lmOA10jjF+eaFCb1/rc3Y3sT0I/lVd7N+25fdCgKs3hwfqNdRsA
 x/VPDpZvby5yUBDWTIEg4LuYOCPP7Wjo2LV78UJtB9lGGLGQNHc5dvaFZHIIktZImJZJ
 2DeB/kYWed4E6FFB+yZfN5wy2tnltff3X2u/zkBY4xDJ9Wqiz8sAMfsnind3ircsh5Sl
 8g1w==
X-Gm-Message-State: AOAM530mKEmslljqjtCVFUg7cS30Z05D4g5nL8bMNdg7lx5UZ4+Yqslo
 fLrF3PW5WAc9K0KSnFay4kBVAQ==
X-Google-Smtp-Source: ABdhPJyDUVan27LdZrfGwB43tW1F6j2jcICSk1keh1hupJzDQdLYuU2z5OfA7mMI9qFVfmsuxjYo+A==
X-Received: by 2002:a17:90b:4a4b:b0:1dc:8bf0:feb2 with SMTP id
 lb11-20020a17090b4a4b00b001dc8bf0feb2mr230838pjb.6.1651680331860; 
 Wed, 04 May 2022 09:05:31 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 7-20020a631347000000b003c14af505fcsm14998790pgt.20.2022.05.04.09.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:05:31 -0700 (PDT)
Date: Wed, 04 May 2022 09:05:31 -0700 (PDT)
X-Google-Original-Date: Wed, 04 May 2022 09:05:28 PDT (-0700)
Subject: Re: [PATCH] linux-user: Expose risc-v V and H isa bit in
 get_elf_hwcap()
In-Reply-To: <CAKmqyKPbTh87h=_ibuXBS=TAdF3MxdQ0r=ojwrqci4fUsm+z4A@mail.gmail.com>
CC: shuizhuyuanluo@126.com, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alistair23@gmail.com, Kito Cheng <kito.cheng@gmail.com>
Message-ID: <mhng-205d4899-352a-4ef8-b8c9-d251d83d8071@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 04 May 2022 08:10:03 PDT (-0700), alistair23@gmail.com wrote:
> On Wed, May 4, 2022 at 2:32 PM nihui <shuizhuyuanluo@126.com> wrote:
>>
>> This patch brings the optional risc-v vector and hypervisor bits
>> in hwcap so that application could detect these isa support from
>> /proc/self/auxv correctly in qemu userspace mode.
>>
>> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
>> ---
>>  linux-user/elfload.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
>> index 61063fd974..3f0ef2b8f6 100644
>> --- a/linux-user/elfload.c
>> +++ b/linux-user/elfload.c
>> @@ -1484,7 +1484,8 @@ static uint32_t get_elf_hwcap(void)
>>  #define MISA_BIT(EXT) (1 << (EXT - 'A'))
>>      RISCVCPU *cpu = RISCV_CPU(thread_cpu);
>>      uint32_t mask = MISA_BIT('I') | MISA_BIT('M') | MISA_BIT('A')
>> -                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C');
>> +                    | MISA_BIT('F') | MISA_BIT('D') | MISA_BIT('C')
>> +                    | MISA_BIT('V') | MISA_BIT('H');
>
> The kernel doesn't support H or V. I understand V should be supported
> in the future, but what is the use case for H?

IMO even V is a bit in question: sure that bit's likely to be set at 
some point, but there's many flavors of V now and we'll have to give 
userspace a way to differentiate between them.  There's been some 
proposals (see Kito's talk from Plumbers last year, for example) about 
how to deal with this, but nothing really concrete has shown up yet.

If we flip on the V bit in user mode emulation then we run the risk of 
having a wacky ABI here, where QEMU is setting the V bit but then not 
setting whatever extra info is expected to come along with it.  That'd 
mean userspace has to deal with that case -- maybe that's not the worst 
problem, and I guess it's better than just assuming V is always on, 
which is all userspace can do now, but any ABI divergence is going to 
lead to headaches at some point.

IMO the right way forward here is to just sort out what the actual 
interface is, last time I talked to Kito about it we had a rough idea of 
where to go and plans to do it.  Not sure what's up these days, so I've 
added him to the thread.  If it's a long way off then we can always toss 
some intermediate thing together like this, but if it's close then it's 
probably best to just get the interface ironed out and then have it 
match.

>
> Alistair
>
>>
>>      return cpu->env.misa_ext & mask;
>>  #undef MISA_BIT
>> --
>> 2.25.1
>>
>>

