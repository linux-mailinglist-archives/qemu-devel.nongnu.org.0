Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01737AAF8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:42:34 +0200 (CEST)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUWn-00024g-Bp
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgUUK-0000Kl-Dn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgUUI-0002hw-RZ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:40:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620747598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TCmfyDa36nTPKLCSaB1b6HP6Lo17Ihw0k1xi/m30iZ4=;
 b=KTex8359YihrkZSiCoqQWvs6lnkHSirJerBpqoBjRyFBK5F7O+HlwtD1wVrHL5Owxakfa9
 e/zSspmd4DibHHTW7ZuopSkBZDAz7eO3eW1CO0qlN1eL8s35Wrpk7s+cu49G437MyIY2zQ
 hoY/n27AfHJ/lQcYeOJVoYrLl89u99s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-jmjgosPeNwm-eD_JiXbP0Q-1; Tue, 11 May 2021 11:39:56 -0400
X-MC-Unique: jmjgosPeNwm-eD_JiXbP0Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF598C8657
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 15:39:56 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C221360C04;
 Tue, 11 May 2021 15:39:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] netdev: add more commands to preconfig mode
Date: Tue, 11 May 2021 11:39:55 -0400
Message-Id: <20210511153955.506577-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Creating and destroying network backend does not require a fully
constructed machine.  Allow the related monitor commands to run before
machine initialization has concluded.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx | 2 ++
 qapi/net.json   | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index 901a50ebd1..1768bc5df0 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1276,6 +1276,7 @@ ERST
         .help       = "add host network device",
         .cmd        = hmp_netdev_add,
         .command_completion = netdev_add_completion,
+        .flags      = "p",
     },
 
 SRST
@@ -1290,6 +1291,7 @@ ERST
         .help       = "remove host network device",
         .cmd        = hmp_netdev_del,
         .command_completion = netdev_del_completion,
+        .flags      = "p",
     },
 
 SRST
diff --git a/qapi/net.json b/qapi/net.json
index af3f5b0fda..7fab2e7cd8 100644
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
2.26.2


