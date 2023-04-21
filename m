Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D256EA0DD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKh-0002gd-28; Thu, 20 Apr 2023 21:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKW-0002eP-Dx
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:52 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKT-0008OH-PO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:51 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2471214cdd3so1160690a91.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039566; x=1684631566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGVxufv435zSU4KrQ+6NR01fwhxqaFbsFZNIoUMt/hQ=;
 b=ZTt9r1I8TUMPft6NAIG1pc+s0Gr97XT1LOkw65ssAhjieUl4pRPwV5J3+wPvaON/2n
 f4xd1+YMZTqS5GKYcqevhFWhWrVvu41cheOURmH9MngGZw871BVhwLRAkiLBqr7g2AzF
 UoPr5SfLDoJy3Njf2v92yv1bI+0+vXwfF3d00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039566; x=1684631566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGVxufv435zSU4KrQ+6NR01fwhxqaFbsFZNIoUMt/hQ=;
 b=R7UqCFsT90O6qIJ8NSsSaHAgzaMHWE+oODGT+/j2Qu4YeEF1P6O/JelcHl3aqjRVrT
 Nq/2rpX2R5lDJTwxezQpu6uz0zvirdOlAN1HLdIlnSdUmutTszrF9H/dSdvAxjsn0iTz
 w0USbLeBnm6gf2ERA5gYi35r32aZAs4rEKCWzw4mT6RWSz6pnTi54oP3aSupBL+6F2E9
 otIFFSSeSAd4xMNQiU15fkGkL3Bq/Vgr+fQQWXZoRMMDJmUDRtHG6p5n0RJZZPn9TEUc
 kyA+BMZEnOhg9G5A8RQM/N4sY8G1lyC5IhFO2M/45R9CTx+AGJL7ylujyHSo1S7q//Le
 0lwg==
X-Gm-Message-State: AAQBX9fbIk7Ltgh0SIUzC7lCSdQj8pONvGQmEhJtH90IXm0jXxQogeql
 tFrkxcsNeuvrAvuuuhYmiddvgfb82T+efmDSlGIfl5Os
X-Google-Smtp-Source: AKy350amNwXq56Zmme/caDCN16+34u7VQPrN7JAS0ZGE1wm4gsmaPX6aQqwdTwqM/giQIhkLwqheSA==
X-Received: by 2002:a17:90a:2e17:b0:244:9227:5eca with SMTP id
 q23-20020a17090a2e1700b0024492275ecamr2942746pjd.49.1682039566167; 
 Thu, 20 Apr 2023 18:12:46 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:45 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 12/13] HACK: use memory region API to inject memory to
 guest
Date: Thu, 20 Apr 2023 18:12:22 -0700
Message-Id: <20230421011223.718-13-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I just copied the patches that have been floating around that do
this, but it doesn't seem to robustly work.  This current
implementation is probably good enough to run vkcube or simple
apps, but whenever a test starts to aggressively map/unmap memory,
things do explode on the QEMU side.

A simple way to reproduce is run:

./deqp-vk --deqp-case=deqp-vk --deqp-case=dEQP-VK.memory.mapping.suballocation.*

You should get stack traces that sometimes look like this:

0  __pthread_kill_implementation (no_tid=0, signo=6, threadid=140737316304448) at ./nptl/pthread_kill.c:44
1  __pthread_kill_internal (signo=6, threadid=140737316304448) at ./nptl/pthread_kill.c:78
2  __GI___pthread_kill (threadid=140737316304448, signo=signo@entry=6) at ./nptl/pthread_kill.c:89
3  0x00007ffff7042476 in __GI_raise (sig=sig@entry=6) at ../sysdeps/posix/raise.c:26
4  0x00007ffff70287f3 in __GI_abort () at ./stdlib/abort.c:79
5  0x00007ffff70896f6 in __libc_message (action=action@entry=do_abort, fmt=fmt@entry=0x7ffff71dbb8c "%s\n") at ../sysdeps/posix/libc_fatal.c:155
6  0x00007ffff70a0d7c in malloc_printerr (str=str@entry=0x7ffff71de7b0 "double free or corruption (out)") at ./malloc/malloc.c:5664
7  0x00007ffff70a2ef0 in _int_free (av=0x7ffff7219c80 <main_arena>, p=0x555557793e00, have_lock=<optimized out>) at ./malloc/malloc.c:4588
8  0x00007ffff70a54d3 in __GI___libc_free (mem=<optimized out>) at ./malloc/malloc.c:3391
9  0x0000555555d65e7e in phys_section_destroy (mr=0x555557793e10) at ../softmmu/physmem.c:1003
10 0x0000555555d65ed0 in phys_sections_free (map=0x555556d4b410) at ../softmmu/physmem.c:1011
11 0x0000555555d69578 in address_space_dispatch_free (d=0x555556d4b400) at ../softmmu/physmem.c:2430
12 0x0000555555d58412 in flatview_destroy (view=0x5555572bb090) at ../softmmu/memory.c:292
13 0x000055555600fd23 in call_rcu_thread (opaque=0x0) at ../util/rcu.c:284
14 0x00005555560026d4 in qemu_thread_start (args=0x5555569cafa0) at ../util/qemu-thread-posix.c:541
15 0x00007ffff7094b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
16 0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

