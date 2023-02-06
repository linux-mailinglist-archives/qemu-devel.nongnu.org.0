Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567C68BFA6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Ck-000663-Cp; Mon, 06 Feb 2023 09:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cg-00065A-0v; Mon, 06 Feb 2023 09:10:42 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ce-0002fa-HS; Mon, 06 Feb 2023 09:10:41 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CFE433CF9;
 Mon,  6 Feb 2023 14:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEGE8pycELFg8/TWdTKjH83z3RR5mzFkoQaZma3+j+8=;
 b=phpX8Ui0tb9oUlgo2rJlliCGS+K1vTcDzOmkjw06bqCWhhMZxKMKizsd8Ay9mA3q0a+fT7
 VCdM56C/rv5x+Bd/6zM1mYXv8VKbi+9HM2vfRCBCZPvNha7Lfd3SXbd7tqD/mQnPUozUsM
 s1hxZgYLh9Bd/oZ2cH3NgAXlmmjkE68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692639;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FEGE8pycELFg8/TWdTKjH83z3RR5mzFkoQaZma3+j+8=;
 b=MMXrNsp3nWjQLcMhNMA5eR6o7a0v56jxJ2tP2CPn+GuVero7ntpLVWl36gixQHWyIMGWfA
 WS7twA7/Fd4HncAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5AB6138E7;
 Mon,  6 Feb 2023 14:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UHeOIl0K4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 05/10] hw/arm: Select VIRTIO_NET for virt machine
Date: Mon,  6 Feb 2023 11:08:04 -0300
Message-Id: <20230206140809.26028-6-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The 'virt' machine uses virtio-net-pci as a fallback when no other
network driver has been selected via command line. Select VIRTIO_NET
and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
(due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..8dcc08b7ec 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -31,6 +31,8 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select VIRTIO_PCI
+    select VIRTIO_NET
 
 config CHEETAH
     bool
-- 
2.35.3


