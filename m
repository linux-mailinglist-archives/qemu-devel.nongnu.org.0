Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D76571333
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:37:04 +0200 (CEST)
Received: from localhost ([::1]:34000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAS7-0003bT-Cq
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA64-0005Ly-30
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA60-0005ol-GV
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:14:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SeHd4Sq150CNMEw7FbTV5FzLH0vnrfn4gWBHV+XF1oA=;
 b=BxL+LAQ0pT14wyHAvfmHxiP/pxqs4FPMvG4lBcnTRZjKWbH2mZWMwJ8NOAHCs6wLeN2WTS
 Q3Yxpf/br+K+EqpE/XQhS3L8oIvlYe2ucZTdNbed1UmTq4Bm9Au6OpjtsIYAPuoS48nueu
 pBojIEhBmGiRuHRBqwO7Ad3en/LTGdA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-C9Hh5bLONauzev73GFvzIg-1; Tue, 12 Jul 2022 03:14:09 -0400
X-MC-Unique: C9Hh5bLONauzev73GFvzIg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i13-20020adfaacd000000b0021d96b4da5eso1131324wrc.18
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SeHd4Sq150CNMEw7FbTV5FzLH0vnrfn4gWBHV+XF1oA=;
 b=R5mDnBBmfRT+KiLIsMUw+/TVl1ANtNOArQoiQX03banzeedAm6W7H3kg5CxtC0nXH2
 4v+pUgRvUD5m0zjFeLM8RkraF536ydLbgEKeH+KuscuBNJHEEHjRylBXZvAN92KftpSt
 AI9QoWOMeq9nlTpQLbqxXfykzp5ekSc1Ox6KiPqYSikn2cw1yklrew/1mt6fn3+iLFyh
 l2zvPvzJDiJ6kFNVGr/SdNDeetgQUdKH/XFjml9k2+rsAsFEYJQgMeDgXQnzR5qq3Eom
 d5eTaWeu9IYnGZFXYgbhJbQGBbnlqIxpDO4vCbzE0Zfp7j3A4WddIb6gikZiVeVYuIbJ
 nRTg==
X-Gm-Message-State: AJIora8XkNGS9nAAuMu4zqVcWfhDSfosF87xAb9nxNdHG4rbw2eC5T22
 9TiORG3H/RxJjGeFxnmc3zpY5ULslB19nw+1MoYF9T+AJK1SQOSiGAmDDG92+AKgoxuMxlDxPAg
 5dQcNNJwet/856+k=
X-Received: by 2002:a1c:f709:0:b0:3a0:3b29:5eb2 with SMTP id
 v9-20020a1cf709000000b003a03b295eb2mr2235643wmh.133.1657610048573; 
 Tue, 12 Jul 2022 00:14:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFGDihs6xn4XdVL2EZLcIARimicDgkLbYzkgzOrmd2dEmBR0GRYbs8Uns2qqNlPIFYTAXFrQ==
X-Received: by 2002:a1c:f709:0:b0:3a0:3b29:5eb2 with SMTP id
 v9-20020a1cf709000000b003a03b295eb2mr2235614wmh.133.1657610048256; 
 Tue, 12 Jul 2022 00:14:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d900:a75d:cddc:d29f:bdb3?
 (p200300cbc703d900a75dcddcd29fbdb3.dip0.t-ipconnect.de.
 [2003:cb:c703:d900:a75d:cddc:d29f:bdb3])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a5d6912000000b0021d888e1132sm7533911wru.43.2022.07.12.00.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:14:07 -0700 (PDT)
Message-ID: <3b0504e9-4adf-34e6-464f-37b4f11d48b0@redhat.com>
Date: Tue, 12 Jul 2022 09:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] accel/tcg: Fix unaligned stores to s390x
 low-address-protected lowcore
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20220711185640.3558813-1-iii@linux.ibm.com>
 <20220711185640.3558813-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220711185640.3558813-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 11.07.22 20:56, Ilya Leoshkevich wrote:
> If low-address-protection is active, unaligned stores to non-protected
> parts of lowcore lead to protection exceptions. The reason is that in
> such cases tlb_fill() call in store_helper_unaligned() covers
> [0, addr + size) range, which contains the protected portion of
> lowcore. This range is too large.
> 
> The most straightforward fix would be to make sure we stay within the
> original [addr, addr + size) range. However, if an unaligned access
> affects a single page, we don't need to call tlb_fill() in
> store_helper_unaligned() at all, since it would be identical to
> the previous tlb_fill() call in store_helper(), and therefore a no-op.
> If an unaligned access covers multiple pages, this situation does not
> occur.
> 
> Therefore simply skip TLB handling in store_helper_unaligned() if we
> are dealing with a single page.
> 
> Fixes: 2bcf018340cb ("s390x/tcg: low-address protection support")
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  accel/tcg/cputlb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index f90f4312ea..a46f3a654d 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -2248,7 +2248,7 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
>      const size_t tlb_off = offsetof(CPUTLBEntry, addr_write);
>      uintptr_t index, index2;
>      CPUTLBEntry *entry, *entry2;
> -    target_ulong page2, tlb_addr, tlb_addr2;
> +    target_ulong page1, page2, tlb_addr, tlb_addr2;
>      MemOpIdx oi;
>      size_t size2;
>      int i;
> @@ -2256,15 +2256,17 @@ store_helper_unaligned(CPUArchState *env, target_ulong addr, uint64_t val,
>      /*
>       * Ensure the second page is in the TLB.  Note that the first page
>       * is already guaranteed to be filled, and that the second page
> -     * cannot evict the first.
> +     * cannot evict the first.  An exception to this rule is PAGE_WRITE_INV
> +     * handling: the first page could have evicted itself.
>       */
> +    page1 = addr & TARGET_PAGE_MASK;
>      page2 = (addr + size) & TARGET_PAGE_MASK;
>      size2 = (addr + size) & ~TARGET_PAGE_MASK;
>      index2 = tlb_index(env, mmu_idx, page2);
>      entry2 = tlb_entry(env, mmu_idx, page2);
>  
>      tlb_addr2 = tlb_addr_write(entry2);
> -    if (!tlb_hit_page(tlb_addr2, page2)) {
> +    if (page1 != page2 && !tlb_hit_page(tlb_addr2, page2)) {
>          if (!victim_tlb_hit(env, mmu_idx, index2, tlb_off, page2)) {
>              tlb_fill(env_cpu(env), page2, size2, MMU_DATA_STORE,
>                       mmu_idx, retaddr);

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


