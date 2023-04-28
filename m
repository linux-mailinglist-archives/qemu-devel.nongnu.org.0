Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 526A86F1638
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:58:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLn7-0006dA-D3; Fri, 28 Apr 2023 06:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psLmv-0006Oy-Bd
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1psLmq-0004Wd-Dh
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wyW7JyauwMccmOSzvdapIpBe5eBqr3LzZ5dd1oqQRdw=;
 b=JF0SD6O6WCA1TS2xyHHI66dW127OV3kVd5MlpixStG45WyqKNSrf4C28Jh2MVThiDidiev
 W7WVElH+fUENavm2OAkCqwr3w0SeNTTcvzetnqBXLHevvPXDjh2IqOIEYzCF17PdG6hAgV
 dq1MCRGJqFcezmobT0XPSmv1Ie7MO38=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-H3sdxON3MaiMpuNzCJ7VxQ-1; Fri, 28 Apr 2023 06:57:09 -0400
X-MC-Unique: H3sdxON3MaiMpuNzCJ7VxQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f173bd0fc9so56515135e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 03:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682679428; x=1685271428;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wyW7JyauwMccmOSzvdapIpBe5eBqr3LzZ5dd1oqQRdw=;
 b=Z8OI0tHJ4FcTa7ZYUgMT07g36rGotquwdWOoQorBbk6fzN11dzmQE2jC7Hwsp/ZCyM
 rcPY+3mVD4BaAPCB5lm+DTlCxSkaTp50jk0VP5d/DF+pxJkdUoIX16w6G4UlGNmpPlyr
 K6RIXJFgI5pUe6GjcUvE2q/DZTXdeO9thazCzr/oqm94QfmXWU15Dq0+1YDDJjHvg6RX
 /M7a2F3nzGttUDTChI6Q749F6yOMv4dRFNZT1qpkM0TKQmMM6hNGhn/QKPiTe3cncPbZ
 yufOBfcWvEMkuQjtRYaLXrQMVyFGsQB3AuQPVYW2vWTONNLJYv0z9AkdNu0umGRmXrR+
 CYFQ==
X-Gm-Message-State: AC+VfDznSsR5wDZZo9/9E13dqYVhbxVsg8vVnHH5avGXj3qlQRvb8bmk
 P58sn+gBgl0wFcsWqC6BX31fL9KNijj78ggMVvvGgirLswbFuXKRSvTvlAD2B8qhy5brOMdL0Zf
 T5OOZmPqAoB7Dux4=
X-Received: by 2002:a1c:7716:0:b0:3dc:55d9:ec8 with SMTP id
 t22-20020a1c7716000000b003dc55d90ec8mr3566720wmi.41.1682679428204; 
 Fri, 28 Apr 2023 03:57:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69lUn/El1ONjS5427qFFpWQ6KtFAnTWqRTqAv199+kKfDvlmTVA1SIvcU0x9q0kdRPNYVOSQ==
X-Received: by 2002:a1c:7716:0:b0:3dc:55d9:ec8 with SMTP id
 t22-20020a1c7716000000b003dc55d90ec8mr3566709wmi.41.1682679427936; 
 Fri, 28 Apr 2023 03:57:07 -0700 (PDT)
Received: from [192.168.8.102] (tmo-098-235.customers.d1-online.com.
 [80.187.98.235]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c22c300b003f31d44f0cbsm3163770wmg.29.2023.04.28.03.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 03:57:07 -0700 (PDT)
Message-ID: <be8ccc72-0dfb-ca33-e309-27d51d96a623@redhat.com>
Date: Fri, 28 Apr 2023 12:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] softmmu: Tidy dirtylimit_dirty_ring_full_time
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230428103448.3811208-1-richard.henderson@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230428103448.3811208-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 28/04/2023 12.34, Richard Henderson wrote:
> Drop inline marker: let compiler decide.
> 
> Change return type to uint64_t: this matches the computation in the
> return statement and the local variable assignment in the caller.
> 
> Rename local to dirty_ring_size_MB to fix typo.
> Simplify conversion to MiB via qemu_target_page_bits and right shift.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   softmmu/dirtylimit.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/softmmu/dirtylimit.c b/softmmu/dirtylimit.c
> index 82986c1499..71bf6dc7a4 100644
> --- a/softmmu/dirtylimit.c
> +++ b/softmmu/dirtylimit.c
> @@ -232,18 +232,23 @@ bool dirtylimit_vcpu_index_valid(int cpu_index)
>                cpu_index >= ms->smp.max_cpus);
>   }
>   
> -static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
> +static uint64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate)
>   {
>       static uint64_t max_dirtyrate;
> -    uint32_t dirty_ring_size = kvm_dirty_ring_size();
> -    uint64_t dirty_ring_size_meory_MB =
> -        dirty_ring_size * qemu_target_page_size() >> 20;
> +    unsigned target_page_bits = qemu_target_page_bits();
> +    uint64_t dirty_ring_size_MB;
> +
> +    /* So far, the largest (non-huge) page size is 64k, i.e. 16 bits. */
> +    assert(target_page_bits < 20);
> +
> +    /* Convert ring size (pages) to MiB (2**20). */
> +    dirty_ring_size_MB = kvm_dirty_ring_size() >> (20 - target_page_bits);
>   
>       if (max_dirtyrate < dirtyrate) {
>           max_dirtyrate = dirtyrate;
>       }
>   
> -    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +    return dirty_ring_size_MB * 1000000 / max_dirtyrate;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


