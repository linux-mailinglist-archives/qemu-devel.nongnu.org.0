Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F75523F9C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 23:46:34 +0200 (CEST)
Received: from localhost ([::1]:33016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nouAD-0003Er-LP
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 17:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nou7g-0001Ue-Fw
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:43:56 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:34381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nou7e-00049h-QO
 for qemu-devel@nongnu.org; Wed, 11 May 2022 17:43:56 -0400
Received: by mail-pf1-x434.google.com with SMTP id a11so3107738pff.1
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NFdb0GdCZn+oPwUVVC/YZZUhqsM2E80LxP2/3H0u3UI=;
 b=ItkKgdhuElhLsB3psAiUp+GB5gR+xU/wxRuOLcwckjLm4ouYy8xUzGkhuS5VAv6PoS
 owtEFbuyOOWpg7DEWqVRs+Qj6tTZpUpADPDDuVQsfOmDGDj0MPYMAY4rozrIi9cKolzW
 nufZ85bDcImn8RtNvgha4K1oDc1jc/vsX6izh2UJZJE2uIHrVp3dlc/QDXAmwfCWxYPa
 aiTMJC1/YkzubCHcN7inojz4RZUrBcYC15IWiIqJO3+JcSJxI58vus0hvDHdUiMw+1VH
 Iaew1pTEXhhrV3uTplLq57Re1VTBeEBDZQPPo9XPHRwhDwhIcvk28SQ7mx/nBFKr3euT
 MxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFdb0GdCZn+oPwUVVC/YZZUhqsM2E80LxP2/3H0u3UI=;
 b=Lkrew7qGDfXiPRjUzlBW0MXqgq5KVKa9hVJ38YX0/IXIRBL8AO/PWjTKEYja8NbGuN
 JWbtIRwMb7Kj37WK4olG96VwrHlDWUQqE509MOsmtMp0tdVDhwrmZEHHns78lqGjDtRA
 TIvZBzH5yUnde7hYBIXD5XatVvHNbM2ihMfMfRDoW8izST+OsrGe6Ewj5JFC6EK/6r/0
 PF9WAFgfDPvMDV4DCnWBcXs1LOsclKELPSCa/JZcH/DMgSd7+6vrIglfFsYaOl82q6du
 EEd0/kjihaHNycB4pvufy2LvLpsWLUOsDQvB+yoU7WiFRZMHIWyFadP5yTYctErKYmEZ
 1Awg==
X-Gm-Message-State: AOAM532CxZLutBR7PNdUW8rn+EUIy5FihjZKVCCV5em9FuPf3UGrEHvg
 kHTrBdB035PSZ7Ji749GUv8=
X-Google-Smtp-Source: ABdhPJx0B4AHzkgpfO3+ZDCUv6V/GBvqd6ojCQY6U5fn2Gn5/4nwoVUh/kxgWtVIlIy9WPG1e8Da5Q==
X-Received: by 2002:a63:cd0b:0:b0:3c6:afc0:32a6 with SMTP id
 i11-20020a63cd0b000000b003c6afc032a6mr14433769pgg.436.1652305433441; 
 Wed, 11 May 2022 14:43:53 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a17090a408300b001cd4989fee4sm373023pjg.48.2022.05.11.14.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 14:43:51 -0700 (PDT)
Date: Thu, 12 May 2022 06:43:49 +0900
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] target/openrisc: Do not reset delay slot flag on early
 tb exit
Message-ID: <YnwuFZsNjQLxOfp0@antec>
References: <20220511120541.2242797-1-shorne@gmail.com>
 <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf7c27e9-3bc9-888e-dbba-25c0bb583e09@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=shorne@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, May 11, 2022 at 07:32:58AM -0700, Richard Henderson wrote:
> On 5/11/22 05:05, Stafford Horne wrote:
> > +static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
> > +                                             const TranslationBlock *tb)
> > +{
> > +    OpenRISCCPU *cpu = OPENRISC_CPU(cs);
> > +
> > +    cpu->env.pc = tb->pc;
> > +}
> 
> If mips is a guide, you'd want to set dflag based on
> 
>   tb->flags & TB_FLAGS_DFLAG
> 
> as well.   But I think openrisc is more careful to keep dflag up-to-date.

I was thinking that too so I left it out.

For example:

    0xc01e3ffc:  l.bf      3
    0xc01e4000:   l.ori     r12, r0, 1

    ---

     ---- c01e3ffc 00000000                
     movcond_i32 jmp_pc,sr_f,$0x0,$0xc01e4008,$0xc01e4004,ne  sync: 0  dead: 0 1 2 3 4  pref=0xffff
     mov_i32 dflag,$0x1                       sync: 0  dead: 0 1  pref=0xffff
     mov_i32 ppc,$0xc01e3ffc                  sync: 0  dead: 0 1  pref=0xffff
     mov_i32 pc,$0xc01e4000                   sync: 0  dead: 0 1  pref=0xffff
     call lookup_tb_ptr,$0x6,$1,tmp7,env      dead: 1  pref=none
     goto_ptr tmp7                            dead: 0
     set_label $L0                          
     exit_tb $0x7f7b047f3b43                

    ---

     ld_i32 tmp0,env,$0xfffffffffffffff0      pref=0xffff
     brcond_i32 tmp0,$0x0,lt,$L0              dead: 0

     ---- c01e4000 00000001                
     mov_i32 r12,$0x1                         sync: 0  dead: 0 1  pref=0xffff
     mov_i32 dflag,$0x0                       sync: 0  dead: 0 1  pref=0xffff
     mov_i32 ppc,$0xc01e4000                  sync: 0  dead: 0 1  pref=0xffff
     mov_i32 pc,jmp_pc                        sync: 0  dead: 0 1  pref=0xffff
     discard jmp_pc                           pref=none
     call lookup_tb_ptr,$0x6,$1,tmp4,env      dead: 1  pref=none
     goto_ptr tmp4                            dead: 0
     set_label $L0                          
     exit_tb $0x7f7b047f3c83    


This is an example of a branch followed by a branch delay slot.  If we exit the
branch delay slot via `exit_tb $0x7f7b047f3c83`.  The `mov_i32 dflag,$0x1` instruction
would have run from `c01e3ffc` having env already updated.

At this point how would tb->flags have the right value?  Would it always be set
correctly by `cpu_get_tb_cpu_state` in the `lookup_tb_ptr`call?

-Stafford

