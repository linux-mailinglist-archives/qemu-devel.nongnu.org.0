Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F43F506F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:36:00 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEnf-0002x3-As
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIEmG-0002Eb-EP
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mIEmE-0006u1-2y
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:34:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629743668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7DOIRq46sOzRZx+2zO4rwyXetONBMAD+2SQYeqMOnvc=;
 b=cu7tTQgG5I4HBhhII4F7DLWBJKmTMIH3bC3+WLF3INbIi20538dmzxTWsmhbAcKPOzO4R0
 +79Blf/weJL9nJiPMHo6DvvHyI2DY/oPJP/Z4Y4YF5ryjD3YzIwCn5pfXa61vzXDFhEAQX
 12xNzj3NxbUGY0B4qnvgHVcOIcOvzaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-ACf1-ZL1PL27Hjakafxk2Q-1; Mon, 23 Aug 2021 14:34:27 -0400
X-MC-Unique: ACf1-ZL1PL27Hjakafxk2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EA25192AB83;
 Mon, 23 Aug 2021 18:34:26 +0000 (UTC)
Received: from localhost (unknown [10.22.32.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2CE5D9CA;
 Mon, 23 Aug 2021 18:34:15 +0000 (UTC)
Date: Mon, 23 Aug 2021 14:34:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/3] hw/usb/hcd-xhci-pci: Abort if setting link
 property failed
Message-ID: <20210823183414.hmu4ly2y5zkbw3mg@habkost.net>
References: <20210819171547.2879725-1-philmd@redhat.com>
 <20210819171547.2879725-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210819171547.2879725-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus

On Thu, Aug 19, 2021 at 07:15:46PM +0200, Philippe Mathieu-Daudé wrote:
> Do not ignore eventual error if we failed at setting the 'host'
> property of the TYPE_XHCI model.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/hcd-xhci-pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
> index e934b1a5b1f..71f6629ccde 100644
> --- a/hw/usb/hcd-xhci-pci.c
> +++ b/hw/usb/hcd-xhci-pci.c
> @@ -115,7 +115,7 @@ static void usb_xhci_pci_realize(struct PCIDevice *dev, Error **errp)
>      dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
>      dev->config[0x60] = 0x30; /* release number */
>  
> -    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), NULL);
> +    object_property_set_link(OBJECT(&s->xhci), "host", OBJECT(s), &error_fatal);

If this fails, it's due to programmer error, isn't?  Shouldn't we
use &error_abort on that case?

>      s->xhci.intr_update = xhci_pci_intr_update;
>      s->xhci.intr_raise = xhci_pci_intr_raise;
>      if (!qdev_realize(DEVICE(&s->xhci), NULL, errp)) {
> -- 
> 2.31.1
> 

-- 
Eduardo


