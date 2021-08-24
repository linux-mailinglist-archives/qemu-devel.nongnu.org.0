Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6703B3F5EC9
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:15:15 +0200 (CEST)
Received: from localhost ([::1]:54258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWGn-0006bo-GD
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mIWF1-0005P6-Hf
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:13:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1mIWEz-0006yX-4I
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629810799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S/sKbjiYvDUrqehLkwCDnHgdDPOoWGbm82SzDx5AAAQ=;
 b=HMiPN61/x42GL1DrWmYpLdxv/CYjvaVIr8QF+OXJLvx878uuxaL7kUjaqFIehcXe9Bo4gr
 PhJHe/iVIcVj20zYuAbtVZ/PbfW4sUWtZKDWO/zrktjVyqe5DTGQaQTK6AeIy0aa+/oaYz
 1F8OHWkUmfwdiu+FSADYm6BechdSg6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-vwEzWmPBNyC91gy5jr5zFQ-1; Tue, 24 Aug 2021 09:12:12 -0400
X-MC-Unique: vwEzWmPBNyC91gy5jr5zFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98904871803
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 13:12:11 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.33.36.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8928C620DE;
 Tue, 24 Aug 2021 13:11:59 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] virtiofsd: Reverse req_list before processing it
Date: Tue, 24 Aug 2021 15:11:58 +0200
Message-Id: <20210824131158.39970-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com, Sergio Lopez <slp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the thread pool disabled, we add the requests in the queue to a
GList, processing by iterating over there afterwards.

For adding them, we're using "g_list_prepend()", which is more
efficient but causes the requests to be processed in reverse order,
breaking the read-ahead and request-merging optimizations in the host
for sequential operations.

According to the documentation, if you need to process the request
in-order, using "g_list_prepend()" and then reversing the list with
"g_list_reverse()" is more efficient than using "g_list_append()", so
let's do it that way.

Testing on a spinning disk (to boost the increase of read-ahead and
request-merging) shows a 4x improvement on sequential write fio test:

Test:
fio --directory=/mnt/virtio-fs --filename=fio-file1 --runtime=20
--iodepth=16 --size=4G --direct=1 --blocksize=4K --ioengine libaio
--rw write --name seqwrite-libaio

Without "g_list_reverse()":
...
Jobs: 1 (f=1): [W(1)][100.0%][w=22.4MiB/s][w=5735 IOPS][eta 00m:00s]
seqwrite-libaio: (groupid=0, jobs=1): err= 0: pid=710: Tue Aug 24 12:58:16 2021
  write: IOPS=5709, BW=22.3MiB/s (23.4MB/s)(446MiB/20002msec); 0 zone resets
...

With "g_list_reverse()":
...
Jobs: 1 (f=1): [W(1)][100.0%][w=84.0MiB/s][w=21.5k IOPS][eta 00m:00s]
seqwrite-libaio: (groupid=0, jobs=1): err= 0: pid=716: Tue Aug 24 13:00:15 2021
  write: IOPS=21.3k, BW=83.1MiB/s (87.2MB/s)(1663MiB/20001msec); 0 zone resets
...

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index fc2564a603..8f4fd165b9 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -716,6 +716,7 @@ static void *fv_queue_thread(void *opaque)
 
         /* Process all the requests. */
         if (!se->thread_pool_size && req_list != NULL) {
+            req_list = g_list_reverse(req_list);
             g_list_foreach(req_list, fv_queue_worker, qi);
             g_list_free(req_list);
             req_list = NULL;
-- 
2.26.2


