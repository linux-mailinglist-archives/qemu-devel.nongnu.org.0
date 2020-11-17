Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B472B5ADE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 09:20:53 +0100 (CET)
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kewEN-0000tV-TS
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 03:20:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kewDB-0000Ru-Bc
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kewD7-0001ti-9M
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 03:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605601170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3NlJG6JggSAVwVc9zkoiO/jmJ4sIqpWDqforQ4tq8x0=;
 b=QE3yVNvvFbVekvl8mDnZOA1OpN9/xFYVWKaj9U5R/WPEQ3kBQh51VrbMXd6eIgIkKkDMOq
 24vMUIe2z4HYQe+U8FqDpMUbQqdGymzHyigKJOBfbysxoMC57POct4+j2McMukzk/Q1HlU
 fIrNEmeBkD7eStK1F4epZrZAVonEg94=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-bSGAtFVAPB2RvCRBz2H3AA-1; Tue, 17 Nov 2020 03:19:26 -0500
X-MC-Unique: bSGAtFVAPB2RvCRBz2H3AA-1
Received: by mail-wr1-f69.google.com with SMTP id v5so12624134wrr.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 00:19:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3NlJG6JggSAVwVc9zkoiO/jmJ4sIqpWDqforQ4tq8x0=;
 b=lk11gtSi4PKFuOri2yzILsWOsJ9xuirAAvfdEfQK/QJxOLEVR4lD+gutXF55kwHHMQ
 LqsyK+Q10M2A1xR6gVFYahxf9LThrlECw/emlDpFIEunmUJG7CLnrXFchWKoDcqNBizh
 RfkJezka98SHLaJo6H6iTKuEL9OlITZwA+zloX7PyWIBEVhhYa6nx+iI5SltvWdIagmf
 RJSZV3nhN9GxsJuPXhdHSjO9mjeytWXlE7nmv0ri+qZfyYXCHnWpO6X/vMF++zxd0psf
 /O5wc4Mmlv3k++aezHqeLcSh9JythjDaFLAxh82IiMfABozKQHtGXSTOqoqHrXlv/zps
 gY9Q==
X-Gm-Message-State: AOAM532yekP8oGmDee/xKIZtsovWj61z8yXAPgEHOwLR6TQZkIpxVoHa
 8jQVoOrhQ09tea97YM3Px5gytIZerfrvYAmengE5q5uiukD43O35O5eakH5UBsiA8MXcbzHMLMl
 X7CEFZDMncxRlcQQ=
X-Received: by 2002:a5d:5482:: with SMTP id h2mr12856350wrv.18.1605601165645; 
 Tue, 17 Nov 2020 00:19:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8QFZ+I/yokdCUWNICN8nLAo4krkgR2Z/sCc5PFgsLDeLqNR1e7bgcEJFtuRDffv7oxIX2iw==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr12856326wrv.18.1605601165408; 
 Tue, 17 Nov 2020 00:19:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g138sm2293538wme.39.2020.11.17.00.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:19:24 -0800 (PST)
Subject: Re: [PATCH] hvf: Fix value of MMU_PAGE_NX and add MMU_PAGE_RS
To: Jessica Clarke <jrtc27@jrtc27.com>, qemu-devel@nongnu.org
References: <20201116201322.29262-1-jrtc27@jrtc27.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddd4e2a1-0967-afca-6853-beb68ab56984@redhat.com>
Date: Tue, 17 Nov 2020 09:19:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116201322.29262-1-jrtc27@jrtc27.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/11/20 21:13, Jessica Clarke wrote:
> These are meant to correspond to the error code reported for #PF, so fix
> the definition for Instruction Fetch faults and add one for Reserved Bit
> faults (checking for that is currently a TODO in x86_mmu.c).
> 
> Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> ---
>   target/i386/hvf/x86_mmu.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/hvf/x86_mmu.h b/target/i386/hvf/x86_mmu.h
> index cd6e137e79..710adb82b5 100644
> --- a/target/i386/hvf/x86_mmu.h
> +++ b/target/i386/hvf/x86_mmu.h
> @@ -34,7 +34,8 @@
>   #define MMU_PAGE_PT             (1 << 0)
>   #define MMU_PAGE_WT             (1 << 1)
>   #define MMU_PAGE_US             (1 << 2)
> -#define MMU_PAGE_NX             (1 << 3)
> +#define MMU_PAGE_RS             (1 << 3)
> +#define MMU_PAGE_NX             (1 << 4)
>   
>   bool mmu_gva_to_gpa(struct CPUState *cpu, target_ulong gva, uint64_t *gpa);

Since you are at it, can you instead replace these flags with 
PG_ERROR_{P,W,U,RSVD,I_D}_MASK from cpu.h?

Thanks,

Paolo


