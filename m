Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356453BC15E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 18:08:03 +0200 (CEST)
Received: from localhost ([::1]:39412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0R8c-0004bM-7D
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 12:08:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1J-0001Gr-8I
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0R1H-0003cX-GK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 12:00:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id q17so2255980wrv.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mzo6AeYrmpZuyjeUL5LIfWrr9x9Cyyuphnxq1KvcFvQ=;
 b=uqq3oSmZxHvZeez8MjE30f1tyDa3eA1vwlMo2KCkuz+QOct0PMhf/YU0fKO8oCMgHb
 sp4PP6O5iBoH+ppxOqShsDvu3u4yWvFbDaTzKnzUb32LM6dwM/uBhQH+GUODQfTblm2o
 etnAqOozBZLvhnk6UxuiWVoeQbDv4eGnQpt1jtnPODwzdvrL8O7s/o3fz9tJ3Qs7EsA2
 xmQuA8IhzwyCAiJk3tR5CUn02sJxNkGKfKzAP63pG9mDBjVlqpAhZZBhplOoRJsxyeEh
 CATBhlT2j//kx4MihO2Vzb9jEIruhqQipOLebwDYHKE9mrxXx8FEH67eV37/uImrKIHw
 L/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mzo6AeYrmpZuyjeUL5LIfWrr9x9Cyyuphnxq1KvcFvQ=;
 b=jhsINd79wf99BJVD4HBB/Smn2pSSP19+CHsEM4qNLpE7OGA1kLUrvPezxbi29BDCPj
 fLguZ6g2QOnhCjeDnG/ywJIpJBA+nHQMpOnDBs9La1zP9n1ANAF/Lnm6eMS4k4aHt1f2
 QJA0/uqsPBauddYUlu+i7kdh54/mEHpADBRBk13WTur2J4Q8f2M0ZmSSSUN0V4JnmUTE
 flvG5Qg81ci9M9K9GWIBSBzBwUuewErejT4SZfGwGJ428WjdmILInRQjVuZnSlq1W/cc
 VLI6FwBdMqpib61Y6s8wrvclTnDbr4aUlSa7myiZRF1jcR74MtJGWYDxyzdE+86OHLeD
 8c0A==
X-Gm-Message-State: AOAM533fMkbKNl/4ZtaW0BJr2nPZqi8RhaYVTYIQC5NGtK+UX25gJ1ts
 0VoEmawzZSws9DxYrZjldQCMOoSfJGY=
X-Google-Smtp-Source: ABdhPJw+SGvd2C33CFlKAntsv2Mk21QyxRbi+0VWGttUSOkMXGpDRh8wmKLvnDjZusBYx/DQ/MG1QQ==
X-Received: by 2002:a05:6000:184b:: with SMTP id
 c11mr16663772wri.122.1625500825926; 
 Mon, 05 Jul 2021 09:00:25 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 b12sm1217063wrt.78.2021.07.05.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 09:00:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/17] meson: sort existing compiler tests
Date: Mon,  5 Jul 2021 18:00:09 +0200
Message-Id: <20210705160018.241397-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210705160018.241397-1-pbonzini@redhat.com>
References: <20210705160018.241397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next patches will add more compiler tests.  Sort and group the
existing tests, keeping similar cc.has_* tests together and sorting them
alphabetically by macro name.  This should make it easier to look for
examples when adding new tests to meson.build.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 1216ac8f72..53dfc2b4c6 100644
--- a/meson.build
+++ b/meson.build
@@ -1253,16 +1253,19 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+
+# has_header
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
-config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
-config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
+# has_function
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.31.1



