Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C234716E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 07:13:32 +0100 (CET)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOwln-0004je-RH
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 02:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwkK-0004Ia-A2
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwkF-0007i0-83
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 02:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616566313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/0mJg+r8EoS5BpNuoex/cbJ15ErGHdLqsyyw1srKB0=;
 b=gnTCmhBPDxRkHFOf2Vj/nCDV7nhJ3I8gdEXStoe4lQN0DPPi++H/bzOJayu4sfVpMXR5uk
 GRyNv7toOwLjF6ijl9HGbVq8MzkGcjd3PPIsRQcj+AYaFQ3JAVxCYfF8o99Gz6TcwwSDid
 6flvcEqZIg/lUXrFNFZh59JgkwQ5dqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-IHr9EO20P36q_JuauDHU_A-1; Wed, 24 Mar 2021 02:11:49 -0400
X-MC-Unique: IHr9EO20P36q_JuauDHU_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728D3180FCA1;
 Wed, 24 Mar 2021 06:11:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F67360C05;
 Wed, 24 Mar 2021 06:11:47 +0000 (UTC)
Subject: Re: [PATCH v2 09/22] tests/tcg: add HeapInfo checking to semihosting
 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210323165308.15244-1-alex.bennee@linaro.org>
 <20210323165308.15244-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <319ecfbc-6f69-04cc-a57f-e5f9574f84f9@redhat.com>
Date: Wed, 24 Mar 2021 07:11:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323165308.15244-10-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 17.52, Alex Bennée wrote:
> Query the SYS_HEAPINFO semicall and do some basic verification of the
> information via libc calls.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210320133706.21475-10-alex.bennee@linaro.org>
> 
> ---
> v2
>    - expand test as suggested by Richard
> ---
>   .../multiarch/arm-compat-semi/semihosting.c   | 55 ++++++++++++++++++-
>   1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/multiarch/arm-compat-semi/semihosting.c b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
> index b3fd16cd12..8627eee3cf 100644
> --- a/tests/tcg/multiarch/arm-compat-semi/semihosting.c
> +++ b/tests/tcg/multiarch/arm-compat-semi/semihosting.c
> @@ -8,9 +8,13 @@
>    */
>   
>   #define SYS_WRITE0      0x04
> +#define SYS_HEAPINFO    0x16
>   #define SYS_REPORTEXC   0x18
>   
>   #include <stdint.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
>   #include "semicall.h"
>   
>   int main(int argc, char *argv[argc])
> @@ -21,8 +25,57 @@ int main(int argc, char *argv[argc])
>       uintptr_t exit_block[2] = {0x20026, 0};
>       uintptr_t exit_code = (uintptr_t) &exit_block;
>   #endif
> +    struct {
> +        void *heap_base;
> +        void *heap_limit;
> +        void *stack_base;
> +        void *stack_limit;
> +    } info;
> +    void *ptr_to_info = (void *) &info;
>   
> -    __semi_call(SYS_WRITE0, (uintptr_t) "Hello World");
> +    __semi_call(SYS_WRITE0, (uintptr_t) "Checking HeapInfo\n");
> +
> +    memset(&info, 0, sizeof(info));
> +    __semi_call(SYS_HEAPINFO, (uintptr_t) &ptr_to_info);
> +
> +    if (info.heap_base == NULL || info.heap_limit == NULL) {
> +        printf("null heap: %p -> %p\n", info.heap_base, info.heap_limit);
> +        exit(1);
> +    }
> +
> +    /* Error if heap base is above limit */
> +    if ((uintptr_t) info.heap_base >= (uintptr_t) info.heap_limit) {
> +        printf("heap base %p >= heap_limit %p\n",
> +               info.heap_base, info.heap_limit);
> +        exit(2);
> +    }
> +
> +    if (info.stack_base == NULL || info.stack_limit) {
> +        printf("null stack: %p -> %p\n", info.stack_base, info.stack_limit);
> +        exit(3);
> +    }
> +
> +    /* check our local variables are indeed inside the reported stack */
> +    if (ptr_to_info > info.stack_base) {
> +        printf("info appears to be above stack: %p > %p\n", ptr_to_info,
> +               info.stack_base);
> +        exit(4);
> +    } else if (ptr_to_info < info.stack_limit) {
> +        printf("info appears to be outside stack: %p < %p\n", ptr_to_info,
> +               info.stack_limit);
> +        exit(5);
> +    }
> +
> +    if (ptr_to_info > info.heap_base && ptr_to_info < info.heap_limit) {
> +        printf("info appears to be inside the heap: %p in %p:%p\n",
> +               ptr_to_info, info.heap_base, info.heap_limit);
> +        exit(6);
> +    }
> +
> +    printf("heap: %p -> %p\n", info.heap_base, info.heap_limit);
> +    printf("stack: %p -> %p\n", info.stack_base, info.stack_limit);
> +
> +    __semi_call(SYS_WRITE0, (uintptr_t) "Passed HeapInfo checks");
>       __semi_call(SYS_REPORTEXC, exit_code);
>       /* if we get here we failed */
>       return -1;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


