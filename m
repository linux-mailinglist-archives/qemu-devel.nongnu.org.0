Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1580628545D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:16:11 +0200 (CEST)
Received: from localhost ([::1]:55026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvFi-0003b6-1X
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9x-00072L-OD
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9t-0006R3-Ts
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:10:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oPydp3bkYwR6GH+LZESlXGy3MqkTdWCORJFCS9/vfSs=;
 b=Om1Q5cg1P7WEvEYa20BQSqBvo5q6gXMOy3v6PPjGxR8I9J7i6u8RM+HOE2cw9xSZnVUqg+
 Pu2d9xpf62TqNiBVNqaimARDzTaKOOaBAo1EM3Hs6ke1bOWiWHrE/oSzHkm/i43IGoDvsi
 TE3UUPbqnaasPTK4aGdwYjEBW0ZMhic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-3h1kuw24Pv6iXN1KLTJH0g-1; Tue, 06 Oct 2020 18:09:57 -0400
X-MC-Unique: 3h1kuw24Pv6iXN1KLTJH0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD246804018;
 Tue,  6 Oct 2020 22:09:55 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 840761A835;
 Tue,  6 Oct 2020 22:09:55 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 16/21] kernel-doc: Handle function typedefs that return pointers
Date: Tue,  6 Oct 2020 18:09:25 -0400
Message-Id: <20201006220930.908275-17-ehabkost@redhat.com>
In-Reply-To: <20201006220930.908275-1-ehabkost@redhat.com>
References: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One example that was not being parsed correctly by kernel-doc is:

  typedef Object *(ObjectPropertyResolve)(Object *obj,
                                          void *opaque,
                                          const char *part);

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20201003024123.193840-2-ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/kernel-doc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 40ad782e34..57a4a72970 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1318,8 +1318,8 @@ sub dump_typedef($$) {
     $x =~ s@/\*.*?\*/@@gos;	# strip comments.
 
     # Parse function prototypes
-    if ($x =~ /typedef\s+(\w+)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
-	$x =~ /typedef\s+(\w+)\s*(\w\S+)\s*\s*\((.*)\);/) {
+    if ($x =~ /typedef\s+(\w+\s*\**)\s*\(\*\s*(\w\S+)\s*\)\s*\((.*)\);/ ||
+	$x =~ /typedef\s+(\w+\s*\**)\s*(\w\S+)\s*\s*\((.*)\);/) {
 
 	# Function typedefs
 	$return_type = $1;
-- 
2.26.2


