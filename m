Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DC5A62EF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:11:32 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT05a-0002UF-Oe
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT02E-0006mv-Gr
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:08:02 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT02C-000649-P0
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:08:02 -0400
Received: by mail-pj1-x1031.google.com with SMTP id q3so7685941pjg.3
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=v2mknBGhh4NgL0POsOtBxzJobMgZrQHRFaoFPemT8pk=;
 b=B0tZHe+7+qPY849awdirRCKSKCLXrF6VEY4BzOSS1DzxzpVbhejWr77Va7noQ31ntP
 FPoJDzUqjafhTfuKAugUltNorwcDsB/Tn+Kg40rqeF1HwmD7QxDU58lgrFjsEqVwK0Sv
 EgBJXkFrE/HEIZ4QBsNC1EyYFnKS3PF/RTF43JFnx5h/LAgRlpAIWcJxtobymK1gqccW
 8IeivJOopOq0O1+gSzxwmVhP75M4l314iqMoway4iGwZ1nA7JlPANIOHJdQhsYM51R8d
 C+mmIy5J2pvnwv5bBkrKKc5id6QV0W0lsn6LOsyJug+XgdQHdhYED+LMwEfl05hXfZu6
 e09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=v2mknBGhh4NgL0POsOtBxzJobMgZrQHRFaoFPemT8pk=;
 b=N0RIY+q1kaYlRZ9ggsjAK3OQT7mg6h6YOC2DfiDSoX1Q7GpDMYGONGN3MLPmYKOAGF
 xlRBxAYDXmTuv3/ruSmhhZdgvvpddHcRAfUSQmeTglLsWUtlkZ1Fn3T8KZVeXsDU0EA9
 97IW4qlcUCE2xlMin/Tg4kW5NZ8JoDJVEbqSbjf1WZI12OBGn7oXo+6JSQcbhjxZdykd
 1sPpOJGB3JDyNWWMfCiXZAVKKil0EeU+oXWTm4if54G7PxZd0Piwxcb0y1Lg3qywG7ro
 ytOlRcXJGki3otT1rrCK94GxuRSnUvXAXYrO4jtIiZVFLSY80tH85sLMflloKezTlzQb
 3QUw==
X-Gm-Message-State: ACgBeo3iSCUPABwodUp6zaxD1B4x7ANw+KRJCUmjepDz/+wTYvcEtoq3
 VHrfewslcSQ3gnkIkUH3rkzif3Ooacs=
X-Google-Smtp-Source: AA6agR60TB5hm3EGwVk7HS41n1H24Dgnk05tQNsLGTJQn3eqDgt7C+/8o5+AZlfwieKt9QThMZbG2A==
X-Received: by 2002:a17:902:bd08:b0:16d:4230:cb45 with SMTP id
 p8-20020a170902bd0800b0016d4230cb45mr20881725pls.59.1661861279098; 
 Tue, 30 Aug 2022 05:07:59 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a170902a3cb00b001745919b197sm7813262plb.243.2022.08.30.05.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:07:58 -0700 (PDT)
Message-ID: <8fd4c34c-f010-a5ec-af54-3bb8e17f0ad4@amsat.org>
Date: Tue, 30 Aug 2022 14:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2] KVM: dirty ring: add missing memory barrier
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Gavin Shan <gshan@redhat.com>
References: <20220827082218.214001-1-pbonzini@redhat.com>
In-Reply-To: <20220827082218.214001-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 27/8/22 10:22, Paolo Bonzini wrote:
> The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
> the read of the fields are not ordered after the read of the flag,
> QEMU might see stale values.
> 
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 8d81ab74de..136c8eaed3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -719,7 +719,11 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
>   
>   static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   {
> -    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
> +    /*
> +     * Read the flags before the value.  Pairs with barrier in
> +     * KVM's kvm_dirty_ring_push() function.
> +     */
> +    return qatomic_load_acquire(&gfn->flags) == KVM_DIRTY_GFN_F_DIRTY;
>   }
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


