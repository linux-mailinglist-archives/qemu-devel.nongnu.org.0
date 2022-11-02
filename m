Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85037616364
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:11:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqDJ0-0007Qj-UO; Wed, 02 Nov 2022 08:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDIz-0007QP-3w
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:57:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqDIx-0000kb-An
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667393832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbLpADSIRQQjLuWSODLRB5L2NSbiKEG6TT+kzATkYro=;
 b=WHUQJWcSJ7Q4yZqkSHtiuj3nF9vYm0bpZGqEqsIKbsD9MbW/B7pX2+CAq765q2riJb5cLH
 CKwCzC8uNNRLMw14lg0PRD9NVz1eKHQZnI3b47aPL2f/Njt6NekFe4CLPYc5OSENSx/K2m
 MQRyLqvcnqVZdR/cb4qyr+1x5LtfN+A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-_BRsaRWhMsyno5C-Ppsepg-1; Wed, 02 Nov 2022 08:57:11 -0400
X-MC-Unique: _BRsaRWhMsyno5C-Ppsepg-1
Received: by mail-ej1-f71.google.com with SMTP id
 jg27-20020a170907971b00b007ad9892f5f6so8560988ejc.7
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbLpADSIRQQjLuWSODLRB5L2NSbiKEG6TT+kzATkYro=;
 b=oYoDBrTn6/lLG8kDqNvIYmX3j84XzqSqz6eVpP6Ysv1WdpchaiJtfo6LoKZeltRGzr
 PsfR4ar8YqUXL6hHsrUp4BMLA1Vx1F6AmQH80gLL8gllfBCtHje6ZPjKn+I9QD0pPVZ7
 e6O0lTTio8Jqz6SC4qH1a17x+5mOriZULLk6JNMDfM2DJJfPopeL7GOvUUBURCMBeX04
 tjCMcC+PaCMD+n8c2a5wPrhAl+ronkEXj2AiATWmsk5tLB3suE31yAS72i6d3luuPvJy
 B8lCKH2kOvOTm5f4BgqvrohMKpnyPTFbgZr21++YWPtnh4vsi4l9qPf1fygKodaPkbs1
 ZP2Q==
X-Gm-Message-State: ACrzQf0q7B10xm9xU8v1GNG+gNCtP3+YxzfkGSAePR6X8/6x2ASr6IjL
 XMd/6tLD/gEQwLgSiOCbRzc/zy3cW6JfAwNwTb8wchHrzkPxJeKr1Vwe1XZXb7ilikl2WE6AnV7
 yU3o4wG4zD+yLIn8=
X-Received: by 2002:a17:907:25c1:b0:77b:9966:ccf1 with SMTP id
 ae1-20020a17090725c100b0077b9966ccf1mr24092102ejc.763.1667393828650; 
 Wed, 02 Nov 2022 05:57:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4PLMTvQWW3dH2q7tEioguJb6aUfJlSXb6jwiKd5Dh+GFhuUcmUw7r+bUsBYQKrRg0kwlWc3g==
X-Received: by 2002:a17:907:25c1:b0:77b:9966:ccf1 with SMTP id
 ae1-20020a17090725c100b0077b9966ccf1mr24092081ejc.763.1667393828418; 
 Wed, 02 Nov 2022 05:57:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 y19-20020a056402135300b0045d59e49acbsm5789469edw.7.2022.11.02.05.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 05:57:07 -0700 (PDT)
Message-ID: <de44c343-b800-340b-13bd-23d80f7e27e1@redhat.com>
Date: Wed, 2 Nov 2022 13:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] target/i386: Fix test for paging enabled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: eduardo@habkost.net, Andreas Gustafsson <gson@gson.org>
References: <20221102091232.1092552-1-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221102091232.1092552-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/2/22 10:12, Richard Henderson wrote:
> If CR0.PG is unset, pg_mode will be zero, but that is not the
> only condition for which pg_mode will be zero.  Restore the
> correct test for paging enabled.
> 
> Fixes: 98281984a37 ("target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1269
> Reported-by: Andreas Gustafsson <gson@gson.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/sysemu/excp_helper.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
> index d51b5d7431..405a5d414a 100644
> --- a/target/i386/tcg/sysemu/excp_helper.c
> +++ b/target/i386/tcg/sysemu/excp_helper.c
> @@ -553,12 +553,12 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
>           break;
>   
>       default:
> -        in.cr3 = env->cr[3];
> -        in.mmu_idx = mmu_idx;
> -        in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
> -        in.pg_mode = get_pg_mode(env);
> +        if (likely(env->cr[0] & CR0_PG_MASK)) {
> +            in.cr3 = env->cr[3];
> +            in.mmu_idx = mmu_idx;
> +            in.ptw_idx = use_stage2 ? MMU_NESTED_IDX : MMU_PHYS_IDX;
> +            in.pg_mode = get_pg_mode(env);
>   
> -        if (likely(in.pg_mode)) {
>               if (in.pg_mode & PG_MODE_LMA) {
>                   /* test virtual address sign extension */
>                   int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;

Queued, thanks.

Paolo


