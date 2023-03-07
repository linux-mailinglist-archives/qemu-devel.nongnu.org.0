Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F356AE36B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:55:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYj8-0000Aq-Oe; Tue, 07 Mar 2023 09:55:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZYj6-00008i-W9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZYj5-0004AQ-MK
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:55:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678200937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0j8M9++z4TYW1EadNTIGB1llO2/qg+02n4l606k/QDM=;
 b=Hy4tAnt4/5OylHUbfFfHXbOo9LI7+cxSqOq2ivzYGCMeanXeqJ3r1oh6QiYlhMgaxxikJ0
 RhcwcccBokJpT/OPy3ScOTMHL0dHSUCquxX/sSDoAJI058u+aThZFtn0iAtQilIrBH13VF
 IvRYlabLruwikm86vNGwQyBClR65FJo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-PQmHb4cENqWsM0c7VgOpHg-1; Tue, 07 Mar 2023 09:55:36 -0500
X-MC-Unique: PQmHb4cENqWsM0c7VgOpHg-1
Received: by mail-wr1-f70.google.com with SMTP id
 o3-20020a5d6483000000b002cc4fe0f7fcso2249735wri.7
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678200935;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0j8M9++z4TYW1EadNTIGB1llO2/qg+02n4l606k/QDM=;
 b=C4fWuV6zPkEz8G7o6wqppurruJXJLH/j5+xT7UBwNfZrcYxDWG1lMdeWbh5VMhILzk
 vsfWWv75XieIahEiqWsqDksqx77rU6aotbGUvKVtgdv/P/47qWxFXV6ZbkZL/do3WN9x
 752z9MeNCq1O3105Pa6CpB36pHzq7kgIjGKIOrZH8LEHodbtqmNpf7R5ImwdZizrHJ+9
 IrqWJtitk3/C6fbguUK59/ErCjm8mVFfyxds1iPbXlXEr9YdDK6hgeGF3PBHHXWa8eUz
 EtuKeQqmEs2LGAwp8z7DQQEswqHolQZxxDPUejE7pZO3EPcj0Im5fX1NQN/LG3AxeBmh
 P0Pw==
X-Gm-Message-State: AO0yUKXI7hHkeUPspXtEUpUTYSzUxYw/PMmeOrI+Idj+18SQbbtd33ER
 Lx+xKDNOIf0Hg8EksFmEHLJwpvFHT442S48RQICYlD11G5GgkFncNYJ6myCtUmWo2XAVfG40drU
 8Fu4SeVFiAB7+npg=
X-Received: by 2002:a5d:460b:0:b0:2c9:a800:7d08 with SMTP id
 t11-20020a5d460b000000b002c9a8007d08mr9476782wrq.43.1678200935403; 
 Tue, 07 Mar 2023 06:55:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9zVUQe9tob9qu/vfejQNMTZlkJP/L90Xg+aLCaeMXFZp8yI0Bg1PTQ0/1xOFTFvtMm+vyPyg==
X-Received: by 2002:a5d:460b:0:b0:2c9:a800:7d08 with SMTP id
 t11-20020a5d460b000000b002c9a8007d08mr9476773wrq.43.1678200935097; 
 Tue, 07 Mar 2023 06:55:35 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d68ca000000b002c59e001631sm13066954wrw.77.2023.03.07.06.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:55:34 -0800 (PST)
Date: Tue, 7 Mar 2023 14:55:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steven Sistare <steven.sistare@oracle.com>
Cc: quintela@redhat.com, qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH V2] migration: fix populate_vfio_info
Message-ID: <ZAdQZBQUvA1BAunT@work-vm>
References: <1675796553-235469-1-git-send-email-steven.sistare@oracle.com>
 <ZAcg39dY/kPK1Vjz@work-vm>
 <0f3dcc76-45b5-ad62-1c03-e2fcc58aa701@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f3dcc76-45b5-ad62-1c03-e2fcc58aa701@oracle.com>
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

* Steven Sistare (steven.sistare@oracle.com) wrote:
> On 3/7/2023 6:32 AM, Dr. David Alan Gilbert wrote:
> > * Steve Sistare (steven.sistare@oracle.com) wrote:
> >> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> >> CONFIG_VFIO.  Without it, the 'info migrate' command never returns
> >> info about vfio.
> >>
> >> Fixes: 43bd0bf30f ("migration: Move populate_vfio_info() into a separate file")
> >> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> >> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> ---
> >>  migration/target.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/migration/target.c b/migration/target.c
> >> index 907ebf0..00ca007 100644
> >> --- a/migration/target.c
> >> +++ b/migration/target.c
> >> @@ -8,6 +8,7 @@
> >>  #include "qemu/osdep.h"
> >>  #include "qapi/qapi-types-migration.h"
> >>  #include "migration.h"
> >> +#include CONFIG_DEVICES
> >>  
> >>  #ifdef CONFIG_VFIO
> >>  #include "hw/vfio/vfio-common.h"
> >> @@ -17,7 +18,6 @@ void populate_vfio_info(MigrationInfo *info)
> >>  {
> >>  #ifdef CONFIG_VFIO
> >>      if (vfio_mig_active()) {
> >> -        info->has_vfio = true;
> > 
> > Why this removal?
> 
> The has_vfio member was removed by:
>   720a252c2651 ("qapi migration: Elide redundant has_FOO in generated C")
> The stale reference was not noticed at the time because the ifdef was never true.

Oh ok, that makes sense,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> - Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


