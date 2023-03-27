Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98036CABCA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:22:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqXj-0002rb-TD; Mon, 27 Mar 2023 13:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqXh-0002rE-Iu
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <casantos@redhat.com>)
 id 1pgqXf-0001wP-Bt
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679937718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=AYvkhTSkuOljNyDAJTHjUcD90OjB4ORw+krVEGstItw=;
 b=Z1eKFYOSptQ9tccunN2RVO/5YjvvzVJMSeBwZ/zf9cCKvrMOmfVipF4s14O4W2sOCR33iS
 +ihLc5LJ9DOyLjayWjghW+CxSbpmOhm2kl5Emz+pTyEG/YeIrCJogMFvuFmYl9RAp4JPWL
 GKUNfdvi5NbuaTzXqRElbne14P4Ip+s=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-dMVJB_TRPu2qGKNTS-UW-Q-1; Mon, 27 Mar 2023 13:21:55 -0400
X-MC-Unique: dMVJB_TRPu2qGKNTS-UW-Q-1
Received: by mail-ot1-f70.google.com with SMTP id
 a15-20020a0568300b8f00b0069965814cf7so3907641otv.15
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679937715;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AYvkhTSkuOljNyDAJTHjUcD90OjB4ORw+krVEGstItw=;
 b=tApiXea6POczVoCTUKEizw3ZsZX/uVPqGEE2TjRzXy28XVyD8o+4dUsjSE6Q1ysc0e
 6392rRi41kv8bDdXk3YEVG2CQGp5b2fIwFkBKHNSqLXQSowt987gpLDYwAmrkRPtXDaX
 x+GbqssAvXiU+KnbroEqIy6BuzgM/O99ltgQ61TvKT6EcfCPD8PnMTRgkG6shJM/Dsc8
 K2J8p4SDjjp987eWEAklTRFJ+bmaAiY5JaDfIUdon3rMN2EtZ3tWNJL9d4iWht0wz5Ju
 eQEtkXxMJ0BlVAs1LROuaB+laGulEnW7pTczd89VHyIMEMOH5cWPihktvg22/CXeJWUR
 xs4A==
X-Gm-Message-State: AO0yUKUnwtKf7pfQPBrM/xa9Wwggd6Ko+IJKRX664Rmo3zAowjwgu3TO
 UiADByUojAgNwClEisFKEIyJednq7TxdgsMOcrBFtnq4Mn1tVKapunF4MJGFYL3Yu40D/qjLghp
 CXfpUUw86Qgof1JjuyFdYGs2zd3VqvmGMdoLU16pyM4wJhLsKBGwNBzcGr5y9XSty2f3v1dHxZu
 M=
X-Received: by 2002:a9d:5e0a:0:b0:698:77ed:2bd3 with SMTP id
 d10-20020a9d5e0a000000b0069877ed2bd3mr5058617oti.28.1679937714844; 
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
X-Google-Smtp-Source: AK7set84gUdKvqnKkzCm0mlgDPCk9/Ua2VJVobXrmBEtdAsQwjnfOnzC5RW6QBnRa/magra6z1Eulg==
X-Received: by 2002:a9d:5e0a:0:b0:698:77ed:2bd3 with SMTP id
 d10-20020a9d5e0a000000b0069877ed2bd3mr5058607oti.28.1679937714525; 
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a05683013da00b0069df7242a08sm4339687otq.26.2023.03.27.10.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 10:21:54 -0700 (PDT)
From: casantos@redhat.com
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Carlos Santos <casantos@redhat.com>
Subject: [PATCH V3] meson: install keyboard maps only if necessary
Date: Mon, 27 Mar 2023 14:21:47 -0300
Message-Id: <20230327172147.196607-1-casantos@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=casantos@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Carlos Santos <casantos@redhat.com>

They are required only for system emulation (i.e. have_system is true).

Signed-off-by: Carlos Santos <casantos@redhat.com>
---
Changes v1->v2:
  Remove stray --{enable,disable}-install-keymaps addition to scripts/meson-buildoptions.sh

Changes v2->v3:
  Reset submodules (synchronize to origin/master)
---
 pc-bios/keymaps/meson.build | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 158a3b410c..bff3083313 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -47,7 +47,7 @@ if native_qemu_keymap.found()
                        build_by_default: true,
                        output: km,
                        command: [native_qemu_keymap, '-f', '@OUTPUT@', args.split()],
-                       install: true,
+                       install: have_system,
                        install_dir: qemu_datadir / 'keymaps')
   endforeach
 
@@ -56,4 +56,6 @@ else
   install_data(keymaps.keys(), install_dir: qemu_datadir / 'keymaps')
 endif
 
-install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+if have_system
+  install_data(['sl', 'sv'], install_dir: qemu_datadir / 'keymaps')
+endif
-- 
2.31.1


