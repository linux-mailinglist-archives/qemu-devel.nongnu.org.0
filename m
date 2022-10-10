Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061875F9B84
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:59:03 +0200 (CEST)
Received: from localhost ([::1]:35002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohocn-0000jr-JL
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ohoS1-0007hG-Iq
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ohoRo-0005Lf-F2
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 04:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665391656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Luciw3QrPkUyTunXvw8an62Zw5Mk07shANqqe30YmjU=;
 b=UraRycK95t+NJSIk68rfUTCSN3BwwJ1etg5g+aSmssr08OUdHzkHoPRK8MGmJkBiu1GpF8
 fqcvncoc9hp2WfR1GqadVhd5Yu5xujBJLUBGFWl7PUxE/PFdIZNWu3bj9Q0wItQMQbg6n9
 92dwUpJTFu5ro/amiWeYYUmyNsffdhw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-100-gjx0ble4PxOkJ3Prc2H8oA-1; Mon, 10 Oct 2022 04:47:34 -0400
X-MC-Unique: gjx0ble4PxOkJ3Prc2H8oA-1
Received: by mail-wm1-f69.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so2900260wmi.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 01:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Luciw3QrPkUyTunXvw8an62Zw5Mk07shANqqe30YmjU=;
 b=Ncq7J6jBp50lO6aPI3cyjFYstc+2qAiV1UrRczAmGsfQCMUv2tSPY1hiVn21d/puty
 JCPEq+6KpBX40csTDqvOc7Thb/2q4/cuueVQ5uCXnNANuQqFDAPXSxwxeab1XbogvRxe
 z2xU/2G1dyXNqwidDH6cj7RQi9ucZjiQP0Fye75ZQauwou+UL7s8k8HW+Fh7cZxpTTfO
 f3l9DuWt/coB4VxrU1JjUaDfH8XpyjfW4GztIjsXcomDjoSSaOBD/Y38D725kB2eX+RM
 WrSvkZ9AG3fVtk1wprU9u+ud/FChKjGKEvxF1E7ksD9DAPAIcly49n4ncVDerN+TZjPB
 l6bQ==
X-Gm-Message-State: ACrzQf15mM0f3k1TpL6vjBW8jq0YpB1YwpHPebm8X8ArkygULK8GPM0R
 jfsioDutNByOqkzs7pAE5Qtr8UiY+d+2lF0Pe5Medp2K904uoysgni8DYdDmU1QBGac+3xajSmz
 di/XQ7uLSmXTx9jU=
X-Received: by 2002:a5d:6384:0:b0:22e:6027:9da4 with SMTP id
 p4-20020a5d6384000000b0022e60279da4mr10204685wru.686.1665391653695; 
 Mon, 10 Oct 2022 01:47:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66+gfHjA/Vm2BGNERFvRXBBLRtNd5fdKKjPDRZe5SYeQvMjCATd91BeAFJsdz5EA1u8sdjhQ==
X-Received: by 2002:a5d:6384:0:b0:22e:6027:9da4 with SMTP id
 p4-20020a5d6384000000b0022e60279da4mr10204665wru.686.1665391653332; 
 Mon, 10 Oct 2022 01:47:33 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-34.retail.telecomitalia.it.
 [87.11.6.34]) by smtp.gmail.com with ESMTPSA id
 n24-20020a7bc5d8000000b003b6b3202e22sm14962310wmk.33.2022.10.10.01.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 01:47:32 -0700 (PDT)
Date: Mon, 10 Oct 2022 10:47:28 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH] block/io_uring: revert "Use io_uring_register_ring_fd()
 to skip fd operations"
Message-ID: <20221010084728.cvdjptxf5sgadgum@sgarzare-redhat>
References: <20220924144815.5591-1-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220924144815.5591-1-faithilikerun@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 24, 2022 at 10:48:15PM +0800, Sam Li wrote:
>Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1193
>
>The commit "Use io_uring_register_ring_fd() to skip fd operations" broke
>when booting a guest with iothread and io_uring. That is because the
>io_uring_register_ring_fd() call is made from the main thread instead of
>IOThread where io_uring_submit() is called. It can not be guaranteed
>to register the ring fd in the correct thread or unregister the same ring
>fd if the IOThread is disabled. This optimization is not critical so we
>will revert previous commit.

Right, maybe we can call it on the first submit.

>
>This reverts commit e2848bc574fe2715c694bf8fe9a1ba7f78a1125a
>and 77e3f038af1764983087e3551a0fde9951952c4d.

Yep, better to revert for now:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


Should we queue this for stable?

Thanks,
Stefano

>
>Signed-off-by: Sam Li <faithilikerun@gmail.com>
>---
> block/io_uring.c | 13 +------------
> meson.build      |  1 -
> 2 files changed, 1 insertion(+), 13 deletions(-)
>
>diff --git a/block/io_uring.c b/block/io_uring.c
>index a1760152e0..973e15d876 100644
>--- a/block/io_uring.c
>+++ b/block/io_uring.c
>@@ -11,7 +11,6 @@
> #include "qemu/osdep.h"
> #include <liburing.h>
> #include "block/aio.h"
>-#include "qemu/error-report.h"
> #include "qemu/queue.h"
> #include "block/block.h"
> #include "block/raw-aio.h"
>@@ -19,7 +18,6 @@
> #include "qapi/error.h"
> #include "trace.h"
>
>-
> /* io_uring ring size */
> #define MAX_ENTRIES 128
>
>@@ -432,17 +430,8 @@ LuringState *luring_init(Error **errp)
>     }
>
>     ioq_init(&s->io_q);
>-#ifdef CONFIG_LIBURING_REGISTER_RING_FD
>-    if (io_uring_register_ring_fd(&s->ring) < 0) {
>-        /*
>-         * Only warn about this error: we will fallback to the non-optimized
>-         * io_uring operations.
>-         */
>-        warn_report("failed to register linux io_uring ring file descriptor");
>-    }
>-#endif
>-
>     return s;
>+
> }
>
> void luring_cleanup(LuringState *s)
>diff --git a/meson.build b/meson.build
>index 3885fc1076..63cfb844cf 100644
>--- a/meson.build
>+++ b/meson.build
>@@ -1793,7 +1793,6 @@ config_host_data.set('CONFIG_LIBNFS', libnfs.found())
> config_host_data.set('CONFIG_LIBSSH', libssh.found())
> config_host_data.set('CONFIG_LINUX_AIO', libaio.found())
> config_host_data.set('CONFIG_LINUX_IO_URING', linux_io_uring.found())
>-config_host_data.set('CONFIG_LIBURING_REGISTER_RING_FD', cc.has_function('io_uring_register_ring_fd', prefix: '#include <liburing.h>', dependencies:linux_io_uring))
> config_host_data.set('CONFIG_LIBPMEM', libpmem.found())
> config_host_data.set('CONFIG_NUMA', numa.found())
> config_host_data.set('CONFIG_OPENGL', opengl.found())
>-- 
>2.37.3
>


