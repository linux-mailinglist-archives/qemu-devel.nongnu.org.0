Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AE06F808A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 12:06:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pusK6-0003SL-FC; Fri, 05 May 2023 06:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pusK1-0003QS-IV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:05:54 -0400
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pusJz-0003x9-11
 for qemu-devel@nongnu.org; Fri, 05 May 2023 06:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=dQqO1khjEzEoVtLNIOKXHQ3bWHajiFN7+uL2OPfkzMc=; b=mdPsTpwATAWPjUrJsoF9GqrraD
 ajLSNGDetq1iGmRFud9L4vAHbADCzTD3E3c6yEdaLI3bbNGs1D4uyazX3g9WPHteinNh9oz30GZRE
 CO8h/8ds1IYxaYm2gkOCo7yB82NJf/CHy//A8XKS7wurt69xdA5mmKgLcqj8/Qjek+I2jKDWt/eP7
 MUf5+MlWwrg3SzIYfYMzYZF4OBLVHR5ZqxuXqiJPfQAECq80PEl2Kdc0m86pSda+Ppxoi442OEqdO
 06GMIvCgnIicQa5eekq+hFLlxYcWoOD6FN3s+7HFtT8nBKvE5J53fQO3t6EsUfKXr8KWuODtgBBxu
 MlCt7vSu6nU8XxBuAO4oon6qV8IQX7DrKh4D+3O94BsG6OReeTHKqKOzqIBJ4gzvxwD4qSSl9IWZG
 l7A0qMl3H8rZ+jj80Tx2SrBg+FKrFYd1DJC+iuTaIrnaibk3DWZhOFRDdUNAv5DG+NzAE2Whe0SPF
 V8rbCFG37AMef1xY+AxMloEZXIOAGM1m3edeEBVnPOQHL9fXA4OtsP17LmZUTqsh/kKAexb2RgY//
 FwZCdBD4uickZaxI4MJcwFtO/m3AL4f1b0ifFtnUgpStquuZ98puAJ+oPGsAGRWmmJ+TBYYnC2ZEA
 TNUaF0NX0WSuOJtxSSqcaHEl5uHf4J0kx6/+e/YN4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Jason Andryuk <jandryuk@gmail.com>, Greg Kurz <groug@kaod.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
Date: Fri, 05 May 2023 12:05:45 +0200
Message-ID: <43162544.QFhiSxD2Za@silver>
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
References: <20230502143722.15613-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Jason,

as this is a Xen specific change, I would like Stefano or another Xen
developer to take a look at it, just few things from my side ...

On Tuesday, May 2, 2023 4:37:22 PM CEST Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed

Where exactly does it do that access? A backtrace or another detailed commit
log description would help.

> out when free is called.  Do the teardown in _disconnect().  This
> matches the setup done in _connect().
> 
> trace-events are also added for the XenDevOps functions.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>  hw/9pfs/trace-events     |  5 +++++
>  hw/9pfs/xen-9p-backend.c | 36 +++++++++++++++++++++++-------------
>  2 files changed, 28 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
> index 6c77966c0b..7b5b0b5a48 100644
> --- a/hw/9pfs/trace-events
> +++ b/hw/9pfs/trace-events
> @@ -48,3 +48,8 @@ v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
>  v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name %s"
>  v9fs_setattr(uint16_t tag, uint8_t id, int32_t fid, int32_t valid, int32_t mode, int32_t uid, int32_t gid, int64_t size, int64_t atime_sec, int64_t mtime_sec) "tag %u id %u fid %d iattr={valid %d mode %d uid %d gid %d size %"PRId64" atime=%"PRId64" mtime=%"PRId64" }"
>  v9fs_setattr_return(uint16_t tag, uint8_t id) "tag %u id %u"
> +

Nit-picking; missing leading comment:

# xen-9p-backend.c

