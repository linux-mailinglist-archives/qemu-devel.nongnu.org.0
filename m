Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A403483E8C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:57:46 +0100 (CET)
Received: from localhost ([::1]:37810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fdZ-0002EB-Ev
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fag-0007i7-Os; Tue, 04 Jan 2022 03:54:46 -0500
Received: from [2a00:1450:4864:20::42d] (port=37709
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4faf-0007oW-8i; Tue, 04 Jan 2022 03:54:46 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t26so74656169wrb.4;
 Tue, 04 Jan 2022 00:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7poeiDAlvUUvxRbvytrefmDPizDrA/o3E05wUsT87M4=;
 b=UUGEaBcPNOZd+Dbmoy6MFSgbtwK6P7e/c9wozixeIFNndcIjstYEMhf3/8UfcCC7/+
 79J5rLVk8gE2CZGFXzisQ5l76K7eL5t6pF5Y6lD9gTq1CwrHLp5V4JVD0euJKTDVNuox
 RZmt0D9m/ofWCScjAIqO/+6F7QpTaUMQcmT+Q5cZpVSXYT7FwWApN07KxU3ZqQwDtA1r
 IyLY1JtWnj3ihha3TENpDfl121v0RaMAQ6mltEDYf8zgDraSAyN+LgJgtx9EqTa2lh1J
 3JHPswE3n6LQ+f9T0vpb52IbjW9jtdKNaDZAnMOIklMLZVIHrE6IYVq81hJuzEr4K/6O
 2ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7poeiDAlvUUvxRbvytrefmDPizDrA/o3E05wUsT87M4=;
 b=ysao4X8JiUQsK2Fq8kRN8lpAyd9kDlck0d7SuWkBmN8JfftjUWZ99HEsYhS+ZjUKmv
 Td67CEqlz8A0ZRwm8BZ3yIYTU3SrRPafR8OVXBjhOKpm0hl0eczsqniXNAgO2k7ZkVIe
 sMFI7EkyqNaoDSxy6xPGRZpaUCliALy4NDfPZF02MCoP45sGtLXuYM1kZOBJxvj7LeL4
 sDDnew8oc8xUXYL+4/ANGyC5JN5YrD/bYz5m1J8zbNwRUH+RBBJhHeNDox7ib8GIlOTc
 INVh+wsxG/bv1wVjHyOacht3anusgZPLBp7tRv/ZI9nlGl9DsW9AXoH7BkI9hqNCCjLK
 appQ==
X-Gm-Message-State: AOAM533Mg2tzkJ45LIQYU3dhakqvsnA4ABDkj0miHv/EuHuVH3enNIoz
 7wPSsPX+smHz+E8Eo4o1Mlzcu+wu6qrkFQ==
X-Google-Smtp-Source: ABdhPJwuO/20isVdDxP2PyzAjyNLAfzVJWXJ3er99Hc6IeVZWz8r4k17PqTyYAqYA+l15lpIkAgS6w==
X-Received: by 2002:a5d:5749:: with SMTP id q9mr39548940wrw.17.1641286483229; 
 Tue, 04 Jan 2022 00:54:43 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id r7sm36312281wrt.77.2022.01.04.00.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] hw/pci: Restrict pci-bus stub to sysemu
Date: Tue,  4 Jan 2022 09:54:24 +0100
Message-Id: <20220104085431.2122999-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Neither tools nor user-mode emulation require the PCI bus stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 363f6fa785d..d359cbe1ad7 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -26,7 +26,6 @@
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
-stub_ss.add(files('pci-bus.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
@@ -51,6 +50,7 @@
 endif
 if have_system
   stub_ss.add(files('fw_cfg.c'))
+  stub_ss.add(files('pci-bus.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.33.1


