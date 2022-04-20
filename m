Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1AA508D29
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:23:57 +0200 (CEST)
Received: from localhost ([::1]:57916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhD7U-0004D8-LA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhCSC-0006vc-U4
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:41:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nhCSA-0002L5-UD
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:41:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650469273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9DfYREnQSQ9+dUz//rqip6nZHtCAe97XEdYZIm5893w=;
 b=JfZyOo3/4t1uKKQjBW/tcsoqdBDvdRwZkbHhSg35H2i/GXVSTpNHlXMz7DPTGBSmCbZsGx
 SQu+In+ucHwlLuFheA3dOp0lBrDbCt9VA1uhx2uJo3P9LKmt6nvZD0fT8MgdnR3NuXTbAz
 ZNCqCTjrQq94KjfKZvmFze5I4x+AKrk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-4npPYOvfOeeLnVKiH9-R1g-1; Wed, 20 Apr 2022 11:41:08 -0400
X-MC-Unique: 4npPYOvfOeeLnVKiH9-R1g-1
Received: by mail-wm1-f70.google.com with SMTP id
 i184-20020a1c3bc1000000b0038e4c5968b5so3133562wma.0
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9DfYREnQSQ9+dUz//rqip6nZHtCAe97XEdYZIm5893w=;
 b=BErbvovXx5ZRWtu+Em4z6enBbiG371K7NvGUd6s30kMcypmsTU+MtffrFm5DVhGqpQ
 8jd3vODrw756dlHdrodfzBQ4zuBBMTEXrEOTK+223jW+BP89mxSMXgZknlRtWv04kMkF
 BEBiIamrNJtyN92yOPfKMSE1zuiQ8WQDKMCTjpGav+oO4uXxvTkjVqJIxBzYcXlvQzah
 DjwxX1tx7emYWgeLepKtpbniFYKReY4VLREaTQnHDxJP3aFbNvPaS/RhjPt8lnLqdaDp
 DlzdL0/AEOXQR+L5vbA1trd8Wa1CGL1XwPsXC4eHUsPRkxXrzXVdB8akQjUmzlFvkb7f
 hhzg==
X-Gm-Message-State: AOAM5309fy7HedKaZLOLpbyh2hno4UNnoMcQrIXIL5GZFL0tpbffMGiI
 iFDC8j4z2vhfYZVexJgCxhsIu7Bx2IzyXvNjoie3On6QLM2jQOExuQtsm8AP7lPy3+maYuFNEbB
 GE/g1fZLHPO4SjoI=
X-Received: by 2002:a5d:4e45:0:b0:209:87ac:4cce with SMTP id
 r5-20020a5d4e45000000b0020987ac4ccemr15832740wrt.669.1650469267314; 
 Wed, 20 Apr 2022 08:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkEV8onrzNbM9gTo+0PzKwKRbbukQ8V3CMEcXFf3g+Njb2ky99TYVrk91/Vyoesro/8q0F0w==
X-Received: by 2002:a5d:4e45:0:b0:209:87ac:4cce with SMTP id
 r5-20020a5d4e45000000b0020987ac4ccemr15832720wrt.669.1650469267067; 
 Wed, 20 Apr 2022 08:41:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 d18-20020a05600c34d200b0038ed14b7ac3sm109508wmq.40.2022.04.20.08.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:41:06 -0700 (PDT)
Date: Wed, 20 Apr 2022 16:41:04 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 2/3] qapi: Fix documentation for
 query-xen-replication-status
Message-ID: <YmApkGQI0C/R195u@work-vm>
References: <20220420153408.243584-1-abologna@redhat.com>
 <20220420153408.243584-3-abologna@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420153408.243584-3-abologna@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrea Bolognani (abologna@redhat.com) wrote:
> The correct return type is ReplicationStatus, not
> ReplicationResult.
> 
> Signed-off-by: Andrea Bolognani <abologna@redhat.com>

Hmm yes I think that's right.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qapi/migration.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 27d7b28158..409eb086a2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1619,7 +1619,7 @@
>  #
>  # Query replication status while the vm is running.
>  #
> -# Returns: A @ReplicationResult object showing the status.
> +# Returns: A @ReplicationStatus object showing the status.
>  #
>  # Example:
>  #
> -- 
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


