Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C83D37C7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:36:02 +0200 (CEST)
Received: from localhost ([::1]:44150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6rb7-00074V-8C
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6rZf-0006MD-Lb
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:34:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m6rZb-0005fu-Op
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:34:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627032866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koIVfpDn/CJjQuGRjR3zSVOUTdiaLr58bYWxdqz9yLQ=;
 b=NV8di5McZiF3lCLxUEGgsv1sVzuaPgQ41P+lkMyq8gHmdPSkxriUGyXkC/F1NCAnMKM8pr
 /+1K/cq4iAqtompQ+1XlIExCODpAVLEjRgJBr2q4COV8ZTFE3YdgguTjpDV6IIrfLvjYXe
 psDdrxnD/2JrPXB5z18vrwrGlIsHBso=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-S7_F6WgeP0u3LYBoNwKzPQ-1; Fri, 23 Jul 2021 05:34:21 -0400
X-MC-Unique: S7_F6WgeP0u3LYBoNwKzPQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 j22-20020a50ed160000b02903ab03a06e86so426763eds.14
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 02:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=koIVfpDn/CJjQuGRjR3zSVOUTdiaLr58bYWxdqz9yLQ=;
 b=jz8zjjLI/32UX7jyX4GCeVUAExv9uRZxMa+vL8CSZai9UawgNDLWQp96YfJaA9xd8w
 x/FYQZwbNfkielUh/9DNJOFB02H3+4t/iHf40NsAZlUYgJYdEB2boY5s8EbmtWyaHWfF
 zXCWpVcu1xR7Fl/aQPiwps40Sq8Pd1MxnfzKAeqHtxw0PwdrjGM6kNBTt7dYZCGWU1da
 nVewo06OGMKKvCQCgSnoilPSvVvaeTrdbT4WhYPEtNKRV5F4l6lAM5x4e3GlvtpTtyBd
 6mv9l4Y1RmmAsiC2Rx3sMekb1H8l6ZpgEm/aL39FJ8G9pd6xL8X6F+3wFjAFI7HJBYNt
 +d5w==
X-Gm-Message-State: AOAM530XQWGEgIc7YX+0mzbYgUPKWG16QosUReFW7uggEL2lP9XwZbhx
 tGDzxXjtd9Y50K+arBTn2TJXcWhN3f9DStLlRriN2xDG95zAFHN40UN+AxGU6gsLxRZqCZSIIlI
 cbl12ESRn3z/Ggbs=
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr4673571edd.150.1627032860818; 
 Fri, 23 Jul 2021 02:34:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxY+JxgVLA3QoszM4c7I8jloErO7Yfo868fZfL1gRu4MCYrztpO6Lbi/xD2AXTML3M8HV9Iwg==
X-Received: by 2002:a05:6402:51c7:: with SMTP id
 r7mr4673551edd.150.1627032860584; 
 Fri, 23 Jul 2021 02:34:20 -0700 (PDT)
Received: from redhat.com ([2.55.16.196])
 by smtp.gmail.com with ESMTPSA id n13sm10309652ejk.97.2021.07.23.02.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:34:19 -0700 (PDT)
Date: Fri, 23 Jul 2021 05:34:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
Message-ID: <20210723053234-mutt-send-email-mst@kernel.org>
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
 <20210722133738-mutt-send-email-mst@kernel.org>
 <YPqCVwY0Y/+jUoWT@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YPqCVwY0Y/+jUoWT@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 jusual@redhat.com, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 09:48:23AM +0100, Daniel P. Berrangé wrote:
> On Thu, Jul 22, 2021 at 01:49:34PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Jul 22, 2021 at 06:59:45AM -0400, Igor Mammedov wrote:
> > > Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> > > switched PCI hotplug from native to ACPI one by default.
> > > 
> > > That however breaks ihotplug on following CLI that used to work:
> > 
> > s/ihotplug/hotplug/ ?
> > 
> > >    -nodefaults -machine q35 \
> > >    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
> > >    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> > > 
> > > where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> > > 
> > >   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
> > >   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> > >   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
> > >   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> > > 
> > > cause is that QEMU's ACPI hotplug never supported functions other then 0
> > > and due to bug it was generating notification entries for not described
> > > functions.
> > > 
> > > Technically there is no reason not to describe cold-plugged bridges
> > > (root ports) on functions other then 0, as they similaraly to bridge
> > > on function 0 are unpluggable.
> > > 
> > > Fix consists of describing cold-plugged bridges[root ports] on functions
> > > other than 0.
> > 
> > 
> > I would add: since we need to describe multifunction devices
> > 
> > 
> > > 
> > > Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
> > 
> > use short hash and include subject within ("subject here") please
> 
> Using short hashes isn't a good idea in commits IMHO. A git short
> hash is only guaranteed unique at the time it is generated. In future
> the repo might gain commits that result in a clashing short hash.
> Using the full hash is good.
> 
> 
> Regards,
> Daniel

It's a good point but it became a standard practice at this point.
At least with the subject it's unlikely to be ambiguous too often.


> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


