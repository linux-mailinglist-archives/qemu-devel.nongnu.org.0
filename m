Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D73D5CB1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:11:31 +0200 (CEST)
Received: from localhost ([::1]:55232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82GQ-0003h9-JD
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82FX-0002FU-0o
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:10:35 -0400
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:34010
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82FV-0007Ol-NN
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:10:34 -0400
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m82FT-000InE-6Y; Mon, 26 Jul 2021 15:10:31 +0000
Date: Mon, 26 Jul 2021 15:10:31 +0000
From: John Levon <levon@movementarian.org>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server 06/11] vfio-user: handle PCI config space
 accesses
Message-ID: <20210726151031.GB71233@li1368-133.members.linode.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <791f5f9a010b14844e5210c4390c8628ffefb80d.1626722742.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791f5f9a010b14844e5210c4390c8628ffefb80d.1626722742.git.jag.raman@oracle.com>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.4, RCVD_IN_XBL=0.375,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 swapnil.ingle@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 04:00:08PM -0400, Jagannathan Raman wrote:

> Define and register handlers for PCI config space accesses
> 
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index 6a2d0f5..60d9fa8 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -36,6 +36,7 @@
>  #include "sysemu/runstate.h"
>  #include "qemu/notify.h"
>  #include "qemu/thread.h"
> +#include "qemu/main-loop.h"
>  #include "qapi/error.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/qdev-core.h"
> @@ -131,6 +132,35 @@ static void *vfu_object_ctx_run(void *opaque)
>      return NULL;
>  }
>  
> +static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
> +                                     size_t count, loff_t offset,
> +                                     const bool is_write)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint32_t val = 0;
> +    int i;
> +
> +    qemu_mutex_lock_iothread();
> +
> +    for (i = 0; i < count; i++) {
> +        if (is_write) {
> +            val = *((uint8_t *)(buf + i));
> +            trace_vfu_cfg_write((offset + i), val);
> +            pci_default_write_config(PCI_DEVICE(o->pci_dev),
> +                                     (offset + i), val, 1);
> +        } else {
> +            val = pci_default_read_config(PCI_DEVICE(o->pci_dev),
> +                                          (offset + i), 1);
> +            *((uint8_t *)(buf + i)) = (uint8_t)val;
> +            trace_vfu_cfg_read((offset + i), val);
> +        }
> +    }

Is it always OK to split up the access into single bytes like this?

regards
john

