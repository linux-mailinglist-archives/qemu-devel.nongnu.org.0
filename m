Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E18F4E2365
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:34:31 +0100 (CET)
Received: from localhost ([::1]:53408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEQn-0001PK-NS
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:34:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWEPE-0000OK-2n
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:32:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWEPA-0007n5-FS
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:32:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647855166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/9GboK5W3CIYVydzIj8AfHvp9yQONofrjDOYSSMMbEg=;
 b=RsBrS7fxgP4bi196Vl3MxwqWkqq/5MzGp/ZxCgplhPZwOxAV5kTMqiY9oeGcHWgyirvVrO
 lsrDhaKaaIcch7U16joUCUSwA3GQcO5hTEclElCRloQldPMAIrIDTvOCU71Nbqp154T2rl
 oK1DYdbVLaoPDhkQuZzSiooSKcrYVio=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-4V5Zpo18OAK09EK7gQwcGQ-1; Mon, 21 Mar 2022 05:32:45 -0400
X-MC-Unique: 4V5Zpo18OAK09EK7gQwcGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n19-20020a7bcbd3000000b0038c94b86258so2175679wmi.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=/9GboK5W3CIYVydzIj8AfHvp9yQONofrjDOYSSMMbEg=;
 b=l5vz3Ki8UK2mCiLtrt7J95qqtnvXSOxUDl+6VcU5tG6DnBW8e9A1rTzEW5y6bSwnuc
 UC0FDltRZkUDDTGq7lfahw2ER7pMFWKRh6OP9RHLDmm4vAH4iDpbr38meKRAIk9AWUDT
 DbbFp8o0cOiJ88xE6F3biNzXL+n9SaLSK49kOhfmSFY2o0xA+fAS7BNw0qsG3Irzn0pl
 5jX9H9InQf/lImqlGG7zsIHTsewYK38nL3brMECHeh45PHc2iWQTDxwR4No6UQAcLkyt
 X6Q2yg19RRutB1Qba7OCQDpgebTGuEQus/GXd+tozymwUaeoIpkb96X9VnX4U6QdqOW7
 kaGw==
X-Gm-Message-State: AOAM532EY7B72BHfrrYh8R1qVKgyYN5hCW2c1heSohvY9wcNln+J0ak4
 VZFScC3gU+hyeFCAAiC0Xh83faxK19xB8QSTwvcZiuYttK7ydgSyn4Yu0dk2a05WUel328r/ee5
 abgLyPQh09HTiHpE=
X-Received: by 2002:a5d:64cf:0:b0:203:7b90:d5e2 with SMTP id
 f15-20020a5d64cf000000b002037b90d5e2mr18034080wri.558.1647855164463; 
 Mon, 21 Mar 2022 02:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXGZ542lHSY8mCpWCB1voX5sK0D50gs9VxT2zeQ9Usqd9oBaDOmXVxNBrRg4ZLnjyQdSpW0w==
X-Received: by 2002:a5d:64cf:0:b0:203:7b90:d5e2 with SMTP id
 f15-20020a5d64cf000000b002037b90d5e2mr18034057wri.558.1647855164110; 
 Mon, 21 Mar 2022 02:32:44 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:4900:849b:f76e:5e1f:ff95?
 (p200300cbc7044900849bf76e5e1fff95.dip0.t-ipconnect.de.
 [2003:cb:c704:4900:849b:f76e:5e1f:ff95])
 by smtp.gmail.com with ESMTPSA id
 r13-20020adfbb0d000000b00203e0efdd3bsm12678647wrg.107.2022.03.21.02.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:32:43 -0700 (PDT)
Message-ID: <0ccc1487-843c-178b-79c1-dc2b31866065@redhat.com>
Date: Mon, 21 Mar 2022 10:32:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220308015358.188499-1-richard.henderson@linaro.org>
 <20220308015358.188499-2-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 01/11] tcg: Implement tcg_gen_{h,w}swap_{i32,i64}
