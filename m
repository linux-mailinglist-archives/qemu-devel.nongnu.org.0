Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764B3B930A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:18:49 +0200 (CEST)
Received: from localhost ([::1]:52888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxWi-0007eU-Jt
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUI-0004uS-Uo
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUH-0005xW-8X
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvQHA93JiGIpz1G0Cyy5ab5xSbhqVWLuEjlIwl7FZ/w=;
 b=Wpjl6qrr7QHFiWkt3K9YeVMBBZ9Lk8e+zQosGxnhkDi/rL8fppCuo/Sqb2IJmQv16O7iNi
 VkC3F6vwd4Zv+F3tccXM0RxEisnGRymMLhO/IPWAmAEoX+C7NF/92Q+2s/JxaRLyNSbPyy
 GZmXQhFNSEQkYWjFoC6oB18T9FXNZdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-touYdJuAPRSWfDD1sSz5wQ-1; Thu, 01 Jul 2021 10:16:15 -0400
X-MC-Unique: touYdJuAPRSWfDD1sSz5wQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DCB0804141;
 Thu,  1 Jul 2021 14:16:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3FD360843;
 Thu,  1 Jul 2021 14:16:11 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 03/20] migration: fix the memory overwriting risk in
 add_to_iovec
Date: Thu,  1 Jul 2021 15:15:28 +0100
Message-Id: <20210701141545.193571-4-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Feng Lin <linfeng23@huawei.com>

When testing migration, a Segmentation fault qemu core is generated.
0  error_free (err=0x1)
1  0x00007f8b862df647 in qemu_fclose (f=f@entry=0x55e06c247640)
2  0x00007f8b8516d59a in migrate_fd_cleanup (s=s@entry=0x55e06c0e1ef0)
3  0x00007f8b8516d66c in migrate_fd_cleanup_bh (opaque=0x55e06c0e1ef0)
4  0x00007f8b8626a47f in aio_bh_poll (ctx=ctx@entry=0x55e06b5a16d0)
5  0x00007f8b8626e71f in aio_dispatch (ctx=0x55e06b5a16d0)
6  0x00007f8b8626a33d in aio_ctx_dispatch (source=<optimized out>, callback=<optimized out>, user_data=<optimized out>)
7  0x00007f8b866bdba4 in g_main_context_dispatch ()
8  0x00007f8b8626cde9 in glib_pollfds_poll ()
9  0x00007f8b8626ce62 in os_host_main_loop_wait (timeout=<optimized out>)
10 0x00007f8b8626cffd in main_loop_wait (nonblocking=nonblocking@entry=0)
11 0x00007f8b862ef01f in main_loop ()
Using gdb print the struct QEMUFile f = {
  ...,
  iovcnt = 65, last_error = 21984,
  last_error_obj = 0x1, shutdown = true
}
Well iovcnt is overflow, because the max size of MAX_IOV_SIZE is 64.
struct QEMUFile {
    ...;
    struct iovec iov[MAX_IOV_SIZE];
    unsigned int iovcnt;
    int last_error;
    Error *last_error_obj;
    bool shutdown;
};
iovcnt and last_error is overwrited by add_to_iovec().
Right now, add_to_iovec() increase iovcnt before check the limit.
And it seems that add_to_iovec() assumes that iovcnt will set to zero
in qemu_fflush(). But qemu_fflush() will directly return when f->shutdown
is true.

The situation may occur when libvirtd restart during migration, after
f->shutdown is set, before calling qemu_file_set_error() in
qemu_file_shutdown().

So the safiest way is checking the iovcnt before increasing it.

Signed-off-by: Feng Lin <linfeng23@huawei.com>
Message-Id: <20210625062138.1899-1-linfeng23@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Fix typo in 'writeable' which is actually misnamed 'writable'
---
 migration/qemu-file.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d6e03dbc0e..1eacf9e831 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -416,6 +416,11 @@ static int add_to_iovec(QEMUFile *f, const uint8_t *buf, size_t size,
     {
         f->iov[f->iovcnt - 1].iov_len += size;
     } else {
+        if (f->iovcnt >= MAX_IOV_SIZE) {
+            /* Should only happen if a previous fflush failed */
+            assert(f->shutdown || !qemu_file_is_writable(f));
+            return 1;
+        }
         if (may_free) {
             set_bit(f->iovcnt, f->may_free);
         }
-- 
2.31.1


