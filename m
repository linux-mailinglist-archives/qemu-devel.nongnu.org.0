Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAA83F0E2B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:30:30 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGU4r-0006G2-0j
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU3f-0005X1-SZ
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:29:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGU3e-00065H-8E
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:29:15 -0400
Received: by mail-pl1-x62b.google.com with SMTP id l11so2762644plk.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Bh9yC1lJ77oeKW06TqUS+/Qd1I0kS8/uP3kKLTTl64=;
 b=gROQgCFPOU9VwbTRHSv8Paf/PEPu9IdoQbmfzaLWN9Wszu1TOSsbQsx9RJm02033ey
 C/beYnkQ5OjBpl/wlJe22P/yZkKFBWV6tzIsuLo3wSsnBTVqeLJhhCMYpahV9NfQXqtr
 a2R1U18hj8kSEKo1TLLVRe7uf0PfB/STEdqCVhmzDUTvBI9yVaUOLQKZUx1qritfo2y1
 aVumDiRw22ypGZSv9naWCKKsx9+tFS5rslv9Xeo5E2a/pp7GMqEQ1wu8q3C82f4s4Ci0
 VyIgdthGuyPCOfZyxo13V1RBw0ZyUYc7IF2nGTwJL1yN5KVXDS/RmHLtr0UDigP9TLS9
 RoPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Bh9yC1lJ77oeKW06TqUS+/Qd1I0kS8/uP3kKLTTl64=;
 b=SQmFD83B8AGOPxHN8CXg+6k5Cr7mbC8vb6QvW4urLNGsugxhFuZZdyCuOG5/GDyVBO
 rwq9hFYE1rRx0I1KlYwA8dZzyG968nR9UGmm0DyB1x5tO/JqjrTzPyRDM1M+Dxoc1AJT
 tz4hbOCjQf34knHiUhzRUfUzDizTdQ8y75L4b5CFf7JQAgumdk+hmXMKnTcpmtTP9UJc
 yE8xrGmWPR0Qb1CqviorbjQxkf7H6a44gSTbhsgY89PGmKcavPtx7WebkLNfrZZrcpqm
 rCmOagecVF3AvD751wQiztL0mXcc0wkzM+HgpczNsgaLxcGF65fBgpWLE8Qzfpe6TnAv
 oCWg==
X-Gm-Message-State: AOAM5303MfgzAHg/oVLI3jPhkvU2eV4CF0VStvdh0dwCEF8yoOu9g5z5
 EpeRqF9E9uiyNV4023fNqUEioA==
X-Google-Smtp-Source: ABdhPJy8gg2/nLnEktAOhAPglc5V1O6aO5D0J1bVyhKp4og+0QHfQFfSkk2MwsgQXOB9bBOIjyQbuw==
X-Received: by 2002:a17:90a:d98b:: with SMTP id
 d11mr11845636pjv.49.1629325752592; 
 Wed, 18 Aug 2021 15:29:12 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id y4sm6302834pjg.9.2021.08.18.15.29.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:29:12 -0700 (PDT)
Subject: Re: [PATCH 1/5] target/mips: Replace GET_OFFSET() macro by
 get_offset() function
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-2-f4bug@amsat.org>
 <eb7b7211-def7-b2fb-e843-57d0266ea20a@linaro.org>
 <d50fcef1-c2c3-e68a-7ae1-96ba566a4a64@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acb5216f-e628-f123-4e60-ee824c9be40c@linaro.org>
Date: Wed, 18 Aug 2021 12:29:08 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d50fcef1-c2c3-e68a-7ae1-96ba566a4a64@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 11:31 AM, Philippe Mathieu-Daudé wrote:
>>    I think you should drop
>> get_offset() entirely and replace it with
>>
>>      int dir = cpu_is_bigendian(env) ? 1 : -1;
>>
>>      stb(env, arg2 + 1 * dir, data);
>>
>>      stb(env, arg2 + 2 * dir, data);
>>
>> Alternately, bite the bullet and split the function(s) into two,
>> explicitly endian versions: helper_swl_be, helper_swl_le, etc.
> 
> I'll go for the easier path ;)

It's not really more difficult.

static inline void do_swl(env, uint32_t val, target_ulong addr, int midx,
                           int dir, unsigned lmask, uintptr_t ra)
{
     cpu_stb_mmuidx_ra(env, addr, val >> 24, midx, ra);

     if (lmask <= 2) {
         cpu_stb_mmuidx_ra(env, addr + 1 * dir, val >> 16, midx, ra);
     }
     if (lmask <= 1) {
         cpu_stb_mmuidx_ra(env, addr + 1 * dir, val >> 8, midx, ra);
     }
     if (lmask == 0) {
         cpu_stb_mmuidx_ra(env, addr + 1 * dir, val, midx, ra);
     }
}

void helper_swl_be(env, val, addr, midx)
{
     do_swl(env, val, addr, midx, 1, addr & 3, GETPC());
}

void helper_swl_le(env, val, addr, midx)
{
     do_swl(env, val, addr, midx, -1, ~addr & 3, GETPC());
}

Although I do wonder if this is strictly correct with respect to atomicity.  In my 
tcg/mips unaligned patch set, I assumed that lwl+lwr of an aligned address produces two 
atomic 32-bit loads, which result in a complete atomic load at the end.

Should we be doing something like

void helper_swl_be(env, val, addr, midx)
{
     uintptr_t ra = GETPC();

     switch (addr & 3) {
     case 0:
         cpu_stl_be_mmuidx_ra(env, val, addr, midx, ra);
         break;
     case 1:
         cpu_stb_mmuidx_ra(env, val >> 24, addr, midx, ra);
         cpu_stw_be_mmuidx_ra(env, val >> 16, addr + 1, midx, ra);
         break;
     case 2:
         cpu_stw_be_mmuidx_ra(env, val >> 16, addr, midx, ra);
         break;
     case 3:
         cpu_stb_mmuidx_ra(env, val >> 24, addr, midx, ra);
         break;
     }
}

void helper_swl_le(env, val, addr, midx)
{
     uintptr_t ra = GETPC();

     /*
      * We want to use stw and stl for atomicity, but want any
      * fault to report ADDR, not the aligned address.
      */
     probe_write(env, addr, 0, midx, ra);

     switch (addr & 3) {
     case 3:
         cpu_stl_le_mmuidx_ra(env, val, addr - 3, midx, ra);
         break;
     case 1:
         cpu_stw_le_mmuidx_ra(env, val >> 16, addr - 1, midx, ra);
         break;
     case 2:
         cpu_stw_le_mmuidx_ra(env, val >> 8, addr - 2, midx, ra);
         /* fall through */
     case 0:
         cpu_stb_mmuidx_ra(env, val >> 24, addr, midx, ra);
         break;
     }
}

etc.


r~

