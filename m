Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69186302984
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:05:58 +0100 (CET)
Received: from localhost ([::1]:42424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46FR-0003JT-E7
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bd-0001Q0-2H
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46BY-0006kv-Uq
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfhOBGn+oEwzTYx5DwqV0KlLI7vT/PBfxDmUKVwxCSE=;
 b=DnIHMxyWg3/h3zJv3epp1XbdfPv16k1SlCdSAhrW/rxjglK6446k++9RmznPxk6vfaXNhE
 ysAuGZi1iOo3jLbq77Pr/n7Kj4FU4+0B4zLlXtR//SZf2KCPUgrOiNhMipbn6AufcF9gkh
 1+frV2dbfqTAbVaqEVP8+ZgX2QhA/oA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-UBocEi2CNGy3K7NhZKAU0A-1; Mon, 25 Jan 2021 13:01:53 -0500
X-MC-Unique: UBocEi2CNGy3K7NhZKAU0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AA6C8144F3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:01:52 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F40F6FEED;
 Mon, 25 Jan 2021 18:01:52 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4D7CF225FD0; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 6/6] virtiofsd: Opt in for slave start/stop/shutdown
 functionality
Date: Mon, 25 Jan 2021 13:01:15 -0500
Message-Id: <20210125180115.22936-7-vgoyal@redhat.com>
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an opt-in feature not enabled by default. Enable it in
protocol features by setting VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 6805d8ba01..9328c8fac6 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -103,6 +103,11 @@ static void fv_set_features(VuDev *dev, uint64_t features)
 {
 }
 
+static uint64_t fv_get_protocol_features(VuDev *dev)
+{
+    return 1ULL << VHOST_USER_PROTOCOL_F_SLAVE_CH_START_STOP;
+}
+
 /*
  * Callback from libvhost-user if there's a new fd we're supposed to listen
  * to, typically a queue kick?
@@ -902,6 +907,7 @@ static const VuDevIface fv_iface = {
     .get_features = fv_get_features,
     .set_features = fv_set_features,
 
+    .get_protocol_features = fv_get_protocol_features,
     /* Don't need process message, we've not got any at vhost-user level */
     .queue_set_started = fv_queue_set_started,
 
-- 
2.25.4


