Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F0735CAD4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 18:09:41 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVz87-00020t-Ui
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 12:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVz63-0001R8-PP
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lVz5r-0002bd-1V
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 12:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618243636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UqWbxRC1VSuFtn1Taf6aQOoDT2aAa3G7zcexv0nXVZ4=;
 b=CsggSsBjpmb2oPOHpi/BIhIAE3gZLXGLCfcdKlpL/zm3x61NRqFVN8+a24ynSdpzhB70FX
 cF3v/1nl+ThCmgqyuwNTG9Y4AHFIDBA5iqih/iWX3bWX76Ey4ey406O5RG2LJArCj9lQwk
 4i+GebSGmVxBA5lYMJpOjYZ2BPFVDTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-210-RLhtda6aPdqMAww6dM_mkA-1; Mon, 12 Apr 2021 12:07:14 -0400
X-MC-Unique: RLhtda6aPdqMAww6dM_mkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD83484B9A0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 16:07:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5741196E3;
 Mon, 12 Apr 2021 16:07:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kwolf@redhat.com
Subject: [PATCH] qapi/qom.json: Do not use CONFIG_VIRTIO_CRYPTO in common code
Date: Mon, 12 Apr 2021 18:07:09 +0200
Message-Id: <20210412160710.639800-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ObjectType enum and ObjectOptions are included from qapi-types-qom.h
into common code. We should not use target-specific config switches like
CONFIG_VIRTIO_CRYPTO here, since this is not defined in common code and
thus the enum will look differently between common and target specific
code. For this case, it's hopefully enough to check for CONFIG_VHOST_CRYPTO
only (which is a host specific config switch, i.e. it's the same on all
targets).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qapi/qom.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index db5ac419b1..cd0e76d564 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -752,7 +752,7 @@
     'cryptodev-backend',
     'cryptodev-backend-builtin',
     { 'name': 'cryptodev-vhost-user',
-      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
     'dbus-vmstate',
     'filter-buffer',
     'filter-dump',
@@ -809,7 +809,7 @@
       'cryptodev-backend':          'CryptodevBackendProperties',
       'cryptodev-backend-builtin':  'CryptodevBackendProperties',
       'cryptodev-vhost-user':       { 'type': 'CryptodevVhostUserProperties',
-                                      'if': 'defined(CONFIG_VIRTIO_CRYPTO) && defined(CONFIG_VHOST_CRYPTO)' },
+                                      'if': 'defined(CONFIG_VHOST_CRYPTO)' },
       'dbus-vmstate':               'DBusVMStateProperties',
       'filter-buffer':              'FilterBufferProperties',
       'filter-dump':                'FilterDumpProperties',
-- 
2.27.0


