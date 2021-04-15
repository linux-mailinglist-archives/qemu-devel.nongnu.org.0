Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F2360B45
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:02:19 +0200 (CEST)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX2ZW-00077N-Pc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2Wd-0005bl-Ew
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX2Wb-000293-HG
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618495156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0MmcAntTd5SbwkFZUh0401Z4Ui3UqiqHIykQtY6N3o=;
 b=PEoMkOGKCx/ynlywyiDzIC1a2XmFg3QuShaiM5dqimWFM58BGdjXN6keDv63XNcLM1R2fn
 DRWvZcuhWCsgUbwW4IKDxuF3ZNDYoL015CKzFid5eoeLBu7Z/iUstjqosNvNJ7Hvvo87HB
 L+gJ1DU29ovWFonxHZ7lkbvpkD7o8mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-lrIRfBsiPMqxn_KVfXSS0w-1; Thu, 15 Apr 2021 09:59:13 -0400
X-MC-Unique: lrIRfBsiPMqxn_KVfXSS0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B226D8189EC;
 Thu, 15 Apr 2021 13:59:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-159.ams2.redhat.com
 [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7843D60CC5;
 Thu, 15 Apr 2021 13:59:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] block: add trace point when fdatasync fails
Date: Thu, 15 Apr 2021 14:58:50 +0100
Message-Id: <20210415135851.862406-5-berrange@redhat.com>
In-Reply-To: <20210415135851.862406-1-berrange@redhat.com>
References: <20210415135851.862406-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A flush failure is a critical failure scenario for some operations.
For example, it will prevent migration from completing, as it will
make vm_stop() report an error. Thus it is important to have a
trace point present for debugging.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/file-posix.c | 2 ++
 block/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index 99cf452f84..6aafeda44f 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1362,6 +1362,8 @@ static int handle_aiocb_flush(void *opaque)
 
     ret = qemu_fdatasync(aiocb->aio_fildes);
     if (ret == -1) {
+        trace_file_flush_fdatasync_failed(errno);
+
         /* There is no clear definition of the semantics of a failing fsync(),
          * so we may have to assume the worst. The sad truth is that this
          * assumption is correct for Linux. Some pages are now probably marked
diff --git a/block/trace-events b/block/trace-events
index 1a12d634e2..c8a943e992 100644
--- a/block/trace-events
+++ b/block/trace-events
@@ -206,6 +206,7 @@ file_copy_file_range(void *bs, int src, int64_t src_off, int dst, int64_t dst_of
 file_FindEjectableOpticalMedia(const char *media) "Matching using %s"
 file_setup_cdrom(const char *partition) "Using %s as optical disc"
 file_hdev_is_sg(int type, int version) "SG device found: type=%d, version=%d"
+file_flush_fdatasync_failed(int err) "errno %d"
 
 # sheepdog.c
 sheepdog_reconnect_to_sdog(void) "Wait for connection to be established"
-- 
2.30.2


