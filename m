Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A07025757B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 10:34:38 +0200 (CEST)
Received: from localhost ([::1]:33678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCfGv-0001LD-3t
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 04:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCfFX-00085D-Hi
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:33:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kCfFV-0006ZQ-L1
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 04:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598862788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/J0K4csVztYP7o+7FyVdDGJsxMvUqrrvTDjsw7WPVs=;
 b=a8chflFx0/vbZ3Aycj8xX7B52ya36db+QCsOusjXD7KfpP4mQzreE4md6BVYxIDQ1n9fVo
 gf20ygDkJKq8rD58JeBuhE3X53oSfslNVjZNQuC700FCi3fVtW/WlOqNioTNu6F8kIOUWK
 tdqSTjZXVvV8IvNqxaP5rjmiDGB5KcM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-CsdYJ_B6MGyikCWTAhkR0g-1; Mon, 31 Aug 2020 04:33:06 -0400
X-MC-Unique: CsdYJ_B6MGyikCWTAhkR0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D73BC10ABDAD
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 08:33:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9DE92616B;
 Mon, 31 Aug 2020 08:33:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C23645B2; Mon, 31 Aug 2020 10:33:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] ehci: drop pointless warn_report for guest bugs.
Date: Mon, 31 Aug 2020 10:32:47 +0200
Message-Id: <20200831083301.6357-5-kraxel@redhat.com>
In-Reply-To: <20200831083301.6357-1-kraxel@redhat.com>
References: <20200831083301.6357-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 03:02:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a tracepoint at the same place which can be enabled if needed.

Buglink: https://bugzilla.redhat.com//show_bug.cgi?id=1859236
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200722072613.10390-1-kraxel@redhat.com>
---
 hw/usb/hcd-ehci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 4da446d2de6b..2b995443fbfd 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -352,7 +352,6 @@ static void ehci_trace_sitd(EHCIState *s, hwaddr addr,
 static void ehci_trace_guest_bug(EHCIState *s, const char *message)
 {
     trace_usb_ehci_guest_bug(message);
-    warn_report("%s", message);
 }
 
 static inline bool ehci_enabled(EHCIState *s)
-- 
2.27.0


