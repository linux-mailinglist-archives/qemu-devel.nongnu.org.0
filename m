Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F416779CD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 12:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJue2-0003Kb-OC; Mon, 23 Jan 2023 06:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJue0-0003KQ-RB
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pJudz-0007bA-0p
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 06:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674471942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQFDL9w0J/l/rHZFKU5yaDJhFDMapRpssKMGglkUK4M=;
 b=BNwNZMqUDUwI1hTAB/XXXf6SJXFG4KguWpfhZcVKNvb4zxgACDgYWm9XOkFyFfo8Lop7SK
 ooubJEKWsNm1wnAyqm9rQSZe1Dur5KQd1TbJtQD/LQWoDONGurJxoSkt7Jtz32B/KH9H5L
 Xq0yRc27SPBBsnOJwBPAoZ8To6/Jz9s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-321-L4TJBUU_MeyoTkS-Nfeb9Q-1; Mon, 23 Jan 2023 06:05:39 -0500
X-MC-Unique: L4TJBUU_MeyoTkS-Nfeb9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 n16-20020a05600c3b9000b003db127e03c5so3256037wms.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 03:05:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQFDL9w0J/l/rHZFKU5yaDJhFDMapRpssKMGglkUK4M=;
 b=heirog4MApa213i/9Fx8gELt6lkILgQNieYrIoH+Ynm66E/78Xw21GklfK25aydMXq
 n2w7Do6RIAr8AH2dqgM2uW72hmJybPvQJihqewA+qMQLejcQRy03P0K971pz7us2CNPc
 7Ej0hyTEs7qUiO2Oq9aPwqs3bug4d3BpnW2BqHk7VW1znhEYwN64XcqSwFsNmyv0V07q
 TfPrmb+YwlG2aIs624WPezYmy0HZl+ZF/qB8JUv3K1aov+Lnp+hvYCqsM4HVfaW9uEVf
 nk8geQ+lVOTM45IzmxVexPtccrX5zODh19KDeyCvDKLw/eOYYb+1LXn+hSc2LBJDkqPI
 zdZg==
X-Gm-Message-State: AFqh2krt77k/hmYnVmFI7lVhFjrCYX1hly5ouve6aOiiVTfBmIpV2AVM
 56jwHbo90FGtNls2JL4OcVmRi8CPLX1YU4VLkPsfUPsybKkCFPwfOaZ55zyUBwel8c3wAScplzg
 if7S7WAUC+KKPMKE=
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id
 n13-20020a05600c4f8d00b003d33d1b6354mr20380486wmq.3.1674471938001; 
 Mon, 23 Jan 2023 03:05:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuqrRPNFUHw0ojZUqdRQbG2Hbi8VMpoLsyY5sXapUXJtnMLkjWs5VzAgIq4LZ2Z0mAFTWitZA==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id
 n13-20020a05600c4f8d00b003d33d1b6354mr20380464wmq.3.1674471937700; 
 Mon, 23 Jan 2023 03:05:37 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:1100:65a0:c03a:142a:f914?
 (p200300cbc704110065a0c03a142af914.dip0.t-ipconnect.de.
 [2003:cb:c704:1100:65a0:c03a:142a:f914])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003db2b81660esm10615144wmo.21.2023.01.23.03.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 03:05:37 -0800 (PST)
Message-ID: <03656161-1299-c362-89c3-3af7ccc1c691@redhat.com>
Date: Mon, 23 Jan 2023 12:05:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] coverity: physmem: use simple assertions instead of
 modelling
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: philmd@linaro.org, peterx@redhat.com, pbonzini@redhat.com,
 peter.maydell@linaro.org, armbru@redhat.com
