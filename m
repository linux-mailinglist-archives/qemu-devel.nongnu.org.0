Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667CD2806AA
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 20:33:39 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO3Oc-00016g-EL
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 14:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fh-0003c2-Sm
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kO2fc-0006qu-2P
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 13:47:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601574427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUlI7YRqEBWIcjGaIwTXsdH7kwWOc4UyHnJG6Saz5cY=;
 b=CO8jlCn7DNmeyP0E2fBy7723G/ag9v6HPsxF9XcZhw3LzbKght58pOwoxwLfMowxIEANzZ
 ZWCVPFw+DQU/OjI7QjVJ6WA7OGYEsqAT0JmWJ+f2G6WoRM25czsZBdTuvBEYJwJttI+8PV
 1Xl74eP3Be9UVxUoJXgDF1PBRxR7e8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-6a19ufkbMw-QnXr8AZsglA-1; Thu, 01 Oct 2020 13:47:03 -0400
X-MC-Unique: 6a19ufkbMw-QnXr8AZsglA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4B92803F45;
 Thu,  1 Oct 2020 17:47:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BDB55C1CF;
 Thu,  1 Oct 2020 17:47:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 8/9] ide: clear interrupt on command write
Date: Thu,  1 Oct 2020 13:46:48 -0400
Message-Id: <20201001174649.1911016-9-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not known to fix any bug, but I couldn't help but notice that ATA
specifies that writing to this register should clear an interrupt.

ATA7: Section 5.3.3 (Command register - Effect)
ATA6: Section 7.4.4 (Command register - Effect)
ATA5: Section 7.4.4 (Command register - Effect)
ATA4: Section 7.4.4 (Command register - Effect)
ATA3: Section 5.2.2 (Command register)

Other editions: try searching for the phrase "Writing this register".

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index 8a55352e4b2..0d745d63a18 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1312,6 +1312,7 @@ void ide_ioport_write(void *opaque, uint32_t addr, uint32_t val)
     default:
     case ATA_IOPORT_WR_COMMAND:
         ide_clear_hob(bus);
+        qemu_irq_lower(bus->irq);
         ide_exec_cmd(bus, val);
         break;
     }
-- 
2.26.2


