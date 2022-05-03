Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4D5180AF
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:10:11 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloXq-0004k7-GJ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nloQV-0005pO-Sh
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nloQT-00079S-6z
 for qemu-devel@nongnu.org; Tue, 03 May 2022 05:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCXnWec/eUgVbEIGTD30ChucykThxnBJ2IJxeuvoZbo=;
 b=XCrB+WaD71gLH+qVaNjn5TOWykyE5s1jGwPrhMXjoLRuNVl/Khq1S9jwYetEYYK0Ut7gyM
 7Ed7lfCAJbYMwIowIGd84nFehiDBOzj7Nb7u1nhxeAQJDXh+zcZ3cIMzG7V7drGjnRudJC
 mOn3udszCBUB5mMQHwO2+uruZy0OSWk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-mguhxHi2M6yMF9fGhIOJdw-1; Tue, 03 May 2022 05:02:31 -0400
X-MC-Unique: mguhxHi2M6yMF9fGhIOJdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 p32-20020a05600c1da000b00393fbf9ab6eso1066674wms.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FCXnWec/eUgVbEIGTD30ChucykThxnBJ2IJxeuvoZbo=;
 b=eh6EW4jeL6qDZUpyaU/7dPNuVF3e02snJ/+s7CU25aTI17U/khDqbD9vQu/2kf3+Gr
 OeXt3nKeNm+BT9RsjEpOb0bt9IixQv4AZvrQBzZrByH1aYWbMyt8mY8kM/tFhh0XIibx
 V6FwYeY9j3SLUPY3D1mMDpdR2wFJzpFf7tI+lFZROJu5yKlMmUC4DqiM8KfiS+0NqoFq
 DISvY+T7wl+Zf5yX2iugqaxYMAGcKUKW7hgosCv6lzbCRaD9KxPvzShTualILkwA5UaD
 KKaD5pRfeX+kLuPHyjjuRcCyx8XvjmpXd184aSd5Mqp03e65uLObvVp/DN5ehtfKwdg/
 DWmw==
X-Gm-Message-State: AOAM5334+84rJWd1pmUqNTD/CyCsg9BVvhKs6/ssgBByRlgUK14DszZq
 MuKntpsFsh95i7j0FokuBjz1fftmGqtoGhHJCuIJB00fdAanF6Tjkk7igENZc3m3pScwp4y2p6x
 R6AlkF9x4xK4u8i0=
X-Received: by 2002:adf:e587:0:b0:20a:cfbb:ac08 with SMTP id
 l7-20020adfe587000000b0020acfbbac08mr11414533wrm.718.1651568549063; 
 Tue, 03 May 2022 02:02:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWUiXTKy668/0bjm79N7EhD32CFoVKmPRTtZGjO02pg8VCQZtI/GB5uqdpXCTl6KRT4vB7ww==
X-Received: by 2002:adf:e587:0:b0:20a:cfbb:ac08 with SMTP id
 l7-20020adfe587000000b0020acfbbac08mr11414522wrm.718.1651568548823; 
 Tue, 03 May 2022 02:02:28 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j30-20020adfb31e000000b0020c5253d8c2sm8671560wrd.14.2022.05.03.02.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 02:02:28 -0700 (PDT)
Message-ID: <0e5c5988-c764-edd8-5f8f-f208f5cef1d0@redhat.com>
Date: Tue, 3 May 2022 11:02:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20220502164830.1622191-1-iii@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220502164830.1622191-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 02/05/2022 18.48, Ilya Leoshkevich wrote:
> Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
> constants. While this looks like a bug that needs fixing, use a
> different notation (-0x100000000) as a workaround.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/branch-relative-long.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
> index 94219afcad..8ce9f1c2e5 100644
> --- a/tests/tcg/s390x/branch-relative-long.c
> +++ b/tests/tcg/s390x/branch-relative-long.c
> @@ -13,8 +13,8 @@
>           #_name "_end:\n");
>   
>   DEFINE_ASM(br_r14, "br %r14");
> -DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> -DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
> +DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
> +DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");

Works for me, thanks!

Tested-by: Thomas Huth <thuth@redhat.com>

and queued to my s390x-next branch:

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


