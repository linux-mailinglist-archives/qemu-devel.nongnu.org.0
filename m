Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A604276D8E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:35:12 +0200 (CEST)
Received: from localhost ([::1]:40894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNeh-0007gg-3w
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTb-0000jO-4D
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTY-000612-AI
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ngR/YrV5cwyzxc101lPrKi/sIaxZytM2vfoGntLFwMA=;
 b=OkL9SheLxg05js4Briobqwq5THAQLz2uSJS2WMVJ/7WQrlutZ3KmLMmNSbkzet8fcUEMGR
 saXgbxmYGLFL2xWTXMzQ34+pgglM/JyvWJgaNnRdy3/YSXeJlj2bSKM7AJp5N29V6cO4/9
 aLszNNiNahp07+SZR/Ea0atJLtJ9usY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-R4uTjIEFMam4XA0Ysurmyw-1; Thu, 24 Sep 2020 05:23:36 -0400
X-MC-Unique: R4uTjIEFMam4XA0Ysurmyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A72E81891E88;
 Thu, 24 Sep 2020 09:23:35 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5376F73662;
 Thu, 24 Sep 2020 09:23:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/92] hw/char/serial: Make 'wakeup' property boolean
Date: Thu, 24 Sep 2020 05:22:05 -0400
Message-Id: <20200924092314.1722645-24-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Make the "wakeup" property introduced in commit 9826fd597df
("suspend: make serial ports wakeup the guest") a boolean.

As we want to reuse the generic serial properties in the
ISA model (next commit), expose this property.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200907015535.827885-6-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/serial-isa.c     | 2 +-
 hw/char/serial.c         | 1 +
 include/hw/char/serial.h | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/serial-isa.c b/hw/char/serial-isa.c
index 32c2fc0ebe..fc8ff7823a 100644
--- a/hw/char/serial-isa.c
+++ b/hw/char/serial-isa.c
@@ -117,7 +117,7 @@ static Property serial_isa_properties[] = {
     DEFINE_PROP_UINT32("iobase",  ISASerialState, iobase,  -1),
     DEFINE_PROP_UINT32("irq",    ISASerialState, isairq,  -1),
     DEFINE_PROP_CHR("chardev",   ISASerialState, state.chr),
-    DEFINE_PROP_UINT32("wakeup", ISASerialState, state.wakeup, 0),
+    DEFINE_PROP_BOOL("wakeup",   ISASerialState, state.wakeup, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 7b5ef872bd..4386adabd4 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -975,6 +975,7 @@ const MemoryRegionOps serial_io_ops = {
 static Property serial_properties[] = {
     DEFINE_PROP_CHR("chardev", SerialState, chr),
     DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
+    DEFINE_PROP_BOOL("wakeup", SerialState, wakeup, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 23bd7d3dde..8ba7eca3d6 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -61,7 +61,7 @@ struct SerialState {
     uint32_t baudbase;
     uint32_t tsr_retry;
     guint watch_tag;
-    uint32_t wakeup;
+    bool wakeup;
 
     /* Time when the last byte was successfully sent out of the tsr */
     uint64_t last_xmit_ts;
-- 
2.26.2



