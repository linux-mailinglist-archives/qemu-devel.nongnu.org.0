Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC431D0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:19:01 +0100 (CET)
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5sC-00081o-Hv
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:19:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kK-0002nf-20
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kH-0004Q3-3L
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MH8R2iLFmSey485r/jtFELxBHqIKye+LJZy/uTIPL0=;
 b=iCWtkGR0UTtfje1iKsQLdoWqh9lIbJlNMrWu4whE4a5Q47ztoc2aiTSHjAIxA+C1u1/So4
 XkVv9rdWQh2L099JVC+ACobzaf2kvUrzrGaUWpDRH+RwMSe3Fn0AYlz9NG0xCDD2gaYVAC
 mvLAPrwhaMudOGueKbgwg7ky65KmQps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-mdmNCQhIN_Sg7_ZfwuNjew-1; Tue, 16 Feb 2021 14:10:45 -0500
X-MC-Unique: mdmNCQhIN_Sg7_ZfwuNjew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 385BC10082F5;
 Tue, 16 Feb 2021 19:10:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13E015C1B4;
 Tue, 16 Feb 2021 19:10:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] qemu-options: update to show preferred boolean syntax
 for -incoming
Date: Tue, 16 Feb 2021 19:10:22 +0000
Message-Id: <20210216191027.595031-6-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index fb2050cda9..da0ddf8a3a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4135,8 +4135,8 @@ SRST
 ERST
 
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
-    "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
-    "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
+    "-incoming tcp:[host]:port[,to=maxport][,ipv4=on|off][,ipv6=on|off]\n" \
+    "-incoming rdma:host:port[,ipv4=on|off][,ipv6=on|off]\n" \
     "-incoming unix:socketpath\n" \
     "                prepare for incoming migration, listen on\n" \
     "                specified protocol and socket address\n" \
@@ -4148,9 +4148,9 @@ DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
     "                wait for the URI to be specified via migrate_incoming\n",
     QEMU_ARCH_ALL)
 SRST
-``-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]``
+``-incoming tcp:[host]:port[,to=maxport][,ipv4=on|off][,ipv6=on|off]``
   \ 
-``-incoming rdma:host:port[,ipv4][,ipv6]``
+``-incoming rdma:host:port[,ipv4=on|off][,ipv6=on|off]``
     Prepare for incoming migration, listen on a given tcp port.
 
 ``-incoming unix:socketpath``
-- 
2.29.2


