Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E620257583
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 10:36:00 +0200 (CEST)
Received: from localhost ([::1]:39280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCfIF-0003Z8-HF
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 04:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCfFY-00086f-F4
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:33:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32540
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCfFV-0006Zf-Ni
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598862789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xje74MaN8FG/NXyImMEp/+6zvVOF8ojzHUbuRw9nHOI=;
 b=HdcHzVhfKiU5PrXnSpXRU542AWdraPGCHthEGgfxh/otp64VkZN3CPrcHuyFwxhvdXur0y
 FCM27sBzBL1s0II/4CsXVNhl6r0h+SaKPn5a7UmFVN2iN8FGBx2YtgR5ITKMHMQ6m0SPve
 uZt1VzcuAVWgrk6y9M/cs2Sd9WfzmIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-jLEnfXIRPaK33l2cbktc5w-1; Mon, 31 Aug 2020 04:33:06 -0400
X-MC-Unique: jLEnfXIRPaK33l2cbktc5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31B810ABDAC;
 Mon, 31 Aug 2020 08:33:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFD057BE8B;
 Mon, 31 Aug 2020 08:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE881ED9; Mon, 31 Aug 2020 10:33:01 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/18] hw: ehci: destroy sglist in error path
Date: Mon, 31 Aug 2020 10:32:45 +0200
Message-Id: <20200831083301.6357-3-kraxel@redhat.com>
In-Reply-To: <20200831083301.6357-1-kraxel@redhat.com>
References: <20200831083301.6357-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 02:54:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Li Qiang <liq3ea@163.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Qiang <liq3ea@163.com>

This may cause resource leak.

Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20200812161712.29361-1-liq3ea@163.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 1495e8f7fab1..58cceacbf83a 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -1445,6 +1445,7 @@ static int ehci_process_itd(EHCIState *ehci,
             dev = ehci_find_device(ehci, devaddr);
             if (dev == NULL) {
                 ehci_trace_guest_bug(ehci, "no device found");
+                qemu_sglist_destroy(&ehci->isgl);
                 return -1;
             }
             pid = dir ? USB_TOKEN_IN : USB_TOKEN_OUT;
-- 
2.27.0


