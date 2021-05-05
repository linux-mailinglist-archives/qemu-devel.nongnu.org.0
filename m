Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978DF374396
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:46:12 +0200 (CEST)
Received: from localhost ([::1]:56174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLb9-0006X4-Lr
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:46:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1leLXT-0004yd-Hd
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:42:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1leLXR-0003fE-BV
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:42:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id v12so2741456wrq.6
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5ck4hA6Xxm2yKJj3VL+ZRwH+wBOpSKpRNDlAP7W/xkY=;
 b=sqQ1P5bx1mEgzNpROO/fxDPLD91nT9gDAoarQLa7BmVjX+WVZbS3rBTTNHLYFjIFDH
 5zj2pxzaeX4XMXJCmuJ6jzw0XeQOFEt2APMz30Aom4+taAvFdx5rM2KAHCYZhx/hu95P
 TrvajzfUn6kYigiFSjofr5NVPr/kEHrz2NAfon1+zIAojtRgbhDWmBW3hWhXus1zpYbi
 0OqHDmOwMs97yExn2XSUhf6RKK2G3i7E0Ji0i/uUwDcXEcqLiywbnNAbo21yz/g1kPW6
 hakyTnxKg2W8Do32DUD9qoCuw6A4LfozyWo2O6VPiBK27Rqpzme96FXVe1X9FavAI7/T
 phCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:subject:to:cc:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=5ck4hA6Xxm2yKJj3VL+ZRwH+wBOpSKpRNDlAP7W/xkY=;
 b=EjG+k3oPwixao8GVZzGAUdCCc8+9DMCQL5D+Tgc4ObaDenzbvgqjbIGsqrsJ0WkXXl
 E16xAASLa3Pi50xS1C+O6HcvFam7ChAI1RDz1ohyL/F4sEN25ILgbj6Q6w2a5I00OifO
 g4DcrMR78RrYw/15DNex+AhNierCfWTOR8wAfayE//oFmCbEJKtB041ZzFUVQFR/5lT0
 PlDwRR99tepsFhkZMZ/BM2uC78MRGAWUTVTzd7idFXmeJbj5GcspPIWE+unseqX4bSxh
 vhuRrtBMd9aF1rz0GDy260PvzPo0D1XaQJmrAx4jS+PO7uv/voI5he+BGk8pG06xVgJj
 cX0Q==
X-Gm-Message-State: AOAM530EnQksKB1XFuC61odjs4SFU5TVD0bjvGRm0DQDVSKVO3c2el/w
 ODNt9ncUkC8bqJxfDuXLrj8=
X-Google-Smtp-Source: ABdhPJyKeePxveTaMDHr01H0ue6iC6KDu7zCB1oEN0SxiOtXKt6kgydav7ZtpWMIR5bgS3/BkLoc6w==
X-Received: by 2002:adf:a316:: with SMTP id c22mr229727wrb.202.1620236531877; 
 Wed, 05 May 2021 10:42:11 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id q12sm5465702wmj.7.2021.05.05.10.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 10:42:11 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH] xen: Free xenforeignmemory_resource at exit
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20210430163742.469739-1-anthony.perard@citrix.com>
Message-ID: <32263046-97a5-b163-ff23-746effb5c7e4@xen.org>
Date: Wed, 5 May 2021 18:42:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430163742.469739-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/2021 17:37, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Because Coverity complains about it and this is one leak that Valgrind
> reports.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Paul Durrant <paul@xen.org>

> ---
>   hw/i386/xen/xen-hvm.c       | 9 ++++++---
>   include/hw/xen/xen_common.h | 6 ++++++
>   2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 7ce672e5a5c3..47ed7772fa39 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -109,6 +109,7 @@ typedef struct XenIOState {
>       shared_iopage_t *shared_page;
>       shared_vmport_iopage_t *shared_vmport_page;
>       buffered_iopage_t *buffered_io_page;
> +    xenforeignmemory_resource_handle *fres;
>       QEMUTimer *buffered_io_timer;
>       CPUState **cpu_by_vcpu_id;
>       /* the evtchn port for polling the notification, */
> @@ -1254,6 +1255,9 @@ static void xen_exit_notifier(Notifier *n, void *data)
>       XenIOState *state = container_of(n, XenIOState, exit);
>   
>       xen_destroy_ioreq_server(xen_domid, state->ioservid);
> +    if (state->fres != NULL) {
> +        xenforeignmemory_unmap_resource(xen_fmem, state->fres);
> +    }
>   
>       xenevtchn_close(state->xce_handle);
>       xs_daemon_close(state->xenstore);
> @@ -1321,7 +1325,6 @@ static void xen_wakeup_notifier(Notifier *notifier, void *data)
>   static int xen_map_ioreq_server(XenIOState *state)
>   {
>       void *addr = NULL;
> -    xenforeignmemory_resource_handle *fres;
>       xen_pfn_t ioreq_pfn;
>       xen_pfn_t bufioreq_pfn;
>       evtchn_port_t bufioreq_evtchn;
> @@ -1333,12 +1336,12 @@ static int xen_map_ioreq_server(XenIOState *state)
>        */
>       QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
>       QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
> -    fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
> +    state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
>                                            XENMEM_resource_ioreq_server,
>                                            state->ioservid, 0, 2,
>                                            &addr,
>                                            PROT_READ | PROT_WRITE, 0);
> -    if (fres != NULL) {
> +    if (state->fres != NULL) {
>           trace_xen_map_resource_ioreq(state->ioservid, addr);
>           state->buffered_io_page = addr;
>           state->shared_page = addr + TARGET_PAGE_SIZE;
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 82e56339dd7e..a8118b41acfb 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -134,6 +134,12 @@ static inline xenforeignmemory_resource_handle *xenforeignmemory_map_resource(
>       return NULL;
>   }
>   
> +static inline int xenforeignmemory_unmap_resource(
> +    xenforeignmemory_handle *fmem, xenforeignmemory_resource_handle *fres)
> +{
> +    return 0;
> +}
> +
>   #endif /* CONFIG_XEN_CTRL_INTERFACE_VERSION < 41100 */
>   
>   #if CONFIG_XEN_CTRL_INTERFACE_VERSION < 41000
> 


