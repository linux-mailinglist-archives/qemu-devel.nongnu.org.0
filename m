Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D93968F80B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:29:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq89-00076H-9a; Wed, 08 Feb 2023 14:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPq7t-00074g-Lj
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:29:06 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPq7q-0006JU-Rn
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:29:04 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2920D203D3;
 Wed,  8 Feb 2023 19:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mo1y+IkB88GXLqQq4oQLXPwA8G31nYRTPHHNkmjP/Wg=;
 b=H/sU/PmTwQP82O7kgtXh5h1qIj6IN1YIO6gZDGbes8lbf7xv/vYUP8dNEiPfYQivWucivX
 6fZtmFOtsVkJVmp27GYqVhPnJ3Q9IR9W4DIb8StGu+2zh+4HEHRzEFuI7Ee7Ihlq73VNGG
 cwkaBpAxJ4w3C6XrQJCn5Dv8ryRDeV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mo1y+IkB88GXLqQq4oQLXPwA8G31nYRTPHHNkmjP/Wg=;
 b=56sxkkRvZkXnqhl8dN7EiHSFy4kje5JkOx1/z2IiC5JQPiB0lmQd4PwO9w1o9nSx/vA80e
 VAd57nohkqOPjpDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4427C13425;
 Wed,  8 Feb 2023 19:28:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cFinA/n342NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:28:57 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 00/10] Kconfig vs. default devices
Date: Wed,  8 Feb 2023 16:26:44 -0300
Message-Id: <20230208192654.8854-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

v2:
Applying the feedback received, all small tweaks.

Patch 6 still needs consensus on whether to apply the fix to Kconfig
or elsewhere. Link to the previous version:
https://lore.kernel.org/r/461ba038-31bf-49c4-758b-94ece36f136f@redhat.com

changelog:

- patch 1: moved isa-parallel to a build time check like the other
           patches;
- patch 3: tweaked commit message;
- patch 7: removed the default from XLNX_USB_SUBSYS.

v1:
https://lore.kernel.org/r/20230206140809.26028-1-farosas@suse.de

We currently have a situation where disabling a Kconfig might result
in a runtime error when QEMU selects the corresponding device as a
default value for an option. But first a disambiguation:

Kconfig default::
  a device "Foo" for which there's "config FOO default y" or "config X
  imply FOO" in Kconfig.

QEMU hardcoded default::
  a fallback; a device "Foo" that is chosen in case no corresponding
  option is given in the command line.

The issue I'm trying to solve is that there is no link between the two
"defaults" above, which means that when the user at build time
de-selects a Kconfig default, either via configs/devices/*/*.mak or
--without-default-devices, the subsequent invocation at runtime might
continue to try to create the missing device due to QEMU defaults.

Even a experienced user that tweaks the build via .mak files is not
required to know about what QEMU developers chose to use as fallbacks
in the code. Moreover, the person/entity that builds the code might
not be the same that runs it, which makes it even more confusing.

We do have -nodefaults in the command line, but that doesn't include
all types of fallbacks that might be set in the code. It also does not
cover individual CONFIGs and their respective use as a fallback in the
code.

So my proposal here is actually simple: Let's make sure every fallback
device creation *without* a validation check gets a hard dependency in
Kconfig. A validation check being something like:

if (has_defaults && object_get_class("foo") {
   create_foo();
}

Fabiano Rosas (10):
  hw/i386: Select CONFIG_PARALLEL for PC machines
  hw/i386: Select E1000E for q35
  hw/i386: Select VGA_PCI in Kconfig
  hw/i386: Select E1000_PCI for i440fx
  hw/arm: Select VIRTIO_NET for virt machine
  hw/arm: Select VIRTIO_BLK for virt machine
  hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
  hw/arm: Select GICV3_TCG for sbsa-ref machine
  hw/arm: Select e1000e for sbsa-ref machine
  hw/arm: Select VGA_PCI for sbsa-ref machine

 hw/arm/Kconfig  | 7 +++++++
 hw/i386/Kconfig | 8 ++++----
 hw/usb/Kconfig  | 1 -
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.35.3


