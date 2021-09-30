Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A941DDBD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:39:41 +0200 (CEST)
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVy9s-0000vU-Rx
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1Q-0004cv-Cd
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:30:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1M-0002KV-Ps
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyr3yv4vUAQfnUWEUDYrFC705fmtKP48APeBDAgvsU8=;
 b=aHGjlfWudgNcDGcOnAYgG7RyZD0L+n0fC4uckEvmUqcH4WkXqw0/YeQ4A7CW1mpSwqTifZ
 JEHEVf3IPkZ2rEMDQ6Sizw6FnQLHD0f7lWkq0YtTDPYHdkWWGnkJzGaZXCPSkdZDmYYg8y
 7AiVmf94iqYZUF7O3aPT3bmVHPAyjzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-y6iHBIGENS6-Hde8OFpWnw-1; Thu, 30 Sep 2021 11:30:49 -0400
X-MC-Unique: y6iHBIGENS6-Hde8OFpWnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D6E61966328;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4977F5C1A1;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id C8B32228280; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 01/13] virtio_fs.h: Add notification queue feature bit
Date: Thu, 30 Sep 2021 11:30:25 -0400
Message-Id: <20210930153037.1194279-2-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This change will ultimately come from kernel as kernel header file update
when kernel patches get merged.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 include/standard-headers/linux/virtio_fs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/standard-headers/linux/virtio_fs.h b/include/standard-headers/linux/virtio_fs.h
index a32fe8a64c..b7f015186e 100644
--- a/include/standard-headers/linux/virtio_fs.h
+++ b/include/standard-headers/linux/virtio_fs.h
@@ -8,6 +8,9 @@
 #include "standard-headers/linux/virtio_config.h"
 #include "standard-headers/linux/virtio_types.h"
 
+/* Feature bits. Notification queue supported */
+#define VIRTIO_FS_F_NOTIFICATION	0
+
 struct virtio_fs_config {
 	/* Filesystem name (UTF-8, not NUL-terminated, padded with NULs) */
 	uint8_t tag[36];
-- 
2.31.1


