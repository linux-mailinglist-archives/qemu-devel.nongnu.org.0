Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219926FC67
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 14:23:09 +0200 (CEST)
Received: from localhost ([::1]:35770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJFPw-0003nz-5q
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 08:23:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kJFMP-00013M-Mg
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 08:19:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30063
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kJFMM-0001pL-Hh
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 08:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600431564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c6pD2+Pc8POfcBxmxk90BGRRuH6Y8wbJMwjn9MiDPb8=;
 b=YhiWEAngjhWlrrECwILfS+9piQ7B48FO1zO9aldHaIfkSqqCx+60oNDmQ/u3uDvzx/jYAz
 yXWK2g97hcCFIFhA83T/KH0QB0oACV1/xcsd37DIgQqvw/sarpzx/6a/JHeVmfGMS6SBF5
 cBsJE+pwBCqWjO5YtIUA3+s5jlmlbFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-p1u6MCA5O5qG12alOOZjEw-1; Fri, 18 Sep 2020 08:19:23 -0400
X-MC-Unique: p1u6MCA5O5qG12alOOZjEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE94981F004;
 Fri, 18 Sep 2020 12:19:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF85E5D9E2;
 Fri, 18 Sep 2020 12:19:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 060C31750A; Fri, 18 Sep 2020 14:19:12 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] microvm: add irq table
Date: Fri, 18 Sep 2020 14:19:10 +0200
Message-Id: <20200918121911.5194-2-kraxel@redhat.com>
In-Reply-To: <20200918121911.5194-1-kraxel@redhat.com>
References: <20200918121911.5194-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 03:47:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a comment with a table listing the IRQs,
both legacy pc and microvm side-by-side.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/i386/microvm.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index be2d95af4d74..27eadd6c535c 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -27,6 +27,28 @@
 #include "hw/acpi/acpi_dev_interface.h"
 #include "qom/object.h"
 
+/*
+ *  IRQ    |  pc        | microvm (acpi=on)
+ * --------+------------+------------------
+ *   0     |  pit       |
+ *   1     |  kbd       |
+ *   2     |  cascade   |
+ *   3     |  serial 1  |
+ *   4     |  serial 0  | serial
+ *   5     |  -         |
+ *   6     |  floppy    |
+ *   7     |  parallel  |
+ *   8     |  rtc       | rtc (rtc=on)
+ *   9     |  acpi      | acpi (ged)
+ *  10     |  pci lnk   |
+ *  11     |  pci lnk   |
+ *  12     |  ps2       |
+ *  13     |  fpu       |
+ *  14     |  ide 0     |
+ *  15     |  ide 1     |
+ *  16-23  |  pci gsi   | virtio
+ */
+
 /* Platform virtio definitions */
 #define VIRTIO_MMIO_BASE      0xfeb00000
 #define VIRTIO_NUM_TRANSPORTS 8
-- 
2.27.0


