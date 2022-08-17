Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E69597982
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 00:12:05 +0200 (CEST)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oORGa-0007LU-Ev
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 18:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORE1-0005OQ-Ab
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:09:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oORDy-0006nO-QJ
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 18:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660774158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hxqe6YbWY8LbNBDkE6AAwGvNQS1jk2vuJSnHWyi66A8=;
 b=BEFv6P8XpsS3Q37p+69LY0tGbGk9zqrWcom2vt/d7/b7dJqezNuPLOJyfQNoTk+fevQddG
 Mk/q2naJopy/mXVFT6wDVEW0h9jxbkaL5CpuLlrhI8RmMdW44aSqeVOl924F6ZtMyQ8HvX
 DH4I0dwe+pIucwoZEwLOsT+oHThHEMs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-0NB4WpuhMj-gRp6H7yyN4g-1; Wed, 17 Aug 2022 18:09:14 -0400
X-MC-Unique: 0NB4WpuhMj-gRp6H7yyN4g-1
Received: by mail-qk1-f199.google.com with SMTP id
 bq19-20020a05620a469300b006bb70e293ccso4317548qkb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 15:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=Hxqe6YbWY8LbNBDkE6AAwGvNQS1jk2vuJSnHWyi66A8=;
 b=D9CYdm5pop/BFVGPbOE4YVJ4FCavmEkdYrjyBFXxjZq40AFaJA+4BOErVIj3wXesR8
 NDxp1McFn1fspO9PDmsYrvo3yqNoEuSBRGGdneHfhORagtuLfPhkltMLeBhE8KIo5LOq
 DHVC55Ctlb/wDN86vJhHbkItsHf4EvaPn1B3BgfVBNlK6XLNCUkJEL1pap8zBZwquqZ1
 2i4f3JBu0ReQU+7lCakn6b55uCW4vLXL51xQQ18Ji9tGW/mB/IPCWfGoL/AgmXq44f8P
 VoYnf89rVKbkRMcYRwYghEUHqpu8EJWMPxAU+w/rIgSBE5eg9CzIx/OlwTgyPe+NAun5
 /0FA==
X-Gm-Message-State: ACgBeo23Sj9vMQP6d136QuYzCl67BNNB4lD+7cZJQoTZxyWluSrARqNx
 cRrFGadzJsrD3gCZrvky/gMYFilU8A9IRQv07G9N4N40PGrdHtS2srPR16aWagfMzV/DfupeS5R
 ZPJn9y46Acnz0hfs=
X-Received: by 2002:a05:6214:f6e:b0:496:b88d:dd96 with SMTP id
 iy14-20020a0562140f6e00b00496b88ddd96mr71294qvb.77.1660774154251; 
 Wed, 17 Aug 2022 15:09:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jAysodGeYR92eogyDkHDxTVCOIt38yqkX8P5cmrHNW5U2x8ueHgMl/v2kMfOaMLDwx2s5sA==
X-Received: by 2002:a05:6214:f6e:b0:496:b88d:dd96 with SMTP id
 iy14-20020a0562140f6e00b00496b88ddd96mr71271qvb.77.1660774154005; 
 Wed, 17 Aug 2022 15:09:14 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05620a24d200b006b9a8fc0c93sm34545qkn.53.2022.08.17.15.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 15:09:13 -0700 (PDT)
Date: Wed, 17 Aug 2022 18:09:12 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 4/8] migration: Implement dirty-limit convergence algo
Message-ID: <Yv1nCNl9wzNmocM0@xz-m1.local>
References: <cover.1658561555.git.huangy81@chinatelecom.cn>
 <a2fc4b9a622fbefcad1750b13fcb924caf60ec0b.1658561555.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2fc4b9a622fbefcad1750b13fcb924caf60ec0b.1658561555.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 23, 2022 at 03:49:16PM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Implement dirty-limit convergence algo for live migration,
> which is kind of like auto-converge algo but using dirty-limit
> instead of cpu throttle to make migration convergent.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/ram.c        | 53 +++++++++++++++++++++++++++++++++++++-------------
>  migration/trace-events |  1 +
>  2 files changed, 41 insertions(+), 13 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index b94669b..2a5cd23 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -45,6 +45,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "qapi/qapi-events-migration.h"
> +#include "qapi/qapi-commands-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "trace.h"
>  #include "exec/ram_addr.h"
> @@ -57,6 +58,8 @@
>  #include "qemu/iov.h"
>  #include "multifd.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/dirtylimit.h"
> +#include "sysemu/kvm.h"
>  
>  #include "hw/boards.h" /* for machine_dump_guest_core() */
>  
> @@ -1139,6 +1142,21 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
>      }
>  }
>  
> +/*
> + * Enable dirty-limit to throttle down the guest
> + */
> +static void migration_dirty_limit_guest(void)
> +{
> +    if (!dirtylimit_in_service()) {
> +        MigrationState *s = migrate_get_current();
> +        int64_t quota_dirtyrate = s->parameters.vcpu_dirty_limit;
> +
> +        /* Set quota dirtyrate if dirty limit not in service */
> +        qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
> +        trace_migration_dirty_limit_guest(quota_dirtyrate);
> +    }
> +}

What if migration is cancelled?  Do we have logic to stop the dirty limit,
or should we?

-- 
Peter Xu


