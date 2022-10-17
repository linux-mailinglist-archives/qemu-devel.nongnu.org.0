Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7D56017CE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 21:38:19 +0200 (CEST)
Received: from localhost ([::1]:41668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okVwH-0007my-VW
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 15:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVew-0001qS-98; Mon, 17 Oct 2022 15:20:24 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1okVeu-0002iN-GI; Mon, 17 Oct 2022 15:20:22 -0400
Received: by mail-oi1-x22a.google.com with SMTP id o64so13200761oib.12;
 Mon, 17 Oct 2022 12:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5cChQCBp1ochrw9NHXghkf2Svn+NNB1/NgVtrk42ARA=;
 b=fvMTg8yclyd+Th+yGlWq9j+dZ0aoAs7sK1dnyXal1EWfgBG7y7+6U7onJ4JTzutvz5
 ng7oDc0sQF68KuPfgEkZi6GWNopyeT34pBG4HHFY0KZubD57OkOdKfCvTilsCEqbNaBi
 XLeW5CcDz6kEvSxumVIIO8txZW0gUF9qgOC/Eyc6ba8Gv6RucE8ZeOT4TlDRQ2VimYco
 aNjAZ9FInyvzNhu2A2HPT8P7dJF9K05b0ixbYfGcNic20M6DgnVKSb0Um8T7RMl+5y6c
 pIxfkwDjWKncqB/UE6pny4VujbgJTBOuxBS+L9FmBGbThcTgFfSQ5yFlw4l6VWbJAn+1
 pe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5cChQCBp1ochrw9NHXghkf2Svn+NNB1/NgVtrk42ARA=;
 b=iyu8o4NbtYPPwJS28YJiJkgxOhTiclLjGoLU4+imFZU6cKKFdoLhkCtFggpcbZX/q1
 bcGJ8p0HYT649vjFlPlVITc8J7COhXH+QOk0DZtcg3GlROAuWrnPnO+Pm0PJhLcusQCE
 iQIUFS58dSEWB7Drqchx53bi7oWr9DuOUknI4R53az8iNYgZEKL2QC6G37iO5eD8NWhe
 akojWN4kBZ9MFvb4LxllY3bVSfB6HJe5wX58bQtG84U1O5IJLciF31pVJ3un+V4Aqm0X
 WbPLhc9eRPMCuECslGIE+12MrScB0ncQ23ftxW18RezcTEfjsaQPu0CQO3+wK/uZzomp
 MECQ==
X-Gm-Message-State: ACrzQf00gizVL1ovYT7JE7y/1KB2qQchrtb+LJRl+TJ6es3iTumiU61e
 A7VK+46+L/H3WtdFxULEHKbYDsclVtA=
X-Google-Smtp-Source: AMsMyM5YTXRrwoQrG8pEpLAPucO6ES47wq86j78UdV7+c3tXlolsjVWYx5/bt7kXr5P4dv/EMCHL6w==
X-Received: by 2002:a05:6808:ec8:b0:354:4ce3:9ba5 with SMTP id
 q8-20020a0568080ec800b003544ce39ba5mr5745070oiv.226.1666034418654; 
 Mon, 17 Oct 2022 12:20:18 -0700 (PDT)
Received: from balboa.COMFAST ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 n132-20020aca408a000000b00342eade43d4sm4648005oia.13.2022.10.17.12.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 12:20:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 01/38] MAINTAINERS: step back from PPC
Date: Mon, 17 Oct 2022 16:19:32 -0300
Message-Id: <20221017192009.92404-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017192009.92404-1-danielhb413@gmail.com>
References: <20221017192009.92404-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

I am not active anymore on the PPC maintainership, degrade my self as
standard Reviewer. Also degrade PowerNV and XIVE status since I am not
funded for this work.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929180946.848721-1-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ae2e43c83..d86d21ae4e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -267,8 +267,8 @@ F: hw/openrisc/
 F: tests/tcg/openrisc/
 
 PowerPC TCG CPUs
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
@@ -392,8 +392,8 @@ F: target/mips/kvm*
 F: target/mips/sysemu/
 
 PPC KVM CPUs
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 S: Maintained
@@ -1365,8 +1365,8 @@ F: include/hw/rtc/m48t59.h
 F: tests/avocado/ppc_prep_40p.py
 
 sPAPR (pseries)
-M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
+R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
@@ -1387,7 +1387,7 @@ F: tests/avocado/ppc_pseries.py
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: docs/system/ppc/powernv.rst
 F: hw/ppc/pnv*
 F: hw/intc/pnv*
@@ -2333,7 +2333,7 @@ T: git https://github.com/philmd/qemu.git fw_cfg-next
 XIVE
 M: Cédric Le Goater <clg@kaod.org>
 L: qemu-ppc@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/*/*xive*
 F: include/hw/*/*xive*
 F: docs/*/*xive*
-- 
2.37.3


