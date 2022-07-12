Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54060571310
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 09:26:22 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBAHl-0004UQ-Ex
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 03:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA8S-0006hs-BY
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:16:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oBA8Q-0006SV-Fh
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 03:16:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657610201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkSh9kvuChkkUzYyKhg1/YJol0IonDikf3Nhs+5DA8I=;
 b=EAZpTp/svkQQdVVbOLZdAjWVbxCMfEKqc8r6OeYXcEmr/pT9KD/pspGOt/TZavhxYHm42N
 Ngrh+9Xwsb7bW5ZF/6O7uV+R395S7AusDL80QBdjjmYkE5/xfyTQ2M99HE/jfVLy7ObC+A
 TUAfY6/LqAHBHhcW1Xl2lM/IpPR5ue8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-ZSf7N4dEOzuXhLGPsjWexg-1; Tue, 12 Jul 2022 03:16:38 -0400
X-MC-Unique: ZSf7N4dEOzuXhLGPsjWexg-1
Received: by mail-wm1-f71.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so3397321wmp.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 00:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=LkSh9kvuChkkUzYyKhg1/YJol0IonDikf3Nhs+5DA8I=;
 b=TdM/7+qye+NHOUxQKwAaMr5eEvnoj3Njz92WUrrDTp5TMbcUTOYMVthJLpOTCRsq1f
 FPUW5eoEeriuCK1z6vJUUmbLhLZBh5qQG4gv9kiY5W7uGC5E6B2/iPYQSgbE7Fa5irrU
 F5W/gpLVbcbEXeKAeQFC+6g2Z9VmLa/KLJQVWEJhW7xM8aEgZ/EcZGW0USHKPNcAIfcx
 /RfXPQKODHd+0pnFZh/gHn6NtO11NGzr8IJ/jrY/NZDXnBIreLyH+c6Sklh8WvlaPurd
 f39gbuQ3ZqsklRv/naHb2An1uRRVXoXAWZr5lFfT0xKZ210Kau2JIeFdjeZ5jsk8lO4Z
 5FGg==
X-Gm-Message-State: AJIora/pP+xbfeLGbOO2e65l7IfqGbD6PlhzNpumiI2z3QzkEMPda6ej
 yp6cDe0q8iCCLsdOUiVuuC3Sk/yLgoZZom/4Fzyvh4mfJlxePd0tqsiE6omN8zU3FZiyGtyXNno
 d0EmdSHWoictct1s=
X-Received: by 2002:adf:e98b:0:b0:21d:7337:da3a with SMTP id
 h11-20020adfe98b000000b0021d7337da3amr20152561wrm.13.1657610197388; 
 Tue, 12 Jul 2022 00:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t4Vw5QHAYKpa+titnHET+RrI4zhWz4Tgwe8Q5Yp1bdAp22dzlSnfeEpneza+0E0dDSp+DHQw==
X-Received: by 2002:adf:e98b:0:b0:21d:7337:da3a with SMTP id
 h11-20020adfe98b000000b0021d7337da3amr20152529wrm.13.1657610197036; 
 Tue, 12 Jul 2022 00:16:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c703:d900:a75d:cddc:d29f:bdb3?
 (p200300cbc703d900a75dcddcd29fbdb3.dip0.t-ipconnect.de.
 [2003:cb:c703:d900:a75d:cddc:d29f:bdb3])
 by smtp.gmail.com with ESMTPSA id
 r39-20020a05600c322700b003a2eacc8179sm2346301wmp.27.2022.07.12.00.16.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 00:16:36 -0700 (PDT)
Message-ID: <821506d2-8d1f-a3c4-5d30-8e3fa322a082@redhat.com>
Date: Tue, 12 Jul 2022 09:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] target/s390x: fix handling of zeroes in vfmin/vfmax
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220712015717.3602602-1-iii@linux.ibm.com>
 <20220712015717.3602602-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220712015717.3602602-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 12.07.22 03:57, Ilya Leoshkevich wrote:
> vfmin_res() / vfmax_res() are trying to check whether a and b are both
> zeroes, but in reality they check that they are the same kind of zero.
> This causes incorrect results when comparing positive and negative
> zeroes.
> 
> Fixes: da4807527f3b ("s390x/tcg: Implement VECTOR FP (MAXIMUM|MINIMUM)")
> Co-developed-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/s390x/tcg/vec_fpu_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/tcg/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
> index 2a618a1093..75cf605b9f 100644
> --- a/target/s390x/tcg/vec_fpu_helper.c
> +++ b/target/s390x/tcg/vec_fpu_helper.c
> @@ -824,7 +824,7 @@ static S390MinMaxRes vfmin_res(uint16_t dcmask_a, uint16_t dcmask_b,
>          default:
>              g_assert_not_reached();
>          }
> -    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
> +    } else if (unlikely((dcmask_a & DCMASK_ZERO) && (dcmask_b & DCMASK_ZERO))) {
>          switch (type) {
>          case S390_MINMAX_TYPE_JAVA:
>              return neg_a ? S390_MINMAX_RES_A : S390_MINMAX_RES_B;
> @@ -874,7 +874,7 @@ static S390MinMaxRes vfmax_res(uint16_t dcmask_a, uint16_t dcmask_b,
>          default:
>              g_assert_not_reached();
>          }
> -    } else if (unlikely(dcmask_a & dcmask_b & DCMASK_ZERO)) {
> +    } else if (unlikely((dcmask_a & DCMASK_ZERO) && (dcmask_b & DCMASK_ZERO))) {
>          const bool neg_a = dcmask_a & DCMASK_NEGATIVE;
>  
>          switch (type) {

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


