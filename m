Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A656ADD79
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:33:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVYu-0006D5-Lm; Tue, 07 Mar 2023 06:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZVYs-0006CR-RT
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZVYr-0006Qj-II
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678188772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oDak3hqXUVmktsW1RUf94xaJaP+8v4PfakmakNoI5Vc=;
 b=jAmmm1JKlbOjJjRLNf2b41cpih+U6CDtIqu9B7NtmiymuqFmZKj3SJKBpZ5W5AVqT/6L+F
 CKmMhKFBQR0vcLbEALEXqqbQQai6TgoWiJg+Sfql7wpdD25WEj2P4jkujY8c7wLXc/NNmq
 iv0VwAHUC5TVswfb3VOn1vdU+WQYKCg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-bUPJBKarNui8vxHABrQswQ-1; Tue, 07 Mar 2023 06:32:51 -0500
X-MC-Unique: bUPJBKarNui8vxHABrQswQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 r14-20020a0560001b8e00b002cdb76f7e80so2131751wru.19
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678188770;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDak3hqXUVmktsW1RUf94xaJaP+8v4PfakmakNoI5Vc=;
 b=Tz+dwr2aFSS5LzELjXgtY3EspO05D/wJvsV4WhptQk8H4RR7BfbPoDgDXEWFkaOzR1
 qWCsIt0ssMji64bP0I9wn5uSKZjrtbeM8MLqowcnlMcF2m0X2XYegcKyy3VMEtc+/jrb
 i6BtTbrRzLwqLaBJRgKPJnSTscCYy7ihvkH3K7x01pWTW3F36ohlIqbr22Sp/VQV5Yxx
 jTJ5xqsbfs4HO1NCGjhmzlcGxD9LfMAuJGwDMcv/0XV5S5jK85LEAi/sg6+40Hv8SpER
 SuaGKdc+W891ouXttc4Em0uBfpT2jVR73JAhZFLeeTUl08xJbp5/D+tt7LvJ0GbtkEan
 0oFA==
X-Gm-Message-State: AO0yUKXe6rlKTHwIqxmNxKeEinmBQO2xcblIgfEYauenXhKgOou9hzV2
 q11oFZjCZTWI2TsSje5Zhyz/XamPJ5Q80ZaHPp11fR+KOCwq+OGZ/ctY5Ks5fNAAOwT8Ndu1Eol
 oDoBF8AzUYUhWZPQ=
X-Received: by 2002:a1c:750a:0:b0:3dc:4fd7:31f7 with SMTP id
 o10-20020a1c750a000000b003dc4fd731f7mr11872558wmc.41.1678188770233; 
 Tue, 07 Mar 2023 03:32:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+vCZrgD2dz0Z6VzHob1dA/76UaOCKfchpZtKmFARXY0bl6Tv+Rzxr8Sxq47rpYCtnTY5qTmA==
X-Received: by 2002:a1c:750a:0:b0:3dc:4fd7:31f7 with SMTP id
 o10-20020a1c750a000000b003dc4fd731f7mr11872543wmc.41.1678188769988; 
 Tue, 07 Mar 2023 03:32:49 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b002c557f82e27sm12132607wru.99.2023.03.07.03.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:32:49 -0800 (PST)
Date: Tue, 7 Mar 2023 11:32:47 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>, quintela@redhat.com
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH V2] migration: fix populate_vfio_info
Message-ID: <ZAcg39dY/kPK1Vjz@work-vm>
References: <1675796553-235469-1-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1675796553-235469-1-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Steve Sistare (steven.sistare@oracle.com) wrote:
> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> CONFIG_VFIO.  Without it, the 'info migrate' command never returns
> info about vfio.
> 
> Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate file")
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  migration/target.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/target.c b/migration/target.c
> index 907ebf0..00ca007 100644
> --- a/migration/target.c
> +++ b/migration/target.c
> @@ -8,6 +8,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "migration.h"
> +#include CONFIG_DEVICES
>  
>  #ifdef CONFIG_VFIO
>  #include "hw/vfio/vfio-common.h"
> @@ -17,7 +18,6 @@ void populate_vfio_info(MigrationInfo *info)
>  {
>  #ifdef CONFIG_VFIO
>      if (vfio_mig_active()) {
> -        info->has_vfio = true;

Why this removal?

Dave

>          info->vfio = g_malloc0(sizeof(*info->vfio));
>          info->vfio->transferred = vfio_mig_bytes_transferred();
>      }
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


