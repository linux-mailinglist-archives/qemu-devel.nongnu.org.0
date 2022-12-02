Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D656406DC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 13:32:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p15Cu-00013D-Ph; Fri, 02 Dec 2022 07:31:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p15Cp-00012k-QU
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:31:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p15Cn-0006yw-VO
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 07:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669984309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KyB9aSCNSkERchkxL9mToF9eJgfLA3h8asioHCp50Bk=;
 b=JFFZYPYpOtnLXTe/0mW65pg1y91ZRi0FRxrVzJrBdAq80NJWA85Q9mWkA+ylarbTezvxUL
 eBc4hQBe3vLS4zoAKJr3qfcCnf+br3ZL52TfeedCDbeyt+8ye4E/vbWGvjtu8DfIdpNYTb
 bxZ3OwBSUBZXs7tGhyfu+Tf2/nPEq8E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-Zm9eKFQdM0S-LV7oPrusBw-1; Fri, 02 Dec 2022 07:31:47 -0500
X-MC-Unique: Zm9eKFQdM0S-LV7oPrusBw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q13-20020adfab0d000000b002420132f543so1036081wrc.19
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 04:31:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KyB9aSCNSkERchkxL9mToF9eJgfLA3h8asioHCp50Bk=;
 b=M4Wa6pf64l/bhWDxi8nx1qezfNKX5I+A/a+bQW00OinVR58X5oDNYfBUMIHdDrQ7mM
 U7DnrNrtTBjyuk6yw+CCU0Ywq+ip0S3C2eVhb25lxLytBcJ4CZXOzQOgMEnOM0uQAPVs
 jwe8vvGJ0d/1CgE3ekl5+7XF1xVI61dDkLaqjlAwTqe5KS245Tm2pBmG1p5idSe5HEbn
 m6j9NijDIQlo72CxYLsaZiVIXnmtM5LFJ2u7p8ttPu6SalAjq0tj0ig3eifep+JtmA+E
 fyUgqQjdwfqw+SdOpcsaxVuT7B/iW9TfBnhnjM1oz/QHpMhUfMW7YNgPXCX3lkfhitk6
 /MRw==
X-Gm-Message-State: ANoB5plW1Hb3uJFYBMWt4J/EOyMZpVdWG+qkmHwhPgOVq7eppnkyKlzj
 18A5hjFJDNJqbdpbCid9SKpFJnqu9D5uB0ws7EkthsD/gqSIqgffrFdZqr54fVVtGTs/8joIeUM
 h7POhppbQcz55hkU=
X-Received: by 2002:adf:e50f:0:b0:22c:cc75:5aab with SMTP id
 j15-20020adfe50f000000b0022ccc755aabmr42334177wrm.143.1669984306044; 
 Fri, 02 Dec 2022 04:31:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5oazFz+k9TxdZub9qC2AO7nL2Vzpmo5HMbYhfBfZX9S9aBhCUZ+bR98jxcH7feCUBG/OMNoQ==
X-Received: by 2002:adf:e50f:0:b0:22c:cc75:5aab with SMTP id
 j15-20020adfe50f000000b0022ccc755aabmr42334164wrm.143.1669984305751; 
 Fri, 02 Dec 2022 04:31:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:7a00:852e:72cd:ed76:d72f?
 (p200300cbc7037a00852e72cded76d72f.dip0.t-ipconnect.de.
 [2003:cb:c703:7a00:852e:72cd:ed76:d72f])
 by smtp.gmail.com with ESMTPSA id
 o16-20020adfead0000000b00241cfa9333fsm7055979wrn.5.2022.12.02.04.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 04:31:45 -0800 (PST)
Message-ID: <f3bf635a-3f37-6a90-5409-134a3eb58acb@redhat.com>
Date: Fri, 2 Dec 2022 13:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 for-8.0] target/s390x/tcg: Fix and improve the SACF
 instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
References: <20221201184443.136355-1-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221201184443.136355-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 01.12.22 19:44, Thomas Huth wrote:
> The SET ADDRESS SPACE CONTROL FAST instruction is not privileged, it can be
> used from problem space, too. Just the switching to the home address space
> is privileged and should still generate a privilege exception. This bug is
> e.g. causing programs like Java that use the "getcpu" vdso kernel function
> to crash (see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=990417#26 ).
> 
> While we're at it, also check if DAT is not enabled. In that case the
> instruction is supposed to generate a special operation exception.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/655
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/s390x/tcg/insn-data.h.inc | 2 +-
>   target/s390x/tcg/cc_helper.c     | 7 +++++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/insn-data.h.inc b/target/s390x/tcg/insn-data.h.inc
> index 7e952bdfc8..54d4250c9f 100644
> --- a/target/s390x/tcg/insn-data.h.inc
> +++ b/target/s390x/tcg/insn-data.h.inc
> @@ -1365,7 +1365,7 @@
>   /* SERVICE CALL LOGICAL PROCESSOR (PV hypercall) */
>       F(0xb220, SERVC,   RRE,   Z,   r1_o, r2_o, 0, 0, servc, 0, IF_PRIV | IF_IO)
>   /* SET ADDRESS SPACE CONTROL FAST */
> -    F(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0, IF_PRIV)
> +    C(0xb279, SACF,    S,     Z,   0, a2, 0, 0, sacf, 0)
>   /* SET CLOCK */
>       F(0xb204, SCK,     S,     Z,   0, m2_64a, 0, 0, sck, 0, IF_PRIV | IF_IO)
>   /* SET CLOCK COMPARATOR */
> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
> index b2e8d3d9f5..b36f8cdc8b 100644
> --- a/target/s390x/tcg/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -487,6 +487,10 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
>   {
>       HELPER_LOG("%s: %16" PRIx64 "\n", __func__, a1);
>   
> +    if (!(env->psw.mask & PSW_MASK_DAT)) {
> +        tcg_s390_program_interrupt(env, PGM_SPECIAL_OP, GETPC());
> +    }
> +
>       switch (a1 & 0xf00) {
>       case 0x000:
>           env->psw.mask &= ~PSW_MASK_ASC;
> @@ -497,6 +501,9 @@ void HELPER(sacf)(CPUS390XState *env, uint64_t a1)
>           env->psw.mask |= PSW_ASC_SECONDARY;
>           break;
>       case 0x300:
> +        if ((env->psw.mask & PSW_MASK_PSTATE) != 0) {
> +            tcg_s390_program_interrupt(env, PGM_PRIVILEGED, GETPC());
> +        }
>           env->psw.mask &= ~PSW_MASK_ASC;
>           env->psw.mask |= PSW_ASC_HOME;
>           break;


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


