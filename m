Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5174EDAF1
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:54:43 +0200 (CEST)
Received: from localhost ([::1]:50242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvG6-00017Z-73
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:54:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZvCf-0007Uv-DA
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:51:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nZvCc-0006Mb-0R
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648734664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rh87ueoTFrVabeDrJxu9b/ua/FWoZ+N+NXy76yxDgsA=;
 b=XebvQsxIpy4NDSqo9P7j0U4Ot786WRzkj5JNz0ql8xrAy0zeL/XlGUXx/krUwJ7nNTNXBl
 6fTSCVtI0rPxFILpkXasd6YSxN434wjBrx5zo+0I98heGOlgrkrGmPXjzjQy4wuqLk3pHB
 a+uCtXrJqWrzwxITo/wfzbLO84LvO70=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-WZ5YIVYLMsGpiPRfEdkWHg-1; Thu, 31 Mar 2022 09:51:03 -0400
X-MC-Unique: WZ5YIVYLMsGpiPRfEdkWHg-1
Received: by mail-wr1-f71.google.com with SMTP id
 f18-20020adf9f52000000b00203d86759beso6543937wrg.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 06:51:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rh87ueoTFrVabeDrJxu9b/ua/FWoZ+N+NXy76yxDgsA=;
 b=zc9ODEM5zv/m1WokAmV7F9rNgRZnbcWhc2r0b+wfLCsSxQ82KQrBIS1L0gB7SkKnNv
 CX0R1hA/PqSeYtid5YDQsGKBdDjOV9iNXI9lPwmZTD+vcC8zCT7BSjn9nwBK3Q+2T6nk
 1dF5nfVi4KtcXRIm8JDtL1Ov/JzlOM1F9BGZq9S4aE73ILVfn6eBkdr77EuOMcgRWaos
 tveSzW7nNF3Pgo/GOZ9NMzs1B2GF+Ti3NeAFLqfk//xFpC749j0qcckTQJbWWhxFVQ8R
 yj0LoslVu2l5HxPErjPOQv2P0aGq+t6/5opKziA3hFwc2GsFFdk+fHsv4/xIIBwsmFqt
 eXnA==
X-Gm-Message-State: AOAM531TdSIoKlOpPFWgJxyC/EvZXHjwW0yf1r0eHviGUQCVTKbpqs0t
 ffkb8xx9R8YwnEsKQVHIrKMetLXjbBvMiYyb/Ix0Y7AKLG6iYtAv+pE4u2DapD7SsatMkPvhoLG
 00tkop/0V5J7biTw=
X-Received: by 2002:a05:6000:170a:b0:205:8a7f:c0c6 with SMTP id
 n10-20020a056000170a00b002058a7fc0c6mr4309360wrc.702.1648734661843; 
 Thu, 31 Mar 2022 06:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYGljdCEd0XRmUjtz8by67fPuxvuoSDVwaENEpymNIh/EFZwa7+UQJkGMpsdlGVXOnLGLccA==
X-Received: by 2002:a05:6000:170a:b0:205:8a7f:c0c6 with SMTP id
 n10-20020a056000170a00b002058a7fc0c6mr4309344wrc.702.1648734661567; 
 Thu, 31 Mar 2022 06:51:01 -0700 (PDT)
Received: from [192.168.149.116]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d6652000000b001e669ebd528sm19692552wrw.91.2022.03.31.06.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 06:51:01 -0700 (PDT)
Message-ID: <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
Date: Thu, 31 Mar 2022 15:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 31/03/2022 um 11:59 schrieb Paolo Bonzini:
> On 3/30/22 18:02, Paolo Bonzini wrote:
>> On 3/30/22 12:53, Hanna Reitz wrote:
>>>>
>>>> Seems a good compromise between drains and rwlock. What do you think?
>>>
>>> Well, sounds complicated.  So I’m asking myself whether this would be
>>> noticeably better than just an RwLock for graph modifications, like
>>> the global lock Vladimir has proposed.
> 
> [try again, this time with brain connected]
> 
> A global lock would have to be taken by all iothreads on every I/O
> operation, even a CoRwLock would not scale because it has a global
> CoMutex inside and rdlock/unlock both take it.  Even if the critical
> section is small, the cacheline bumping would be pretty bad.
> 
> Perhaps we could reuse the code in cpus-common.c, which relies on a list
> of possible readers and is quite cheap (two memory barriers basically)
> for readers.  Here we would have a list of AioContexts (or perhaps
> BlockDriverStates?) as the possible readers.
> 
> The slow path uses a QemuMutex, a QemuCond for the readers and a
> QemuCond for the writers.  The reader QemuCond can be replaced by a
> CoQueue, I think.
> 

It would be something like this:
Essentially move graph_bdrv_states as public, so that we can iterate
through all bs as cpu-common.c does with cpus, and then duplicate the
already existing API in cpu-common.c:

bdrv_graph_list_wrlock <-> start_exclusive
bdrv_graph_list_wrunlock <-> end_exclusive
bdrv_graph_list_rdlock <-> cpu_exec_start
bdrv_graph_list_rdunlock <-> cpu_exec_end

The only difference is that there is no qemu_cpu_kick(), but I don't
think it matters.

What do you think?

diff --git a/block.c b/block.c
index 718e4cae8b..af8dd37101 100644
--- a/block.c
+++ b/block.c
@@ -52,6 +52,7 @@
 #include "qemu/range.h"
 #include "qemu/rcu.h"
 #include "block/coroutines.h"
+#include "block/block-list.h"

 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
@@ -67,10 +68,6 @@

 #define NOT_DONE 0x7fffffff /* used while emulated sync operation in
progress */

-/* Protected by BQL */
-static QTAILQ_HEAD(, BlockDriverState) graph_bdrv_states =
-    QTAILQ_HEAD_INITIALIZER(graph_bdrv_states);
-
 /* Protected by BQL */
 static QTAILQ_HEAD(, BlockDriverState) all_bdrv_states =
     QTAILQ_HEAD_INITIALIZER(all_bdrv_states);
diff --git a/include/block/block-list.h b/include/block/block-list.h
new file mode 100644
index 0000000000..d55a056938
--- /dev/null
+++ b/include/block/block-list.h
@@ -0,0 +1,54 @@
+#ifndef BLOCK_LIST_H
+#define BLOCK_LIST_H
+
+#include "qemu/osdep.h"
+
+
+/* Protected by BQL */
+QTAILQ_HEAD(,BlockDriverState) graph_bdrv_states =
QTAILQ_HEAD_INITIALIZER(graph_bdrv_states);
+
+void bdrv_init_graph_list_lock(void);
+
+/*
+ * bdrv_graph_list_wrlock:
+ * Modify the graph. Nobody else is allowed to access the graph.
+ * Set pending op >= 1, so that the next readers will wait in a
coroutine queue.
+ * Then keep track of the running readers using bs->has_writer,
+ * and wait until they finish.
+ */
+void bdrv_graph_list_wrlock(void);
+
+/*
+ * bdrv_graph_list_wrunlock:
+ * Write finished, reset pending operations to 0 and restart
+ * all readers that are waiting.
+ */
+void bdrv_graph_list_wrunlock(void);
+
+/*
+ * bdrv_graph_list_rdlock:
+ * Read the bs graph. Set bs->reading_graph true, and if there are pending
+ * operations, it means that the main loop is modifying the graph,
+ * therefore wait in exclusive_resume coroutine queue.
+ * If this read is coming while the writer has already marked the
+ * running read requests and it's waiting for them to finish,
+ * wait that the write finishes first.
+ * Main loop will then wake this coroutine once it is done.
+ */
+void bdrv_graph_list_rdlock(BlockDriverState *bs);
+
+/*
+ * bdrv_graph_list_rdunlock:
+ * Read terminated, decrease the count of pending operations.
+ * If it's the last read that the writer is waiting for, signal
+ * the writer that we are done and let it continue.
+ */
+void bdrv_graph_list_rdunlock(BlockDriverState *bs);
+
+
+
+
+#define BS_GRAPH_READER(bs) /* in main loop OR bs->reading_graph */
+#define BS_GRAPH_WRITER(bs) /* in main loop AND bs->bs_graph_pending_op
> 0 */
+#endif /* BLOCK_LIST_H */
+
diff --git a/include/block/block_int-common.h
b/include/block/block_int-common.h
index 5a04c778e4..0266876a59 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -985,6 +985,20 @@ struct BlockDriverState {
     bool force_share; /* if true, always allow all shared permissions */
     bool implicit;  /* if true, this filter node was automatically
inserted */

+    /*
+     * If true, the bs is reading the graph.
+     * No write should happen in the meanwhile.
+     * Atomic.
+     */
+    bool reading_graph;
+
+    /*
+     * If true, the main loop is modifying the graph.
+     * bs cannot read the graph.
+     * Protected by bs_graph_list_lock.
+     */
+    bool has_writer;
+
     BlockDriver *drv; /* NULL means no media */
     void *opaque;


