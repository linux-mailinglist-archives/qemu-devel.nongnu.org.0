Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A441744D722
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:21:56 +0100 (CET)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlA1b-0003X3-Or
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pd-00072Q-L9
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ml9pb-00053L-JU
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636636171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qlARd0wWwIKpAauUODlukfQTPIPqbnOk1LJI916gnE=;
 b=Xc+yfOUczwUT+BcKLDADDEpAt0PGY2qQMjnYTvIAkmqj2iuoJCryHPVmMaLeE5Cdv7bJXG
 1VDnrv9GFAFSsMP3ZO//VVdPEzUcugS4RPzOO9lCKUh2oEtCWeYslX6KrNvQzRcYA3az2E
 3AT8OTzf04HfePIkGouwo/YSNJ6z3QQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-8jISEyVrN2uV5f193qLTPw-1; Thu, 11 Nov 2021 08:09:29 -0500
X-MC-Unique: 8jISEyVrN2uV5f193qLTPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC76192204C;
 Thu, 11 Nov 2021 13:09:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F99F848A6;
 Thu, 11 Nov 2021 13:09:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0E6E018009CF; Thu, 11 Nov 2021 14:09:00 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] pcie: fast unplug when slot power is off
Date: Thu, 11 Nov 2021 14:08:58 +0100
Message-Id: <20211111130859.1171890-6-kraxel@redhat.com>
In-Reply-To: <20211111130859.1171890-1-kraxel@redhat.com>
References: <20211111130859.1171890-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case the slot is powered off (and the power indicator turned off too)
we can unplug right away, without round-trip to the guest.

Also clear pending attention button press, there is nothing to care
about any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/pci/pcie.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 959bf074b205..a930ac738a15 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -560,6 +560,16 @@ void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
         return;
     }
 
+    if (((sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF) &&
+        ((sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_OFF)) {
+        /* slot is powered off -> unplug without round-trip to the guest */
+        pcie_cap_slot_do_unplug(hotplug_pdev);
+        hotplug_event_notify(hotplug_pdev);
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                     PCI_EXP_SLTSTA_ABP);
+        return;
+    }
+
     pcie_cap_slot_push_attention_button(hotplug_pdev);
 }
 
-- 
2.33.1


