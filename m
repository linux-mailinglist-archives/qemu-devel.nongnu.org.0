Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D739734A540
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 11:05:25 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPjLI-0003ux-TO
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 06:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPjK4-0003RC-H2
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lPjK0-0008Bw-NT
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 06:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616753041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lFfR2Pecg/oHg5f0JqUtn8KUxvkW3k/9oI0fNpPTYDU=;
 b=aoup7y4sspPOnjIEbGWU34YUh2eUCzSqKj1LIb+P7o8n1AM/wc+jtPUukAXQKzAEiah7Du
 oSwR1qccNlY1SXIjFEGB7koJPslVgB2XVNIJB08r8XwS5OX3rB5//eEv6lBHgLEeaEwH3y
 kIwNx7OOWurYhl8ep/nubWBXlFQgcFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-hcNhA5TiOrSeoFLGzqTySw-1; Fri, 26 Mar 2021 06:03:59 -0400
X-MC-Unique: hcNhA5TiOrSeoFLGzqTySw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62591966326;
 Fri, 26 Mar 2021 10:03:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84DE118AAB;
 Fri, 26 Mar 2021 10:03:57 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0] qapi: qom: do not use target-specific conditionals
Date: Fri, 26 Mar 2021 06:03:57 -0400
Message-Id: <20210326100357.2715571-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ObjectType and ObjectOptions are defined in a target-independent file,
therefore they do not have access to target-specific configuration
symbols such as CONFIG_PSERIES or CONFIG_SEV.  For this reason,
pef-guest and sev-guest are currently omitted when compiling the
generated QAPI files.  In addition, this causes ObjectType to have
different definitions depending on the file that is including
qapi-types-qom.h (currently this is not causing any issues, but it
is wrong).

Define the two enum entries and the SevGuestProperties type
unconditionally to avoid the issue.  We do not expect to have
many target-dependent user-creatable classes, so it is not
particularly problematic.

Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/qom.json | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 2056edc072..db5ac419b1 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -733,8 +733,7 @@
             '*policy': 'uint32',
             '*handle': 'uint32',
             '*cbitpos': 'uint32',
-            'reduced-phys-bits': 'uint32' },
-  'if': 'defined(CONFIG_SEV)' }
+            'reduced-phys-bits': 'uint32' } }
 
 ##
 # @ObjectType:
@@ -768,14 +767,14 @@
     { 'name': 'memory-backend-memfd',
       'if': 'defined(CONFIG_LINUX)' },
     'memory-backend-ram',
-    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
+    'pef-guest',
     'pr-manager-helper',
     'rng-builtin',
     'rng-egd',
     'rng-random',
     'secret',
     'secret_keyring',
-    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
+    'sev-guest',
     's390-pv-guest',
     'throttle-group',
     'tls-creds-anon',
@@ -831,8 +830,7 @@
       'rng-random':                 'RngRandomProperties',
       'secret':                     'SecretProperties',
       'secret_keyring':             'SecretKeyringProperties',
-      'sev-guest':                  { 'type': 'SevGuestProperties',
-                                      'if': 'defined(CONFIG_SEV)' },
+      'sev-guest':                  'SevGuestProperties',
       'throttle-group':             'ThrottleGroupProperties',
       'tls-creds-anon':             'TlsCredsAnonProperties',
       'tls-creds-psk':              'TlsCredsPskProperties',
-- 
2.26.2


