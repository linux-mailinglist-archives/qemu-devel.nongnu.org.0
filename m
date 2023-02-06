Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521FB68BFA4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cb-000619-Vw; Mon, 06 Feb 2023 09:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2CX-0005zd-PY
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:10:33 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2CV-0002Zh-U3
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:10:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43D2833CF9;
 Mon,  6 Feb 2023 14:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AR45YYrvUz2H1u7poKdPcRr/QLsI/6t2WOIwBcJW2YY=;
 b=yubnneXpKSCSfYvQKCpYTspEmdmA4wE9Pjm7et9/V0zIUqAvWMswU0VhdvtTVf/CyEX89h
 kNc7qduBhWg5/yWvi7YX16Hjd4zShfJkAtIa5ifgI8/0f00Wi+93Op+QzLyJ3YC+3AHURG
 rEUAlbReSCNSLj2U1hMnvI3AFlXM6CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692628;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=AR45YYrvUz2H1u7poKdPcRr/QLsI/6t2WOIwBcJW2YY=;
 b=fvnrz0OFkQwTK9UF4H0QOwiOzEomnewLk1Cw6MD3P3hzuJH+K15JEUofHZIt0HdHZ2KHBj
 d5JM+Ukizarb6XDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 519F1138E7;
 Mon,  6 Feb 2023 14:10:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aYB3BlMK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
Subject: [PATCH 00/10] Kconfig vs. default devices
Date: Mon,  6 Feb 2023 11:07:59 -0300
Message-Id: <20230206140809.26028-1-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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
  vl.c: Do not add isa-parallel if it's not present
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
 hw/i386/Kconfig | 6 +++---
 softmmu/vl.c    | 3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.35.3


