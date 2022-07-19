Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7CC57A431
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:27:45 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDq4W-0001sS-Kw
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDq0Q-0005TF-7c
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oDq0L-00059I-NV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658247803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qi2FDdLbM9C/DmPUBGhEMRewyfwGrqgR8WMjS7pPEiU=;
 b=K+7FwV3uprTudA8q4AUT7Lj4tdXhg1veMhE8yUFj+E27+BK7qcPSzktZXvdLgZm2ZZi9z+
 YK+886/+1XomJSDbHY/dfPDd6KkkEej9Xn+xv65/3Wc36ldDnKfkIgQelLq+oGHoDaRiv9
 KKhMeeLk5xHVO7OkV/wSrOVpG1uxNDc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-d7TjtoaxMES8PEvfil2LsA-1; Tue, 19 Jul 2022 12:23:22 -0400
X-MC-Unique: d7TjtoaxMES8PEvfil2LsA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5624248wmj.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qi2FDdLbM9C/DmPUBGhEMRewyfwGrqgR8WMjS7pPEiU=;
 b=eWf3bgXJYDe5LHBqFHCKKBTB/RPnAF7paLz4zeEj+5E0GhGmgrFlM2Y3fFDFeoa5vT
 z3ZDuPohlQdlkSIwkrkZHxzG1H8WvF5SCYCE4aZwSd6yLpnrIXQ986romD4tHPiPYg5x
 5gNFePinnaCxpszQxjxeOOl+vIVcwDlYpoo6JzqbRCCYox9+3YREI03dQ/p/0D5V2/lU
 zknPpL9wjEUglvn00Pa0nWHTbQHU813T5b/3PhjGROO+NoFpBIe4I+/wO/fk4w3dsUwy
 ITFXqNNA+rYBdhD79v2jUnsX5D9mWwucyUII2n9evEmWfToFnIpq39BztP9+noTGYVHL
 TyNw==
X-Gm-Message-State: AJIora+Mb4fhpy6YLQa+RYkrabfB+Kft/krgoAK3DfWq1TSjdQhmShIt
 eal645aX/2cl7C4SrC34OladDgTiLJFZf12QBqBqzctRRmmFXWt7ev/fvxspIk4Ndy8ObSc/X6w
 A4Nug2dk8hdLCD0k=
X-Received: by 2002:adf:ee0f:0:b0:21d:6e3b:d262 with SMTP id
 y15-20020adfee0f000000b0021d6e3bd262mr26515146wrn.687.1658247801085; 
 Tue, 19 Jul 2022 09:23:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfEQHFKRdxCeLzn7bg3gtHfWzWUS3yi/XkTuHMzf2nwx8mVMgxPNPJu+1vAuerYNkWKranuQ==
X-Received: by 2002:adf:ee0f:0:b0:21d:6e3b:d262 with SMTP id
 y15-20020adfee0f000000b0021d6e3bd262mr26515132wrn.687.1658247800868; 
 Tue, 19 Jul 2022 09:23:20 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 r6-20020a5d6946000000b0021b91d1ddbfsm13860558wrw.21.2022.07.19.09.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 09:23:20 -0700 (PDT)
Date: Tue, 19 Jul 2022 17:23:18 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v1 1/1] migration: Avoid false-positive on non-supported
 scenarios for zero-copy-send
Message-ID: <YtbadoNW+aSyQ84E@work-vm>
References: <20220719122345.253713-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220719122345.253713-1-leobras@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

* Leonardo Bras (leobras@redhat.com) wrote:
> Migration with zero-copy-send currently has it's limitations, as it can't
> be used with TLS nor any kind of compression. In such scenarios, it should
> output errors during parameter / capability setting.
> 
> But currently there are some ways of setting this not-supported scenarios
> without printing the error message:
> 
> !) For 'compression' capability, it works by enabling it together with
> zero-copy-send. This happens because the validity test for zero-copy uses
> the helper unction migrate_use_compression(), which check for compression
> presence in s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS].
> 
> The point here is: the validity test happens before the capability gets
> enabled. If all of them get enabled together, this test will not return
> error.
> 
> In order to fix that, replace migrate_use_compression() by directly testing
> the cap_list parameter migrate_caps_check().
> 
> 2) For features enabled by parameters such as TLS & 'multifd_compression',
> there was also a possibility of setting non-supported scenarios: setting
> zero-copy-send first, then setting the unsupported parameter.
> 
> In order to fix that, also add a check for parameters conflicting with
> zero-copy-send on migrate_params_check().
> 
> 3) XBZRLE is also a compression capability, so it makes sense to also add
> it to the list of capabilities which are not supported with zero-copy-send.
> 
> Fixes: 1abaec9a1b2c ("migration: Change zero_copy_send from migration parameter to migration capability")
> Signed-off-by: Leonardo Bras <leobras@redhat.com>

Yeh, it's unusual in that you need to check both the capabilities and
parameters; where as we have the inidividual 'caps_check' and
'params_check'.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 78f5057373..c6260e54bf 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1274,7 +1274,9 @@ static bool migrate_caps_check(bool *cap_list,
>  #ifdef CONFIG_LINUX
>      if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
>          (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
> -         migrate_use_compression() ||
> +         cap_list[MIGRATION_CAPABILITY_COMPRESS] ||
> +         cap_list[MIGRATION_CAPABILITY_XBZRLE] ||
> +         migrate_multifd_compression() ||
>           migrate_use_tls())) {
>          error_setg(errp,
>                     "Zero copy only available for non-compressed non-TLS multifd migration");
> @@ -1511,6 +1513,17 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>          error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
>          return false;
>      }
> +
> +#ifdef CONFIG_LINUX
> +    if (migrate_use_zero_copy_send() &&
> +        ((params->has_multifd_compression && params->multifd_compression) ||
> +         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
> +        error_setg(errp,
> +                   "Zero copy only available for non-compressed non-TLS multifd migration");
> +        return false;
> +    }
> +#endif
> +
>      return true;
>  }
>  
> -- 
> 2.37.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


