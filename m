Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182986B9C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:55:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7vN-0005aa-Ut; Tue, 14 Mar 2023 12:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pc7vL-0005Iu-8l
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:54:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pc7vJ-0003eK-Ov
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:54:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678812892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8dljH6HBqJAboVMagxmA34eQstxfJmFU29X0A5OKKg=;
 b=R7Vhq7p05zBh/ZjZYwitoSylDI0s04yoL3angIedIFq9lBZgfBkNACU7m+V18XuRmVnNJt
 d+V65GJmdAWCKU15gZ1GhffRZ93zRvd33QkOw8YdUu1HaqW5c6fcf6ky4gN2/f2DQn3BuO
 xNcpR5knr4A8CbRCw53SFcox2TL1i2M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-1scjA6LVOKaq7Umgpwkm9A-1; Tue, 14 Mar 2023 12:54:50 -0400
X-MC-Unique: 1scjA6LVOKaq7Umgpwkm9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so5905680wms.8
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812889;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q8dljH6HBqJAboVMagxmA34eQstxfJmFU29X0A5OKKg=;
 b=niOP7KrKkzr3oYvl7BfBDNvfEmYK0qR5t7uwNYn9FwHiTU5bwvC4nU2VA2B3TdRyFW
 z5n/iJy4l3aD9EXHYdIrY+Oh3mvSQxbZj+ygmCmBj5wLO5kSFt6l5mrGpN8xMNOhVIZ+
 z3fk+vZj6US9GqollFH9KIWsPXQ8QtuRVZ2zOWpc+iM/8k+42B+pwV1tps7SN1RMOCrd
 H8jvWRqie+frwS98ZWd4WxQzYvqxHsb/VUqr8RcAh3HmkLKdLXA2RKm5wkjoBIxZxXA5
 82k2rZH3P5wodTOmd9JusPAZtJkxnj/3r7rkZIcbJTpCul9ihQz4+phdwv43whXON8aQ
 AfhA==
X-Gm-Message-State: AO0yUKUUsRJiD9iIL9a0mdEkCHvHW4U8ATFumKMm6BfaUapiRfovRhEr
 71oWvzLmc5TcIwnjk6Ux+VFeZnuXKSvDuNSU9RH7Q1Kfci8y5DeroKSqSiqSn4oE9enk6DiVsbx
 4VbrhLlvNFkzVSio=
X-Received: by 2002:a7b:c053:0:b0:3eb:f59f:6daf with SMTP id
 u19-20020a7bc053000000b003ebf59f6dafmr14504943wmc.34.1678812889636; 
 Tue, 14 Mar 2023 09:54:49 -0700 (PDT)
X-Google-Smtp-Source: AK7set/EyqZplUVrlRmLE/CFaHDncdaAEaIaQAE+awp1ByQCkB3xdd90qLPYneYrsYzhvPX/gj4o3w==
X-Received: by 2002:a7b:c053:0:b0:3eb:f59f:6daf with SMTP id
 u19-20020a7bc053000000b003ebf59f6dafmr14504925wmc.34.1678812889329; 
 Tue, 14 Mar 2023 09:54:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:1000:21d5:831d:e107:fbd6?
 (p200300cbc704100021d5831de107fbd6.dip0.t-ipconnect.de.
 [2003:cb:c704:1000:21d5:831d:e107:fbd6])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1cf613000000b003e0015c8618sm3519156wmc.6.2023.03.14.09.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 09:54:48 -0700 (PDT)
Message-ID: <042208f0-4fe2-cefc-e7fc-3e64cc69b28f@redhat.com>
Date: Tue, 14 Mar 2023 17:54:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/s390x: Implement Early Exception Recognition
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
References: <20230314110022.184717-1-iii@linux.ibm.com>
 <20230314110022.184717-2-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230314110022.184717-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 14.03.23 12:00, Ilya Leoshkevich wrote:
> Generate specification exception if a reserved bit is set in the PSW
> mask or if the PSW address is out of bounds dictated by the addresing
> mode.
> 
> Reported-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

Unofficially known to be broken (and ignored) for a long time :D

> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/cpu.c             | 26 ++++++++++++++++++++++++++
>   target/s390x/cpu.h             |  1 +
>   target/s390x/tcg/excp_helper.c |  3 ++-
>   3 files changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index b10a8541ff8..8e6e46aa3d8 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -41,6 +41,26 @@
>   #define CR0_RESET       0xE0UL
>   #define CR14_RESET      0xC2000000UL;
>   
> +#ifndef CONFIG_USER_ONLY
> +static bool is_early_exception_recognized(uint64_t mask, uint64_t addr)

Nit: I'd call this is_early_exception_psw() or sth like that.

Thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


