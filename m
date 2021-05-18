Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24683876BC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:40:18 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix97-0008Qy-My
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwsu-0004eG-00
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:23:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1liwsr-0007oB-Uo
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F95w/vcOFb3y1apV22tgyoT2dDrpL3OJRbU2X6HTsrw=;
 b=dRs32MlJDidbpgGAcovc/K2soazydXP5KgD/L55t2V+nE4oA5xkNXmyzjBxIhOBg6YSZFL
 +XUO6ERJFnKdKthDT4xPsjWcpCLPbCCvmd2/67jFx9WNuu0RwrZ3++dYH7nZMZ4dHN3q0a
 idicuHAuYFLOV9zxaj9iKQLJLxjsdpk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-kxQNJ_AzOAq9VupHtV9TFA-1; Tue, 18 May 2021 06:23:27 -0400
X-MC-Unique: kxQNJ_AzOAq9VupHtV9TFA-1
Received: by mail-ed1-f72.google.com with SMTP id
 u14-20020a05640207ceb029038d4bfbf3a6so1927369edy.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F95w/vcOFb3y1apV22tgyoT2dDrpL3OJRbU2X6HTsrw=;
 b=oswM0meqGylEZOxbEEMTDob7+tVIs6b05mL6+u3MEfTod1/N1K/ybiXpHYHHz9QmTJ
 CAEKrZECigFsWj1tlqG08a5Qka414/6ZW6VzXDG8esxvTF63ZFfzOe9LGK5P5PjktRJk
 TtGFV/1bX/owV9PgIn5Dtjw6/+v+Lk+ybZip8s+0LAKwvKLwGxBG7z/YKnJTmeks/UPV
 ywK3ecFwl2MwlKstCSPPIPq6P95PJLwshfEvMhOZ4OYCoQ3dA9MkMrMeMkw0DEDAFZsq
 wDO7EyKp/qppnYfbrT9bNNFTD9byr1ZqiNEOE4/nPQj0UWNjnZ/ZPahZXJegB197O4hm
 2c8w==
X-Gm-Message-State: AOAM530+WYG8vT3m+1XMi4HIMi5qPz7597oB8YFkLvwaJBjjdPMmQF2J
 Th3qXPGQJiQKvqPZDrcWJ/qTJ22K4OWFJxa6ZA0ivVJ+E4sRGlNkiVrJDFUvCTS9uKiTMvS32k/
 FQAp8RiOMcvn0ZSE=
X-Received: by 2002:a17:907:76e8:: with SMTP id
 kg8mr5020668ejc.130.1621333405890; 
 Tue, 18 May 2021 03:23:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg22R3XhyOaRbkxRYg8udhh9zIF6kXsUjbxs3AuzqmGMqcNNvlT8Vl3aMnK1VqO5/AHm6FXQ==
X-Received: by 2002:a17:907:76e8:: with SMTP id
 kg8mr5020656ejc.130.1621333405744; 
 Tue, 18 May 2021 03:23:25 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f26sm6169981ejl.66.2021.05.18.03.23.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:23:25 -0700 (PDT)
Subject: Re: [PATCH v2 50/50] target/i386: Remove user-only i/o stubs
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210514151342.384376-1-richard.henderson@linaro.org>
 <20210514151342.384376-51-richard.henderson@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5c8d4e04-2c35-1713-1a6c-0d4d6c97ac1a@redhat.com>
