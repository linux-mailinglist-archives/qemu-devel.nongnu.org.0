Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58325926E2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 00:57:09 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNMXc-0003Eo-Ru
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 18:57:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNMWV-0001ue-2s
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 18:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oNMWQ-0005jW-1k
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 18:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660517752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oLhlwkIZ2kwvll6JQzr0hw8KAeFxM5Bc5YJMd6/4cLU=;
 b=Dh9WqUathGLBu6nYS1p+WP05qrUxRx6zcXXiN5u2CL1ASK40wEwPVmvARoMs3CAL7mjkn1
 qZgz6z9kX9VWBHi9hiO0kiTjxG/UDTyKM8QpOr2Mm7VPASxtsHLx3ypc7OF+KjNHc/E0to
 7I0OHLYmRIMmhlFvcZApGbEntWFg8to=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-VyCxvDahPYCg5PEqs-TZFg-1; Sun, 14 Aug 2022 18:55:50 -0400
X-MC-Unique: VyCxvDahPYCg5PEqs-TZFg-1
Received: by mail-ej1-f72.google.com with SMTP id
 gs35-20020a1709072d2300b00730e14fd76eso854223ejc.15
 for <qemu-devel@nongnu.org>; Sun, 14 Aug 2022 15:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=oLhlwkIZ2kwvll6JQzr0hw8KAeFxM5Bc5YJMd6/4cLU=;
 b=el85bw1BFA++OJFAJivteM4KS1t0UAWg829MaLHKmCVZxkUDvU3LgJ7WZCvfgSCgJM
 JKAe2Atcv+HaEQ+Fm+G7TeOQCeVGVn7s7prcirkChNf70ZpB4SMjDV7+3kQAPWK12z4n
 +FZ8MDOs/ExPLzOd4g2/LTblCWOndu2whNupSbCB+TNXBGiOkm9JgQfEYsEilntVc/yG
 KV6XWWD9j9A0GzHWusoOnmmKRyvBQqIcOqVzD2D5TNfy+hOVaU7wmQjAcpV+LmlnGueS
 FqBjC5rFJ6G33GzgG33w/wNlIXkqvYcWulmAolbe6dufthbCJ1XD8vQ8aZkMvZ6jYvvo
 ojTw==
X-Gm-Message-State: ACgBeo18fvvRD0s0L1g0Q4yhvhiIH+oR+YIgEEnfTG0WuFHFQVQiP1mh
 gKi84gIawTT1t362J8akpItqGnxcgMnd6bIZML7Ccrzpw1H/7vhGef9J1oN9LggzS7nX0HZcSn4
 fM49Q9vlwhp5WEpk=
X-Received: by 2002:a17:907:d2a:b0:730:d34d:8a1c with SMTP id
 gn42-20020a1709070d2a00b00730d34d8a1cmr8759559ejc.574.1660517749070; 
 Sun, 14 Aug 2022 15:55:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6/N7g34mjuFBkeRYlwNvsVb+bewJzwI+nuE5dKh24iL0fKtwC524Z2sn53+dQOOKVOD/uUjA==
X-Received: by 2002:a17:907:d2a:b0:730:d34d:8a1c with SMTP id
 gn42-20020a1709070d2a00b00730d34d8a1cmr8759540ejc.574.1660517748741; 
 Sun, 14 Aug 2022 15:55:48 -0700 (PDT)
Received: from redhat.com ([2.54.169.49]) by smtp.gmail.com with ESMTPSA id
 b10-20020a0564021f0a00b0043df40e4cfdsm5472590edb.35.2022.08.14.15.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 15:55:47 -0700 (PDT)
Date: Sun, 14 Aug 2022 18:55:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paul Schlacter <wlfightup@gmail.com>
Cc: marcel.apfelbaum@gmail.com, fam@euphon.net, kwolf@redhat.com,
 stefanha@redhat.com, k.jensen@samsung.com, f4bug@amsat.org,
 its@irrelevant.dk, xypron.glpk@gmx.de, imammedo@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, kbusch@kernel.org,
 hreitz@redhat.com, ani@anisinha.ca
Subject: Re: [PATCH] xio3130_upstream: Add ACS (Access Control Services)
 capability
Message-ID: <20220814185429-mutt-send-email-mst@kernel.org>
References: <CADak6y5OdAgSwCmsdghy9JarwFqeR7GtaK2pz+TSLvSiAy8PQA@mail.gmail.com>
 <20220814064705-mutt-send-email-mst@kernel.org>
 <CADak6y6J9hZV48im8Jknb+JtDNuWRK3HsNiHi1aL8kda-Gnpkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADak6y6J9hZV48im8Jknb+JtDNuWRK3HsNiHi1aL8kda-Gnpkg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Aug 14, 2022 at 11:59:51PM +0800, Paul Schlacter wrote:
> What's wrong with not disabling the old version?

Old versions have to behave in the same way as they did,
or close enough. Changing that breaks migration between
qemu versions.

> 
> 
> On Sun, Aug 14, 2022 at 6:48 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Sun, Aug 14, 2022 at 03:47:49PM +0800, Paul Schlacter wrote:
>     > If it is a pcie device, check that all devices on the path from
>     >
>     > the device to the root complex have ACS enabled, and then the
>     >
>     > device will become an iommu_group.
>     >
>     > it will have the effect of isolation
>     >
>     >
>     > Signed-off-by: wlfightup <wlfightup@gmail.com>
> 
>     I don't think we can do this unconditionally. Has to have
>     a property and disabled for old versions.
> 
>     > ---
>     >
>     >  hw/pci-bridge/xio3130_upstream.c | 3 +++
>     >
>     >  1 file changed, 3 insertions(+)
>     >
>     >
>     > diff --git a/hw/pci-bridge/xio3130_upstream.c b/hw/pci-bridge/
>     > xio3130_upstream.c
>     >
>     > index 5ff46ef050..2df952222b 100644
>     >
>     > --- a/hw/pci-bridge/xio3130_upstream.c
>     >
>     > +++ b/hw/pci-bridge/xio3130_upstream.c
>     >
>     > @@ -37,6 +37,8 @@
>     >
>     >  #define XIO3130_SSVID_SSID              0
>     >
>     >  #define XIO3130_EXP_OFFSET              0x90
>     >
>     >  #define XIO3130_AER_OFFSET              0x100
>     >
>     > +#define XIO3130_ACS_OFFSET \
>     >
>     > +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>     >
>     >
>     >  static void xio3130_upstream_write_config(PCIDevice *d, uint32_t
>     address,
>     >
>     >                                            uint32_t val, int len)
>     >
>     > @@ -92,6 +94,7 @@ static void xio3130_upstream_realize(PCIDevice *d,
>     Error
>     > **errp)
>     >
>     >          goto err;
>     >
>     >      }
>     >
>     >
>     > +    pcie_acs_init(d, XIO3130_ACS_OFFSET);
>     >
>     >      return;
>     >
>     >
>     >  err:
>     >
>     > --
>     >
>     > 2.24.3 (Apple Git-128)
>     >
> 
> 


