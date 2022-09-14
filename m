Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDB5B8EA3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 20:13:24 +0200 (CEST)
Received: from localhost ([::1]:40048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYWt1-0005qu-4D
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 14:13:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYWqV-0003GS-RR
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1oYWqJ-0000cu-RM
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 14:10:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663179034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmWFcfR1nHtmW8H1hCw9QRs1P/7uUAL7SdGF6jz9nzQ=;
 b=GR0fm15AAwb+eQCwWSYzKnVgvygcAu6An0L36Li7dmXNJ8xPeebaiMv08FpLyro3l/3Far
 OuTbZatldvC/Gk+WWR6URzMevH3iBKz4GgyYaamSLAM2U7urC/RePCldIt65hGMdrurtgD
 e+eODK+Juo6PQXti9vrCjS5oQiBlK9M=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-sJamzaRhMI-f1-Rsxcp0aQ-1; Wed, 14 Sep 2022 14:10:32 -0400
X-MC-Unique: sJamzaRhMI-f1-Rsxcp0aQ-1
Received: by mail-io1-f72.google.com with SMTP id
 m22-20020a5d9696000000b006a1bab26d55so2566670ion.15
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 11:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=DmWFcfR1nHtmW8H1hCw9QRs1P/7uUAL7SdGF6jz9nzQ=;
 b=PB8rPyspf36lMBFJydGPQ/dsO/NO+N7L1Jf0lBQDeRf693jOoVf3+L+h2RLqa+2iyP
 ck7+LnWFMJTm611shriMm/R+Traeh5mqrDTOx/lBO08B0DZBXoGcICLawj3wQnOFNwIV
 i0cNSqCQolRzMwlUA9s6z0WJrsXKoNHIPyB8DXKtu2dBLkQJFvbNEiJKNRfaIkNOebS6
 TAnOPJh7bRH9i+o0a4OOCBUkCBg3S9PaKW8Z6sxGV9grc3BGym6iAZ4QswY2iShhNxXy
 sDl1NbYTwJAlerSwdjb/jh7yI+NMdh9DeH6spap/sR3yvrowyULXjnH/O4kxuLqlXkFM
 wCYQ==
X-Gm-Message-State: ACgBeo2hSi3JY2egpzUIc3W1RqvTskCsSOISRgWZJIXw/9AS9lxLlBlp
 cOpzN3zh+RACAisoqMfT53J/aUC8OK45dXSd6LcAnmiAUOhmDFQYy3L3uB5r91dz9wW7fhZ2tdo
 3JRN3B9wRM6TGE28=
X-Received: by 2002:a92:b106:0:b0:2dc:eebb:e6f6 with SMTP id
 t6-20020a92b106000000b002dceebbe6f6mr15269635ilh.54.1663179031458; 
 Wed, 14 Sep 2022 11:10:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5PKokDSf/PndiMycs5wkUlGQcmR9o0fa43riwbpRe56mP9PbKK4wvKpUqIyB3QoDDE5V0Xyg==
X-Received: by 2002:a92:b106:0:b0:2dc:eebb:e6f6 with SMTP id
 t6-20020a92b106000000b002dceebbe6f6mr15269622ilh.54.1663179031217; 
 Wed, 14 Sep 2022 11:10:31 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o7-20020a92dac7000000b002eb0ce391aasm6867622ilq.75.2022.09.14.11.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 11:10:30 -0700 (PDT)
Date: Wed, 14 Sep 2022 12:10:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, <qemu-devel@nongnu.org>,
 <kwankhede@nvidia.com>, <avihaih@nvidia.com>, <shayd@nvidia.com>,
 <jgg@nvidia.com>
Subject: Re: [PATCH] vfio/common: Do not g_free in vfio_get_iommu_info
Message-ID: <20220914121029.1a693e5d.alex.williamson@redhat.com>
In-Reply-To: <Yx+b0t20wtneTry+@Asurada-Nvidia>
References: <20220910004245.2878-1-nicolinc@nvidia.com>
 <8735cwu5r7.fsf@redhat.com> <Yx+b0t20wtneTry+@Asurada-Nvidia>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Mon, 12 Sep 2022 13:51:30 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> On Mon, Sep 12, 2022 at 02:38:52PM +0200, Cornelia Huck wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, Sep 09 2022, Nicolin Chen <nicolinc@nvidia.com> wrote:
> >   
> > > Its caller vfio_connect_container() assigns a default value
> > > to info->iova_pgsizes, even if vfio_get_iommu_info() fails.
> > > This would result in a "Segmentation fault" error, when the
> > > VFIO_IOMMU_GET_INFO ioctl errors out.
> > >
> > > Since the caller has g_free already, drop the g_free in its
> > > rollback routine and add a line of comments to highlight it.  
> > 
> > There's basically two ways to fix this:
> > 
> > - return *info in any case, even on error
> > - free *info on error, and make sure that the caller doesn't try to
> >   access *info if the function returned !0
> > 
> > The problem with the first option is that the caller will access invalid
> > information if it neglects to check the return code, and that might lead
> > to not-that-obvious errors; in the second case, a broken caller would at
> > least fail quickly with a segfault. The current code is easier to fix
> > with the first option.
> > 
> > I think I'd prefer the second option; but obviously maintainer's choice.  
> 
> The caller does check rc all the time. So I made a smaller fix
> (the first option). Attaching the git-diff for the second one.
> 
> Alex, please let me know which one you prefer. Thanks!
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 51b2e05c76..74431411ab 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
[snip]

I think we can do better than that, I don't think we need to maintain
the existing grouping, and that FIXME comment is outdated and has
drifted from the relevant line of code.  What about:

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562a9ba1..8d8c54d59083 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -2111,29 +2111,31 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     {
         struct vfio_iommu_type1_info *info;
 
-        /*
-         * FIXME: This assumes that a Type1 IOMMU can map any 64-bit
-         * IOVA whatsoever.  That's not actually true, but the current
-         * kernel interface doesn't tell us what it can map, and the
-         * existing Type1 IOMMUs generally support any IOVA we're
-         * going to actually try in practice.
+	/*
+         * Setup defaults for container pgsizes and dma_max_mappings if not
+         * provided by kernel below.
          */
-        ret = vfio_get_iommu_info(container, &info);
-
-        if (ret || !(info->flags & VFIO_IOMMU_INFO_PGSIZES)) {
-            /* Assume 4k IOVA page size */
-            info->iova_pgsizes = 4096;
-        }
-        vfio_host_win_add(container, 0, (hwaddr)-1, info->iova_pgsizes);
-        container->pgsizes = info->iova_pgsizes;
-
-        /* The default in the kernel ("dma_entry_limit") is 65535. */
+        container->pgsizes = 4096;
         container->dma_max_mappings = 65535;
+
+        ret = vfio_get_iommu_info(container, &info);
         if (!ret) {
+            if (info->flags & VFIO_IOMMU_INFO_PGSIZES) {
+                container->pgsizes = info->iova_pgsizes;
+            }
+
             vfio_get_info_dma_avail(info, &container->dma_max_mappings);
             vfio_get_iommu_info_migration(container, info);
+            g_free(info);
         }
-        g_free(info);
+
+        /*
+         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
+         * information to get the actual window extent rather than assume
+         * a 64-bit IOVA address space.
+         */
+        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
+
         break;
     }
     case VFIO_SPAPR_TCE_v2_IOMMU:


