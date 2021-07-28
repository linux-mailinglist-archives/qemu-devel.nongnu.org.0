Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBB3D961E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 21:39:32 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8pOt-00085f-MT
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 15:39:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>) id 1m8pNN-0006iR-MB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:37:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rth7680@gmail.com>) id 1m8pNL-0000Ny-Pw
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 15:37:57 -0400
Received: by mail-pj1-x102b.google.com with SMTP id ca5so6703111pjb.5
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tJCB2hx5xR17KzB2xe6SZl9rKeU7YseN6LInOEmhets=;
 b=HNMEMEh0bLcJ0/PHIS5StqoWvVqolvIaB1hft6NUKVuMhjjXs6uiQFPUoDFMYWD6CP
 6fd7y5sq3lV1TToLd7UpcL1qxAw1ObNhRu4HxdqTb9GlBSryz1rphaynjfJR0nje6GOf
 V/rxOcDHUjo1PWu/li/O8dU3aF8EmEoFQs4nLrQ0ZvySME3juj8LTVdPjTnUidIhDdsg
 M54k7xpsgvQryTPOOrpGJIuurcsin9N1QDhrE2VUqlCwubs8fSAwGsb7D3xXy7hdAD2P
 Ut6hwMuaSgJue9lFGLr+3KNmJduJQmsMa9kNE89cE7pjH5uOezBM47vP9DUyepcAr5wM
 5N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tJCB2hx5xR17KzB2xe6SZl9rKeU7YseN6LInOEmhets=;
 b=dIaJsl6/JDkV73a8YcE2EF8DgRk5fDVBjn9mXRgLqoSlYcrnZUuuVYD6vlFs6kfLm4
 KnZp3W3dwIX3TQ1Q0S2uEzCbVyJ2CVAtHcRuHa7i6SD1JPXdWZsrphUmXt13JfJDvn1T
 oBpU59H1M5HBs1DvLuJlykoCV3IFF6/0jg2DQENceCU7OB7HbA1OIquQSpzrnvF+jz2v
 RSIrTINqM6h2A7BqujyWp33wuKyswha0kPsFO6hva9dOdhCXer/1WPoD/W5j/rQSg8/g
 1qMIz3/d8q8Rg+7qCrl9gB/6xbCN7GQlVSWye1IhAAqs2+XMDm7j8BfLdIaMj9dXSbGE
 YxGw==
X-Gm-Message-State: AOAM532oRJTSOkyaCFXumN5J5NRoGSarXF3gu4/BDJSsReeL6kqIDmK0
 eu49Jp53YEknWHh7DTQnCyc=
X-Google-Smtp-Source: ABdhPJz76M1BaDdCXHoHWcp4aJ6taiXtrVyU5J6fLXG/XzHOV2XR3pArEbJUzl2zrfeWvFjlqO0ntQ==
X-Received: by 2002:a17:90b:1b0c:: with SMTP id
 nu12mr11390896pjb.177.1627501073418; 
 Wed, 28 Jul 2021 12:37:53 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604?
 (2603-800c-3202-ffa7-dcaa-9e71-a2b2-2604.res6.spectrum.com.
 [2603:800c:3202:ffa7:dcaa:9e71:a2b2:2604])
 by smtp.googlemail.com with ESMTPSA id z3sm506152pjn.43.2021.07.28.12.37.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 12:37:52 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <9b93e149-3147-3dca-83ce-474af99ccd2e@twiddle.net>
Date: Wed, 28 Jul 2021 09:37:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615175523.439830-3-peterx@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=rth7680@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 7:55 AM, Peter Xu wrote:
> Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
> source should be mostly enough, but let's change the dest too to make them
> match always.
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 55 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d9225f58d4d..9ef6b471353 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -27,6 +27,10 @@
>   #include "migration-helpers.h"
>   #include "tests/migration/migration-test.h"
>   
> +#if defined(__linux__)
> +#include "linux/kvm.h"
> +#endif

This breaks the build for hosts that do not support kvm, e.g. sparc:


[2/3] Compiling C object tests/qtest/migration-test.p/migration-test.c.o
FAILED: tests/qtest/migration-test.p/migration-test.c.o
cc -Itests/qtest/migration-test.p -Itests/qtest -I../qemu/tests/qtest -I. -Iqapi -Itrace 
-Iui -Iui/shader -I/usr/include/glib-2.0 -I/usr/lib/sparc64-linux-gnu/glib-2.0/include 
-fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem 
/home/rth/qemu/qemu/linux-headers -isystem linux-headers -iquote . -iquote 
/home/rth/qemu/qemu -iquote /home/rth/qemu/qemu/include -iquote 
/home/rth/qemu/qemu/disas/libvixl -iquote /home/rth/qemu/qemu/tcg/sparc -pthread 
-U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -mcpu=ultrasparc -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv 
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-security 
-Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels 
-Wexpansion-to-defined -Wimplicit-fallthrough=2 -Wno-missing-include-dirs 
-Wno-shift-negative-value -Wno-psabi -fPIE -MD -MQ 
tests/qtest/migration-test.p/migration-test.c.o -MF 
tests/qtest/migration-test.p/migration-test.c.o.d -o 
tests/qtest/migration-test.p/migration-test.c.o -c ../qemu/tests/qtest/migration-test.c
In file included from ../qemu/tests/qtest/migration-test.c:31:
/home/rth/qemu/qemu/linux-headers/linux/kvm.h:15:10: fatal error: asm/kvm.h: No such file 
or directory
    15 | #include <asm/kvm.h>
       |          ^~~~~~~~~~~
compilation terminated.


r~

