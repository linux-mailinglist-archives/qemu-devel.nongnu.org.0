Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E345A360F
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:42:21 +0200 (CEST)
Received: from localhost ([::1]:48522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrOU-0005vF-3U
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrIU-0001D0-BN
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:36:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrIQ-0002Y6-U4
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:36:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqwaGnDIM81YNxjwtF/q8GtNMk/xi+H9cgP0lvybVZ4=;
 b=BL/HDv3u7l1lMCpKNr192B7scPQWdEb77zDfZUbKZ61y/TzVmgyHUDu46iFgcNRG0PBpJK
 nZhRGOVHIV/U0KDfM5exhShMVzKHXej7fDfHoelrk3YHRRCtZA83HddLcjEPgw+DSrrLEl
 p41aMmOnoH5BwsOsVq2CVTTvFK7o+Ds=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-wCNtjouUPSSImxmFPCCMIA-1; Sat, 27 Aug 2022 04:36:00 -0400
X-MC-Unique: wCNtjouUPSSImxmFPCCMIA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfa1d1000000b0022574d4574aso514368wrv.22
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=WqwaGnDIM81YNxjwtF/q8GtNMk/xi+H9cgP0lvybVZ4=;
 b=MenKTI5B8o860kraYzAL/FA6aJ62peZZSh8Rd4uuYpddnx4YKINjmUs4y9Y9NQsbrx
 78XQYAGJbeKcZQbM8r5TqLDZTQd76EMsusXPDKUOq1z2KSVDPMcLs4aoenpMxkOEz3y9
 OWSUFaPeL8qo+65qF/Z9st4cOInUtVoAspl6FdGuH6bOq5Hf8O7XGbDABJKDrlCOeqfu
 0lpiqicX2r/cONOlJsQ3Wvs4ZRqzjzUDSVvnHQcTDODsjg9x5jaI3q5p1oPKbVcrqNUH
 /HQI9/Oi7H5Ij/fDk5G4UHi4fLzLlvG2ZUq1iw+wBFJX1OYOWRiyH88Hm0pTyDEY4Rnl
 J+3w==
X-Gm-Message-State: ACgBeo3JK/cixslMzJ2GszaJnxwv54UmuNthL98asbS/YD/1lmHSNx6C
 7tK3JbDB7nXATA6Lrxih5Hm/HRhLWBMLDNa4u/RQsi256RDvC6Udvet/ONl/OEZj7KenRdTLya4
 rTWFE9ctHr+cHG6o=
X-Received: by 2002:a1c:7214:0:b0:3a5:ea1c:c55b with SMTP id
 n20-20020a1c7214000000b003a5ea1cc55bmr1846887wmc.190.1661589359444; 
 Sat, 27 Aug 2022 01:35:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5EBTV/JJ8JJ5UEtain6Zh/46+lEURNz4jKJMSe7d8Dfrorb9kUA36jFx44VTIKPZv/iKCgIg==
X-Received: by 2002:a1c:7214:0:b0:3a5:ea1c:c55b with SMTP id
 n20-20020a1c7214000000b003a5ea1cc55bmr1846871wmc.190.1661589359210; 
 Sat, 27 Aug 2022 01:35:59 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d4946000000b00226d2462b32sm881656wrs.52.2022.08.27.01.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:35:58 -0700 (PDT)
Message-ID: <7006f05f-42f0-394f-39c0-f2bc171acfb6@redhat.com>
Date: Sat, 27 Aug 2022 10:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 16/20] disas/nanomips: Replace Cpp enums for C enums
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-17-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-17-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Change enums to typedef enums to keep naming clear
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/nanomips.cpp | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
> index a8cd878809..9406805367 100644
> --- a/disas/nanomips.cpp
> +++ b/disas/nanomips.cpp
> @@ -43,16 +43,16 @@ typedef uint64_t img_address;
>   typedef bool(*conditional_function)(uint64 instruction);
>   typedef const char *(*disassembly_function)(uint64 instruction);
>   
> -enum TABLE_ENTRY_TYPE {
> +typedef enum {
>       instruction,
>       call_instruction,
>       branch_instruction,
>       return_instruction,
>       reserved_block,
>       pool,
> -};
> +} TABLE_ENTRY_TYPE;
>   
> -enum TABLE_ATTRIBUTE_TYPE {
> +typedef enum {
>       MIPS64_    = 0x00000001,
>       XNP_       = 0x00000002,
>       XMMS_      = 0x00000004,
> @@ -70,7 +70,7 @@ enum TABLE_ATTRIBUTE_TYPE {
>       TLB_       = 0x00004000,
>       MVH_       = 0x00008000,
>       ALL_ATTRIBUTES = 0xffffffffull,
> -};
> +} TABLE_ATTRIBUTE_TYPE;

Reviewed-by: Thomas Huth <thuth@redhat.com>


