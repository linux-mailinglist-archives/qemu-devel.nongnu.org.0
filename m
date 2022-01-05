Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8C6484C57
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:13:08 +0100 (CET)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4vnX-00053V-2T
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:13:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n4vjP-0003ly-Oh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:08:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:13249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1n4vjD-0001Zz-JN
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641348519; x=1672884519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xG0RktRcRe9uuKrM5Jz5gzaQ6PaDbE7D25Nce3dYbDo=;
 b=n+utBZz7ExJRF9yFVcfpNuHyBsF6Wl5FE4dfnheAcjWlc3DaxpL7oCZF
 9kUnGgKndSTzlzYTPp6rhuYGSvBkBBkM5XdIVhqIn0WHr3KmczVxvpI4f
 2UoB1OjO8DDtfjsFNRAFja4ccAy+J+kgIDaEe1e3USxxB8NvvQW2OQP02
 eJAaiaM+x4hIGHs3Ag88XniGXdcWeUMTcgoFrnzH9kvSW6kjQwK3Knjs2
 7aUHAzsru2MctDyLTmOEVLBlGq9zGk6YPTE2jBnSQ4b8MDkTStg2AUzRB
 fuvPBxvHF1jQeMrNihuBW8wip45tDvKWAgq2lkiyl0dDwkjEcNHT7G5R9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242147680"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="242147680"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 18:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="472293568"
Received: from unknown (HELO leirao-pc.bj.intel.com) ([10.238.156.112])
 by orsmga006.jf.intel.com with ESMTP; 04 Jan 2022 18:08:31 -0800
From: Rao Lei <lei.rao@intel.com>
To: kraxel@redhat.com
Subject: [PATCH v2] ui/vnc.c: Fixed a deadlock bug.
Date: Wed,  5 Jan 2022 10:08:08 +0800
Message-Id: <20220105020808.597325-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24; envelope-from=lei.rao@intel.com;
 helo=mga09.intel.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Rao Lei <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GDB statck is as follows:
(gdb) bt
0  __lll_lock_wait (futex=futex@entry=0x56211df20360, private=0) at lowlevellock.c:52
1  0x00007f263caf20a3 in __GI___pthread_mutex_lock (mutex=0x56211df20360) at ../nptl/pthread_mutex_lock.c:80
2  0x000056211a757364 in qemu_mutex_lock_impl (mutex=0x56211df20360, file=0x56211a804857 "../ui/vnc-jobs.h", line=60)
    at ../util/qemu-thread-posix.c:80
3  0x000056211a0ef8c7 in vnc_lock_output (vs=0x56211df14200) at ../ui/vnc-jobs.h:60
4  0x000056211a0efcb7 in vnc_clipboard_send (vs=0x56211df14200, count=1, dwords=0x7ffdf1701338) at ../ui/vnc-clipboard.c:138
5  0x000056211a0f0129 in vnc_clipboard_notify (notifier=0x56211df244c8, data=0x56211dd1bbf0) at ../ui/vnc-clipboard.c:209
6  0x000056211a75dde8 in notifier_list_notify (list=0x56211afa17d0 <clipboard_notifiers>, data=0x56211dd1bbf0) at ../util/notify.c:39
7  0x000056211a0bf0e6 in qemu_clipboard_update (info=0x56211dd1bbf0) at ../ui/clipboard.c:50
8  0x000056211a0bf05d in qemu_clipboard_peer_release (peer=0x56211df244c0, selection=QEMU_CLIPBOARD_SELECTION_CLIPBOARD)
    at ../ui/clipboard.c:41
9  0x000056211a0bef9b in qemu_clipboard_peer_unregister (peer=0x56211df244c0) at ../ui/clipboard.c:19
10 0x000056211a0d45f3 in vnc_disconnect_finish (vs=0x56211df14200) at ../ui/vnc.c:1358
11 0x000056211a0d4c9d in vnc_client_read (vs=0x56211df14200) at ../ui/vnc.c:1611
12 0x000056211a0d4df8 in vnc_client_io (ioc=0x56211ce70690, condition=G_IO_IN, opaque=0x56211df14200) at ../ui/vnc.c:1649
13 0x000056211a5b976c in qio_channel_fd_source_dispatch
    (source=0x56211ce50a00, callback=0x56211a0d4d71 <vnc_client_io>, user_data=0x56211df14200) at ../io/channel-watch.c:84
14 0x00007f263ccede8e in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
15 0x000056211a77d4a1 in glib_pollfds_poll () at ../util/main-loop.c:232
16 0x000056211a77d51f in os_host_main_loop_wait (timeout=958545) at ../util/main-loop.c:255
17 0x000056211a77d630 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
18 0x000056211a45bc8e in qemu_main_loop () at ../softmmu/runstate.c:726
19 0x000056211a0b45fa in main (argc=69, argv=0x7ffdf1701778, envp=0x7ffdf17019a8) at ../softmmu/main.c:50

From the call trace, we can see it is a deadlock bug.
vnc_disconnect_finish will acquire the output_mutex.
But, the output_mutex will be acquired again in vnc_clipboard_send.
Repeated locking will cause deadlock. So, I move
qemu_clipboard_peer_unregister() behind vnc_unlock_output();

Fixes: 0bf41cab93e ("ui/vnc: clipboard support")
Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vnc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index 1ed1c7efc6..3ccd33dedc 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1354,12 +1354,12 @@ void vnc_disconnect_finish(VncState *vs)
         /* last client gone */
         vnc_update_server_surface(vs->vd);
     }
+    vnc_unlock_output(vs);
+
     if (vs->cbpeer.notifier.notify) {
         qemu_clipboard_peer_unregister(&vs->cbpeer);
     }
 
-    vnc_unlock_output(vs);
-
     qemu_mutex_destroy(&vs->output_mutex);
     if (vs->bh != NULL) {
         qemu_bh_delete(vs->bh);
-- 
2.32.0


