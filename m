Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABD8387640
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:15:03 +0200 (CEST)
Received: from localhost ([::1]:53608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwkg-0003HU-Np
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwOD-00035w-J3
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwNy-00063d-LI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621331494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bYhmD638ZmZwaAaZroqcqHOcLa8kgTxzhCeknHp3iLQ=;
 b=Wz/JsKo0q+1a3uZC6vNZHIvkYWt/Ya+Z+GLxrwwXw+HsyPO9VsgwUqUTmYqLftDLlE9I3i
 ZEMTzGMRJIHLwaRss2JxLGkYFs/1UdJZDqOLOmKySjQNQr2qt+y4xOZkYWcJktWXmb+U+M
 MxQ0BDeQ3abG8bUUpb8fF69KTHjhI6Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-obsJCcXSOi6gJLaMuwbDgw-1; Tue, 18 May 2021 05:51:31 -0400
X-MC-Unique: obsJCcXSOi6gJLaMuwbDgw-1
Received: by mail-ed1-f70.google.com with SMTP id
 m6-20020aa7c4860000b029038d4e973878so1278305edq.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bYhmD638ZmZwaAaZroqcqHOcLa8kgTxzhCeknHp3iLQ=;
 b=jIQuJVFVMSILUUy67skB8F3rFxf7CCp7vXwaXdrNzOhjA/PTOuckABntd0Nb64EFe+
 qv9hD+lpZ4cT7Otexm5DkfJEk041G5HkktZUKh6f3/qrjWhIfeKvJTUQPDzO9IcZspST
 dSpqBGcqr5PEC/yal6QRf8hIZ9NP7Uog68RKjLEynNERoODwwq+qfXsEUJY9YVI87ksA
 ROaosvsi2RF/lVsynn2cLiJkoOnDq2dfdEpsu2+0Hy6llVTAO2IAo45x3HkBD0N74qRX
 KewGLqkNZSOx4Lajxu2y/sdZ6xHLFZXs+ZqAikMPZf3O14frroWOCmXFdMGfAsEEVH5g
 cGCQ==
X-Gm-Message-State: AOAM5329aO19EjGYvkm4Oxm/InatKgQm0F/UqtWpDwybFS4AdkCFwqm/
 eNuJreX2k/3rZPt2j5pH79UEhY7diqm44jQo0Dl+HeD/BVQ1h0DBCROY7tMQs9Iheloos7m5sVY
 UoNeGx62K43ZZGPg=
X-Received: by 2002:a17:907:20a7:: with SMTP id
 pw7mr5218175ejb.39.1621331489939; 
 Tue, 18 May 2021 02:51:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzJrrnINcAJoa0wrrVYUB3veLCwfwClo+hXVL3xlyOFE3II18WtL3OCrjJer9RNwWjNL7seA==
X-Received: by 2002:a17:907:20a7:: with SMTP id
 pw7mr5218166ejb.39.1621331489804; 
 Tue, 18 May 2021 02:51:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n13sm2010061ejk.97.2021.05.18.02.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:51:28 -0700 (PDT)
Subject: Re: [PATCH v2 31/50] target/i386: Assert !GUEST for user-only
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-32-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4fbb0525-5e09-7c8f-9f8b-f6fd73f927dd@redhat.com>
Date: Tue, 18 May 2021 11:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-32-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cfontana@suse.de, f4bug@amsat.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/05/21 17:13, Richard Henderson wrote:
> For user-only, we do not need to check for VMM intercept.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

>   target/i386/tcg/translate.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index f58e0f480a..57ae515796 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -139,11 +139,13 @@ typedef struct DisasContext {
>   #define CPL(S)    3
>   #define IOPL(S)   0
>   #define SVME(S)   false
> +#define GUEST(S)  false
>   #else
>   #define PE(S)     (((S)->flags & HF_PE_MASK) != 0)
>   #define CPL(S)    ((S)->cpl)
>   #define IOPL(S)   ((S)->iopl)
>   #define SVME(S)   (((S)->flags & HF_SVME_MASK) != 0)
> +#define GUEST(S)  (((S)->flags & HF_GUEST_MASK) != 0)
>   #endif
>   #if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
>   #define VM86(S)   false
> @@ -677,7 +679,7 @@ static void gen_check_io(DisasContext *s, MemOp ot, target_ulong cur_eip,
>               tcg_abort();
>           }
>       }
> -    if(s->flags & HF_GUEST_MASK) {
> +    if (GUEST(s)) {
>           gen_update_cc_op(s);
>           gen_jmp_im(s, cur_eip);
>           svm_flags |= (1 << (4 + ot));
> @@ -2417,8 +2419,9 @@ gen_svm_check_intercept_param(DisasContext *s, target_ulong pc_start,
>                                 uint32_t type, uint64_t param)
>   {
>       /* no SVM activated; fast case */
> -    if (likely(!(s->flags & HF_GUEST_MASK)))
> +    if (likely(!GUEST(s))) {
>           return;
> +    }
>       gen_update_cc_op(s);
>       gen_jmp_im(s, pc_start - s->cs_base);
>       gen_helper_svm_check_intercept_param(cpu_env, tcg_const_i32(type),
> @@ -8517,6 +8520,7 @@ static void i386_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>       g_assert(LMA(dc) == ((flags & HF_LMA_MASK) != 0));
>       g_assert(ADDSEG(dc) == ((flags & HF_ADDSEG_MASK) != 0));
>       g_assert(SVME(dc) == ((flags & HF_SVME_MASK) != 0));
> +    g_assert(GUEST(dc) == ((flags & HF_GUEST_MASK) != 0));
>   
>       dc->cc_op = CC_OP_DYNAMIC;
>       dc->cc_op_dirty = false;
> 


