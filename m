Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B290861E273
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 14:49:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1org1V-0002qQ-5l; Sun, 06 Nov 2022 08:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1org1P-0002nF-Jq
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:49:12 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1org1N-0002SC-VW
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 08:49:11 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id j2so10832611ybb.6
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Koxt25dAHwmSBqitd69fODFeyKaeWiWzhRKiPOstpjk=;
 b=NC6tSjmosFwOp7/d1keNf+0WHsXjhLxhKpAUzpG7zmDxUSPg+RC4R0xB/tjrrLZCSl
 VYgSFY00HuUUG6dSKSNRZEvL6Xb4pxVS2MTrHQnhMwA26s5G2SM7n2+J/b+LqYs3cGPV
 y5OmqL8vHHkJHqPCGsk411gqfggEAetEQtz1q8MeBH9RG+PE67b7hOECH7WLkoWTrknC
 J7f8vfi1WEA4ex/xGiZHZBseEgjifqPnNALByjeTrYh3lN6EfOmVcSerG5cBfuNBNSkB
 eMfth2tU/CNV8HXlXBpmZOR0lTKLJvjr4pmw8piyNYglOuKLq/pVjD9ORpBIKAQ7f3Ev
 p3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Koxt25dAHwmSBqitd69fODFeyKaeWiWzhRKiPOstpjk=;
 b=SSHENCL3JamYbXb/hjl5D+TfSRuTwC6fin4Z6mok9hI+xu4xNie3u3tROxiIw7dFHq
 qabCjpesZdmOWsjvRdxLb6BpfWyM1Gp4v/wgnWknkqaBEc09QIYqMh46Y/P9LMnjYN0C
 9e7d+EmeljZkRJ1BqawSYSq4QqEoePl24w/r5yvTULXz713qebvKd9Jl5pm4tif0t89N
 iUAv7o/On2SNvpLNqj3OlsSqh+9CXfKs2yGCwB3Lr0/1WRf62mVflei8u33IkKEdhtLT
 kqkHhayTFzSvbe1+TS/3Ox+ujYTNa9vDqff6SuPmzokJOZcmKdrSQtGf9/uJTLRIZpvT
 +cuw==
X-Gm-Message-State: ACrzQf1FJzsnzF/lq1PAafZDeX/y3m3U2c35VVY2J1KwjnNqRno5+D/S
 y7/rlFxeoBHgX0zl9WIrrfylv3n3ErnoZFQ2Tv0=
X-Google-Smtp-Source: AMsMyM5brGITPFip8Heed9WVs8gTcrmiPAcDBB4H7AiBLW2xDrLBdzHyOhAQKx/YJj4QMP84REvEvvkiTsWfVqfZtqI=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr44769918ybe.642.1667742547392; Sun, 06
 Nov 2022 05:49:07 -0800 (PST)
MIME-Version: 1.0
References: <20221104230811.7188-1-nyoro.martin@gmail.com>
In-Reply-To: <20221104230811.7188-1-nyoro.martin@gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Sun, 6 Nov 2022 08:48:55 -0500
Message-ID: <CAJSP0QWry8DBoydu0bBEJm80-RaZXfAMPepKm6NEqdt-STykHQ@mail.gmail.com>
Subject: Re: [PATCH] LockGuards: replace manual lock()/unlock() calls to
 WITH_QEMU_LOCK_GUARD()
To: nyoro.gachu@gmail.com
Cc: qemu-devel@nongnu.org, stefanha@redhat.com, Samker <samkergachu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 4 Nov 2022 at 21:04, <nyoro.gachu@gmail.com> wrote:
>
> From: Samker <samkergachu@gmail.com>
...
> Signed-off-by: M N Gachu <nyoro.gachu@gmail.com>

The author and Signed-off-by name/email are different. Do you want to
use a single name/email?

> ---
>  softmmu/physmem.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index d9578ccfd4..fb00596777 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -24,6 +24,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/cacheflush.h"
>  #include "qemu/madvise.h"
> +#include "qemu/lockable.h"
>
>  #ifdef CONFIG_TCG
>  #include "hw/core/tcg-cpu-ops.h"
> @@ -3114,13 +3115,12 @@ void cpu_register_map_client(QEMUBH *bh)
>  {
>      MapClient *client = g_malloc(sizeof(*client));
>
> -    qemu_mutex_lock(&map_client_list_lock);
> +    WITH_QEMU_LOCK_GUARD(&map_client_list_lock);

There is a bug here: the lock won't be held after this line because
WITH_QEMU_LOCK_GUARD() is block scoped. It requires curly braces:

  WITH_QEMU_LOCK_GUARD(&lock) {
      ...protected code...
  }
  ...unprotected code...

Use QEMU_LOCK_GUARD(&lock); when don't want block scope. It holds the
lock for the remainder of the function.

