Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F7C28064F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 20:11:34 +0200 (CEST)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO33F-0004H1-V4
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 14:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fZ-0003Wj-4o
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fW-0006pB-N5
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601574421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzRa9z7IwW/DNPxxsmhM08wyOERdOGuR8hCGrdYJgqY=;
 b=PhAbw1aUEvRIKZ/jK3MgqgUX702VzgltuhNaWZqrYXIHZ8/cSKJLhbGlTmfCuCJjgRnjal
 WyB+t6GEO4hYewdm9CbpZZbHZVfN6bidKKVMnrcrpBldsiY+5apwFhD+r0Uk1B5yC+6dKq
 GkvPECtCbn1UCPWmbuzw05PiqbzJJ+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-n72ru4lZPcKTwLdR-pyzuQ-1; Thu, 01 Oct 2020 13:46:59 -0400
X-MC-Unique: n72ru4lZPcKTwLdR-pyzuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3A72ED7;
 Thu,  1 Oct 2020 17:46:58 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 883C25C1CF;
 Thu,  1 Oct 2020 17:46:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/9] ide: don't tamper with the device register
Date: Thu,  1 Oct 2020 13:46:44 -0400
Message-Id: <20201001174649.1911016-5-jsnow@redhat.com>
In-Reply-To: <20201001174649.1911016-1-jsnow@redhat.com>
References: <20201001174649.1911016-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In real ISA operation, register writes go out to an entire bus channel
and all listening devices receive the write. The devices do not toggle
the DEV bit based on their own configuration, nor does the HBA
intermediate or tamper with that value.

The reality of the matter is that DEV0/DEV1 accordingly will react to
command register writes based on whether or not the device was selected.

This does not fix a known bug, but it makes the code slightly simpler
and more obvious.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 84499e2241c..29dc5dc4b45 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1297,8 +1297,8 @@ void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         break;
     case ATA_IOPORT_WR_DEVICE_HEAD:
         /* FIXME: HOB readback uses bit 7 */
-        bus->ifs[0].select = (val & ~0x10) | 0xa0;
-        bus->ifs[1].select = (val | 0x10) | 0xa0;
+        bus->ifs[0].select = val | 0xa0;
+        bus->ifs[1].select = val | 0xa0;
         /* select drive */
         bus->unit = (val >> 4) & 1;
         break;
-- 
2.26.2


