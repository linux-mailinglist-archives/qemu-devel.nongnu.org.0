Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6768F812
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:31:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq8K-0007Bw-Iu; Wed, 08 Feb 2023 14:29:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq83-00075v-20; Wed, 08 Feb 2023 14:29:18 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq81-0006Kn-Hn; Wed, 08 Feb 2023 14:29:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 71F0021E93;
 Wed,  8 Feb 2023 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nF6Q1feagG1j59SSALXFHCj/mrnFM3pmdWjXUdvEyk=;
 b=sNnftqi4zStop0gseG/k/OM8AoHPXROPryXh/EtSmpXBJ5zNIZAA3zmVbVWE1H+MA5XGq5
 ntqO6UZDNKCzKsbaSeGNOIhwx4JIli5DMJVnWdBcPc87xqkDxdMF5+O+n1785Ol4z1gUwn
 5WbmjE9dNltbmVWm6Yys7hC8Fk34L1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884551;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nF6Q1feagG1j59SSALXFHCj/mrnFM3pmdWjXUdvEyk=;
 b=cjo/7+NIqmT1AqYUnoUuNpBfMjK4/DHYCutFvyxloIGtx8qU9XTDHe9YXQXIruC2/DjLAo
 l+gOvUPVPD0S7vBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2207513425;
 Wed,  8 Feb 2023 19:29:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YBD+NgX442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 06/10] hw/arm: Select VIRTIO_BLK for virt machine
Date: Wed,  8 Feb 2023 16:26:50 -0300
Message-Id: <20230208192654.8854-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
References: <20230208192654.8854-1-farosas@suse.de>
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

The virt machine has IF_VIRTIO as block_default_type, which causes the
generic code to try to create a virtio-blk-pci device pair at
configure_blockdev()/qemu_create_cli_devices().

Select VIRTIO_BLK and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors
when PCI_DEVICES=n (due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max -nodefaults -cdrom foo.qcow2
qemu-system-aarch64: -cdrom foo.qcow2: 'virtio-blk' (alias
'virtio-blk-pci') is not a valid device model name

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 8dcc08b7ec..296d4f5176 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM_VIRT
     select ACPI_HMAT
     select VIRTIO_PCI
     select VIRTIO_NET
+    select VIRTIO_BLK
 
 config CHEETAH
     bool
-- 
2.35.3


