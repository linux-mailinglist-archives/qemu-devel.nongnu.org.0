Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDA346513
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:28:05 +0100 (CET)
Received: from localhost ([::1]:46654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOjsy-0005R0-Uc
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJo-00050G-VI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:45 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOjJj-0003O1-1G
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:51:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id k8so21275650wrc.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 08:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GTHORnB8GNFhRLeDkVGvcV7KBq/1cths7rE32mWJo3E=;
 b=YiWtCPDU2vhHPlBVW5Hi74JHJb1bGGyRcS8XKfzX4oOvb+EfnJAk3bstZnIMo3izD+
 Q5jq//7I6sl58r3w9vksm3xnMjEcBuiJRxmMnDLwrrW7jDI+FDUiG5y7ZJe4RwPmi3Vh
 CqNY4Bz9joHUh8FZPWRAHFKivFi+TYkX+2LnlaUktiko6uKltoZJT1fcxxh1MJfaTDoc
 E8m8Syz+Bm8BbcRCpUl4z5qTE/4oFAiqLDtu2y0rCFuKFWY+68w03pJGxZrsnr6o96ko
 Lo4XxYwebXFPV/JBmSELaz4u2NzOHSdvzCEcL/cxs17WngvP5PaFq0us0hYOuwNmQBXT
 ikww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GTHORnB8GNFhRLeDkVGvcV7KBq/1cths7rE32mWJo3E=;
 b=nJLgG+1POJ291+rRSSyQkL97y/H+XM9oZzPR1WcvMrtdE65j1FdBusv5EGxTRfUI8b
 crtlmyTLT9LJUN+wDIpG3Qw69JKYNBMCw19R568zsVFHYtzFc7UN0WneATs150ieHykj
 DlZhih6g861gntICYAADkhiAw0KD9SwJ6DYoU7Do5DivTVUYbil1fEZxbaT/bqmdqRJ6
 iD+AbNlscnzOYSaryJwSfCed1mK3mxqOCD2/3mgJUllH8F9mGRV+5l6zymH2ATqB+n0c
 oFUANvvV35qVMlU3u4aaUHTMr0mZHg2se2l2xMOk7oipchC+ywIi1HfH8nQPuFq6X+Ay
 IN9Q==
X-Gm-Message-State: AOAM5319xc6P6EgVNYBfumyPtJ3BZaydzVz4w8UOiZMhhVouiGqwHahR
 Np0oAyg+/5zKbVnwDKki/0rIdLzy8BW6DQ==
X-Google-Smtp-Source: ABdhPJwHwG58qs/gjVOm+DToAfk9CZjiIVC1zVPvMB0Lb50l0EhvFsdG9wodCAP/HJDbcqW6y9ud2g==
X-Received: by 2002:adf:e412:: with SMTP id g18mr4841051wrm.159.1616514694063; 
 Tue, 23 Mar 2021 08:51:34 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm3116255wmc.17.2021.03.23.08.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 08:51:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/13] blobs: Only install required (system emulation)
 files
Date: Tue, 23 Mar 2021 16:51:19 +0100
Message-Id: <20210323155132.238193-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When building a subset of targets, we don't need to install=0D
a bunch of unrelated files. This series restrict the installed=0D
blobs to what is simply required.=0D
Combined with Paolo's series converting pc-bios/Makefile to=0D
Meson, this should reduce the (CI) build cycles some more.=0D
=0D
RFC because there is probably a nicer way to do this with Meson.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (13):=0D
  blobs: Use Meson source_set to store blob files=0D
  blobs: Only install EDK2 license file if EDK2 blobs are installed=0D
  blobs: Only install qemu-nsis.bmp on Windows host=0D
  blobs: Only install PALcode blob if alpha system target is built=0D
  blobs: Only install npcm7xx bootrom if ARM system targets are built=0D
  blobs: Only install PA-RISC SeaBIOS if hppa system target is built=0D
  blobs: Only install DT blobs if microblaze system targets are built=0D
  blobs: Only install blobs if powerpc system targets are built=0D
  blobs: Only install firmware blobs if riscv system targets are built=0D
  blobs: Only install s390x firmwares if s390x system target is built=0D
  blobs: Only install SPARC firmwares if sparc system targets are built=0D
  blobs: Only install x86 blobs if x86 system targets are built=0D
  meson: Only build ROM/BIOS when system emulation is built=0D
=0D
 meson.build         |  22 +++++++-=0D
 pc-bios/meson.build | 125 +++++++++++++++++++++++++++++++-------------=0D
 2 files changed, 111 insertions(+), 36 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

