Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEE26804D6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:18:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLbX-0000cK-4i; Sun, 29 Jan 2023 23:17:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLbC-0000bL-TX
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:17:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLbA-0001ij-Ti
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052212;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=EK4FWVhw41A+YzQxDIRiLniL5PTqlHaOD+VWFbW7HvdQjmEY57BTn0SeJhl2gqKUvln1/p
 uHuwgF1jLa1ibGz0aZAk5Nz28vwQJ2VkhCnk12ZLGD5Q0+y1/HjvIikzo0nt5LMmLTaiHO
 c2ju8XwKDrjDv6PBJ6fRjSRqwpoQfVw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-jIr9tSmJO2KP5Q-nLt_v5A-1; Sun, 29 Jan 2023 23:16:40 -0500
X-MC-Unique: jIr9tSmJO2KP5Q-nLt_v5A-1
Received: by mail-wm1-f71.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1365250wmb.2
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gU8adfAwuLfc26sqIh9pm7Jq7Iesz802exA5x/kmz6k=;
 b=WZT8un8efM1glszf/IS4Yeq+1X/zcG5turi6w1HTZf5tG2x0M0fGHkj9ua0lRbkJQc
 ZdalqX7QDEfnzxYuEWQ5s70L+pnsk4qrFUqq22D2cbI/pKdMCw3rJwmyRMv8v+HcSotQ
 yz+/nq208E55TQt263tgcYW5xmnETuShvDb9WUamLQujy7Du2syJtLVAB4GuxEJL+kzy
 PuNJl9Er8FXTOfPk9k2nR1nsXAhVUO71SiXadkZ2r+zh0TCERoHyu7D4g9jdvm7BJcZK
 rjSh0vuYQjpYHsKq8Wg/j8VFiH2tUcv/KL5XFJdJu3FV6gJWf5BJTt8SzthLvO6NjZxz
 AB0A==
X-Gm-Message-State: AO0yUKWM4YTywrZ9Ec1MmvXkzjVCz+gdMJTmkUYomIThrG/EPzyX6c+D
 y4nkyu7k4U43qWpL8E1GGJlqheA+j02PPlExHe8IKQjGWpPco+eVSflpdsLtxB0RzHau7rxEMZY
 HJlBpTDCkOxmwypE=
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048255wml.35.1675052199093; 
 Sun, 29 Jan 2023 20:16:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/NuJm0/GGFcSWLl2wNg3skVv07Dwu7LNXy9+q+i4AjVPh3KV/Q5F/R/gsH9xGlHqFeji8eAg==
X-Received: by 2002:a7b:c85a:0:b0:3d2:813:138a with SMTP id
 c26-20020a7bc85a000000b003d20813138amr4048227wml.35.1675052198873; 
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c26d300b003dc50c38921sm4586064wmv.35.2023.01.29.20.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:16:38 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  qemu_oss@crudebyte.com,  mst@redhat.com,
 philmd@linaro.org,  peter.maydell@linaro.org,  alistair@alistair23.me,
 jasowang@redhat.com,  jonathan.cameron@huawei.com,
 kbastian@mail.uni-paderborn.de,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com,  tsimpson@quicinc.com,
 palmer@dabbelt.com,  bin.meng@windriver.com,  qemu-block@nongnu.org,
 qemu-arm@nongnu.org,  qemu-riscv@nongnu.org
Subject: Re: [PATCH v4 19/19] Drop duplicate #include
In-Reply-To: <20230119065959.3104012-20-armbru@redhat.com> (Markus
 Armbruster's message of "Thu, 19 Jan 2023 07:59:59 +0100")
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-20-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:16:37 +0100
Message-ID: <87357spsgq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Markus Armbruster <armbru@redhat.com> wrote:
> Tracked down with the help of scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>


> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index b9a37ef255..8b7d1af75d 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu/rcu.h"
>  #include "qemu/madvise.h"
>  #include "exec/target_page.h"
>  #include "migration.h"
> @@ -34,7 +33,6 @@
>  #include "hw/boards.h"
>  #include "exec/ramblock.h"
>  #include "socket.h"
> -#include "qemu-file.h"
>  #include "yank_functions.h"
>  #include "tls.h"

Ouch

Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't want to look into the logs.  They *could* say that it was me the
one doing the mess.