References: <20221226220351.754204-1-vsementsov@yandex-team.ru>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20221226220351.754204-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.149, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26.12.22 23:03, Vladimir Sementsov-Ogievskiy wrote:
> Unfortunately Coverity doesn't follow the logic aroung "len" and "l"
> variables in stacks finishing with flatview_{read,write}_continue() and
> generate a lot of OVERRUN false-positives. When small buffer (2 or 4
> bytes) is passed to mem read/write path, Coverity assumes the worst
> case of sz=8 in stn_he_p()/ldn_he_p() (defined in
> include/qemu/bswap.h), and reports buffer overrun.
> 
> To silence these false-positives we have model functions, which hide
> real logic from Coverity.
> 
> However, it turned out that these new two assertions are enough to
> quiet Coverity.
> 
> Assertions are better than hiding the logic, so let's drop the
> modelling and move to assertions for memory r/w call stacks.
> 
> After patch, the sequence
> 
>   cov-make-library --output-file /tmp/master.xmldb \
>      scripts/coverity-scan/model.c
>   cov-build --dir ~/covtmp/master make -j9
>   cov-analyze --user-model-file /tmp/master.xmldb \
>      --dir ~/covtmp/master --all --strip-path "$(pwd)
>   cov-format-errors --dir ~/covtmp/master \
>      --html-output ~/covtmp/master_html_report
> 
> Generate for me the same big set of CIDs excepept for 6 disappeared (so
> it becomes even better).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   scripts/coverity-scan/model.c | 88 -----------------------------------
>   softmmu/physmem.c             | 18 +++++++
>   2 files changed, 18 insertions(+), 88 deletions(-)
> 
> diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
> index 686d1a3008..a064d84084 100644
> --- a/scripts/coverity-scan/model.c
> +++ b/scripts/coverity-scan/model.c
> @@ -42,94 +42,6 @@ typedef _Bool bool;
>   
>   typedef struct va_list_str *va_list;
>   
> -/* exec.c */
> -
> -typedef struct AddressSpace AddressSpace;
> -typedef struct MemoryRegionCache MemoryRegionCache;
> -typedef uint64_t hwaddr;
> -typedef uint32_t MemTxResult;
> -typedef struct MemTxAttrs {} MemTxAttrs;
> -
> -static void __bufwrite(uint8_t *buf, ssize_t len)
> -{
> -    int first, last;
> -    __coverity_negative_sink__(len);
> -    if (len == 0) return;
> -    buf[0] = first;
> -    buf[len-1] = last;
> -    __coverity_writeall__(buf);
> -}
> -
> -static void __bufread(uint8_t *buf, ssize_t len)
> -{
> -    __coverity_negative_sink__(len);
> -    if (len == 0) return;
> -    int first = buf[0];
> -    int last = buf[len-1];
> -}
> -
> -MemTxResult address_space_read_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                      MemTxAttrs attrs,
> -                                      void *buf, int len)
> -{
> -    MemTxResult result;
> -    // TODO: investigate impact of treating reads as producing
> -    // tainted data, with __coverity_tainted_data_argument__(buf).
> -    __bufwrite(buf, len);
> -    return result;
> -}
> -
> -MemTxResult address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                MemTxAttrs attrs,
> -                                const void *buf, int len)
> -{
> -    MemTxResult result;
> -    __bufread(buf, len);
> -    return result;
> -}
> -
> -MemTxResult address_space_rw_cached(MemoryRegionCache *cache, hwaddr addr,
> -                                    MemTxAttrs attrs,
> -                                    void *buf, int len, bool is_write)
> -{
> -    if (is_write) {
> -        return address_space_write_cached(cache, addr, attrs, buf, len);
> -    } else {
> -        return address_space_read_cached(cache, addr, attrs, buf, len);
> -    }
> -}
> -
> -MemTxResult address_space_read(AddressSpace *as, hwaddr addr,
> -                               MemTxAttrs attrs,
> -                               void *buf, int len)
> -{
> -    MemTxResult result;
> -    // TODO: investigate impact of treating reads as producing
> -    // tainted data, with __coverity_tainted_data_argument__(buf).
> -    __bufwrite(buf, len);
> -    return result;
> -}
> -
> -MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
> -                                MemTxAttrs attrs,
> -                                const void *buf, int len)
> -{
> -    MemTxResult result;
> -    __bufread(buf, len);
> -    return result;
> -}
> -
> -MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
> -                             MemTxAttrs attrs,
> -                             void *buf, int len, bool is_write)
> -{
> -    if (is_write) {
> -        return address_space_write(as, addr, attrs, buf, len);
> -    } else {
> -        return address_space_read(as, addr, attrs, buf, len);
> -    }
> -}
> -
>   /* Tainting */
>   
>   typedef struct {} name2keysym_t;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index edec095c7a..24571002b3 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2821,6 +2821,15 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>               l = memory_access_size(mr, l, addr1);
>               /* XXX: could force current_cpu to NULL to avoid
>                  potential bugs */
> +
> +            /*
> +             * Assure Coverity (and ourselves) that we are not going to OVERRUN
> +             * the buffer by following ldn_he_p().
> +             */
> +            assert((l == 1 && len >= 1) ||
> +                   (l == 2 && len >= 2) ||
> +                   (l == 4 && len >= 4) ||
> +                   (l == 8 && len >= 8));
>               val = ldn_he_p(buf, l);
>               result |= memory_region_dispatch_write(mr, addr1, val,
>                                                      size_memop(l), attrs);
> @@ -2891,6 +2900,15 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>               l = memory_access_size(mr, l, addr1);
>               result |= memory_region_dispatch_read(mr, addr1, &val,
>                                                     size_memop(l), attrs);
> +
> +            /*
> +             * Assure Coverity (and ourselves) that we are not going to OVERRUN
> +             * the buffer by following stn_he_p().
> +             */
> +            assert((l == 1 && len >= 1) ||
> +                   (l == 2 && len >= 2) ||
> +                   (l == 4 && len >= 4) ||
> +                   (l == 8 && len >= 8));
>               stn_he_p(buf, l, val);
>           } else {
>               /* RAM case */

I'm no coverity expert, but if it gets the job done reliably

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


