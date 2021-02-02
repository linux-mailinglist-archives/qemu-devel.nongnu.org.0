Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F530BC75
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 12:01:52 +0100 (CET)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6tRP-0004w1-LP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 06:01:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l6tPa-0004KT-7x
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1l6tPX-0001Oz-Vz
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 05:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612263594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgISFIPFA/+Os4LFh3G35//efuyrkSyBmG24pXTGgzg=;
 b=Ath1Ii+Vx+ZqynTCe6gElN9XX+8M2AlSFWgeA+WELpuj6YnvWxEo08V3l6GavOWAdc/5iG
 dRrS7II/6U+TVJq4XxLiHAyXq7nWaas3VtlY7icBEnBCSCycQKdjx2ZkXtZ6R7rP+u0DpE
 yy9zKQ5iNrTQG1h3Eep8KJ+RwFmbxkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-Ih-foR5hM7eMu30GXsWsQw-1; Tue, 02 Feb 2021 05:59:53 -0500
X-MC-Unique: Ih-foR5hM7eMu30GXsWsQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D401107ACE6
 for <qemu-devel@nongnu.org>; Tue,  2 Feb 2021 10:59:52 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-241.ams2.redhat.com
 [10.36.115.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F260A7EA92;
 Tue,  2 Feb 2021 10:59:42 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] pci: reject too large ROMs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210129192838.582771-1-pbonzini@redhat.com>
 <20210129192838.582771-2-pbonzini@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <8ff2f58f-cf14-ed79-cbec-953da00ec460@redhat.com>
Date: Tue, 2 Feb 2021 11:59:41 +0100
MIME-Version: 1.0
In-Reply-To: <20210129192838.582771-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: dgilbert@redhat.com, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/29/21 20:28, Paolo Bonzini wrote:
> get_image_size() returns an int64_t, which pci_add_option_rom() assigns
> to an "int" without any range checking.  A 32-bit BAR could be up to
> 2 GiB in size, so reject anything above it.  In order to accomodate
> a rounded-up size of 2 GiB, change pci_patch_ids's size argument
> to unsigned.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/pci/pci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index a6b0c5602e..bbce10050b 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -25,6 +25,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> +#include "qemu/units.h"
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
> @@ -2258,7 +2258,7 @@ static uint8_t pci_find_capability_at_offset(PCIDevice *pdev, uint8_t offset)
>  
>  /* Patch the PCI vendor and device ids in a PCI rom image if necessary.
>     This is needed for an option rom which is used for more than one device. */
> -static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
> +static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, uint32_t size)
>  {
>      uint16_t vendor_id;
>      uint16_t device_id;
> @@ -2316,7 +2316,7 @@ static void pci_patch_ids(PCIDevice *pdev, uint8_t *ptr, int size)
>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>                                 Error **errp)
>  {
> -    int size;
> +    int64_t size;
>      char *path;
>      void *ptr;
>      char name[32];
> @@ -2366,6 +2366,11 @@ static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom,
>          error_setg(errp, "romfile \"%s\" is empty", pdev->romfile);
>          g_free(path);
>          return;
> +    } else if (size > 2 * GiB) {
> +        error_setg(errp, "romfile \"%s\" too large (size cannot exceed 2 GiB)",
> +                   pdev->romfile);
> +        g_free(path);
> +        return;
>      }
>      size = pow2ceil(size);
>  
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


