Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7F423BED
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:04:51 +0200 (CEST)
Received: from localhost ([::1]:42010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4jC-0003Cw-IO
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eB-00081v-0v
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4e8-0005vn-De
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LGfde9CiAc4R+tCtcOIems66/aZ0letPuexkCiB9oiA=;
 b=YHY+jbpzEfoxIdhcgJ4GPf0saGkNKQAFd9chE71soXR5Ga5MadpEMkgjaKez9q9A9v4r2b
 DPDJrJNztT8kEPTL44XybQlIpq4GqSg5j/WIRnOs1rbxbe0GXLExx3ML0n/isGyhLA31PO
 9tP/0X7wqGkn9s71Ixq5r01XC8937ws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-6GS1FALpMQCzqUz1sqQszg-1; Wed, 06 Oct 2021 06:59:34 -0400
X-MC-Unique: 6GS1FALpMQCzqUz1sqQszg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F68835DF7;
 Wed,  6 Oct 2021 10:59:33 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F93A60BE5;
 Wed,  6 Oct 2021 10:59:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/13] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
Date: Wed,  6 Oct 2021 12:59:12 +0200
Message-Id: <20211006105923.223549-3-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

When configuring QEMU with --disable-fuse, the qemu-storage-daemon
still reports FUSE command line options in its help:

  $ qemu-storage-daemon -h
  Usage: qemu-storage-daemon [options]
  QEMU storage daemon

    --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
             [,growable=on|off][,writable=on|off]
                           export the specified block node over FUSE

Remove this help message when FUSE is disabled, to avoid:

  $ qemu-storage-daemon --export fuse
  qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'

Reported-by: Qing Wang <qinwang@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210816180442.2000642-1-philmd@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index fc8b150629..10a1a33761 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -98,10 +98,12 @@ static void help(void)
 "                         export the specified block node over NBD\n"
 "                         (requires --nbd-server)\n"
 "\n"
+#ifdef CONFIG_FUSE
 "  --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>\n"
 "           [,growable=on|off][,writable=on|off]\n"
 "                         export the specified block node over FUSE\n"
 "\n"
+#endif /* CONFIG_FUSE */
 "  --monitor [chardev=]name[,mode=control][,pretty[=on|off]]\n"
 "                         configure a QMP monitor\n"
 "\n"
-- 
2.31.1


