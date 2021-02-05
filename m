Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E322D31064C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 09:11:40 +0100 (CET)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7wDL-0003v0-Jv
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 03:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l7wC1-0003Oz-9W
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:10:17 -0500
Received: from relay68.bu.edu ([128.197.228.73]:58020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l7wBz-000176-Fq
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 03:10:16 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 11589aKU009319
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 5 Feb 2021 03:09:39 -0500
Date: Fri, 5 Feb 2021 03:09:36 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v2 17/20] virtio-gpu: avoid re-entering cmdq processing
Message-ID: <20210205080936.wj4hwnp2diuqbo4h@mozz.bu.edu>
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-18-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204105232.834642-18-marcandre.lureau@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210204 1452, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The next patch will notify the GL context got flush, which will resume
> the queue processing. However, if this happens within the caller
> context, it will end up with a stack overflow flush/update loop.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I know this was pulled already, but FWIW I think this is
Buglink: https://bugs.launchpad.net/qemu/+bug/1888606

> ---
>  include/hw/virtio/virtio-gpu.h | 1 +
>  hw/display/virtio-gpu.c        | 5 +++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
> index 4f3dbf79f9..0043268e90 100644
> --- a/include/hw/virtio/virtio-gpu.h
> +++ b/include/hw/virtio/virtio-gpu.h
> @@ -148,6 +148,7 @@ struct VirtIOGPU {
>  
>      uint64_t hostmem;
>  
> +    bool processing_cmdq;
>      bool renderer_inited;
>      bool renderer_reset;
>      QEMUTimer *fence_poll;
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 0e833a462b..7eb4265a6d 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -814,6 +814,10 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
>  {
>      struct virtio_gpu_ctrl_command *cmd;
>  
> +    if (g->processing_cmdq) {
> +        return;
> +    }
> +    g->processing_cmdq = true;
>      while (!QTAILQ_EMPTY(&g->cmdq)) {
>          cmd = QTAILQ_FIRST(&g->cmdq);
>  
> @@ -843,6 +847,7 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
>              g_free(cmd);
>          }
>      }
> +    g->processing_cmdq = false;
>  }
>  
>  static void virtio_gpu_gl_unblock(VirtIOGPUBase *b)
> -- 
> 2.29.0
> 
> 

