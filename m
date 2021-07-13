Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D867D3C7865
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:02:43 +0200 (CEST)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PYA-0000Ok-7q
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3PVj-0007pk-9l
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:00:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m3PVc-0002IO-CP
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626210001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMaYBTfm4H1DYO2luNtfCYTiO6V0PBqr4awtnZ+4v60=;
 b=UnB9nt58t+FqcrZqcj2Y6friCzdTbyc+/FcEVQrUURj8C5r8BK/kVMp3USCb1YQpYi75Gt
 sxrek7XepDc1WV7/0yYlz/4WbGIHmtW2lz/DuZVIbUbz/Y4P/JXa7ZLb5Mn3GGiEZm7VmH
 RAXVbZYJlQfcNed3Be4z0gt3YNw6qDY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-26x9e1SMM2W-4QirtWVV8Q-1; Tue, 13 Jul 2021 16:59:59 -0400
X-MC-Unique: 26x9e1SMM2W-4QirtWVV8Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so201083wrc.20
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 13:59:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NMaYBTfm4H1DYO2luNtfCYTiO6V0PBqr4awtnZ+4v60=;
 b=Y5PwdH88UiO6PF+v1BSOQIC382PaK21tXxsUljtrqslzY5wH1U5qNPuKI1iNKPSIQ9
 4YIMzbhJicbXI/cvw1+baen6XpAP2kps0ArDRTQhhGtteiaLJRlMakF+61TpvztdzItB
 LOtSiY1RJzpzVKWIPh9k1mHXFQp5mrPpnsjWPv+O406kB3CLPI1PV/ONuCFapyNbYbDu
 RHptyCHcwYTlXrrZpGg+WCjugCChHKXfVN1dmc5H5fNShzIYZ5cRBMVi4tiZJEa5kEVb
 mqO0R/RMiQld4sCfdXRcTVMn9iqMFikS5i7H8lr0M7tiA+cTpR4X4yuZkxPMVHUeyVc8
 zY9g==
X-Gm-Message-State: AOAM532lIvI+zsqpBlqMRoTiABomc/8K7OaJYFwVL+axVpcSx8BLjktF
 CSftMOsVTO23IeXqmpPWJZbW7J7ziXGUeLMSBM/mLcHBGuHOaYxnzwkNr79muyp+Oqv6SadTYSD
 04EI5stJP7bN4z8U=
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr143691wms.130.1626209998146; 
 Tue, 13 Jul 2021 13:59:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTAyyLuVIYUkMhnykey1lQZqON+ZeBPIXbOwndJWCYuF14K4wJHd1QwnCOIMi9LVTmb9GQvQ==
X-Received: by 2002:a05:600c:1d28:: with SMTP id
 l40mr143665wms.130.1626209997954; 
 Tue, 13 Jul 2021 13:59:57 -0700 (PDT)
Received: from redhat.com ([2.55.15.23])
 by smtp.gmail.com with ESMTPSA id b20sm152658wmj.7.2021.07.13.13.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 13:59:56 -0700 (PDT)
Date: Tue, 13 Jul 2021 16:59:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RESEND v2 0/3] To add HMP interface to dump PCI MSI-X
 table/PBA
Message-ID: <20210713165917-mutt-send-email-mst@kernel.org>
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20210712235812.19725-1-dongli.zhang@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, jasowang@redhat.com,
 joe.jin@oracle.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 04:58:09PM -0700, Dongli Zhang wrote:
> I have just rebased the v2 patchset on top of most recent qemu to resend.
> 
> This patch is to introduce the new HMP command to dump the MSI-X table/PBA.
> 
> Here is the RFC v1:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html
> 
> The idea was inspired by below discussion:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html

Fails build for microblaze:

/scm/qemu/build/../softmmu/qdev-monitor.c:1030: undefined reference to `msix_dump_info'
collect2: error: ld returned 1 exit status
[2525/8445] Compiling C object libqemu-microblaze-softmmu.fa.p/meson-generated_.._qapi_qapi-visit-misc-target.c.o

> 
> (qemu) info msix -d /machine/peripheral/vscsi0
> Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
> 0xfee00000 0x00000000 0x00004041 0x00000000
> 0xfee00000 0x00000000 0x00004051 0x00000000
> 0xfee00000 0x00000000 0x00004061 0x00000000
> 0xfee00000 0x00000000 0x00004071 0x00000000
> 0xfee01000 0x00000000 0x000040b1 0x00000000
> 0xfee02000 0x00000000 0x000040c1 0x00000000
> 0xfee03000 0x00000000 0x000040d1 0x00000000
> 
> MSI-X PBA
> 0 0 0 0 0 0 0
> 
> virtio pci vector info:
> config: 0
> queue 0: 1
> queue 1: 2
> queue 2: 3
> queue 3: 4
> queue 4: 5
> queue 5: 6
> 
> 
> Changed since RFC v1:
>   - Add heading to MSI-X table (suggested by David Alan Gilbert)
>   - Add device specific interface, e.g., to dump virtio-pci queue-to-vector
>     mapping (Suggested By Jason)
> 
> 
>  hmp-commands-info.hx       | 14 +++++++++
>  hw/pci/msix.c              | 63 +++++++++++++++++++++++++++++++++++++++++
>  hw/virtio/virtio-pci.c     | 22 ++++++++++++++
>  hw/virtio/virtio.c         | 10 +++++++
>  include/hw/pci/msix.h      |  2 ++
>  include/hw/pci/pci.h       |  3 ++
>  include/hw/virtio/virtio.h |  2 ++
>  include/monitor/hmp.h      |  1 +
>  softmmu/qdev-monitor.c     | 36 +++++++++++++++++++++++
>  9 files changed, 153 insertions(+)
> 
> Thank you very much!
> 
> Dongli Zhang
> 


