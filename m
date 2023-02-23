Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623E6A033F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5pL-0007Y6-Dh; Thu, 23 Feb 2023 02:15:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pV5pF-0007Wi-4l
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pV5pD-0005In-6c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 02:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677136530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F7st8/7G+kuzy6p6iN9pd8XeIeFzladbf1zVXg6io6U=;
 b=aEkWCvL0UwvXiF3nrQ/aKkNrN3xa5c3jdlaLQD0t4LQMBHvSg034uQqJX0GGjRjJp747rX
 NGJWKif15afg4NmDsTFSTOYz5M8lit0OJPGiO3Lmgh0fjOPwmV+rn9UOcQ0uZpS3XKZeM7
 mFVOQxgdlPgsTOM759qEbLYV4x4ZENg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-G9LXQDVYOca1_gF3-joH-g-1; Thu, 23 Feb 2023 02:15:28 -0500
X-MC-Unique: G9LXQDVYOca1_gF3-joH-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 l20-20020a05600c1d1400b003e10d3e1c23so4676830wms.1
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 23:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7st8/7G+kuzy6p6iN9pd8XeIeFzladbf1zVXg6io6U=;
 b=6DGu0OBnPu+BkwWySufOvP1JId39XBhZIZKgwNw/ow93RctKOfIyCUNwKaghj86Vu7
 ckj0XaRabiUOZ2s7dRfH5ir3upyy3DGuvf1EwzGQku4DnbujJyfN5wZklcNMJCm/UKUu
 u2olttTU3yLPqhwYBaj4ew21krGM1iJpfrCIo0zWmNvAUeF4iBVSDhRQDo/wKaS5hWvD
 eCsjI5xeP16+bb1vdJEsxO4u861+QYHRa55kd5lVvfYJrU5VHGQKmxADtYPe7enEPOdL
 smJq7P+JsCu0Rvv0ruON61GSwH5BbJb/C9MLFRTdUl1UQzTkCXphD6yCzdK3tkbEZbTa
 ty6Q==
X-Gm-Message-State: AO0yUKU/w0pvXewaZ0kVvpMTHViSUL7dNgqrWQiaSFZatB9GrXljI0jS
 3Ws6C2LopFptaCWLJvhECxI5GNxfiZyaC1GlIWNzl/n5N42VTug9VTyR+qtqIANFqnUAY2JXl4l
 HQyFyFpCAZIUqayI=
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id
 e6-20020a05600c2b4600b003dc50dd361bmr8253401wmf.5.1677136527487; 
 Wed, 22 Feb 2023 23:15:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8JwcA/8zdMIQiR5VAoDXs4FpfvGAKi4Zs0XqAK4kmM7XKWb5MWeeHCR4PYG8F3+RTrquHgUA==
X-Received: by 2002:a05:600c:2b46:b0:3dc:50dd:361b with SMTP id
 e6-20020a05600c2b4600b003dc50dd361bmr8253386wmf.5.1677136527172; 
 Wed, 22 Feb 2023 23:15:27 -0800 (PST)
Received: from redhat.com ([2.52.2.78]) by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b003dd1bd66e0dsm7752243wmh.3.2023.02.22.23.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 23:15:26 -0800 (PST)
Date: Thu, 23 Feb 2023 02:15:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/smbios: fix field corruption in type 4 table
Message-ID: <20230223021451-mutt-send-email-mst@kernel.org>
References: <20230222210049.238599-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222210049.238599-1-jusual@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Feb 22, 2023 at 10:00:49PM +0100, Julia Suvorova wrote:
> Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
> strings which follow immediately after the struct fields have been
> overwritten by unconditional filling of later fields such as core_count2.
> Make these fields dependent on the SMBIOS version.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2169904

Could you also add a Fixes tag with the commit that introduces the bug?

> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/smbios/smbios.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index b4243de735..903fd22350 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -749,14 +749,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
>      t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
>      t->core_enabled = t->core_count;
>  
> -    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> -
>      t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
> -    t->thread_count2 = cpu_to_le16(ms->smp.threads);
>  
>      t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
>      t->processor_family2 = cpu_to_le16(0x01); /* Other */
>  
> +    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
> +        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
> +        t->thread_count2 = cpu_to_le16(ms->smp.threads);
> +    }
> +
>      SMBIOS_BUILD_TABLE_POST;
>      smbios_type4_count++;
>  }
> -- 
> 2.38.1


