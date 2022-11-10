Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DA1623F88
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 11:11:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot4Sv-0003Iq-8k; Thu, 10 Nov 2022 05:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Sl-00032c-7S
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:11 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot4Si-0006Xl-Ee
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 05:07:10 -0500
Received: by mail-pg1-x532.google.com with SMTP id 6so1341669pgm.6
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BJn5Gpsfix8eR37iFYW0tYNid+vOro5KOtMhRy0rf4c=;
 b=EXLxVaqBSxFla3mrNQ0uCKB4AVKP5YbOPNhdR37wmBcgLqpmrG95sOnnaDp79D9NvT
 gtCBOIrQ/u5D7BEg87qNA0ZdDnNdRla2UXj/BXAldgviwIm484QxC8uOsIEMBAp7N+bO
 tExqdyK5VLHC9Cvv2DZULt/F8KiBFTmxVsT13D4zSAws/o5z+QYQojZSTSIwSMRsB1+P
 l1O6p+RmS3Jhxqrv4y0T/1NK4cCPUtOi6MSIZE9899SZZTbTLb2yRJPZHZU89sOF2TtC
 lRASyQpeNEu070oW6wOYwcQkEE+LbxMOul2y2DnEfGbW/dIbSoXuyN618OC28TscBWv5
 uRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BJn5Gpsfix8eR37iFYW0tYNid+vOro5KOtMhRy0rf4c=;
 b=kNkeKI1Iq5rqra3z0hhozJTzWQc73Rl50+UXRKsG0HDcsLgaxYO3Y798OC8zf1UkwA
 L8lh1lOv3ZsULG4Whf3z6aCHKJH/HSHkX0yMivpKkzR8a87V3t7Ange1zD+YCSaOMYxE
 MS3DbcIAuhgFGdrpvEoQ7Y9gJ0suv+a88w17nPt4nnJLx3hbneVO19188h3YVKsUdoNc
 GpAI+P+ks1BNt4hDSnZxxKuq5Q70tO/PY0/2HKe+lWzIUhIJV/2eQpWKTvLBAJnm7wKr
 DzDymWMN4CieZur2EfXpCA2SDqgWoQ+vXygrz1s709eYV/xaLY2DlO6G29LfUADOg8iB
 B9fA==
X-Gm-Message-State: ACrzQf33pBpfs6o2fftD+MEDpZdWQMwMpOEuQBCM8sozzGRkx6+x7VuG
 +KmBuuEp5+MhnzA/CY+stbxFRqmZ53ft160q
X-Google-Smtp-Source: AMsMyM75nyWTRspZhix8ZHtmIBtV6N5dp8WlK05WmRPucObIO3mEIkCprl9RBOft3Oyp+Czhe202XQ==
X-Received: by 2002:a63:560c:0:b0:46e:c390:17b4 with SMTP id
 k12-20020a63560c000000b0046ec39017b4mr2167642pgb.482.1668074824510; 
 Thu, 10 Nov 2022 02:07:04 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a1709027e4900b001714e7608fdsm10730780pln.256.2022.11.10.02.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 02:07:04 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, virtio-fs@redhat.com,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Yan Vugenfirer <yan@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 08/10] module: Use qemu_get_runtime_dir()
Date: Thu, 10 Nov 2022 19:06:27 +0900
Message-Id: <20221110100629.61496-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110100629.61496-1-akihiko.odaki@daynix.com>
References: <20221110100629.61496-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

qemu_get_runtime_dir() is used to construct the path to module upgrades.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 util/module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 32e263163c..580658edf4 100644
--- a/util/module.c
+++ b/util/module.c
@@ -242,7 +242,8 @@ int module_load(const char *prefix, const char *name, Error **errp)
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
                              G_CSET_A_2_Z G_CSET_a_2_z G_CSET_DIGITS "+-.~",
                              '_');
-    dirs[n_dirs++] = g_strdup_printf("/var/run/qemu/%s", version_dir);
+    g_autofree char *run = qemu_get_runtime_dir();
+    dirs[n_dirs++] = g_build_filename(run, "qemu", version_dir, NULL);
 #endif
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
-- 
2.38.1


