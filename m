Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F27B516D78
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 11:37:27 +0200 (CEST)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlSUf-0005op-Cd
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 05:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlSSh-0004SP-5B
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:35:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlSSb-0006mZ-HU
 for qemu-devel@nongnu.org; Mon, 02 May 2022 05:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651484116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ad6ntS+gGRT0hEpLuwo2bDcCo68QdME8lSS+zFZxFg=;
 b=hLqzsBE9RkwJ88HXqq4wWKF63r1mcHSOB2Je/8rd5HiTmljFhoY+WqoJ9cW8beyC/PRAG0
 0MYT3ReYuB3/WVH05ykzVKfyw5LirKyeBUW456qv7LQAR/GlDaY8yX3sTJzhLCOxQMWDtI
 RBLTPxSICK68ZB2pMRmT5GpeZ00qQJw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-RO5ragvyN922o5v5ePkqjQ-1; Mon, 02 May 2022 05:35:15 -0400
X-MC-Unique: RO5ragvyN922o5v5ePkqjQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 n26-20020a1c721a000000b003941ea1ced7so2442086wmc.7
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 02:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6ad6ntS+gGRT0hEpLuwo2bDcCo68QdME8lSS+zFZxFg=;
 b=B46dY4OwkZDkefkSpXfAw/k36gkwXhGZ8SSia1KQVn01idDcyhW1l7+q82GeE4NXb8
 BQl5/MYX9P+1RneJjTNAEz40sEbsVCppDQEw/okIwGylsOrDy61p4f5y4QO287fGvcvs
 2BNoVL2EiRlicH4C/hWRHO7xiVu7d6viljxpzCun82CKStyMfdCSJqs9d7IDVnysi1ql
 30L7aYw1RdLJrh3SfmTh1kvud6YKRPErRWCvWT6VX9JN2Oi8qoK4f7sPZLIBq17fAhrx
 w7zAqwtp2XRlvzaAgvz2oEfBOd28OwPASCz7d+AkJUQ5Rg8xhSjnv/enyS6v+6zv7y08
 UEAw==
X-Gm-Message-State: AOAM532verw3nAvzy/aip2nhTMa7tlaJqf4p7eRtN43s30SteFY4rU6d
 YlM3fPb2NKw995cPgJ/cEjLKSzaf2YlGSYBCVdF9g/pHA0Cb4+CVSXtPEqxp1W7pNGQ+f/bdwMR
 aQBBQJu/9RGMYfO4=
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr5398343wrd.443.1651484114102; 
 Mon, 02 May 2022 02:35:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLeCMOO5joPADRb2yF+kpJsJ3uIoK956pRiLyGhxCoaJbknnno+em7xj6rHPD0uI1XwIIXsg==
X-Received: by 2002:a05:6000:1681:b0:20c:5aa2:ae14 with SMTP id
 y1-20020a056000168100b0020c5aa2ae14mr5398324wrd.443.1651484113870; 
 Mon, 02 May 2022 02:35:13 -0700 (PDT)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adfa70d000000b0020c5253d8e8sm6712293wrd.52.2022.05.02.02.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 02:35:13 -0700 (PDT)
Message-ID: <7fd57a63-25eb-214a-da31-011d2d0469d6@redhat.com>
Date: Mon, 2 May 2022 11:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 13/13] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220428094708.84835-1-david@redhat.com>
 <20220428094708.84835-14-david@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220428094708.84835-14-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Miller <dmiller423@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/04/2022 11.47, David Hildenbrand wrote:
> From: David Miller <dmiller423@gmail.com>
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
[...]
> diff --git a/tests/tcg/s390x/vxeh2_vlstr.c b/tests/tcg/s390x/vxeh2_vlstr.c
> new file mode 100644
> index 0000000000..5677bf7c29
> --- /dev/null
> +++ b/tests/tcg/s390x/vxeh2_vlstr.c
> @@ -0,0 +1,139 @@
> +/*
> + * vxeh2_vlstr: vector-enhancements facility 2 vector load/store reversed *
> + */
> +#include <stdint.h>
> +#include "vx.h"
> +
> +#define vtst(v1, v2) \
> +    if (v1.d[0] != v2.d[0] || v1.d[1] != v2.d[1]) { \
> +        return 1;     \
> +    }
> +
> +static inline void vler(S390Vector *v1, const void *va, uint8_t m3)
> +{
> +    asm volatile("vler %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}

The vxeh2_vlstr test fails when compiling with Clang instead of GCC ... 
seems like it enjoys using register r0 in the spots that use the "d" 
constraints in the inline assembly in here. The fix is easy:

diff a/tests/tcg/s390x/vxeh2_vlstr.c b/tests/tcg/s390x/vxeh2_vlstr.c
--- a/tests/tcg/s390x/vxeh2_vlstr.c
+++ b/tests/tcg/s390x/vxeh2_vlstr.c
@@ -13,7 +13,7 @@ static inline void vler(S390Vector *v1, const void *va, 
uint8_t m3)
  {
      asm volatile("vler %[v1], 0(%[va]), %[m3]\n"
                  : [v1] "+v" (v1->v)
-                : [va]  "d" (va)
+                : [va]  "a" (va)
                  , [m3]  "i" (m3)
                  : "memory");
  }
@@ -21,7 +21,7 @@ static inline void vler(S390Vector *v1, const void *va, 
uint8_t m3)
  static inline void vster(S390Vector *v1, const void *va, uint8_t m3)
  {
      asm volatile("vster %[v1], 0(%[va]), %[m3]\n"
-                : [va] "+d" (va)
+                : [va] "+a" (va)
                  : [v1]  "v" (v1->v)
                  , [m3]  "i" (m3)
                  : "memory");
@@ -31,7 +31,7 @@ static inline void vlbr(S390Vector *v1, void *va, const 
uint8_t m3)
  {
      asm volatile("vlbr %[v1], 0(%[va]), %[m3]\n"
                  : [v1] "+v" (v1->v)
-                : [va]  "d" (va)
+                : [va]  "a" (va)
                  , [m3]  "i" (m3)
                  : "memory");
  }
@@ -39,7 +39,7 @@ static inline void vlbr(S390Vector *v1, void *va, const 
uint8_t m3)
  static inline void vstbr(S390Vector *v1, void *va, const uint8_t m3)
  {
      asm volatile("vstbr %[v1], 0(%[va]), %[m3]\n"
-                : [va] "+d" (va)
+                : [va] "+a" (va)
                  : [v1]  "v" (v1->v)
                  , [m3]  "i" (m3)
                  : "memory");
@@ -50,7 +50,7 @@ static inline void vlebrh(S390Vector *v1, void *va, const 
uint8_t m3)
  {
      asm volatile("vlebrh %[v1], 0(%[va]), %[m3]\n"
                  : [v1] "+v" (v1->v)
-                : [va]  "d" (va)
+                : [va]  "a" (va)
                  , [m3]  "i" (m3)
                  : "memory");
  }
@@ -58,7 +58,7 @@ static inline void vlebrh(S390Vector *v1, void *va, const 
uint8_t m3)
  static inline void vstebrh(S390Vector *v1, void *va, const uint8_t m3)
  {
      asm volatile("vstebrh %[v1], 0(%[va]), %[m3]\n"
-                : [va] "+d" (va)
+                : [va] "+a" (va)
                  : [v1]  "v" (v1->v)
                  , [m3]  "i" (m3)
                  : "memory");
@@ -68,7 +68,7 @@ static inline void vllebrz(S390Vector *v1, void *va, const 
uint8_t m3)
  {
      asm volatile("vllebrz %[v1], 0(%[va]), %[m3]\n"
                  : [v1] "+v" (v1->v)
-                : [va]  "d" (va)
+                : [va]  "a" (va)
                  , [m3]  "i" (m3)
                  : "memory");
  }
@@ -77,7 +77,7 @@ static inline void vlbrrep(S390Vector *v1, void *va, const 
uint8_t m3)
  {
      asm volatile("vlbrrep %[v1], 0(%[va]), %[m3]\n"
                  : [v1] "+v" (v1->v)
-                : [va]  "d" (va)
+                : [va]  "a" (va)
                  , [m3]  "i" (m3)
                  : "memory");
  }

I'll fix it up in my queue, so no need to resend.

  Thomas