Date: Tue, 18 May 2021 12:23:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514151342.384376-51-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> With the previous patch for check_io, we now have enough for
> the compiler to dead-code eliminate all of the i/o helpers.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   target/i386/helper.h              |  3 +-
>   target/i386/tcg/translate.c       |  6 ++++
>   target/i386/tcg/user/misc_stubs.c | 55 -------------------------------
>   target/i386/tcg/user/meson.build  |  1 -
>   4 files changed, 7 insertions(+), 58 deletions(-)
>   delete mode 100644 target/i386/tcg/user/misc_stubs.c
> 
> diff --git a/target/i386/helper.h b/target/i386/helper.h
> index 3fd0253298..f3d8c3f949 100644
> --- a/target/i386/helper.h
> +++ b/target/i386/helper.h
> @@ -86,14 +86,13 @@ DEF_HELPER_1(rdtsc, void, env)
>   DEF_HELPER_1(rdtscp, void, env)
>   DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
>   
> +#ifndef CONFIG_USER_ONLY
>   DEF_HELPER_3(outb, void, env, i32, i32)
>   DEF_HELPER_2(inb, tl, env, i32)
>   DEF_HELPER_3(outw, void, env, i32, i32)
>   DEF_HELPER_2(inw, tl, env, i32)
>   DEF_HELPER_3(outl, void, env, i32, i32)
>   DEF_HELPER_2(inl, tl, env, i32)
> -
> -#ifndef CONFIG_USER_ONLY
>   DEF_HELPER_FLAGS_3(check_io, TCG_CALL_NO_WG, void, env, i32, i32)
>   DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
>   DEF_HELPER_2(svm_check_intercept, void, env, i32)
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index bcc642bf6e..08ff3fe232 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -197,8 +197,14 @@ STUB_HELPER(check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 size)
>   STUB_HELPER(clgi, TCGv_env env)
>   STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
>   STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
> +STUB_HELPER(inb, TCGv ret, TCGv_env env, TCGv_i32 port)
> +STUB_HELPER(inw, TCGv ret, TCGv_env env, TCGv_i32 port)
> +STUB_HELPER(inl, TCGv ret, TCGv_env env, TCGv_i32 port)
>   STUB_HELPER(monitor, TCGv_env env, TCGv addr)
>   STUB_HELPER(mwait, TCGv_env env, TCGv_i32 pc_ofs)
> +STUB_HELPER(outb, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
> +STUB_HELPER(outw, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
> +STUB_HELPER(outl, TCGv_env env, TCGv_i32 port, TCGv_i32 val)
>   STUB_HELPER(rdmsr, TCGv_env env)
>   STUB_HELPER(read_crN, TCGv ret, TCGv_env env, TCGv_i32 reg)
>   STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
> diff --git a/target/i386/tcg/user/misc_stubs.c b/target/i386/tcg/user/misc_stubs.c
> deleted file mode 100644
> index df38b44d6e..0000000000
> --- a/target/i386/tcg/user/misc_stubs.c
> +++ /dev/null
> @@ -1,55 +0,0 @@
> -/*
> - *  x86 misc helpers
> - *
> - *  Copyright (c) 2003 Fabrice Bellard
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#include "qemu/osdep.h"
> -#include "cpu.h"
> -#include "exec/helper-proto.h"
> -
> -void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
> -{
> -    g_assert_not_reached();
> -}
> -
> -target_ulong helper_inb(CPUX86State *env, uint32_t port)
> -{
> -    g_assert_not_reached();
> -    return 0;
> -}
> -
> -void helper_outw(CPUX86State *env, uint32_t port, uint32_t data)
> -{
> -    g_assert_not_reached();
> -}
> -
> -target_ulong helper_inw(CPUX86State *env, uint32_t port)
> -{
> -    g_assert_not_reached();
> -    return 0;
> -}
> -
> -void helper_outl(CPUX86State *env, uint32_t port, uint32_t data)
> -{
> -    g_assert_not_reached();
> -}
> -
> -target_ulong helper_inl(CPUX86State *env, uint32_t port)
> -{
> -    g_assert_not_reached();
> -    return 0;
> -}
> diff --git a/target/i386/tcg/user/meson.build b/target/i386/tcg/user/meson.build
> index 3555b15bdd..1df6bc4343 100644
> --- a/target/i386/tcg/user/meson.build
> +++ b/target/i386/tcg/user/meson.build
> @@ -1,5 +1,4 @@
>   i386_user_ss.add(when: ['CONFIG_TCG', 'CONFIG_USER_ONLY'], if_true: files(
>     'excp_helper.c',
> -  'misc_stubs.c',
>     'seg_helper.c',
>   ))
> 


