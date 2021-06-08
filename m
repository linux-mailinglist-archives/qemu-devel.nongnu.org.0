Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CEC39F506
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:33:30 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqZz6-0001BI-88
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpJ-0006iL-7R
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpG-00083A-3h
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:19 -0400
Received: by mail-wr1-x436.google.com with SMTP id c5so21119148wrq.9
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C9phMDSl+z0yBs8xiAAqnb7izn5gBQT6DdDlqQBBBhs=;
 b=oVdTgN7TYqFx2CWBlESxLR0Q1o9SKrQ3QHc+5hDQS2GmEiW79RGoBxyjacXPB2jC34
 0PeBTcUwciNWXyIo4Z9XFfkKHUE38LQd0QB+lr27bMPUSjASxNqGxAQznzC+SJoMcL+h
 aw9IewWTmU2Cgm5CixUrgCheB4qoyE9x9VgG+3hJt9PZc675DP6K8vUTo9VlsG1CshSw
 r8kVUu1wE9Y9+zNL4AL4tTIQALWORxXKLcslCYTtaphWmbVrDwLEzkDsjQU5sE7nYl4+
 0ClmT5b4QSQ6e7pyeXuylIULH45n0hpStecgssIOdQ8dF7L7REdwsTUXoRoxCrH21/fQ
 M/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=C9phMDSl+z0yBs8xiAAqnb7izn5gBQT6DdDlqQBBBhs=;
 b=i9D8C2CUnBQJWqQTQPOHDpULZYi8fXLqYZrSwz5FWdWQyX2MVf7WTxkkzceRILL7mn
 za+PZ8IMiGU95XVVgAX/ssgtvXWVrN3lpyAWyfCEXfuiZHZxQ2mgo2xsGIEgto0jbsEy
 mGe1PoHmLtcBDAOCziPLDaFcltMfmsILKFpiFjFeN5ftknx9F6ZPs7GFFC0C2OmCh1D1
 9NwbbRlJY51dm/h+CB35u6mWK6DKFz/IGrQZoln8joJIgFqeBT+el75aIiUiLNJbIt2c
 lMN8cBKu4kJToca/Q/6HJ0mQTG+M+ZucGnYFed9o176eoVHDdXCKVRm8b4w+Z7iUBvXg
 aZ3A==
X-Gm-Message-State: AOAM53089YaKn/FzLDlkUwEXILHCQ2UrBtHgPknqMTcBCZGYEe5wSShL
 rn/gu8YfU+35svW0GuvEi6hL6iwuXVc3yQ==
X-Google-Smtp-Source: ABdhPJyit3q77/qphMF0rFFcx4bhc6+CrX1+YMAGHxpG58M7NJT/75yPNaDCtoVRzZQzu9+YCTaphw==
X-Received: by 2002:adf:b648:: with SMTP id i8mr15700042wre.425.1623151396723; 
 Tue, 08 Jun 2021 04:23:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/26] meson: sort header tests
Date: Tue,  8 Jun 2021 13:22:50 +0200
Message-Id: <20210608112301.402434-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 28825dec18..5fdb757751 100644
--- a/meson.build
+++ b/meson.build
@@ -1258,16 +1258,17 @@ config_host_data.set('QEMU_VERSION_MAJOR', meson.project_version().split('.')[0]
 config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1])
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
+config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+
 config_host_data.set('HAVE_BTRFS_H', cc.has_header('linux/btrfs.h'))
 config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
-config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
-config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
+config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.31.1



