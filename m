Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305064CF3E1
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 09:44:58 +0100 (CET)
Received: from localhost ([::1]:49682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR8zA-0003At-N0
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 03:44:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8xF-0002Qy-AJ
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nR8xC-0007X3-IY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 03:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646642572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPUeBzrU/4JyPjRqsbUgIZcazLsmPQ8FodB+p+KIU+Y=;
 b=ikXTIQv/AnbgWYjfhq9CbHze1Zpu3msCLnAvBGzHhbj69OntdWEkJNFcMjh8TaVXZP5/4U
 sLT3sLfGAKeFvH0uPYBWb8UeZUQcsi1Ulc8sfzcqV4JvpE09wXXj+uk0I0VdA12mu7+Ief
 dVpDNHQ0+9xlsQPI0cRTgG2zHf/57cU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-TlTHHDakM3i9r5l9m0QskQ-1; Mon, 07 Mar 2022 03:42:51 -0500
X-MC-Unique: TlTHHDakM3i9r5l9m0QskQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f14-20020adfc98e000000b001e8593b40b0so4260145wrh.14
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 00:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bPUeBzrU/4JyPjRqsbUgIZcazLsmPQ8FodB+p+KIU+Y=;
 b=vYWsA3nH67VS6R/BLT9FaI9jNzCpGP8GLgjJRzBurxbEgd68C17whN4KjZX1GxkmaO
 f3xMr4gfcnO2I8g9rwU8gc7/aUPJKdEOB8xg73Sw+T2uohtopJueqcWrwit3evBRMmVS
 B3AjGQIs+2hyzqE0VxkHzGSeZr91fgNu5XSkv5I2Rzhcficp9Q7xKjbO/bhkNVl2THXJ
 0zeIzOPUoclUFPmBzFJeeBXB8qFjfZ9BaurVfy+2c+D91QugDCDJrh4sjjjHNbhhiw92
 PIdg1k6Ix/pkwDv0FCCv8z33bouulaLlefrOrMXbOpJaLrKiDfzCsbTfFcgAEqrIcMtd
 OchA==
X-Gm-Message-State: AOAM532G2ngzKLquH676WTk++nw5YDdfB+vibc/KiXwTj2r9eZQuRpYj
 h1nbjROJ7QQ8lDVnHdREq9faIZgZjbJ7NpGeq06bOrY/5bQx3eiLgZW7E/ibtUH9QiXw6j7iOkF
 3WvRAkLGeI54m910=
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr8446887wmh.59.1646642570530; 
 Mon, 07 Mar 2022 00:42:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxad3jFvu+Z4FUGrSqg3achebdNRqz7I4jRpkx7sjE7H93byJ1/qs/xbfuecX1ZHcPw34vaBA==
X-Received: by 2002:a7b:cc0d:0:b0:381:220e:a3a0 with SMTP id
 f13-20020a7bcc0d000000b00381220ea3a0mr8446871wmh.59.1646642570322; 
 Mon, 07 Mar 2022 00:42:50 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a10-20020a7bc1ca000000b00389bc87db45sm434886wmj.7.2022.03.07.00.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:42:49 -0800 (PST)
Message-ID: <23a9e21b-5f2b-1945-1b04-8bf71a9c637b@redhat.com>
Date: Mon, 7 Mar 2022 09:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3] tests/tcg/s390x: Cleanup of mie3 tests.
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220301214305.2778-1-dmiller423@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220301214305.2778-1-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/03/2022 22.43, David Miller wrote:
> Adds clobbers and merges remaining separate asm statements.
> 
> v2 -> v3:
> * Removed all direct memory references in mie3-sel.c
> 
> v1 -> v2:
> * Corrected side in rebase conflict, removing older code.
> 
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>   tests/tcg/s390x/mie3-compl.c | 18 ++++++++++++-----
>   tests/tcg/s390x/mie3-mvcrl.c | 12 ++++++++----
>   tests/tcg/s390x/mie3-sel.c   | 38 ++++++++++++++++--------------------
>   3 files changed, 38 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
> index 35649f3b02..938938df9e 100644
> --- a/tests/tcg/s390x/mie3-compl.c
> +++ b/tests/tcg/s390x/mie3-compl.c
> @@ -1,13 +1,20 @@
>   #include <stdint.h>
>   
> +
>   #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
> -{ \
> -    uint64_t res = 0; \
> -    asm ("llihf %[res],801\n" ASM \
> -         : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
> -    return res; \
> +{                       \
> +    uint64_t res = 0;   \
> +asm volatile (          \
> +    "llihf %[res],801\n"\
> +    ASM                 \
> +    : [res] "=&r" (res)  \
> +    : [a] "r" (a)       \
> +    , [b] "r" (b)       \
> +);                      \

Hmm, don't we still need "cc" in the clobber list? AFAICS some of these 
instructions still alter the CC register... so I'd suggest to rather drop 
the changes to this file?

Since QEMU has it's soft-freeze deadline tomorrow, I'll pick this up without 
the changes to mie3-compl.c for now... in case it's necessary, we can still 
sort this out later.

> +    return res;         \
>   }
>   
> +
>   /* AND WITH COMPLEMENT */
>   FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
>   FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
> @@ -28,6 +35,7 @@ FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
>   FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
>   FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
>   
> +
>   int main(int argc, char *argv[])
>   {
>       if (_ncrk(0xFF88, 0xAA11)  != 0x0000032100000011ull ||
> diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
> index 57b08e48d0..f749dad9c2 100644
> --- a/tests/tcg/s390x/mie3-mvcrl.c
> +++ b/tests/tcg/s390x/mie3-mvcrl.c
> @@ -1,15 +1,17 @@
>   #include <stdint.h>
>   #include <string.h>
>   
> +
>   static inline void mvcrl_8(const char *dst, const char *src)
>   {
>       asm volatile (
> -    "llill %%r0, 8\n"
> -    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
> -    : : [dst] "d" (dst), [src] "d" (src)
> -    : "memory");
> +        "llill %%r0, 8\n"
> +        ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
> +        : : [dst] "d" (dst), [src] "d" (src)
> +        : "r0", "memory");
>   }
>   
> +
>   int main(int argc, char *argv[])
>   {
>       const char *alpha = "abcdefghijklmnop";
> @@ -25,3 +27,5 @@ int main(int argc, char *argv[])
>   
>       return strncmp(alpha, tstr, 16ul);
>   }
> +
> +

Some tooling like "git am" (or rather "git apply") complain about trailing 
whitespace, so please try to avoid empty lines at the end of files in future 
patches if possible. (I've dropped the empty lines while picking up the 
patch, so no need to resend just because of this)

  Thomas


