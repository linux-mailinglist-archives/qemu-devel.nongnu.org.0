Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1542EB371
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 20:23:37 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwrvc-0005M7-Oc
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 14:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrqu-0002Ic-2G
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:18:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1kwrqr-0005qE-GM
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 14:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609874320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85nym8nvLqtajebZ1SMAFQWD8NiiFmY0bkfw44mVuJQ=;
 b=fpMOdmQZyKykXe7ymiMOR/og8IQVWu5b3e75NRDAbAHhGKyeiRzdzU4S9mMDACKTcYk4tB
 5Mm3JT4QODY1sfNBUup/NGz5Tpqwf/cccDuXQGFMFDNTpv+awJIIY6Cw0iI3vBIVBT7T+Q
 spN4XowQnGYDvRHVRVIIKbfMQ7CGHNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-yJIwyRIvNSaCHA2G1fhgCg-1; Tue, 05 Jan 2021 14:17:33 -0500
X-MC-Unique: yJIwyRIvNSaCHA2G1fhgCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 996B71936B60
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 19:17:32 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-101.ams2.redhat.com
 [10.36.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76F9561F5E;
 Tue,  5 Jan 2021 19:17:31 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tracetool: fix "PRI" macro decoding
Date: Tue,  5 Jan 2021 20:17:21 +0100
Message-Id: <20210105191721.120463-3-lvivier@redhat.com>
In-Reply-To: <20210105191721.120463-1-lvivier@redhat.com>
References: <20210105191721.120463-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macro is not reset after use, so the format decoded is always the
one of the first "PRI" in the format string.

For instance:

  vhost_vdpa_set_config(void *dev, uint32_t offset, uint32_t size, \
                        uint32_t flags) "dev: %p offset: %"PRIu32" \
                        size: %"PRIu32" flags: 0x%"PRIx32

generates:

  printf("%d@%d vhost_vdpa_set_config dev: %p offset: %u size: %u \
          flags: 0x%u\n", pid(), gettimeofday_ns(), dev, offset, \
          size, flags)

for the "flags" parameter, we can see a "0x%u" rather than a "0x%x"
because the first macro was "PRIu32" (for offset).

In the loop, macro becomes "PRIu32PRIu32PRIx32", and c_macro_to_format()
returns always macro[3] ('u' in this case). This patch resets macro after
the format has been decoded.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 scripts/tracetool/format/log_stap.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/tracetool/format/log_stap.py b/scripts/tracetool/format/log_stap.py
index b486beb67239..3e1186ae9cc2 100644
--- a/scripts/tracetool/format/log_stap.py
+++ b/scripts/tracetool/format/log_stap.py
@@ -54,6 +54,7 @@ def c_fmt_to_stap(fmt):
             else:
                 if state == STATE_MACRO:
                     bits.append(c_macro_to_format(macro))
+                    macro = ""
                 state = STATE_LITERAL
         elif fmt[i] == ' ' or fmt[i] == '\t':
             if state == STATE_MACRO:
-- 
2.29.2


