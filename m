Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C466F8D2B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 02:37:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv5u5-0003IE-8L; Fri, 05 May 2023 20:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pv5u0-0003Fx-2o
 for qemu-devel@nongnu.org; Fri, 05 May 2023 20:35:56 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1pv5tw-0005lH-3n
 for qemu-devel@nongnu.org; Fri, 05 May 2023 20:35:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0079763C2E;
 Sat,  6 May 2023 00:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DED8C433D2;
 Sat,  6 May 2023 00:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683333338;
 bh=bP/3aHvZYOXH3zu8B4TUIjOV1o/FusNOt/78mT12AFw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FA6qHKtIZCoo7JyMA/TPj5q9THuxlE3xbt1wUPQos+XP7Llr1DVlqSqtI9CtwtEnz
 ZtUpCdFFsQR/gq0RuBDEBWUmNytLi/26Er/7E5CNzoXvyhvX11CvehWdgMcSyFl5cZ
 3HzhQ/SrPomJvST5vkoMFoGPniwB7pf7KCH8NLBEl5KAntmYPPE51DFaGvltpnRcUH
 HwWJN2Z7vYd8UykRhHmNmOONUvwc3qz1+hw8RfD3ILXha6BvLupOEUlSSxKnAeUsjz
 p2hwvi5X8C8gabXB+E3EvyS/+uNsd1Knj9l/hxSPto3NSsb+r7k38IJIl4nGDQLUHr
 o4yTLuUOaVS/w==
Date: Fri, 5 May 2023 17:35:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jandryuk@gmail.com>
cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] 9pfs/xen: Fix segfault on shutdown
In-Reply-To: <20230502143722.15613-1-jandryuk@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2305051735020.974517@ubuntu-linux-20-04-desktop>
References: <20230502143722.15613-1-jandryuk@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 2 May 2023, Jason Andryuk wrote:
> xen_9pfs_free can't use gnttabdev since it is already closed and NULL-ed
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

NIT: this return is redudant.

Aside from that:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> +}
> +
> +static int xen_9pfs_free(struct XenLegacyDevice *xendev)
> +{
> +    trace_xen_9pfs_free(xendev->name);
> +
>      return 0;
>  }
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
> -- 
> 2.40.1
> 

