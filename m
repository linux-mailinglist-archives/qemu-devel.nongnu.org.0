Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA09628D3B
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouidu-0001tg-5X; Mon, 14 Nov 2022 18:13:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidn-0001eb-1Z
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiJP-000379-B0
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:52:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VoOH8h5zJxs1trCxHkur4lW8NowOm3VRrSmQjkq7wik=;
 b=KcyxL5mDLAo7E9ia4ur07zr+uT/r57TjSQzhlrVpdq7i0Y2D4IWG+7Kq4056Po2zW4EsCe
 q0S5YEpwZF6AKeiPD+dnHEiTCtdnbXVnPCHDyUGUGfx9uWZpUiyhsI6HFHZPJsW2VRj2sw
 oLIxmMQhpqHM4CDNQiPQiQXX7UI+eRM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-gafmUrvGONm7ECI5Pdy_jw-1; Mon, 14 Nov 2022 17:52:12 -0500
X-MC-Unique: gafmUrvGONm7ECI5Pdy_jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9726B185A7A3;
 Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F6740E9786;
 Mon, 14 Nov 2022 22:52:11 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: libguestfs@redhat.com
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	nbd@other.debian.org
Subject: [libnbd PATCH v2 17/23] ocaml: Add example for 64-bit extents
Date: Mon, 14 Nov 2022 16:51:52 -0600
Message-Id: <20221114225158.2186742-18-eblake@redhat.com>
In-Reply-To: <20221114225158.2186742-1-eblake@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
 <20221114225158.2186742-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Since our example program for 32-bit extents is inherently limited to
32-bit lengths, it is also worth demonstrating the 64-bit extent API,
including the difference in the array indexing being saner.
---
 ocaml/examples/Makefile.am  |  3 ++-
 ocaml/examples/extents64.ml | 42 +++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 ocaml/examples/extents64.ml

diff --git a/ocaml/examples/Makefile.am b/ocaml/examples/Makefile.am
index 5ee6dd63..c6f4989d 100644
--- a/ocaml/examples/Makefile.am
+++ b/ocaml/examples/Makefile.am
@@ -1,5 +1,5 @@
 # nbd client library in userspace
-# Copyright (C) 2013-2019 Red Hat Inc.
+# Copyright (C) 2013-2022 Red Hat Inc.
 #
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
@@ -20,6 +20,7 @@ include $(top_srcdir)/subdir-rules.mk
 ml_examples = \
 	asynch_copy.ml \
 	extents.ml \
+	extents64.ml \
 	get_size.ml \
 	open_qcow2.ml \
 	server_flags.ml \
diff --git a/ocaml/examples/extents64.ml b/ocaml/examples/extents64.ml
new file mode 100644
index 00000000..8ee7e218
--- /dev/null
+++ b/ocaml/examples/extents64.ml
@@ -0,0 +1,42 @@
+open Printf
+
+let () =
+  NBD.with_handle (
+    fun nbd ->
+      NBD.add_meta_context nbd "base:allocation";
+      NBD.connect_command nbd
+                          ["nbdkit"; "-s"; "--exit-with-parent"; "-r";
+                           "sparse-random"; "8G"];
+
+      (* Read the extents and print them. *)
+      let size = NBD.get_size nbd in
+      let cap =
+        match NBD.get_extended_headers_negotiated nbd with
+        | true -> size
+        | false -> 0x8000_0000_L in
+      let fetch_offset = ref 0_L in
+      while !fetch_offset < size do
+        let remaining = Int64.sub size !fetch_offset in
+        let fetch_size = min remaining cap in
+        NBD.block_status_64 nbd fetch_size !fetch_offset (
+          fun meta _ entries err ->
+            printf "nbd_block_status callback: meta=%s err=%d\n" meta !err;
+            if meta = "base:allocation" then (
+              printf "index\t%16s %16s %s\n" "offset" "length" "flags";
+              for i = 0 to Array.length entries - 1 do
+                let len = fst entries.(i)
+                and flags =
+                  match snd entries.(i) with
+                  | 0_L -> "data"
+                  | 1_L -> "hole"
+                  | 2_L -> "zero"
+                  | 3_L -> "hole+zero"
+                  | unknown -> sprintf "unknown (%Ld)" unknown in
+                printf "%d:\t%16Ld %16Ld %s\n" i !fetch_offset len flags;
+                fetch_offset := Int64.add !fetch_offset len
+              done;
+            );
+            0
+        ) (* NBD.block_status *)
+      done
+  )
-- 
2.38.1


