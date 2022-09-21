Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3ED5C000B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 16:38:08 +0200 (CEST)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob0rX-0000x7-1N
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 10:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazr6-0000ue-OP
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:33:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oazr4-0006br-DE
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 09:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663767213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9A8H19Tcw/6VivkX8ROyzpQ/1S1IhxsbAC7nz8C+MsI=;
 b=Of6b41zBwNoN2pZeBKFamEyQUC8SZDxzZJyMB66Y+PTI5HjqLnA+ouzDWfebsRQK5ya8rK
 o+nZwrMllDXm0b2Go3bcQW4SEJUeSm/FDkPPXAAbgZ3wTgL/v+ZLOyZNM9jrlHG9QHSZco
 pv1ep2QVP+9MDp/XfqrSLHIvUgUKLYI=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-604-FwWREmGmM7GTOf7Zg3CSEA-1; Wed, 21 Sep 2022 09:32:37 -0400
X-MC-Unique: FwWREmGmM7GTOf7Zg3CSEA-1
Received: by mail-qt1-f200.google.com with SMTP id
 fe14-20020a05622a4d4e00b0035cc376b1d5so4132580qtb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 06:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=9A8H19Tcw/6VivkX8ROyzpQ/1S1IhxsbAC7nz8C+MsI=;
 b=DHkI5X/CqctRwAQPEgZQjBUL0ui89myRZ94HXygAlU89TtAGZWgYQ276AjQZy2YKDP
 k5AIsKVyP7t9NMMo+Eb+PU4JEHad8RsFQFPskj0XfoXB3LvX2XzAzzRMQ/9V1qVaPaN0
 jT5ZLYos0gDO1y34u4iqVbqpwDm9mdstL7YBTd5bQ4fnWldzZpABdsuIIT9p+cjn0TLy
 vCWoYACFYXzNsi6hFgYIQSjEnNOBPVujIjNc9W3xHvcEUVIYCGkbhTYSgUbgp0HRt+7e
 EQjBkkVWkRPx0WDAa4GsruGRM/wnyupK3zJztWh8b4UZPVsxq7fJzTTfLP0/ZXNCtWVC
 trMQ==
X-Gm-Message-State: ACrzQf3RVp/2eSgCwLjtCd4L5K38OgBmPLUd4egHaPHGBFa919LjK701
 a9miUepOlmeeQEMGOfIinIwTg1gl7gAc6cpAK1X/7UdKSgXbngRCvuFhGU84zsPuNuLbZ9q+uS3
 HND0+/xvLS85t6VT/fUXZtRdM+FTnizY=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22875957qvb.17.1663767157014; 
 Wed, 21 Sep 2022 06:32:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4wQ1WXgw+BtzOUBzNsqHPlZyKdyc7mOJttpkn/4Hgt9b3Az6Vw/ureIYdMYbfnu84d5oVjyleTKunI+3d9eQI=
X-Received: by 2002:a05:6214:4005:b0:474:3c94:cdc2 with SMTP id
 kd5-20020a056214400500b004743c94cdc2mr22875937qvb.17.1663767156782; Wed, 21
 Sep 2022 06:32:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100932.343523-1-richard.henderson@linaro.org>
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 21 Sep 2022 15:32:25 +0200
Message-ID: <CABgObfbC6ntxPT2X2_QSCEt+ByRrdcd7GEU2LiAH6ipsj5O9dw@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] target/i386: pc-relative translation blocks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Looks good! Just a couple weird parts of the architecture where I need
some more explanation.

Paolo

On Tue, Sep 6, 2022 at 12:09 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the x86 specific changes required to reduce the
> amount of translation for address space randomization.
> This is a re-base, with no other significant changes over v1.
>
>
> r~
>
>
> Based-on: 20220906091126.298041-1-richard.henderson@linaro.org
> ("[PATCH v4 0/7] tcg: pc-relative translation blocks")
>
> branch: https://gitlab.com/rth7680/qemu/-/tree/tgt-x86-pcrel
>
>
> Richard Henderson (23):
>   target/i386: Remove pc_start
>   target/i386: Return bool from disas_insn
>   target/i386: Remove cur_eip argument to gen_exception
>   target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
>   target/i386: Create gen_update_eip_cur
>   target/i386: Create gen_update_eip_next
>   target/i386: Introduce DISAS_EOB*
>   target/i386: Use DISAS_EOB* in gen_movl_seg_T0
>   target/i386: Use DISAS_EOB_NEXT
>   target/i386: USe DISAS_EOB_ONLY
>   target/i386: Create cur_insn_len, cur_insn_len_i32
>   target/i386: Remove cur_eip, next_eip arguments to gen_repz*
>   target/i386: Introduce DISAS_JUMP
>   target/i386: Truncate values for lcall_real to i32
>   target/i386: Create eip_next_*
>   target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
>   target/i386: Create gen_jmp_rel
>   target/i386: Use gen_jmp_rel for loop and jecxz insns
>   target/i386: Use gen_jmp_rel for gen_jcc
>   target/i386: Use gen_jmp_rel for gen_repz*
>   target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
>   target/i386: Create gen_eip_cur
>   target/i386: Enable TARGET_TB_PCREL
>
>  target/i386/cpu-param.h      |   1 +
>  target/i386/helper.h         |   2 +-
>  target/i386/tcg/seg_helper.c |   6 +-
>  target/i386/tcg/tcg-cpu.c    |   8 +-
>  target/i386/tcg/translate.c  | 712 ++++++++++++++++++-----------------
>  5 files changed, 369 insertions(+), 360 deletions(-)
>
> --
> 2.34.1
>


