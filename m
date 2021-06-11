Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF523A3BA6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:07:15 +0200 (CEST)
Received: from localhost ([::1]:41958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraK2-0007JV-FD
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDm-0003hF-6a
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDk-00026x-ES
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBGbFjYtx7nwirn1d8ITI6otXR54mJ8pP84N1PczVaw=;
 b=Dzk5w91YX11wHyisbfPqYMfJhinwd27TV7QgtkdT7BMuk7HVYrqYTyFPORIn8JY3Hm/bPS
 Ks659yccHbaTYIGCIoKLgMADaDz/b0V8qgv4cRTMA8L88VNb84jJcHtcDMj6Y17D/ILuxP
 9uHEr4vZ9CRcG61YW/nafLK6qVaQFLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-4UeyygUxP9ClZUSLWM1FVg-1; Fri, 11 Jun 2021 02:00:42 -0400
X-MC-Unique: 4UeyygUxP9ClZUSLWM1FVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CD751922961;
 Fri, 11 Jun 2021 06:00:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27C3560917;
 Fri, 11 Jun 2021 06:00:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 05/12] netdev: add more commands to preconfig mode
Date: Fri, 11 Jun 2021 14:00:17 +0800
Message-Id: <20210611060024.46763-6-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Creating and destroying network backend does not require a fully
constructed machine.  Allow the related monitor commands to run before
machine initialization has concluded.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hmp-commands.hx | 2 ++
 qapi/net.json   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 84dcc3a..8e45bce 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1269,6 +1269,7 @@ ERST
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
         .command_completion = netdev_add_completion,
+        .flags      = "p",
     },
 
 SRST
@@ -1283,6 +1284,7 @@ ERST
         .help       = "remove host network device",
         .cmd        = hmp_netdev_del,
         .command_completion = netdev_del_completion,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/net.json b/qapi/net.json
index af3f5b0..7fab2e7 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -55,7 +55,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true }
+{ 'command': 'netdev_add', 'data': 'Netdev', 'boxed': true,
+  'allow-preconfig': true }
 
 ##
 # @netdev_del:
@@ -75,7 +76,8 @@
 # <- { "return": {} }
 #
 ##
-{ 'command': 'netdev_del', 'data': {'id': 'str'} }
+{ 'command': 'netdev_del', 'data': {'id': 'str'},
+  'allow-preconfig': true }
 
 ##
 # @NetLegacyNicOptions:
-- 
2.7.4


