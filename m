Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9240C409
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 12:58:02 +0200 (CEST)
Received: from localhost ([::1]:38126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQSc5-0004ur-GZ
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 06:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mQSas-0004FK-QB
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:56:47 -0400
Received: from relay.yourmailgateway.de ([46.38.247.118]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1mQSan-00074j-86
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 06:56:46 -0400
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4H8cbS1nHkz7vN2;
 Wed, 15 Sep 2021 12:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zapateado.de; s=key2;
 t=1631703396; bh=nlGSUelm4uLxCeA5XmXqAHym1m9K7W3fD0OfMHYWIHQ=;
 h=From:Subject:To:Cc:Date:From;
 b=VhHAON+F9TFssHPLSePH+3tqAidjSAuyUyHKPOkq/lYWy3xvOwnPnn+9VvZXVxkiJ
 bt1S/XDX3vz0JYtlmCaD9GNlJ5y8lY4JXOITDh22bxIRauNrG+3xJ+ZVDL4hCT4Qc7
 vPmq/QBp9cn6eTsV57QtufBjLVIX8dXwitd4fWT9efIDcKTluBeHZ6wc9bt2yrNvRm
 ywoWJmrTX9OwnvWcolhZYoIpnVMMipwzyR6d3ZEut0wv7dq/FCoIaBl6IflvJvZTdr
 qrOdz+zaNUS0NU2cho7ENDNT2zcA77QTiij05rUfvuOUT9C7BduHDoX1o1E2o0DLLW
 bMUwqHRPMpPZQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4H8cbS1NYgz4xVj;
 Wed, 15 Sep 2021 12:56:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.9
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4H8cbR0pQwz8sh0;
 Wed, 15 Sep 2021 12:56:35 +0200 (CEST)
Received: from [192.168.54.9] (ip-95-223-69-41.hsi16.unitymediagroup.de
 [95.223.69.41])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 4A9CA62DF8;
 Wed, 15 Sep 2021 12:56:34 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.69.41) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH] configure/optionrom: Fix MSYS2 multiboot.bin issue
To: qemu-devel@nongnu.org
Message-ID: <2b5ab039-8495-b55f-03f1-ecfd996907a9@zapateado.de>
Date: Wed, 15 Sep 2021 12:56:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <163170339461.2089.15284814169584458708@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-NC-CID: cRvo7dURD9ZUcOhb6IPvp1DU3wEVhCMgtwHNetfztRol
Received-SPF: pass client-ip=46.38.247.118; envelope-from=hk@zapateado.de;
 helo=relay.yourmailgateway.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch enables native builds on MSYS2 with symlinks disabled.


Signed-off-by: Helge Konetzka <hk@zapateado.de>
---

Without this patch these builds fail with:

make[1]: *** No rule to make target 'multiboot.bin', needed by 'all'. Stop.
make: *** [Makefile:189: pc-bios/optionrom/all] Error 2
make: *** Waiting for unfinished jobs....
...
==> ERROR: A failure occurred in build().
      Aborting...

Builds fail because make cannot determine correct TOPSRC_DIR/SRC_DIR 
based on copied instead of linked Makefile

After applying this patch to current master I succeeded in building 
natively on Linux and Windows/MSYS2 with symlinks disabled and enabled 
(winsymlinks:nativestrict, bash executed as Administrator).

  configure                  | 4 ++++
  pc-bios/optionrom/Makefile | 5 ++---
  2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index da2501489f..a12bc8edbf 100755
--- a/configure
+++ b/configure
@@ -5090,6 +5090,10 @@ for rom in seabios; do
      echo "RANLIB=$ranlib" >> $config_mak
  done

+config_mak=pc-bios/optionrom/config.mak
+echo "# Automatically generated by configure - do not modify" > $config_mak
+echo "TOPSRC_DIR=$source_path" >> $config_mak
+
  if test "$skip_meson" = no; then
    cross="config-meson.cross.new"
    meson_quote() {
diff --git a/pc-bios/optionrom/Makefile b/pc-bios/optionrom/Makefile
index 30771f8d17..3482508a86 100644
--- a/pc-bios/optionrom/Makefile
+++ b/pc-bios/optionrom/Makefile
@@ -1,6 +1,5 @@
-CURRENT_MAKEFILE := $(realpath $(word $(words 
$(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
-SRC_DIR := $(dir $(CURRENT_MAKEFILE))
-TOPSRC_DIR := $(SRC_DIR)/../..
+include config.mak
+SRC_DIR := $(TOPSRC_DIR)/pc-bios/optionrom
  VPATH = $(SRC_DIR)

  all: multiboot.bin linuxboot.bin linuxboot_dma.bin kvmvapic.bin pvh.bin
-- 
2.30.2

