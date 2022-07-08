Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D456B853
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 13:21:40 +0200 (CEST)
Received: from localhost ([::1]:37884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9m3H-0000Au-9t
	for lists+qemu-devel@lfdr.de; Fri, 08 Jul 2022 07:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lwL-0001ac-6v
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:14:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1o9lwI-0003NU-I8
 for qemu-devel@nongnu.org; Fri, 08 Jul 2022 07:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657278865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cXdNhbyMKGK5OvK1Us66ddOoSgCT4nTPK8hEXBdNMOs=;
 b=IM3pgVF+rvOC39VprdPh/rCrGESLkurzXvqb0T0gNlkyOfNK4wnxT9bS3WicH86MB/saiD
 CPMrmZ6h99t9W8e6nHp9BO0v3Tp3GGys1Z0ZPNJZquB2XwhxJBHYiiWm0fvymkeY0dXRwL
 2cRCKJ6NWV0M74DPEWnMA/9Gd0fXvKk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-8JssKQPfNXGhyRxOEEvxQQ-1; Fri, 08 Jul 2022 07:14:17 -0400
X-MC-Unique: 8JssKQPfNXGhyRxOEEvxQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 az35-20020a05600c602300b003a1867d09b5so1498438wmb.0
 for <qemu-devel@nongnu.org>; Fri, 08 Jul 2022 04:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=cXdNhbyMKGK5OvK1Us66ddOoSgCT4nTPK8hEXBdNMOs=;
 b=3TXARjwjflPfIzQ+zkMyC10qAFgs4RBrRS+eqRdqAWmk1v0/MWAjQRsKROclisjs4n
 Zp4qVV2ossKWtKqAMItdWnV/v2q3JDENRkFn6FvgydpbCWN+1uxAdnxDfPv+WhpvgfMq
 pF0iCYcuksZ9VnznAn8DG0juvUzsCktZ4o0ncjw0UHNzkCzFhM3ubZX/hVWpoOBQv/CO
 a3a2AdJg3M9NJ2NMa19z3dSEUEvZUdWGuNH/Q70aupHB2ceZLLwDwo3cCf6oPhYE5Obx
 o2kR4QJrLtfrr/AZTZy22XwuYv3dv/7fWpc9S3wy/9SuhIKVr9SEQt7GhJ9TuerCqn7X
 ttmw==
X-Gm-Message-State: AJIora9uTRb2on/smUpo1xeeFEeaQOsMRd90ZUP6urynb0E15ajenosr
 G5SNfILYIYvavjBtl5s7bRdlGglDGcqCPRyobRLG+o9CNsd/+LkRiah/+i/yeoRthmfZ4tWwURE
 YAIAMhrxXoq3Ajtc=
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id
 bg34-20020a05600c3ca200b003a018252e6bmr9916907wmb.132.1657278855779; 
 Fri, 08 Jul 2022 04:14:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTI5pvS/rzuFGl1cXE7Tya692fC4kb8iZtlUYXLEM7WIc1tFmMmZ0F9Ss+Bt4PIRiiSLjv0A==
X-Received: by 2002:a05:600c:3ca2:b0:3a0:1825:2e6b with SMTP id
 bg34-20020a05600c3ca200b003a018252e6bmr9916891wmb.132.1657278855549; 
 Fri, 08 Jul 2022 04:14:15 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:6300:c44f:789a:59b5:91e9?
 (p200300cbc7026300c44f789a59b591e9.dip0.t-ipconnect.de.
 [2003:cb:c702:6300:c44f:789a:59b5:91e9])
 by smtp.gmail.com with ESMTPSA id
 b15-20020adff90f000000b0021b90cc66a1sm40624391wrr.2.2022.07.08.04.14.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 04:14:15 -0700 (PDT)
Message-ID: <3110fdcb-55dc-17e5-3bad-27493ea173cb@redhat.com>
Date: Fri, 8 Jul 2022 13:14:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] target/s390x: Remove DISAS_GOTO_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: svens@linux.ibm.com, qemu-s390x@nongnu.org
References: <20220702060228.420454-1-richard.henderson@linaro.org>
 <20220702060228.420454-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220702060228.420454-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 02.07.22 08:02, Richard Henderson wrote:
> There is nothing to distinguish this from DISAS_NORETURN.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/s390x/tcg/translate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index fd2433d625..e38ae9ce09 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -1123,9 +1123,6 @@ typedef struct {
>     exiting the TB.  */
>  #define DISAS_PC_UPDATED        DISAS_TARGET_0
>  
> -/* We have emitted one or more goto_tb.  No fixup required.  */
> -#define DISAS_GOTO_TB           DISAS_TARGET_1
> -
>  /* We have updated the PC and CC values.  */
>  #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
>  
> @@ -1189,7 +1186,7 @@ static DisasJumpType help_goto_direct(DisasContext *s, uint64_t dest)
>          tcg_gen_goto_tb(0);
>          tcg_gen_movi_i64(psw_addr, dest);
>          tcg_gen_exit_tb(s->base.tb, 0);
> -        return DISAS_GOTO_TB;
> +        return DISAS_NORETURN;
>      } else {
>          tcg_gen_movi_i64(psw_addr, dest);
>          per_branch(s, false);
> @@ -1258,7 +1255,7 @@ static DisasJumpType help_branch(DisasContext *s, DisasCompare *c,
>              tcg_gen_movi_i64(psw_addr, dest);
>              tcg_gen_exit_tb(s->base.tb, 1);
>  
> -            ret = DISAS_GOTO_TB;
> +            ret = DISAS_NORETURN;
>          } else {
>              /* Fallthru can use goto_tb, but taken branch cannot.  */
>              /* Store taken branch destination before the brcond.  This
> @@ -6634,7 +6631,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>      DisasContext *dc = container_of(dcbase, DisasContext, base);
>  
>      switch (dc->base.is_jmp) {
> -    case DISAS_GOTO_TB:
>      case DISAS_NORETURN:
>          break;
>      case DISAS_TOO_MANY:

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


