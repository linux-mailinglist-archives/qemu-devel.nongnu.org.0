Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5A335F674
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 16:49:54 +0200 (CEST)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWgq1-0003Ia-QV
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgoC-0001pf-TI
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lWgo7-0006uz-3s
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 10:48:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618411673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hW+lXqSwPWnn3khrPgTt6hu9F40iCdPwDBBfF920vVw=;
 b=BItDBeOegaMNozdKE7qZlHsu1SmA6qDBOLiCCkH2oC4GRuH1WRVbEQU58FIGI3b85kwLG5
 YiFVeZ4WrQmwijvkA0YbzmLIsQ9OtvWW9VlnK92RR/FnIDp9t5EMn1S9j6/4ml8v0RL72j
 GyxiC44km6kGofySNg1J1TI7EfjuhdE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-q5ZuymcuMFGdNnAdbHExsw-1; Wed, 14 Apr 2021 10:47:49 -0400
X-MC-Unique: q5ZuymcuMFGdNnAdbHExsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t14-20020adff04e0000b0290103307c23e1so1182853wro.8
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 07:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hW+lXqSwPWnn3khrPgTt6hu9F40iCdPwDBBfF920vVw=;
 b=nBGGKDOMhLo5oksbqHLQs+Chw71u8yGZWp/MTDUE4Ur2Lym/8DdZFyxEhZuhMOY7MF
 agNNaGgGbCXrH7eV8/m7y8zdYdfghCRnpxh965LCrROsceKHJs4ghJ6iW/rY793aiXzI
 uqCz3ZwhOnXO33rWciMHZgJflWniIT2fO1YIiZhQ2fFeiVoZD8lmr44GyZqwr4uHtC3n
 EvY0fla2K4ZlwoRwJzqmQm/gCJrZkLOmp6FtAkEZR0YkusqPFUNSujRzHwVQmsOihMRz
 li7hGXBwZb0xxNUvzkVSu8BjqITmGv7qhE22iIxUs1r7dX1IM2qx2yASjLXitYSp1DAj
 xQUA==
X-Gm-Message-State: AOAM530SgWOStyV3yX0b5xygdfs0pOnQnaSdFYXxKZK03NSFF6JpafOL
 qL8ARaHNhp4om8O2xRjnumYhQSxiE+rtOCirvgy7qRKUKgqpZjjcJk8L+dlQXSL4fq6fFCecfQy
 bKazNpaDbZTZmK/I=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr3407766wmg.81.1618411668332; 
 Wed, 14 Apr 2021 07:47:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHrjyy73tshUXMnlOt0vhhp5m4Ijk7Q+i1zSZQzXmqZE+gwKWvaQeQiPkqhUSl2P7Yh5SWAA==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr3407736wmg.81.1618411667889; 
 Wed, 14 Apr 2021 07:47:47 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6470.dip0.t-ipconnect.de. [91.12.100.112])
 by smtp.gmail.com with ESMTPSA id n125sm5634825wme.46.2021.04.14.07.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 07:47:47 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/s390x: Fix translation exception on illegal
 instruction
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <b47fa95d-e54d-f18d-67f3-b0d1179486ba@redhat.com>
Date: Wed, 14 Apr 2021 16:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414134112.25620-2-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.04.21 15:41, Ilya Leoshkevich wrote:
> Hitting an uretprobe in a s390x TCG guest causes a SIGSEGV. What
> happens is:
> 
> * uretprobe maps a userspace page containing an invalid instruction.
> * uretprobe replaces the target function's return address with the
>    address of that page.
> * When tb_gen_code() is called on that page, tb->size ends up being 0
>    (because the page starts with the invalid instruction), which causes
>    virt_page2 to point to the previous page.
> * The previous page is not mapped, so this causes a spurious
>    translation exception.
> 
> tb->size must never be 0: even if there is an illegal instruction, the
> instruction bytes that have been looked at must count towards tb->size.
> So adjust s390x's translate_one() to act this way for both illegal
> instructions and instructions that are known to generate exceptions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/translate.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/target/s390x/translate.c b/target/s390x/translate.c
> index 4f953ddfba..e243624d2a 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/translate.c
> @@ -6412,7 +6412,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           qemu_log_mask(LOG_UNIMP, "unimplemented opcode 0x%02x%02x\n",
>                         s->fields.op, s->fields.op2);
>           gen_illegal_opcode(s);
> -        return DISAS_NORETURN;
> +        ret = DISAS_NORETURN;
> +        goto out;
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> @@ -6428,7 +6429,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           /* privileged instruction */
>           if ((s->base.tb->flags & FLAG_MASK_PSTATE) && (insn->flags & IF_PRIV)) {
>               gen_program_exception(s, PGM_PRIVILEGED);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>   
>           /* if AFP is not enabled, instructions and registers are forbidden */
> @@ -6455,7 +6457,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               }
>               if (dxc) {
>                   gen_data_exception(dxc);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6463,7 +6466,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>           if (insn->flags & IF_VEC) {
>               if (!((s->base.tb->flags & FLAG_MASK_VECTOR))) {
>                   gen_data_exception(0xfe);
> -                return DISAS_NORETURN;
> +                ret = DISAS_NORETURN;
> +                goto out;
>               }
>           }
>   
> @@ -6484,7 +6488,8 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>               (insn->spec & SPEC_r1_f128 && !is_fp_pair(get_field(s, r1))) ||
>               (insn->spec & SPEC_r2_f128 && !is_fp_pair(get_field(s, r2)))) {
>               gen_program_exception(s, PGM_SPECIFICATION);
> -            return DISAS_NORETURN;
> +            ret = DISAS_NORETURN;
> +            goto out;
>           }
>       }
>   
> @@ -6544,6 +6549,7 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
>       }
>   #endif
>   
> +out:
>       /* Advance to the next instruction.  */
>       s->base.pc_next = s->pc_tmp;
>       return ret;
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


