Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FAB67C9E5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:30:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0Qj-0002RQ-Vh; Thu, 26 Jan 2023 06:28:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0Q7-0000y6-7U
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:27:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pL0Pr-0005kd-P2
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674732458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=frCb/izEkoqK1/aoix9ig8E9JiLgMcR/ezPJRBr1asw=;
 b=asWrFvzYQC/B7yJrdulv9zK5659+ENO/8or7SFAHJP690Us+q2bIcBwSzqouv/pUtfqlGr
 NsCL8HAyCcenUTTyd9QJMnfYFKKIyg9qYy8Bdg1TeZ1J1GU13o4geNtVgTIpZigiAKvgwa
 sDOthGMFGQHvvjuXmD6VlqcMoypZc7M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-481-0ZoQhI33NOyVU_qBKUn3qw-1; Thu, 26 Jan 2023 06:27:37 -0500
X-MC-Unique: 0ZoQhI33NOyVU_qBKUn3qw-1
Received: by mail-wm1-f70.google.com with SMTP id
 az37-20020a05600c602500b003da50af44b3so900789wmb.1
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=frCb/izEkoqK1/aoix9ig8E9JiLgMcR/ezPJRBr1asw=;
 b=lo8sH1XBplEL+FmkbHXnjYOiqTmqRuvVj3o0gnQiUR/oI+/zElNqkfe8FVIkRVmTUz
 wWSFS3WPBtBtrvpcCAAF3L7JKy8BAfE5E+HP1rPV1bDPSNXmm/10lizljPGo5rX+7nQf
 GPbYgJFBaM7UA6iK5/JvT6wzMqPkT2rMpFUoxE1TZYB0flSzrhaiIdOJ5NOvrJVrhnWI
 lNgwrnKEqI9lNH8Wtttywg9nczGaCEjxZld7ayC5vgt0vV1sN0A4bqlHqE0My17ev0tU
 OtB/TXXdFDqvUf8Mxlrc9K9i5qz+5FYACzzgnFuYL/XXhw0YswrLnvrtWQn+bF02MeYv
 j70Q==
X-Gm-Message-State: AFqh2kqO0a63RZKpXP22U3uKMkCvavtvo+zyGs1M47/KhG+0NtwHx0gk
 ZZtlo0ixv5hyiVb7B7zIz8urAuCB5Hthia2Aibe0T3OHvqoNzn8ZzGuaJ3wQ9LoVYYKEyiHrg2Z
 LGhi361ds+/jPxJE=
X-Received: by 2002:a5d:5c10:0:b0:2be:3ccd:7f33 with SMTP id
 cc16-20020a5d5c10000000b002be3ccd7f33mr28299538wrb.27.1674732456076; 
 Thu, 26 Jan 2023 03:27:36 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuUVVn7BkBp+VXGDWABGQOXrZIzg5xLYI1Q4DZMBmltAhBt8DbGP5zU9dq1BHPvUuJ5gdZz6A==
X-Received: by 2002:a5d:5c10:0:b0:2be:3ccd:7f33 with SMTP id
 cc16-20020a5d5c10000000b002be3ccd7f33mr28299514wrb.27.1674732455719; 
 Thu, 26 Jan 2023 03:27:35 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffb91000000b002bddac15b3dsm1031997wrr.33.2023.01.26.03.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 03:27:35 -0800 (PST)
Message-ID: <b3fcf846-1bc9-84e7-0adb-4a7eb1e9ec80@redhat.com>
Date: Thu, 26 Jan 2023 12:27:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 32/36] target/s390x: Use tcg_gen_atomic_cmpxchg_i128
 for CDSG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-33-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230126043824.54819-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

>   static DisasJumpType op_csst(DisasContext *s, DisasOps *o)
> @@ -5419,6 +5410,14 @@ static void prep_r1_P(DisasContext *s, DisasOps *o)
>   }
>   #define SPEC_prep_r1_P SPEC_r1_even
>   
> +static void prep_r1_D64(DisasContext *s, DisasOps *o)
> +{
> +    int r1 = get_field(s, r1);
> +    o->out_128 = tcg_temp_new_i128();
> +    tcg_gen_concat_i64_i128(o->out_128, regs[r1 + 1], regs[r1]);

I really wonder if we should simply move the tcg_gen_concat_i64_i128() 
into the op and use a generic "allocate out_128" instead.

At least that part here confused me heavily.

Apart from that: LGTM although its a bit like black magic :D

-- 
Thanks,

David / dhildenb


