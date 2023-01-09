Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7F662164
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:26:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoKR-00024B-5X; Mon, 09 Jan 2023 04:20:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEoKH-00023j-IY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:20:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pEoKE-0003UR-4l
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673256013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9QjfDoAtssiP4Rx4kwu8L2uOhRb9t/mXpUqewhUizH0=;
 b=gNcs9z0YWn/ku0rqfZr/4PxXg60aaoM73FtVyAp2oiOtha2isfYJ/m1yekF9ZW7YiHLo1J
 RTR1xdpcVtc92GIICM/2+5XxeYTOyVh0rdXN/tpkd1+am/g58hDiMlaAcFOpP4du3h/76h
 p1JDA6YQEehx68MmAjMMv5McdObpCcQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-6eOWJ3mRPJWPKbzuxsuo0w-1; Mon, 09 Jan 2023 04:20:11 -0500
X-MC-Unique: 6eOWJ3mRPJWPKbzuxsuo0w-1
Received: by mail-oi1-f198.google.com with SMTP id
 c5-20020a544e85000000b00361126f6443so2303666oiy.16
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9QjfDoAtssiP4Rx4kwu8L2uOhRb9t/mXpUqewhUizH0=;
 b=Wi4xYAIsW8AS3kfyQIAhVfi1UmDdNIl4FBDar/LJap0cdrUV9Ktz2ilw4Mn8K+HqAx
 Zntb/fnw//SKS1xRbgcFITYsY9Hdw4LK8MJP8IYvLQdt8sNzTKL9W1waB6mklBSt0tUG
 Z/jAYKonQESHZMD8/6X4iIEgU8cO6jYgfTHS5UHGH1z8VROrcekeOhz3+h7D1IQrvHNi
 wJhB0gDYr3PrRW3nNxmMtdaFaqbZ0VbnvVJbOngN/ONfmAA71dyrH6258NrQZscvLkdF
 cAaCxprmjREVPZZ2VnOckTlGL08UNfU6H5jl0ux5eY5o7z53WHV5VXZy6DqBxGRXNTsK
 uJ0A==
X-Gm-Message-State: AFqh2kqBXzEMVO/YcWzVP5qhJjwCLLURLiAtykuMgGRq8kAtBzUKTJWQ
 ZbGD82DDKP7FUL/3aXA3M629IDXYNZj4hT0Z3IfF1eQAjy/kSCII+aPIj8ec0TNeSb4fw8u8/96
 yUSzjbHVse6oNYCZzdMTRUNvDq5bIzVA=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr3403171oah.35.1673256010246; 
 Mon, 09 Jan 2023 01:20:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvm+huypdpS8KXrx1YqsUR5G1lgsvd2qlrWCNRe21hYPy+VxiVtavWYa2aM5pBZ9ZoejLxhf9isVZ8TxdsxOBk=
X-Received: by 2002:a05:6870:4413:b0:144:a97b:1ae2 with SMTP id
 u19-20020a056870441300b00144a97b1ae2mr3403168oah.35.1673256009982; Mon, 09
 Jan 2023 01:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20230102010821.5462-1-j@getutm.app>
In-Reply-To: <20230102010821.5462-1-j@getutm.app>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Jan 2023 17:19:58 +0800
Message-ID: <CACGkMEuusrxZpKSvvWYRJYJ2k95ojt=4rza14mo3nORnbqRH-w@mail.gmail.com>
Subject: Re: [PATCH] vmnet: stop recieving events when VM is stopped
To: Joelle van Dyne <j@getutm.app>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Mon, Jan 2, 2023 at 9:08 AM Joelle van Dyne <j@getutm.app> wrote:
>
> When the VM is stopped using the HMP command "stop", soon the handler will
> stop reading from the vmnet interface. This causes a flood of
> `VMNET_INTERFACE_PACKETS_AVAILABLE` events to arrive and puts the host CPU
> at 100%. We fix this by removing the event handler from vmnet when the VM
> is no longer in a running state and restore it when we return to a running
> state.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>

Applied.

Thanks

> ---
>  net/vmnet_int.h    |  2 ++
>  net/vmnet-common.m | 48 +++++++++++++++++++++++++++++++++-------------
>  2 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> index adf6e8c20d..ffba92108f 100644
> --- a/net/vmnet_int.h
> +++ b/net/vmnet_int.h
> @@ -46,6 +46,8 @@ typedef struct VmnetState {
>      int packets_send_end_pos;
>
>      struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> +
> +    VMChangeStateEntry *change;
>  } VmnetState;
>
>  const char *vmnet_status_map_str(vmnet_return_t status);
> diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> index 2cb60b9ddd..2958283485 100644
> --- a/net/vmnet-common.m
> +++ b/net/vmnet-common.m
> @@ -17,6 +17,7 @@
>  #include "clients.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "sysemu/runstate.h"
>
>  #include <vmnet/vmnet.h>
>  #include <dispatch/dispatch.h>
> @@ -242,6 +243,35 @@ static void vmnet_bufs_init(VmnetState *s)
>      }
>  }
>
> +/**
> + * Called on state change to un-register/re-register handlers
> + */
> +static void vmnet_vm_state_change_cb(void *opaque, bool running, RunState state)
> +{
> +    VmnetState *s = opaque;
> +
> +    if (running) {
> +        vmnet_interface_set_event_callback(
> +            s->vmnet_if,
> +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> +            s->if_queue,
> +            ^(interface_event_t event_id, xpc_object_t event) {
> +                assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> +                /*
> +                 * This function is being called from a non qemu thread, so
> +                 * we only schedule a BH, and do the rest of the io completion
> +                 * handling from vmnet_send_bh() which runs in a qemu context.
> +                 */
> +                qemu_bh_schedule(s->send_bh);
> +            });
> +    } else {
> +        vmnet_interface_set_event_callback(
> +            s->vmnet_if,
> +            VMNET_INTERFACE_PACKETS_AVAILABLE,
> +            NULL,
> +            NULL);
> +    }
> +}
>
>  int vmnet_if_create(NetClientState *nc,
>                      xpc_object_t if_desc,
> @@ -329,19 +359,9 @@ int vmnet_if_create(NetClientState *nc,
>      s->packets_send_current_pos = 0;
>      s->packets_send_end_pos = 0;
>
> -    vmnet_interface_set_event_callback(
> -        s->vmnet_if,
> -        VMNET_INTERFACE_PACKETS_AVAILABLE,
> -        s->if_queue,
> -        ^(interface_event_t event_id, xpc_object_t event) {
> -            assert(event_id == VMNET_INTERFACE_PACKETS_AVAILABLE);
> -            /*
> -             * This function is being called from a non qemu thread, so
> -             * we only schedule a BH, and do the rest of the io completion
> -             * handling from vmnet_send_bh() which runs in a qemu context.
> -             */
> -            qemu_bh_schedule(s->send_bh);
> -        });
> +    vmnet_vm_state_change_cb(s, 1, RUN_STATE_RUNNING);
> +
> +    s->change = qemu_add_vm_change_state_handler(vmnet_vm_state_change_cb, s);
>
>      return 0;
>  }
> @@ -356,6 +376,8 @@ void vmnet_cleanup_common(NetClientState *nc)
>          return;
>      }
>
> +    vmnet_vm_state_change_cb(s, 0, RUN_STATE_SHUTDOWN);
> +    qemu_del_vm_change_state_handler(s->change);
>      if_stopped_sem = dispatch_semaphore_create(0);
>      vmnet_stop_interface(
>          s->vmnet_if,
> --
> 2.28.0
>


