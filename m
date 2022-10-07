Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44C5F7938
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 15:48:11 +0200 (CEST)
Received: from localhost ([::1]:34160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ognhy-0002Ws-20
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 09:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogkx3-00077s-QK
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:51:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogkx1-0003mD-5Y
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pcb8vtz3KDnQhIFYp3GzIRJgcn75LKZ1ISgMGyH0X2c=;
 b=Au5v2xWWB8SsB8dcYN8DLUkPOzTdcQEX8UvdNariQ0sWvOjCJkvnEVbqKTbsNneOIQsMxi
 /iBmBkkxFm00Nmf8h3IQj0viF3ow5+YElu9SIjZKoMCFCZGWPHVjWc/j+auVXs69elwfiy
 HNpp7FRQxOBg3Q7ltTxR/KEiMXl4KZ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-46-eNS5AYf1O6e6fObztKIi6Q-1; Fri, 07 Oct 2022 06:51:28 -0400
X-MC-Unique: eNS5AYf1O6e6fObztKIi6Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 h17-20020adfaa91000000b0022e9f2245c8so418747wrc.19
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcb8vtz3KDnQhIFYp3GzIRJgcn75LKZ1ISgMGyH0X2c=;
 b=YP3ckp66IsQm33xpokhcN1XnkJtkP+V7+wRwrTgpH5NsnMm+HLKqaX8ck7r+RyzNQ6
 LzjcyrcEJOVyZXLRR70Byo7hyD2Y0O+L+TBq2K0lA9D8DmkIPc+A3L7onW3BlZPakDIm
 LONXAmV9CJswsZrmW4vjeRxyCqsk+lF2vipQCQI9Zn81KseH9Pp8jerVAy24OUjzOHjY
 S10DIbF1Fqqt/VH1GxIQDdlzG7n5g4w2CpYU/UmLeQo9jvoNBKWNgqLjr1+KRxHssbNW
 pZo5h4bf8RWYStPQ9+G4RF5Rz4erh5Cvocnqx3cwKwwaEpI16VR7d+cy++jXqk+WeEtS
 lvCQ==
X-Gm-Message-State: ACrzQf2uJF/IRVftGJJauBMHmkiHXtYMzsZx1rQAoLXHrWT2couxc5tT
 KbN9KZy9XtDv1Ozm4friBoxKO8WDmbS0KM3yJEXoJ0EbftmRR2+MlXBN3I/K6JifDavwnix0ar8
 pedlq6UDSFTHjN/w=
X-Received: by 2002:a5d:6da1:0:b0:22b:774:52c3 with SMTP id
 u1-20020a5d6da1000000b0022b077452c3mr2835249wrs.172.1665139887319; 
 Fri, 07 Oct 2022 03:51:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4SatOmrtpqRyhQnjqJCqby/l1wz9p22zPC9isxfQB7lWtg4B0IkKsRH3xSAecZj7vNRTTtZw==
X-Received: by 2002:a5d:6da1:0:b0:22b:774:52c3 with SMTP id
 u1-20020a5d6da1000000b0022b077452c3mr2835201wrs.172.1665139887009; 
 Fri, 07 Oct 2022 03:51:27 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b003b4cba4ef71sm7938473wmq.41.2022.10.07.03.51.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 03:51:26 -0700 (PDT)
Date: Fri, 7 Oct 2022 12:51:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 09/13] block: add BlockRAMRegistrar
Message-ID: <20221007105121.qxhuroqnqhzqkmgo@sgarzare-redhat>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-10-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006213507.645402-10-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 05:35:03PM -0400, Stefan Hajnoczi wrote:
>Emulated devices and other BlockBackend users wishing to take advantage
>of blk_register_buf() all have the same repetitive job: register
>RAMBlocks with the BlockBackend using RAMBlockNotifier.
>
>Add a BlockRAMRegistrar API to do this. A later commit will use this
>from hw/block/virtio-blk.c.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> MAINTAINERS                          |  1 +
> include/sysemu/block-ram-registrar.h | 37 ++++++++++++++++++
> block/block-ram-registrar.c          | 58 ++++++++++++++++++++++++++++
> block/meson.build                    |  1 +
> 4 files changed, 97 insertions(+)
> create mode 100644 include/sysemu/block-ram-registrar.h
> create mode 100644 block/block-ram-registrar.c
>
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 0dcae6168a..91aed2cdc7 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -2498,6 +2498,7 @@ F: block*
> F: block/
> F: hw/block/
> F: include/block/
>+F: include/sysemu/block-*.h
> F: qemu-img*
> F: docs/tools/qemu-img.rst
> F: qemu-io*
>diff --git a/include/sysemu/block-ram-registrar.h b/include/sysemu/block-ram-registrar.h
>new file mode 100644
>index 0000000000..d8b2f7942b
>--- /dev/null
>+++ b/include/sysemu/block-ram-registrar.h
>@@ -0,0 +1,37 @@
>+/*
>+ * BlockBackend RAM Registrar
>+ *
>+ * SPDX-License-Identifier: GPL-2.0-or-later
>+ */
>+
>+#ifndef BLOCK_RAM_REGISTRAR_H
>+#define BLOCK_RAM_REGISTRAR_H
>+
>+#include "exec/ramlist.h"
>+
>+/**
>+ * struct BlockRAMRegistrar:
>+ *
>+ * Keeps RAMBlock memory registered with a BlockBackend using
>+ * blk_register_buf() including hotplugged memory.
>+ *
>+ * Emulated devices or other BlockBackend users initialize a BlockRAMRegistrar
>+ * with blk_ram_registrar_init() before submitting I/O requests with the
>+ * BDRV_REQ_REGISTERED_BUF flag set.
>+ */
>+typedef struct {
>+    BlockBackend *blk;
>+    RAMBlockNotifier notifier;
>+    bool ok;
>+} BlockRAMRegistrar;
>+
>+void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk);
>+void blk_ram_registrar_destroy(BlockRAMRegistrar *r);
>+
>+/* Have all RAMBlocks been registered successfully? */
>+static inline bool blk_ram_registrar_ok(BlockRAMRegistrar *r)
>+{
>+    return r->ok;
>+}
>+
>+#endif /* BLOCK_RAM_REGISTRAR_H */
>diff --git a/block/block-ram-registrar.c b/block/block-ram-registrar.c
>new file mode 100644
>index 0000000000..25dbafa789
>--- /dev/null
>+++ b/block/block-ram-registrar.c
>@@ -0,0 +1,58 @@
>+/*
>+ * BlockBackend RAM Registrar
>+ *
>+ * SPDX-License-Identifier: GPL-2.0-or-later
>+ */
>+
>+#include "qemu/osdep.h"
>+#include "sysemu/block-backend.h"
>+#include "sysemu/block-ram-registrar.h"
>+#include "qapi/error.h"
>+
>+static void ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
>+                            size_t max_size)
>+{
>+    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
>+    Error *err = NULL;
>+
>+    if (!r->ok) {
>+        return; /* don't try again if we've already failed */
>+    }

The segfault I was seeing is gone, though, and I'm getting a doubt.

Here we basically just report the error and prevent new regions from 
being registered. The VM still starts though and the blkio driver works 
as if nothing happened.

For drivers that require all regions to be registered, this can cause 
problems, so should we stop the VM in case of failure or put the blkio 
driver in a state such that IOs are not submitted?

Or maybe it's okay and then the device will somehow report the error 
when it can't find the mapped region?

Thanks,
Stefano

>+
>+    if (!blk_register_buf(r->blk, host, max_size, &err)) {
>+        error_report_err(err);
>+        ram_block_notifier_remove(&r->notifier);
>+        r->ok = false;
>+    }
>+}
>+
>+static void ram_block_removed(RAMBlockNotifier *n, void *host, size_t size,
>+                              size_t max_size)
>+{
>+    BlockRAMRegistrar *r = container_of(n, BlockRAMRegistrar, notifier);
>+    blk_unregister_buf(r->blk, host, max_size);
>+}
>+
>+void blk_ram_registrar_init(BlockRAMRegistrar *r, BlockBackend *blk)
>+{
>+    r->blk = blk;
>+    r->notifier = (RAMBlockNotifier){
>+        .ram_block_added = ram_block_added,
>+        .ram_block_removed = ram_block_removed,
>+
>+        /*
>+         * .ram_block_resized() is not necessary because we use the max_size
>+         * value that does not change across resize.
>+         */
>+    };
>+    r->ok = true;
>+
>+    ram_block_notifier_add(&r->notifier);
>+}
>+
>+void blk_ram_registrar_destroy(BlockRAMRegistrar *r)
>+{
>+    if (r->ok) {
>+        ram_block_notifier_remove(&r->notifier);
>+    }
>+}
>diff --git a/block/meson.build b/block/meson.build
>index 500878f082..b7c68b83a3 100644
>--- a/block/meson.build
>+++ b/block/meson.build
>@@ -46,6 +46,7 @@ block_ss.add(files(
> ), zstd, zlib, gnutls)
>
> softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('blkreplay.c'))
>+softmmu_ss.add(files('block-ram-registrar.c'))
>
> if get_option('qcow1').allowed()
>   block_ss.add(files('qcow.c'))
>-- 
>2.37.3
>


