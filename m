Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C153875EC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:00:53 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwWy-0005Q2-Pl
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw9o-00023y-Fv
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:36:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw9m-0005WA-RA
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTN0yGLbtPzopc9zBVT6PRV8hDfLfbfmzXtEQzDQLL4=;
 b=ODe+2yJmGepK7t22L+Lz5oLodm28bhL/QPMwmVSUgfk+zpt3rg3Mflu4bSMENNHl3tFIAe
 M6XbwHF+3sfF9DLUNlWHTRzC7FwE0wKNIXILfP9XX7BLnP58ESOupNPmLR239JrH3F/TVz
 qX7Wq7aR/wkwqePAFQ/E6Mu08dEs3+8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-tTSZgJEWNryDz5ITf-yhBw-1; Tue, 18 May 2021 05:36:53 -0400
X-MC-Unique: tTSZgJEWNryDz5ITf-yhBw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d12-20020adfc3cc0000b029011166e2f1a7so4359055wrg.19
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTN0yGLbtPzopc9zBVT6PRV8hDfLfbfmzXtEQzDQLL4=;
 b=jnKlukYjnntBi3iDuQ9Vn1H49DE/iMK7AasC0wxaI4X7E64YuhF3WGV1aONGJ0tlck
 MlI4RtRMZWj8C6T9PD4bC/IgDnUkJ23zw25vahqAgyWm6SI+eO7KSiVj6JKVKC6t8Gpc
 DzPDGcf+Ot4bi59Dw2RcO/4tQYBIfC5HaGQ0U+u5zCFbhqD7+Y88MOA8in2bvjxYYp3c
 a8ZPBEvZrfcv/B0NhEJlCxOAcyrdR6aBOyR0E+l5NcJfH2I/LmPtvQ9PDrzJbEqOTw54
 ZLotfueWqePaRWDn7JRHSU57DIA0KMhNIE+ASYstDsKWgLlTlbEc1BtIUAcjtjIMLum+
 RdEQ==
X-Gm-Message-State: AOAM533lWVI0gmvCVH3Sbjx+ZVZV/aLqmgy7HkNV9/e/LufKxtzG7mvB
 iQQQcsFsnxf4l52y4b/L3+wmCC+9MMtmh0wCz3cYLK3hpCpL9aBOd9Hj2l8/nUoqeHCGEZU1H+m
 H0T2pZ+nYJWr1/0g=
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3943475wmc.31.1621330610847; 
 Tue, 18 May 2021 02:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHgvm7mNxU7rvM3nwKIqBXfSx5GKwv8DaFEITcLiWypqwjHdhENemquBQXO5aHMSDQ29V/Kg==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3943456wmc.31.1621330610641; 
 Tue, 18 May 2021 02:36:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id g5sm7307677wmi.8.2021.05.18.02.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:36:50 -0700 (PDT)
Subject: Re: [PATCH v2 26/50] target/i386: Reduce DisasContext jmp_opt,
 repz_opt to bool
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-27-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f3a7d01-4d34-8814-0298-bcdd5373d341@redhat.com>
Date: Tue, 18 May 2021 11:36:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-27-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 3f6214c624..b9b94f0625 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -101,8 +101,8 @@ typedef struct DisasContext {
>       uint8_t vex_v;  /* vex vvvv register, without 1's complement.  */
>       CCOp cc_op;  /* current CC operation */
>       bool cc_op_dirty;
> -    int jmp_opt; /* use direct block chaining for direct jumps */
> -    int repz_opt; /* optimize jumps within repz instructions */
> +    bool jmp_opt; /* use direct block chaining for direct jumps */
> +    bool repz_opt; /* optimize jumps within repz instructions */
>       int mem_index; /* select memory access functions */
>       uint32_t flags; /* all execution flags */
>       uint8_t popl_esp_hack; /* for correct popl with esp base handling */
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


