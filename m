Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E74EBD3F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:08:53 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUJt-0001B6-2E
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:08:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZU8t-0007ol-BV
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:57:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nZU8q-0007Dv-H3
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:57:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648630640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ/BhCXYBWgyW94oaqJs020S6cihQqkskcoYmaBAjRY=;
 b=Yk7DP/4RNtCRUdojsSZA1E4mn+Y1JOuJ/HNc0vHEFJepvp5liyOq3DzFnLa4qFS+y3ZeY2
 66NdrFwCrCOn1GrQg4n3aWwPbQEIfAc70zTwImlz7U3x7zAi1B9rMOum30Vtv5vOKmGaWh
 wmF230Uf30SkF69LPB8iY8JIqPGve+0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-EQB_a-cHPMS_SVacFGoQFQ-1; Wed, 30 Mar 2022 04:57:17 -0400
X-MC-Unique: EQB_a-cHPMS_SVacFGoQFQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 m185-20020a1c26c2000000b0038c9e1197f6so2777059wmm.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=tZ/BhCXYBWgyW94oaqJs020S6cihQqkskcoYmaBAjRY=;
 b=xZiuyqKFPe+RHF+BUWMaKvRF7Gd6fuhpaf27LBL4WWhtAeDAxmfZ6YZu797Pxf9vqk
 XQsdXKLY4pqZDVxl48ADiyWeMc/G5uz8itnwUSjo35G1u9jDpH2V2hHY5HXds2kXjN/k
 bMdX6uwxgmIlu2HFkqge3Cgz66yFfXJFpEpnubPONEMd5x51b7AuNviM2zSxE9gvrMjR
 Zlpz/ggkPsrptHpp8X1Nw+COn41JJWgaibkbxEPBPE9hJ67gr4PBbOrimhQRN4+Oe+R6
 0UnjRW7ybMok2ZVyUFKpoS8UJU+EeBpV9aMxhjShLANoAI3rWPzWIcUl7mjjrm409bLP
 Xq6g==
X-Gm-Message-State: AOAM532W8i2lg0ixWFTDA2ES4kZyG3/TEqKDUY1W52Ax1bwbgJbKRt9/
 xZHfzKu8i3GqpWOK93gekfBCEg2lWzVerPtuAyNiiCecwJsDmzxb2iKW9Ybay3CcrE6nqF42Ivz
 2gu4fI71JooH1KqE=
X-Received: by 2002:a05:6000:18a2:b0:203:d2f5:28a0 with SMTP id
 b2-20020a05600018a200b00203d2f528a0mr35795851wri.355.1648630636697; 
 Wed, 30 Mar 2022 01:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJtV1RiUWw5e/7t2RJl8QymIz3MggUWHKzmqzLROGokd7fePx1I9VK5UkK67bBa5rHRcW/5w==
X-Received: by 2002:a05:6000:18a2:b0:203:d2f5:28a0 with SMTP id
 b2-20020a05600018a200b00203d2f528a0mr35795833wri.355.1648630636441; 
 Wed, 30 Mar 2022 01:57:16 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:2200:178b:7244:2a1f:b5d8?
 (p200300cbc7052200178b72442a1fb5d8.dip0.t-ipconnect.de.
 [2003:cb:c705:2200:178b:7244:2a1f:b5d8])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm19651074wry.102.2022.03.30.01.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:57:15 -0700 (PDT)
Message-ID: <c12a3830-053e-11b7-9e6c-325a7d03df5f@redhat.com>
Date: Wed, 30 Mar 2022 10:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] target/s390x: Fix determination of overflow condition
 code after subtraction
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220323162621.139313-1-thuth@redhat.com>
 <20220323162621.139313-3-thuth@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220323162621.139313-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-s390x@nongnu.org, Bruno Haible <bruno@clisp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.22 17:26, Thomas Huth wrote:
> Reported by Paul Eggert in
> https://lists.gnu.org/archive/html/bug-gnulib/2021-09/msg00050.html
> 
> This program currently prints different results when run with TCG instead
> of running on real s390x hardware:
> 
>  #include <stdio.h>
> 
>  int overflow_32 (int x, int y)
>  {
>    int sum;
>    return __builtin_sub_overflow (x, y, &sum);
>  }
> 
>  int overflow_64 (long long x, long long y)
>  {
>    long sum;
>    return __builtin_sub_overflow (x, y, &sum);
>  }
> 
>  int a1 = 0;
>  int b1 = -2147483648;
>  long long a2 = 0L;
>  long long b2 = -9223372036854775808L;
> 
>  int main ()
>  {
>    {
>      int a = a1;
>      int b = b1;
>      printf ("a = 0x%x, b = 0x%x\n", a, b);
>      printf ("no_overflow = %d\n", ! overflow_32 (a, b));
>    }
>    {
>      long long a = a2;
>      long long b = b2;
>      printf ("a = 0x%llx, b = 0x%llx\n", a, b);
>      printf ("no_overflow = %d\n", ! overflow_64 (a, b));
>    }
>  }
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/618
> Suggested-by: Bruno Haible <bruno@clisp.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/s390x/tcg/cc_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/cc_helper.c b/target/s390x/tcg/cc_helper.c
> index e11cdb745d..b2e8d3d9f5 100644
> --- a/target/s390x/tcg/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -151,7 +151,7 @@ static uint32_t cc_calc_add_64(int64_t a1, int64_t a2, int64_t ar)
>  
>  static uint32_t cc_calc_sub_64(int64_t a1, int64_t a2, int64_t ar)
>  {
> -    if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
> +    if ((a1 >= 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>          return 3; /* overflow */
>      } else {
>          if (ar < 0) {
> @@ -211,7 +211,7 @@ static uint32_t cc_calc_add_32(int32_t a1, int32_t a2, int32_t ar)
>  
>  static uint32_t cc_calc_sub_32(int32_t a1, int32_t a2, int32_t ar)
>  {
> -    if ((a1 > 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
> +    if ((a1 >= 0 && a2 < 0 && ar < 0) || (a1 < 0 && a2 > 0 && ar > 0)) {
>          return 3; /* overflow */
>      } else {
>          if (ar < 0) {

Again, intuitively I'd check for

a) Subtracting a negative number from a positive one -> Adding two
positive numbers should result in the result being bigger than the first
parameter.

a1 > 0 && a2 < 0 && ar < a1

a) Subtracting a positive number from a negative one -> Adding two
negative numbers should result in something that's smaller than the
first parameter

a1 < 0 && a2 > 0 && ar > a1


But maybe I am missing something :)

-- 
Thanks,

David / dhildenb