In-Reply-To: <20220308015358.188499-2-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.03.22 02:53, Richard Henderson wrote:
> Swap half-words (16-bit) and words (32-bit) within a larger value.
> Mirrors functions of the same names within include/qemu/bitops.h.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg-op.h |  6 ++++++
>  tcg/tcg-op.c         | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
> index caa0a63612..b09b8b4a05 100644
> --- a/include/tcg/tcg-op.h
> +++ b/include/tcg/tcg-op.h
> @@ -332,6 +332,7 @@ void tcg_gen_ext8u_i32(TCGv_i32 ret, TCGv_i32 arg);
>  void tcg_gen_ext16u_i32(TCGv_i32 ret, TCGv_i32 arg);
>  void tcg_gen_bswap16_i32(TCGv_i32 ret, TCGv_i32 arg, int flags);
>  void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg);
> +void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg);
>  void tcg_gen_smin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
>  void tcg_gen_smax_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
>  void tcg_gen_umin_i32(TCGv_i32, TCGv_i32 arg1, TCGv_i32 arg2);
> @@ -531,6 +532,8 @@ void tcg_gen_ext32u_i64(TCGv_i64 ret, TCGv_i64 arg);
>  void tcg_gen_bswap16_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
>  void tcg_gen_bswap32_i64(TCGv_i64 ret, TCGv_i64 arg, int flags);
>  void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg);
> +void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg);
> +void tcg_gen_wswap_i64(TCGv_i64 ret, TCGv_i64 arg);
>  void tcg_gen_smin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
>  void tcg_gen_smax_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
>  void tcg_gen_umin_i64(TCGv_i64, TCGv_i64 arg1, TCGv_i64 arg2);
> @@ -1077,6 +1080,8 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
>  #define tcg_gen_bswap32_tl tcg_gen_bswap32_i64
>  #define tcg_gen_bswap64_tl tcg_gen_bswap64_i64
>  #define tcg_gen_bswap_tl tcg_gen_bswap64_i64
> +#define tcg_gen_hswap_tl tcg_gen_hswap_i64
> +#define tcg_gen_wswap_tl tcg_gen_wswap_i64
>  #define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64
>  #define tcg_gen_extr_i64_tl tcg_gen_extr32_i64
>  #define tcg_gen_andc_tl tcg_gen_andc_i64
> @@ -1192,6 +1197,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
>  #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
>  #define tcg_gen_bswap32_tl(D, S, F) tcg_gen_bswap32_i32(D, S)
>  #define tcg_gen_bswap_tl tcg_gen_bswap32_i32
> +#define tcg_gen_hswap_tl tcg_gen_hswap_i32
>  #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
>  #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
>  #define tcg_gen_andc_tl tcg_gen_andc_i32
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 65e1c94c2d..379adb4b9f 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -1056,6 +1056,12 @@ void tcg_gen_bswap32_i32(TCGv_i32 ret, TCGv_i32 arg)
>      }
>  }
>  
> +void tcg_gen_hswap_i32(TCGv_i32 ret, TCGv_i32 arg)
> +{
> +    /* Swapping 2 16-bit elements is a rotate. */
> +    tcg_gen_rotli_i32(ret, arg, 16);
> +}
> +
>  void tcg_gen_smin_i32(TCGv_i32 ret, TCGv_i32 a, TCGv_i32 b)
>  {
>      tcg_gen_movcond_i32(TCG_COND_LT, ret, a, b, a, b);
> @@ -1792,6 +1798,30 @@ void tcg_gen_bswap64_i64(TCGv_i64 ret, TCGv_i64 arg)
>      }
>  }
>  
> +void tcg_gen_hswap_i64(TCGv_i64 ret, TCGv_i64 arg)
> +{
> +    uint64_t m = 0x0000ffff0000ffffull;
> +    TCGv_i64 t0 = tcg_temp_new_i64();
> +    TCGv_i64 t1 = tcg_temp_new_i64();
> +
> +    /* See include/qemu/bitops.h, hswap64. */
> +    tcg_gen_rotli_i64(t1, arg, 32);> +    tcg_gen_andi_i64(t0, t1, m);
> +    tcg_gen_shri_i64(t1, t1, 16);
> +    tcg_gen_shli_i64(t0, t0, 16);

I'd flip these two lines into

tcg_gen_shli_i64(t0, t0, 16);
tcg_gen_shri_i64(t1, t1, 16);

To make it easier to map to hswap64().


Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


