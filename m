Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142133B45E7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:39:01 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmyy-0006gu-1k
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfN-0003XQ-Us
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:46 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:37627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfM-0003I5-Ap
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:45 -0400
Received: by mail-ej1-x630.google.com with SMTP id o11so2224401ejd.4
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDfMHDSuKxMkZiFUP2o6GnGmA2A8MNufC6YTUOx3lYw=;
 b=rcFpB4Yb5JV8Fx3aYGr807kt/lOyvBbaSBvrPfWmREvjMbtvZjy2eCaplbsGk0Pt3n
 v1QlZXo9uQbKT59meejw4QgJqo9efn4HOvQAOV3qmaoFqh2xgte4HOAEvMiX6SqA0Ija
 sfUMJKKTxShf8wpGBQ0+UNmG6SCO9gdD2wqH69xdvmL7NpW4zSBF09T7DOyrV6PuJ8Y3
 9ddMpgui2HbziHJ/TfMh9mSH8vxJfrNY8kZ6fFW0OVMtbFmekjjVcKy0WSxOrbxrVIzM
 GJhPOplNFg4dxWAtDArsDm6IrtokqRGR6Jmfx8c8s6ciS41iz7lG1Xc4S668ts6BAPmn
 b4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SDfMHDSuKxMkZiFUP2o6GnGmA2A8MNufC6YTUOx3lYw=;
 b=s2LPBzVN5Wbx/9YhLZzoYuRzGhaKfGWp2WckW0wjGJyj8tfnc0EPip5Qw8IvxL3nR4
 2D8MPgAlAAw/uqBk19lXkguedy+FC1iZ1AyEk5BEf0HSbN/pmdFc/i3vL9k6BPkRejRU
 4vJZ8m6nyINGFueQpdcHuGTO1ZYmYWx2eBO4U9+bQmfB+sNPQ5ddJnE2prdTBwCklh95
 GnPN+MB67/XkpR/u6xOsGXqksbGB5nPU0CvQeSM47ybuGXDcLfBuWWogYdRaTaT8gGjR
 R5rBE0zHcNP6/4ZiXOoVlw3w6MRgYXTSMLMkXxmz04IJnym9lDFzf0SV5ieYbIbvimhM
 FASA==
X-Gm-Message-State: AOAM531XF1dtHPREgkVm4fKdCIvGNV4WLhYIYdRBAqZ3cpiKsTyVh39D
 4tFk/Xowd/r9wA2TGGcttGoNKZ3zy4E=
X-Google-Smtp-Source: ABdhPJy3mA9yZG0xf6qCY42j5njvbqGF2lk5gpROnTD64Jo1ILCLrdz3iLLayEFeMqqFGn44DTau8A==
X-Received: by 2002:a17:906:3c4a:: with SMTP id
 i10mr10937210ejg.372.1624630723101; 
 Fri, 25 Jun 2021 07:18:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/28] block: check for sys/disk.h
Date: Fri, 25 Jun 2021 16:18:14 +0200
Message-Id: <20210625141822.1368639-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joelle van Dyne <j@getutm.app>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Joelle van Dyne <j@getutm.app>

Some BSD platforms do not have this header.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-Id: <20210315180341.31638-3-j@getutm.app>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block.c     | 2 +-
 meson.build | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 3f456892d0..1d37f133a8 100644
--- a/block.c
+++ b/block.c
@@ -54,7 +54,7 @@
 #ifdef CONFIG_BSD
 #include <sys/ioctl.h>
 #include <sys/queue.h>
-#ifndef __DragonFly__
+#if defined(HAVE_SYS_DISK_H)
 #include <sys/disk.h>
 #endif
 #endif
diff --git a/meson.build b/meson.build
index 6419d4ee41..144456426c 100644
--- a/meson.build
+++ b/meson.build
@@ -1251,6 +1251,7 @@ config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
 config_host_data.set('HAVE_SYSTEM_FUNCTION', cc.has_function('system', prefix: '#include <stdlib.h>'))
 config_host_data.set('HAVE_HOST_BLOCK_DEVICE', have_host_block_device)
+config_host_data.set('HAVE_SYS_DISK_H', cc.has_header('sys/disk.h'))
 
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 
-- 
2.31.1