or this:

0x0000555555e1dc80 in object_unref (objptr=0x6d656d3c6b6e696c) at ../qom/object.c:1198
1198        g_assert(obj->ref > 0);
(gdb) bt
0  0x0000555555e1dc80 in object_unref (objptr=0x6d656d3c6b6e696c) at ../qom/object.c:1198
1  0x0000555555d5cca5 in memory_region_unref (mr=0x5555572b9e20) at ../softmmu/memory.c:1799
2  0x0000555555d65e47 in phys_section_destroy (mr=0x5555572b9e20) at ../softmmu/physmem.c:998
3  0x0000555555d65ec7 in phys_sections_free (map=0x5555588365c0) at ../softmmu/physmem.c:1011
4  0x0000555555d6956f in address_space_dispatch_free (d=0x5555588365b0) at ../softmmu/physmem.c:2430
5  0x0000555555d58409 in flatview_destroy (view=0x555558836570) at ../softmmu/memory.c:292
6  0x000055555600fd1a in call_rcu_thread (opaque=0x0) at ../util/rcu.c:284
7  0x00005555560026cb in qemu_thread_start (args=0x5555569cafa0) at ../util/qemu-thread-posix.c:541
8  0x00007ffff7094b43 in start_thread (arg=<optimized out>) at ./nptl/pthread_create.c:442
9  0x00007ffff7126a00 in clone3 () at ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

The reason seems to be memory regions are handled on a different
thread than the virtio-gpu thread, and that inevitably leads to
raciness.  The memory region docs[a] generally seems to dissuade this:

"In order to do this, as a general rule do not create or destroy
 memory regions dynamically during a device’s lifetime, and only
 call object_unparent() in the memory region owner’s instance_finalize
 callback. The dynamically allocated data structure that contains
 the memory region then should obviously be freed in the
 instance_finalize callback as well."

Though instance_finalize is called before device destruction, so
storing the memory until then is unlikely to be an option.  The
tests do pass when virtio-gpu doesn't free the memory, but
progressively the guest becomes slower and then OOMs.

Though the api does make an exception:

"There is an exception to the above rule: it is okay to call
object_unparent at any time for an alias or a container region. It is
therefore also okay to create or destroy alias and container regions
dynamically during a device’s lifetime."

I believe we are trying to create a container subregion, but that's
still failing?  Are we doing it right?  Any memory region experts
here can help out?  The other revelant patch in this series
is "virtio-gpu: hostmem".

[a] https://qemu.readthedocs.io/en/latest/devel/memory.html

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-rutabaga.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
index 5fd1154198..196267aac2 100644
--- a/hw/display/virtio-gpu-rutabaga.c
+++ b/hw/display/virtio-gpu-rutabaga.c
@@ -159,6 +159,12 @@ static int32_t rutabaga_handle_unmap(VirtIOGPU *g,
     GET_VIRTIO_GPU_GL(g);
     GET_RUTABAGA(virtio_gpu);
 
+    memory_region_transaction_begin();
+    memory_region_set_enabled(&res->region, false);
+    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
+    object_unparent(OBJECT(&res->region));
+    memory_region_transaction_commit();
+
     res->mapped = NULL;
     return rutabaga_resource_unmap(rutabaga, res->resource_id);
 }
@@ -671,6 +677,14 @@ rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
     result = rutabaga_resource_map(rutabaga, mblob.resource_id, &mapping);
     CHECK_RESULT(result, cmd);
 
+    memory_region_transaction_begin();
+    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL,
+                                      mapping.size, (void *)mapping.ptr);
+    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset,
+                                &res->region);
+    memory_region_set_enabled(&res->region, true);
+    memory_region_transaction_commit();
+
     memset(&resp, 0, sizeof(resp));
     resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
     result = rutabaga_resource_map_info(rutabaga, mblob.resource_id,
-- 
2.40.0.634.g4ca3ef3211-goog


