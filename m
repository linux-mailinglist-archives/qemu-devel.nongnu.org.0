Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82283144AF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 01:13:28 +0100 (CET)
Received: from localhost ([::1]:57326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Gel-0000jh-QA
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 19:13:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9FD7-0005Fa-Ia
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l9FD1-0006Xq-Ks
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 17:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612824040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bjyDJAug7FOltymAvJA2nYg8ddyCED0Fp/OPsH5wrRI=;
 b=WLgPMOpAiaroLpBeTjw17uCSZcdJGgbreZwAhMmo6UvWS1njIEp7TeSnEYtDDKPiwYw1bs
 pXgk0DEA9sjXWSJ8+PwDIDlhU+6v0vzUlat87474w70oFr+HAK21CrTBw9NsSoD/SpBqRt
 xQXrlEUwsofTXSIK9n93lO0xD0SWMHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-hZoo53e3Pda5BkOQBCOQFg-1; Mon, 08 Feb 2021 17:40:39 -0500
X-MC-Unique: hZoo53e3Pda5BkOQBCOQFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3ECA66D4E3;
 Mon,  8 Feb 2021 22:40:38 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-237.rdu2.redhat.com [10.10.115.237])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38AA319C59;
 Mon,  8 Feb 2021 22:40:32 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id CDE3D220BCF; Mon,  8 Feb 2021 17:40:31 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v3 0/2] viritofsd: Add support for FUSE_HANDLE_KILLPRIV_V2
Date: Mon,  8 Feb 2021 17:40:22 -0500
Message-Id: <20210208224024.43555-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: mszeredi@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is V3 of the patches. V2 had been posted here.

https://listman.redhat.com/archives/virtio-fs/2020-November/msg00084.html

These patches add support for FUSE_HANDLE_KILLPRIV_V2. This is basically
a feature file server can opt-in. And with xattr enabled, this improves
write performance many fold. Ran following fio command while virtiofsd is
running with options "-o cache=auto" and "-o xattr".

fio libaio random writes
------------------------
fio --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=/mnt/virtiofs/random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randwrite

Without patches:
 WRITE: bw=84.6MiB/s (88.7MB/s), 84.6MiB/s-84.6MiB/s (88.7MB/s-88.7MB/s), io=4096MiB (4295MB), run=48436-48436msec

With patches:
  WRITE: bw=273MiB/s (286MB/s), 273MiB/s-273MiB/s (286MB/s-286MB/s), io=4096MiB (4295MB), run=15003-15003msec

So with these patches, for this particular workload, there is roughly
more than 200% improvement.

fio psync random writes
-----------------------
Even, single queue depth writes with ioengine=psync, how significant
improvement. Performance jumps from roughly 35MiB/s to 70MiB/s.

fio --ioengine=psync --name=test --filename=/mnt/virtiofs/random_read_write.fio --bs=4k --size=4G --readwrite=randwrite

Without patches:
  WRITE: bw=35.0MiB/s (36.7MB/s), 35.0MiB/s-35.0MiB/s (36.7MB/s-36.7MB/s), io=4096MiB (4295MB), run=116932-116932msec

With patches:
 WRITE: bw=69.9MiB/s (73.3MB/s), 69.9MiB/s-69.9MiB/s (73.3MB/s-73.3MB/s), io=4096MiB (4295MB), run=58596-58596msec

In V3 I rebased these patches to latest upstream. There were few
conflicts due to recent security fixes from Stefan. Resolved these
conflicts.

Thanks
Vivek

Vivek Goyal (2):
  virtiofsd: Save error code early at the failure callsite
  viriofsd: Add support for FUSE_HANDLE_KILLPRIV_V2

 tools/virtiofsd/fuse_common.h    | 15 ++++++
 tools/virtiofsd/fuse_lowlevel.c  | 11 +++-
 tools/virtiofsd/fuse_lowlevel.h  |  1 +
 tools/virtiofsd/passthrough_ll.c | 93 ++++++++++++++++++++++++++++----
 4 files changed, 108 insertions(+), 12 deletions(-)

-- 
2.25.4


