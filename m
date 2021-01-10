Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF62F0A46
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 00:19:57 +0100 (CET)
Received: from localhost ([::1]:56492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyk03-0000jt-TI
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 18:19:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyjz4-0000IB-Mf
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 18:18:54 -0500
Received: from mailout05.t-online.de ([194.25.134.82]:54684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1kyjz2-0001xj-PX
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 18:18:54 -0500
Received: from fwd18.aul.t-online.de (fwd18.aul.t-online.de [172.20.26.244])
 by mailout05.t-online.de (Postfix) with SMTP id 2FD584213F20;
 Mon, 11 Jan 2021 00:18:50 +0100 (CET)
Received: from [192.168.211.200]
 (bNU79TZBohWLZdpbW5aUwrBY2AuepKpVT22AV807YVu1c2Twcar+sRPMDyghR+RghO@[93.236.152.29])
 by fwd18.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1kyjyo-21CCYa0; Mon, 11 Jan 2021 00:18:38 +0100
Subject: Re: [PULL 04/47] util/oslib-win32: Use _aligned_malloc for
 qemu_try_memalign
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
 <20210107201448.1152301-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Message-ID: <167e3961-f402-a551-b6b5-e75335208346@t-online.de>
Date: Mon, 11 Jan 2021 00:18:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107201448.1152301-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: bNU79TZBohWLZdpbW5aUwrBY2AuepKpVT22AV807YVu1c2Twcar+sRPMDyghR+RghO
X-TOI-EXPURGATEID: 150726::1610320719-00012C5A-A6E629F6/0/0 CLEAN NORMAL
X-TOI-MSGID: 18cfb347-d788-4d6f-8e18-01267f982284
Received-SPF: none client-ip=194.25.134.82; envelope-from=vr_qemu@t-online.de;
 helo=mailout05.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.012, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We do not need or want to be allocating page sized quanta.
>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> Message-Id: <20201018164836.1149452-1-richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  util/oslib-win32.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index 01787df74c..8adc651259 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -39,6 +39,7 @@
>  #include "trace.h"
>  #include "qemu/sockets.h"
>  #include "qemu/cutils.h"
> +#include <malloc.h>
>  
>  /* this must come after including "trace.h" */
>  #include <shlobj.h>
> @@ -56,10 +57,8 @@ void *qemu_try_memalign(size_t alignment, size_t size)
>  {
>      void *ptr;
>  
> -    if (!size) {
> -        abort();
> -    }
> -    ptr = VirtualAlloc(NULL, size, MEM_COMMIT, PAGE_READWRITE);
> +    g_assert(size != 0);
> +    ptr = _aligned_malloc(alignment, size);

Hi Richard,

this doesn't work really well. The _aligned_malloc parameters are swapped. ptr = _aligned_malloc(size, alignment) is correct.

With best regards,
Volker

>      trace_qemu_memalign(alignment, size, ptr);
>      return ptr;
>  }
> @@ -93,9 +92,7 @@ void *qemu_anon_ram_alloc(size_t size, uint64_t *align, bool shared)
>  void qemu_vfree(void *ptr)
>  {
>      trace_qemu_vfree(ptr);
> -    if (ptr) {
> -        VirtualFree(ptr, 0, MEM_RELEASE);
> -    }
> +    _aligned_free(ptr);
>  }
>  
>  void qemu_anon_ram_free(void *ptr, size_t size)


