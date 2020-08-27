Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F8254B74
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 19:03:36 +0200 (CEST)
Received: from localhost ([::1]:45596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBLJH-0002Sl-TW
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 13:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kBLG6-0005wG-D9
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kBLG4-0005NS-Fl
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 13:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598547613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beY3kFvLNmWOLPxSPAK7cU5mBUfTPlm8BxgoyknGAsI=;
 b=Y88u6kFA1pv02QR9dU7IcXZh34nYsydSz0PxNaiuGyPKG1/gaNSq8P2B36My7ACXgJzeBV
 wWSpJqLWFkJaOQ4mzrVN/oDtIYs1/cqBSGvVRzv/mnTn2bZw5/L5FOSQS+kuLNAYIV8XSz
 Bf6bNhW5op3gUpVA2pyj8ADDeBg88io=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-uuPyhgwjPzyvZVvBAmZjAA-1; Thu, 27 Aug 2020 13:00:07 -0400
X-MC-Unique: uuPyhgwjPzyvZVvBAmZjAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAD5B873115;
 Thu, 27 Aug 2020 17:00:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D66D50B3F;
 Thu, 27 Aug 2020 17:00:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/17] meson: Don't make object files for dtrace on macOS
Date: Thu, 27 Aug 2020 12:59:42 -0400
Message-Id: <20200827165956.12925-4-pbonzini@redhat.com>
In-Reply-To: <20200827165956.12925-1-pbonzini@redhat.com>
References: <20200827165956.12925-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:54:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

dtrace on macOS uses unresolved symbols with a special prefix to define
probes [1], only headers should be generated for USDT (dtrace(1)). But
it doesn't support backwards compatible no-op -G flag [2] and implicit
build rules fail.

1. https://markmail.org/message/6grq2ygr5nwdwsnb
2. https://markmail.org/message/5xrxt2w5m42nojkz

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 trace/meson.build | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/trace/meson.build b/trace/meson.build
index 56e870848e..1c1fb31a61 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -39,12 +39,15 @@ foreach dir : [ '.' ] + trace_events_subdirs
                                    output: fmt.format('trace-dtrace', 'h'),
                                    input: trace_dtrace,
                                    command: [ 'dtrace', '-o', '@OUTPUT@', '-h', '-s', '@INPUT@' ])
-    trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
-                                   output: fmt.format('trace-dtrace', 'o'),
-                                   input: trace_dtrace,
-                                   command: [ 'dtrace', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
+    trace_ss.add(trace_dtrace_h)
+    if host_machine.system() != 'darwin'
+      trace_dtrace_o = custom_target(fmt.format('trace-dtrace', 'o'),
+                                     output: fmt.format('trace-dtrace', 'o'),
+                                     input: trace_dtrace,
+                                     command: [ 'dtrace', '-o', '@OUTPUT@', '-G', '-s', '@INPUT@' ])
+      trace_ss.add(trace_dtrace_o)
+    endif
 
-    trace_ss.add(trace_dtrace_h, trace_dtrace_o)
     genh += trace_dtrace_h
   endif
 endforeach
-- 
2.26.2



