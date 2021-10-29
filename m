Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3A43F944
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 10:53:02 +0200 (CEST)
Received: from localhost ([::1]:37004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgNdE-0000xU-Hq
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 04:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgNbQ-0008Pt-AN
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgNbO-0002f6-8s
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 04:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635497464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HzMvTDx+Y10chaCYqnmiPx84RRsgBJULpiNxedV1aPk=;
 b=Aeyu3s4ku9QlpIHYhjHTd6uIfZ9E8Os97Wbshp6RWT0IaoP58LO8iEvSZa09pgseDvfX/A
 B5+52PTNe0TvG4wxNve1X9+CNi6a5ddkTaq9ArjcFRBFsNbLk7U1whcnSmoDAJ5ofnO43p
 U9CWXgLnKi2gmMiHUQZmNAWe1taLaAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-aji_lCDwNJCAmiEvB95rvg-1; Fri, 29 Oct 2021 04:51:01 -0400
X-MC-Unique: aji_lCDwNJCAmiEvB95rvg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 236148066F5;
 Fri, 29 Oct 2021 08:51:00 +0000 (UTC)
Received: from thuth.remote.csb (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5EAA18368;
 Fri, 29 Oct 2021 08:50:49 +0000 (UTC)
Subject: Re: [PATCH] pci: fix PCI resource reserve capability on BE
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20211020095408.917102-1-mst@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a86ec874-7e5f-7b8a-75c6-9dada697af48@redhat.com>
Date: Fri, 29 Oct 2021 10:50:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211020095408.917102-1-mst@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.847, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/10/2021 11.54, Michael S. Tsirkin wrote:
> PCI resource reserve capability should use LE format as all other PCI
> things. If we don't then seabios won't boot:
> 
> === PCI new allocation pass #1 ===
> PCI: check devices
> PCI: QEMU resource reserve cap: size 10000000000000 type io
> PCI: secondary bus 1 size 10000000000000 type io
> PCI: secondary bus 1 size 00200000 type mem
> PCI: secondary bus 1 size 00200000 type prefmem
> === PCI new allocation pass #2 ===
> PCI: out of I/O address space
> 
> This became more important since we started reserving IO by default,
> previously no one noticed.
> 
> Fixes: e2a6290aab ("hw/pcie-root-port: Fix hotplug for PCI devices requiring IO")
> Cc: marcel.apfelbaum@gmail.com
> Fixes: 226263fb5c ("hw/pci: add QEMU-specific PCI capability to the Generic PCI Express Root Port")
> Cc: zuban32s@gmail.com
> Fixes: 6755e618d0 ("hw/pci: add PCI resource reserve capability to legacy PCI bridge")
> Cc: jing2.liu@linux.intel.com
> Tested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   hw/pci/pci_bridge.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
> index d1f902ee86..da34c8ebcd 100644
> --- a/hw/pci/pci_bridge.c
> +++ b/hw/pci/pci_bridge.c
> @@ -448,11 +448,11 @@ int pci_bridge_qemu_reserve_cap_init(PCIDevice *dev, int cap_offset,
>       PCIBridgeQemuCap cap = {
>               .len = cap_len,
>               .type = REDHAT_PCI_CAP_RESOURCE_RESERVE,
> -            .bus_res = res_reserve.bus,
> -            .io = res_reserve.io,
> -            .mem = res_reserve.mem_non_pref,
> -            .mem_pref_32 = res_reserve.mem_pref_32,
> -            .mem_pref_64 = res_reserve.mem_pref_64
> +            .bus_res = cpu_to_le32(res_reserve.bus),
> +            .io = cpu_to_le64(res_reserve.io),
> +            .mem = cpu_to_le32(res_reserve.mem_non_pref),
> +            .mem_pref_32 = cpu_to_le32(res_reserve.mem_pref_32),
> +            .mem_pref_64 = cpu_to_le64(res_reserve.mem_pref_64)
>       };
>   
>       int offset = pci_add_capability(dev, PCI_CAP_ID_VNDR,

Cc: qemu-stable (in case MichaelR is planning a 6.1.1, too)

  Thomas