> +xen_9pfs_alloc(char *name) "name %s"
> +xen_9pfs_connect(char *name) "name %s"
> +xen_9pfs_disconnect(char *name) "name %s"
> +xen_9pfs_free(char *name) "name %s"
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index 0e266c552b..c646a0b3d1 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -25,6 +25,8 @@
>  #include "qemu/iov.h"
>  #include "fsdev/qemu-fsdev.h"
>  
> +#include "trace.h"
> +
>  #define VERSIONS "1"
>  #define MAX_RINGS 8
>  #define MAX_RING_ORDER 9
> @@ -337,6 +339,8 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
>      Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
>      int i;
>  
> +    trace_xen_9pfs_disconnect(xendev->name);
> +
>      for (i = 0; i < xen_9pdev->num_rings; i++) {
>          if (xen_9pdev->rings[i].evtchndev != NULL) {
>              qemu_set_fd_handler(qemu_xen_evtchn_fd(xen_9pdev->rings[i].evtchndev),
> @@ -345,40 +349,42 @@ static void xen_9pfs_disconnect(struct XenLegacyDevice *xendev)
>                                     xen_9pdev->rings[i].local_port);
>              xen_9pdev->rings[i].evtchndev = NULL;
>          }
> -    }
> -}
> -
> -static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> -{
> -    Xen9pfsDev *xen_9pdev = container_of(xendev, Xen9pfsDev, xendev);
> -    int i;
> -
> -    if (xen_9pdev->rings[0].evtchndev != NULL) {
> -        xen_9pfs_disconnect(xendev);
> -    }
> -
> -    for (i = 0; i < xen_9pdev->num_rings; i++) {
>          if (xen_9pdev->rings[i].data != NULL) {
>              xen_be_unmap_grant_refs(&xen_9pdev->xendev,
>                                      xen_9pdev->rings[i].data,
>                                      xen_9pdev->rings[i].intf->ref,
>                                      (1 << xen_9pdev->rings[i].ring_order));
> +            xen_9pdev->rings[i].data = NULL;
>          }
>          if (xen_9pdev->rings[i].intf != NULL) {
>              xen_be_unmap_grant_ref(&xen_9pdev->xendev,
>                                     xen_9pdev->rings[i].intf,
>                                     xen_9pdev->rings[i].ref);
> +            xen_9pdev->rings[i].intf = NULL;
>          }
>          if (xen_9pdev->rings[i].bh != NULL) {
>              qemu_bh_delete(xen_9pdev->rings[i].bh);
> +            xen_9pdev->rings[i].bh = NULL;
>          }
>      }
>  
>      g_free(xen_9pdev->id);
> +    xen_9pdev->id = NULL;
>      g_free(xen_9pdev->tag);
> +    xen_9pdev->tag = NULL;
>      g_free(xen_9pdev->path);
> +    xen_9pdev->path = NULL;
>      g_free(xen_9pdev->security_model);
> +    xen_9pdev->security_model = NULL;
>      g_free(xen_9pdev->rings);
> +    xen_9pdev->rings = NULL;
> +    return;
> +}
> +
> +static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> +{
> +    trace_xen_9pfs_free(xendev->name);
> +
>      return 0;
>  }

xen_9pfs_free() doing nothing, that doesn't look right to me. Wouldn't it make
sense to turn xen_9pfs_free() idempotent instead?

>  
> @@ -390,6 +396,8 @@ static int xen_9pfs_connect(struct XenLegacyDevice *xendev)
>      V9fsState *s = &xen_9pdev->state;
>      QemuOpts *fsdev;
>  
> +    trace_xen_9pfs_connect(xendev->name);
> +
>      if (xenstore_read_fe_int(&xen_9pdev->xendev, "num-rings",
>                               &xen_9pdev->num_rings) == -1 ||
>          xen_9pdev->num_rings > MAX_RINGS || xen_9pdev->num_rings < 1) {
> @@ -499,6 +507,8 @@ out:
>  
>  static void xen_9pfs_alloc(struct XenLegacyDevice *xendev)
>  {
> +    trace_xen_9pfs_alloc(xendev->name);
> +
>      xenstore_write_be_str(xendev, "versions", VERSIONS);
>      xenstore_write_be_int(xendev, "max-rings", MAX_RINGS);
>      xenstore_write_be_int(xendev, "max-ring-page-order", MAX_RING_ORDER);
> 



