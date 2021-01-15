Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C7D2F8326
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 18:59:36 +0100 (CET)
Received: from localhost ([::1]:51974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0TNn-0002Gq-Ji
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 12:59:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0TGG-0004ED-Kx
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0TGC-0004fs-6q
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 12:51:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610733101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=z0ZhCfIjTJTZklb4Px+QgMD1cvwLEvqa0prsg+AcV2M=;
 b=JtIqt6tBiVV49Eqy/hwhF+HFsS9fqjUIl8XYNab8DWshpCABapIfUsaHUb0wvPMTF+p/ZR
 +7ssxu90bLRdDBf5XsfVPfSMSXD6WMHUzTrESdEhemo5dBO4EDbLNBltUrcG3Y+Z3jfkb/
 ogpenO2txQpz/+yht4zHn8+0MgM+8aE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-7Zru2MAXPfqLk58xlo83zw-1; Fri, 15 Jan 2021 12:51:38 -0500
X-MC-Unique: 7Zru2MAXPfqLk58xlo83zw-1
Received: by mail-ej1-f69.google.com with SMTP id m4so3868375ejc.14
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 09:51:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z0ZhCfIjTJTZklb4Px+QgMD1cvwLEvqa0prsg+AcV2M=;
 b=P3KEDkx98XuSBD1Rg6B4/hDTuUY61+cQvzFCa+XBX1opYHbpOLrN37/qlBJFIes/L8
 Mk1O/XTejpu0apkoju+h7Y3i79uAri/ANMbmSGJvSWDZNMKu91SJ/IREpaDGeQhZNZBZ
 odr87xt23eJvPZfMtrKlGq7UFiz/2420rl0iLl5MOFOQ3n8fWVM82FPr/HZYRwm1q+kL
 rOR6YMmgTKEiYMhLt7OO1kV19cOE6SpOM3gCMxSf1gO3Bxi7JTxjgTVqsebs8n+rkbqN
 7FLy4cEN9jzxo0bwcZnJ+l4tPDQ5XndlQNNb8jWNUlVZYQqstHgketl7NS0qcnCw+/bX
 vGbQ==
X-Gm-Message-State: AOAM530ISkvtc2SrSerCOaB13YMbX0e4m28Ml1vqK90EY7t5PhyPIGpD
 jHf8FW+xjGuhJMzj4P7LLpmm8n3Gl7Oc8FRFvHuq7XxTiVDWR8VuYciaoibWYvVujaXhN4Iya/4
 nJrgMsKyinA+qRlWYMFMj90L2dKqdV2WjU4cNZnW3Xp4y/XCi5hiRX466NG5ofAzg
X-Received: by 2002:a17:906:edd2:: with SMTP id
 sb18mr10188272ejb.114.1610733097242; 
 Fri, 15 Jan 2021 09:51:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt3KQaKQadSgYgdfXuec1PkMrtK72E5Hz2dPaMkyHBNrXTwLz4VEtOp+qW3jlMY/OX0i+vPQ==
X-Received: by 2002:a17:906:edd2:: with SMTP id
 sb18mr10188256ejb.114.1610733097041; 
 Fri, 15 Jan 2021 09:51:37 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id y59sm4421993ede.59.2021.01.15.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 09:51:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] meson: Only install ROMs when building system emulation
 binaries
Date: Fri, 15 Jan 2021 18:51:34 +0100
Message-Id: <20210115175135.3402714-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is pointless to install ROM blobs for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC because I think it would be better to make the 'blobs'
option a 'feature' instead of a boolean so we can set it
as 'auto' and then in that case we could do something

  blobs = have_system

because currently ./configure still displays:

                    Install blobs: YES

which is confusing.
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 954152c90fe..273b8e6baa9 100644
--- a/meson.build
+++ b/meson.build
@@ -2254,7 +2254,9 @@
 
 subdir('scripts')
 subdir('tools')
-subdir('pc-bios')
+if have_system
+  subdir('pc-bios')
+endif
 subdir('docs')
 subdir('tests')
 if gtk.found()
-- 
2.26.2


