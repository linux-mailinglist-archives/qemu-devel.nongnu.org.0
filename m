Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEDC484435
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 16:06:45 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4lOe-0006sx-Nb
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 10:06:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGI-0006rn-FB
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:06 -0500
Received: from [2a00:1450:4864:20::531] (port=38652
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n4lGH-0004Qj-37
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 09:58:06 -0500
Received: by mail-ed1-x531.google.com with SMTP id bm14so149553298edb.5
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 06:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1sRcArNgPLfMk3/muBjnzR5DIWfkwyjUMPup557DbA=;
 b=qIiHvWwMG0ay9mu8S9J0GnqeVv4Enihcj6XVQI6mpisAieQXDV0KLR1RtE05xGRhlP
 2YslYq8QTi3gkgoRF1TTbldsw6aSDWASzWuEplPZNlOVDCHvyEBZcmdMYserMsQb8JCv
 8v8d5lSE2qxxoMcfQW2Efay/qOCEFZsK9oQVyYDxPoFhH9/EpnCpoB9YcRv7lPzeJqrT
 Wmw/Je4o74afUY45WxHtzWiVeQILVhdqXQ5MdgLgRimRrfdRRBrGXMOh2CXOXaoxgaL+
 QWv6Gg8deDVpCEcoGytsRS4c0yVwxO6/t9/v6nDSZmv9FM4Lw0iYh3cIMFNLkn6Xccsz
 kIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W1sRcArNgPLfMk3/muBjnzR5DIWfkwyjUMPup557DbA=;
 b=emS+aUHSv/e10unFr5esFG6yc+Gx4zUvS8tjyetDG8ZbPrpM547oIrYYtWpo6J3OEz
 NTASZtCS5h0sAt+WNpO6iqWsyfPCWA9VJX5CFkD3YXKQYtc8pnSUPkp9sk5LYkIQZyRt
 3SjKnnamYMsMOprpINxzWCmyQtfgZ9Uc63f6UbUBZyQdnwgNy9jKDXWOhsmjtcYE+C/C
 g1Bxc7fsYgH/TderGjHclqj7/X1dnTIyNfxpg8QrBb1Iu+ASD48s3fIzzShjwsDIBSQ9
 m1NbImKgzLADNOiSGvaMzZxK6LWipIjR4yxZG4FjeI9jLiiVukqAg9AVqQdygERTVatF
 8bjw==
X-Gm-Message-State: AOAM531xKZoJ+/GR4E44QSehsDD1lulj+bggMFgDERcpPOxnRQwCHihW
 i7K3QaxpSTHsHjvPg42rp76CNoDGSKI=
X-Google-Smtp-Source: ABdhPJzMy30WPShzsHyUkRnWUmmHEpC/xC6klGiQLqOQZuvJVsClxMIKx6HEtH0pWw3N9p9tkmWnnw==
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr35258069edd.256.1641308283943; 
 Tue, 04 Jan 2022 06:58:03 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j21sm11475964ejj.133.2022.01.04.06.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:58:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] meson: reuse common_user_inc when building files
 specific to user-mode emulators
Date: Tue,  4 Jan 2022 15:57:35 +0100
Message-Id: <20220104145749.417387-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104145749.417387-1-pbonzini@redhat.com>
References: <20220104145749.417387-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 53065e96ec..de111d6fa1 100644
--- a/meson.build
+++ b/meson.build
@@ -2919,6 +2919,7 @@ foreach target : target_dirs
   else
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
+    target_inc += common_user_inc
     qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
@@ -2927,7 +2928,6 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



