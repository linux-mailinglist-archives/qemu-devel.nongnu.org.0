Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700BC2EB368
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:20:35 +0100 (CET)
Received: from localhost ([::1]:40042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrsf-0002wH-Vh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrpr-0001fO-Jd
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrpp-0005VH-OM
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:17:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609874254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1GdRw+5Rsl7K4+c0eeLeKYk/eLw6gFCeEUvqv8KmdB4=;
 b=a8s3bBf9CddDP6iI3EXwBRXzCigVUiwoUWK/TzbHH/+f0QuPzUPguA0X2X62wQHd/uxFPA
 LqVN2AG+fHo1FHVJ5jQMOOwHF6NTti14XBe04Gd6Yda6lHrjqevfvWc+BJlGBSTPbnWUc3
 Gzdwf4qpl1e6b+BO75vC1QJ62394c5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-X4QaRGkINRiIAnQrSMenJw-1; Tue, 05 Jan 2021 14:17:32 -0500
X-MC-Unique: X4QaRGkINRiIAnQrSMenJw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205C21936B65
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 19:17:31 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-101.ams2.redhat.com
 [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1E1E62677;
 Tue,  5 Jan 2021 19:17:29 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] vhost-vdpa: fix "unsigned long long" error with stap
Date: Tue,  5 Jan 2021 20:17:20 +0100
Message-Id: <20210105191721.120463-2-lvivier@redhat.com>
In-Reply-To: <20210105191721.120463-1-lvivier@redhat.com>
References: <20210105191721.120463-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "%llu" format type is not understood by stap:

$ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .

parse error: invalid or missing conversion specifier
          saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
       source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
                                                                                                                 ^

  1 parse error.
  WARNING: tapset "./qemu-system-x86_64-log.stp" has errors, and will be skipped

commit 35e28cb0f210 ("scripts/tracetool: silence SystemTap dtrace(1)
long long warnings") has already fixed the problem for the dtrace format
by dynamically replacing "unsigned long long" by "uint64_t", but as it
seems the problem can happen with any format and this is the only
occurrence of this type, simply replace it directly by "uint64_t" in the
trace-events file.

Fixes: 778e67de4cd8 ("vhost-vdpa: add trace-events")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/virtio/trace-events | 2 +-
 hw/virtio/vhost-vdpa.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 2060a144a2f4..6074bafeb147 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -42,7 +42,7 @@ vhost_vdpa_dump_config(void *dev, const char *line) "dev: %p %s"
 vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, uint32_t flags) "dev: %p offset: %"PRIu32" size: %"PRIu32" flags: 0x%"PRIx32
 vhost_vdpa_get_config(void *dev, void *config, uint32_t config_len) "dev: %p config: %p config_len: %"PRIu32
 vhost_vdpa_dev_start(void *dev, bool started) "dev: %p started: %d"
-vhost_vdpa_set_log_base(void *dev, uint64_t base, unsigned long long size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %llu refcnt: %d fd: %d log: %p"
+vhost_vdpa_set_log_base(void *dev, uint64_t base, uint64_t size, int refcnt, int fd, void *log) "dev: %p base: 0x%"PRIx64" size: %"PRIu64" refcnt: %d fd: %d log: %p"
 vhost_vdpa_set_vring_addr(void *dev, unsigned int index, unsigned int flags, uint64_t desc_user_addr, uint64_t used_user_addr, uint64_t avail_user_addr, uint64_t log_guest_addr) "dev: %p index: %u flags: 0x%x desc_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" log_guest_addr: 0x%"PRIx64
 vhost_vdpa_set_vring_num(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
 vhost_vdpa_set_vring_base(void *dev, unsigned int index, unsigned int num) "dev: %p index: %u num: %u"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d0976..436aa20d3f09 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -493,8 +493,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
 static int vhost_vdpa_set_log_base(struct vhost_dev *dev, uint64_t base,
                                      struct vhost_log *log)
 {
-    trace_vhost_vdpa_set_log_base(dev, base, log->size, log->refcnt, log->fd,
-                                  log->log);
+    trace_vhost_vdpa_set_log_base(dev, base, (uint64_t)log->size, log->refcnt,
+                                  log->fd, log->log);
     return vhost_vdpa_call(dev, VHOST_SET_LOG_BASE, &base);
 }
 
-- 
2.29.2


