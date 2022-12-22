Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72488653D8E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 10:37:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Hze-0007Aa-9b; Thu, 22 Dec 2022 04:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8Hzb-0007A1-27
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 04:35:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p8HzY-0002xC-UA
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 04:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671701755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6SzaNgxDBXzpdj3EYkCcW4b/Od+erXaW7vRva9IcWiw=;
 b=QwMpFKvhTJIA48xQG2PybkwlQ6lbPaqtF4mm96A+UzlwumFmU8hQdTZOwBy1vp0R+4NgQD
 nxu891B6/ArbFpUTnyxGNKf1x6eVUBUJASt0Yc3ReOv2G4hGdY9MXdFxYy5IYxmbrgQypX
 af7Lhago/1y48LvYCls5C3tCYiT0vJI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-1DqskROoN4aCJZ2Gr7BINg-1; Thu, 22 Dec 2022 04:35:53 -0500
X-MC-Unique: 1DqskROoN4aCJZ2Gr7BINg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B724738041C8;
 Thu, 22 Dec 2022 09:35:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 463A314171B6;
 Thu, 22 Dec 2022 09:35:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2607521E691D; Thu, 22 Dec 2022 10:35:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,
 ben.widawsky@intel.com,  jonathan.cameron@huawei.com,  philmd@linaro.org
Subject: Re: [PATCH 4/5] include/hw/pci: Split pci_device.h off pci.h
References: <20221209134802.3642942-1-armbru@redhat.com>
 <20221209134802.3642942-5-armbru@redhat.com>
 <20221221063216-mutt-send-email-mst@kernel.org>
Date: Thu, 22 Dec 2022 10:35:51 +0100
In-Reply-To: <20221221063216-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Wed, 21 Dec 2022 06:33:16 -0500")
Message-ID: <87ili3g4qw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Fri, Dec 09, 2022 at 02:48:01PM +0100, Markus Armbruster wrote:
>> PCIDeviceClass and PCIDevice are defined in pci.h.  Many users of the
>> header don't actually need them.  Similar structs live in their own
>> headers: PCIBusClass and PCIBus in pci_bus.h, PCIBridge in
>> pci_bridge.h, PCIHostBridgeClass and PCIHostState in pci_host.h,
>> PCIExpressHost in pcie_host.h, and PCIERootPortClass, PCIEPort, and
>> PCIESlot in pcie_port.h.
>> 
>> Move PCIDeviceClass and PCIDeviceClass to new pci_device.h, along with
>> the code that needs them.  Adjust include directives.
>> 
>> This also enables the next commit.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
>
> checkpatch is unhappy:
>
> ./scripts/checkpatch.pl /tmp/patch 
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> #707: 
> new file mode 100644

We're good:

    $ scripts/get_maintainer.pl -f include/hw/pci/pci_device.h 
    "Michael S. Tsirkin" <mst@redhat.com> (supporter:PCI)
    Marcel Apfelbaum <marcel.apfelbaum@gmail.com> (supporter:PCI)
    qemu-devel@nongnu.org (open list:All patches CC here)

But checkpatch is too simple-minded to see that.

> ERROR: spaces required around that '*' (ctx:WxV)
> #997: FILE: include/hw/pci/pci_device.h:286:
> +                                               uint##_bits##_t *val, \
>                                                                 ^

False positive.

  #define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
      static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
                                                 dma_addr_t addr, \
--->                                             uint##_bits##_t *val, \
                                                 MemTxAttrs attrs) \
      { \
          return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
      } \
      static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
                                                 dma_addr_t addr, \
                                                 uint##_bits##_t val, \
                                                 MemTxAttrs attrs) \
      { \
          return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
      }

The part checkpatch objects to is actually a parameter declaration of
the form

    TYPE *NAME

The use of spaces is fine.  Not fine would be

    TYPE * NAME

Having a macro expand into a function definition confuses checkpatch.

> It's right - we need a MAINTAINERS entry.
> Not sure how to fix the error - any idea?

There is nothing to fix :)


