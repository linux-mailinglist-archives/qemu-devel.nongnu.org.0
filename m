Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E41E2387558
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:41:55 +0200 (CEST)
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwEd-0001XP-0m
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw48-0007sj-LZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liw45-0001Xj-HI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621330257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7At7OCKxkXm/AK9MFOgKC5AH4MkMbOeJk328kQPyJ8=;
 b=e6qh4NHdnO4VoDndDArAYJjlO08ncev1KewD8VB9c/J8EcR29C+J5AWuCRU5IcdCK2L66A
 7FT+I2AMvklGvkSmjFPcS2zASKCo92GBzidBfT5j6MJRlav+FSs6CKrklhKRRIU73+q67F
 PwlLqIMpCV01mE80Fo249sQ09JAK/Vc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-CzASk8CLOiGySRrG2-MY8g-1; Tue, 18 May 2021 05:30:55 -0400
X-MC-Unique: CzASk8CLOiGySRrG2-MY8g-1
Received: by mail-ej1-f69.google.com with SMTP id
 bi3-20020a170906a243b02903933c4d9132so2145786ejb.11
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H7At7OCKxkXm/AK9MFOgKC5AH4MkMbOeJk328kQPyJ8=;
 b=r3kBBfyZek/uxx/bgwBqMaEbPhChfu08uJ3rvli8pjn7+KepYq17hpfrasuB5ehp6B
 gBLRkJx6auynuFF84jo4RAXcOzSnKyCbpwEBUu2purgDKAfjkHiXIzZsUDG7TuOohtRW
 I3UKwkuMwCEWGH1lvEU85v9LErTA155z9g0qUGIa+tbsvYhY5BLzaIlqM1hh9+gGOUAJ
 hYxQOz+WOpyewkDkA2RPRM+zwJAFn06I3SDNqNd1i0HwsXxUcxf1etXVoKcZHldLJ7GN
 Hle2pUMeXgGDS2NLKVXZxp8Pc+mTSXMNtYNL8Qo00RmN4PtxdaSetINcXhez6XgFOv0S
 IfQQ==
X-Gm-Message-State: AOAM531GtF4vxH9kJCR+7NadB3knj7kACLji85zHzdV6aY+bKYppSOPe
 Fo3xh62r+Ay1RqsTEQ2ROmCPZIujLDa2kvwNBRkiyIUtIf+8dj6iwxWGemN/XCWdPdGL/wOu5aZ
 o86W8ug+ZewOoqT0=
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr5891567edc.233.1621330253894; 
 Tue, 18 May 2021 02:30:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9JLhQ5zhdp3DHnriT5n/u8K0dG6IDjmsChR0aXuAZPwrfOgRjJiXMg34/mNRWDGpmUnHHnA==
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr5891555edc.233.1621330253750; 
 Tue, 18 May 2021 02:30:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e23sm11479541edr.80.2021.05.18.02.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 02:30:53 -0700 (PDT)
Subject: Re: [PATCH v2 20/50] target/i386: Reduce DisasContext.flags to
 uint32_t
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-21-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6953a791-bac2-469b-9eab-48f8739032c5@redhat.com>
Date: Tue, 18 May 2021 11:30:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-21-richard.henderson@linaro.org>
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
> The value comes from tb->flags, which is uint32_t.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 7e296b39f5..ca7f0a8cf4 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -105,7 +105,7 @@ typedef struct DisasContext {
>       int jmp_opt; /* use direct block chaining for direct jumps */
>       int repz_opt; /* optimize jumps within repz instructions */
>       int mem_index; /* select memory access functions */
> -    uint64_t flags; /* all execution flags */
> +    uint32_t flags; /* all execution flags */
>       int popl_esp_hack; /* for correct popl with esp base handling */
>       int rip_offset; /* only used in x86_64, but left for simplicity */
>       int cpuid_features;
> 


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


