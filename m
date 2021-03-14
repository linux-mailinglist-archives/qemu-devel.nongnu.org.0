Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90533A578
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 16:40:00 +0100 (CET)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLSqV-0004eL-EA
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 11:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lLSpJ-0003ol-B6
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 11:38:45 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lLSpH-0000Kp-Rw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 11:38:45 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ci14so62007794ejc.7
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 08:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0RxPTZmycXU/T12a20usvfOvXi6QssR/O3yxJlY36Dk=;
 b=aAspRVyawTquNTUAaCBrqxbuqEjy6CIM9Jklu9Z8Af3iWO0PwIPlWeXDNpXzwrbIoL
 yIhZALBEljBr4uui7EPDIb9R+abWx9KsEHr1nZ97xTKFSwJOAQ+UI+0ufF5TCxVnYFq5
 IYPK7ZV5FSFRhHqZ6SJWuauswM2YgdHdCFkq8wv92Bz4WRwgGuUPCsbtgg9DEPLX6iwA
 vHNsH6FqFp+cTGgd4K81pjC8LVmIs4MtfxKnNKM1wTyuDGGh+idd2Gl7y8r+HmbnWGNA
 wmon7H+WkYb8gW0ZdmeWDB72+UYOXeL0WU3bPWGor1BpGZse38euzF7twiIyvOjVQrzk
 7A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0RxPTZmycXU/T12a20usvfOvXi6QssR/O3yxJlY36Dk=;
 b=KxbxfveMMt12I843cj0oVdIGSej+sdsNBRY+cS4WgKyeHfTdLa+LsM5tfNuMTHsvRZ
 GCVvEN3fOEgV30aNYePWSP9vfcFOV2OtjF3R1tKpSJRHIiLGd9PZropaZojlzwXSj6Vy
 xWWH/1xmRrbdrK9Ra0PMk4cHf4gC9PM8/he4sku38aN78tflFuMmb19axiT3I/iMAaGX
 kijIrDl5wta1xeWAhudIMzRWTDMSrCFqa+MPhj4qKqKbH/zLqvRLa5MPrTU6kXzd3QBH
 Shx/J2YOGOiin5hRFepyoDFJYx3O/dbiiUNJ7c84p1ppv6j+v4tySe8TWaAIrwBBKcS1
 hwjA==
X-Gm-Message-State: AOAM530QeJOnlqqewQAS/WVxigzDhmxaS5PAX0S0m9U+UlHCRzxXQKkD
 qdRvvX1f1VOFBJznfhBkFUknA+ERp1SOJDDHSyM=
X-Google-Smtp-Source: ABdhPJyeH+1Z04JgteeDY/6hVjUyPLCj6wCZA9AYypqPcmNkyqszmrqdRbuGnNmo/u4a0plSNoMjAcFZtOEmxIRUr9w=
X-Received: by 2002:a17:906:1f93:: with SMTP id
 t19mr19575578ejr.443.1615736321938; 
 Sun, 14 Mar 2021 08:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-5-ma.mandourr@gmail.com>
In-Reply-To: <20210314032324.45142-5-ma.mandourr@gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 14 Mar 2021 08:38:30 -0700
Message-ID: <CAMo8BfKC1MF_zNJOZ0GLzLF9_FD8GJ-1tJbiTFT4sNJAWo4B7Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] target/xtensa: Replaced malloc/free with GLib's
 variants
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 13, 2021 at 7:23 PM Mahmoud Mandour <ma.mandourr@gmail.com> wrote:
>
> Replaced the calls to malloc() and their respective calls to
> free() with GLib's allocation and deallocation functions.
>
> Removed null checking before calling g_free() because it's
> not necessary and generates style errors.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  target/xtensa/xtensa-isa.c | 53 +++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 32 deletions(-)
>
> diff --git a/target/xtensa/xtensa-isa.c b/target/xtensa/xtensa-isa.c
> index 630b4f9da1..5afdba77aa 100644
> --- a/target/xtensa/xtensa-isa.c
> +++ b/target/xtensa/xtensa-isa.c

[...]

> @@ -332,36 +332,25 @@ void xtensa_isa_free(xtensa_isa isa)
>       * structure to its initial state.
>       */
>
> -    if (intisa->opname_lookup_table) {
> -        free(intisa->opname_lookup_table);
> -        intisa->opname_lookup_table = 0;
> -    }
> +    g_free(intisa->opname_lookup_table);
> +    intisa->opname_lookup_table = 0;

This 0 should be replaced with NULL.

>
> -    if (intisa->state_lookup_table) {
> -        free(intisa->state_lookup_table);
> -        intisa->state_lookup_table = 0;
> -    }
> +    g_free(intisa->state_lookup_table);
> +    intisa->state_lookup_table = 0;

Ditto.

> +
> +    g_free(intisa->sysreg_lookup_table);
> +    intisa->sysreg_lookup_table = 0;

Ditto.

>
> -    if (intisa->sysreg_lookup_table) {
> -        free(intisa->sysreg_lookup_table);
> -        intisa->sysreg_lookup_table = 0;
> -    }
>      for (n = 0; n < 2; n++) {
> -        if (intisa->sysreg_table[n]) {
> -            free(intisa->sysreg_table[n]);
> -            intisa->sysreg_table[n] = 0;
> -        }
> +        g_free(intisa->sysreg_table[n]);
> +        intisa->sysreg_table[n] = 0;

Ditto.

>      }
>
> -    if (intisa->interface_lookup_table) {
> -        free(intisa->interface_lookup_table);
> -        intisa->interface_lookup_table = 0;
> -    }
> +    g_free(intisa->interface_lookup_table);
> +    intisa->interface_lookup_table = 0;

Ditto.

>
> -    if (intisa->funcUnit_lookup_table) {
> -        free(intisa->funcUnit_lookup_table);
> -        intisa->funcUnit_lookup_table = 0;
> -    }
> +    g_free(intisa->funcUnit_lookup_table);
> +    intisa->funcUnit_lookup_table = 0;

Ditto.

With the above changes:
Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max

