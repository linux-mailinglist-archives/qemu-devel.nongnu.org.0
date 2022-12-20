Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA374652707
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 20:31:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7iKa-00071O-4U; Tue, 20 Dec 2022 14:31:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7iKX-0006ze-F0
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:31:13 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7iKS-0003Lo-JI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:31:11 -0500
Received: by mail-pl1-x630.google.com with SMTP id d3so13259959plr.10
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 11:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+znjbDWZNbmBuBtC5PZ+f+hSzD1TCd8qmWDO05PBTYw=;
 b=VcvKV79eDGqv3dgb/guTCyYDae9rZ5i0Xyf5/u2cVJWErVd0Am8eU8WakcEjspdqZQ
 iU49PjYJqjQZ6y5mfPmKdxXJ0ILDx0xYCmOpRWVGN+tehI4/p1FmusBIASqfvnxsOW6S
 rFgDmTDSNUHM/xIKMUCwsm6cn93CZ9ZzRq2BAHkcMWnc7TKX4Mh/Ub7f6ZWkfAS6mr7i
 CEGtJFuaK5/a2G43yoJb5fi57HQWhcOmuZrAFS5f1yly1J9co9SEIEOfm9cswNlAUciX
 /S4VQovBgWorEoV0FUhWb+QDW2YERpdMmf1i7DwNvxBR3RxOBriEJ5tk3ghdcWGnKf1T
 IvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+znjbDWZNbmBuBtC5PZ+f+hSzD1TCd8qmWDO05PBTYw=;
 b=Ubkz/l2whzrJs7e5p8cDWxX2CyZX9UwKR/lpznC8sq+1NT1DX28ilOcUDnMoT8D/nw
 vXCu1HVyiZjxgg4dV0ZoH5Lw8oyWRX2fGe3c0WikUecUkepf7u+AYVwL1MrmJPmejZOS
 ktdNzkYSD3/EMKHfnbAPmYLvRjfrQLl6knXD2RtBjp06+B1lnLTTn/QkXzgpFMGpLDvY
 wmk1d33FCsyLCfcTMSKY7753V/JogeTdLUEppD4n4Kpu84yoI0ymL+ZHxobj6KVvJipB
 hnrG+681scw5T1redfPoSGa/0Th6NKYZkuep6yxo+yUjfspx+87dp5Xip/Qo13xGWNPL
 Mqqw==
X-Gm-Message-State: AFqh2kpeoRVHEh0dnMkZ3ocJlXH+M3DaOaCmriUezKmnXaq0StJ5EbVt
 2bWC4NvYaGXq4jbcPVk45QB7zhdBq+gA2jCx
X-Google-Smtp-Source: AMrXdXtRQjXrvohavKFOhfKSsr4PXJyfQHwpbgcpr0wG7Cw4kqLg7SwkZ7lgkqYJfc5dRRaYe2Eq7g==
X-Received: by 2002:a17:90a:6b06:b0:219:f15d:fe58 with SMTP id
 v6-20020a17090a6b0600b00219f15dfe58mr13885947pjj.13.1671564666069; 
 Tue, 20 Dec 2022 11:31:06 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:3efa:624c:5fb:32c0?
 ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a17090a7ac200b00218f5de49f4sm11641836pjl.1.2022.12.20.11.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 11:31:05 -0800 (PST)
Message-ID: <c6e49899-509d-6c81-1a89-7182c61896ec@linaro.org>
Date: Tue, 20 Dec 2022 11:31:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>
References: <20221217184823.3606676-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20221217184823.3606676-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/17/22 10:48, Richard Henderson wrote:
> Make bsd-user match linux-user in not marking host pages
> as reserved.  This isn't especially effective anyway, as
> it doesn't take into account any heap memory that qemu
> may allocate after startup.
> 
> Cc: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> I started to simply fix up this code to match my user-only interval-tree
> patch set, as L1_MAP_ADDR_SPACE_BITS gets removed from translate-all.c,
> but then I decided to remove it all.

A further justification for this:  The actual PAGE_RESERVED bit is write-only; there is no 
other reference to this bit elsewhere.


r~

> 
> 
> r~
> 
> ---
>   accel/tcg/translate-all.c | 65 ---------------------------------------
>   1 file changed, 65 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index b964ea44d7..48e9d70b4e 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -354,71 +354,6 @@ void page_init(void)
>   {
>       page_size_init();
>       page_table_config_init();
> -
> -#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
> -    {
> -#ifdef HAVE_KINFO_GETVMMAP
> -        struct kinfo_vmentry *freep;
> -        int i, cnt;
> -
> -        freep = kinfo_getvmmap(getpid(), &cnt);
> -        if (freep) {
> -            mmap_lock();
> -            for (i = 0; i < cnt; i++) {
> -                unsigned long startaddr, endaddr;
> -
> -                startaddr = freep[i].kve_start;
> -                endaddr = freep[i].kve_end;
> -                if (h2g_valid(startaddr)) {
> -                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
> -
> -                    if (h2g_valid(endaddr)) {
> -                        endaddr = h2g(endaddr);
> -                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -                    } else {
> -#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
> -                        endaddr = ~0ul;
> -                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -#endif
> -                    }
> -                }
> -            }
> -            free(freep);
> -            mmap_unlock();
> -        }
> -#else
> -        FILE *f;
> -
> -        last_brk = (unsigned long)sbrk(0);
> -
> -        f = fopen("/compat/linux/proc/self/maps", "r");
> -        if (f) {
> -            mmap_lock();
> -
> -            do {
> -                unsigned long startaddr, endaddr;
> -                int n;
> -
> -                n = fscanf(f, "%lx-%lx %*[^\n]\n", &startaddr, &endaddr);
> -
> -                if (n == 2 && h2g_valid(startaddr)) {
> -                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
> -
> -                    if (h2g_valid(endaddr)) {
> -                        endaddr = h2g(endaddr);
> -                    } else {
> -                        endaddr = ~0ul;
> -                    }
> -                    page_set_flags(startaddr, endaddr, PAGE_RESERVED);
> -                }
> -            } while (!feof(f));
> -
> -            fclose(f);
> -            mmap_unlock();
> -        }
> -#endif
> -    }
> -#endif
>   }
>   
>   PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)


