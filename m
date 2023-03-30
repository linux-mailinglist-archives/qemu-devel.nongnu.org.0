Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E26D0214
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpox-0005JD-Ar; Thu, 30 Mar 2023 06:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phpoa-0005IP-AE
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phpoY-0007AW-SB
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680173249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LB6JFEuxq9+ZlesHPrbGrjmtUbdh7Iz2UNqGE9f0qfE=;
 b=faDXSIDVA5dZyH6AjdhGCOIq/VwYvEhNM3inIoIZdjf2cjiRcuY2alfUIGgxTi52tsnnbE
 ZZH8TFW/KEoIhyTSpG44Vnqj0RIcH/pA1PV0CGunynNyvWq1zbovXGU80OwRIqPfXDGJKx
 Mn4eAXnn9FlFu25DXunOU3sqcpJMmLk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-tqBOJvOnNG23-ayN9nEiRA-1; Thu, 30 Mar 2023 06:47:28 -0400
X-MC-Unique: tqBOJvOnNG23-ayN9nEiRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 r11-20020a05600c458b00b003eea8d25f06so9611626wmo.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680173247; x=1682765247;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LB6JFEuxq9+ZlesHPrbGrjmtUbdh7Iz2UNqGE9f0qfE=;
 b=jf32QKTJcpor3cpYuhm0vqwa/kVdVrzHLEJy6c4FCynw8wR7jBOoNwylzCxAG7aOgC
 DOnCu7fLvEdlrm0zqXcGqL3p8794JEsW2DFey0SUzWCiYy5Rf5I/Vt3Wis2LLGazPiEz
 rpaIeTC/7ZRkhUfjGgT4lb5q47jRDOOspmuAE4AbjtTkOusdXM5GxYUa89IRtZNgcLm8
 01OiMGOMoqf338UW2ZjvoPbxwuQrqb2nFo2nJ3lHY8754o2nZ8IcxJeY6v4+raJaNo6O
 Qx8r5LSZFEzghfzLIR755kqgn7E9opNGue0ihCi9tXHHrw+gaSW0OJqrGrqmP7w5Lnnv
 KHhg==
X-Gm-Message-State: AO0yUKVeVauXkUqdaSo9SRdlZJm/j/AFudOPCSVhEmiC7SedeD3lT4ys
 YRFcqaTNrLLkXFUr/GLSrpuXF/byQJUkw41aoupwlXZ87AMixB6x7G1MT37UGbw35Ql9HQ5p8dg
 m/tlEC9JEE1P8d56RKQxo7J/eul9kRvdnXt5zsnm34al/qkc6dlU0u9T7QJQytbY6QIeBal0Aqn
 xRuQ==
X-Received: by 2002:a1c:790b:0:b0:3ee:8e3d:4b9c with SMTP id
 l11-20020a1c790b000000b003ee8e3d4b9cmr18015010wme.21.1680173247014; 
 Thu, 30 Mar 2023 03:47:27 -0700 (PDT)
X-Google-Smtp-Source: AK7set9xnoG1n6YgIOs5wPKK8//h9UH56jVNbqCBFJbrmL5q9+muBLvBdkGMjpaehd6SDIzBWhzRdA==
X-Received: by 2002:a1c:790b:0:b0:3ee:8e3d:4b9c with SMTP id
 l11-20020a1c790b000000b003ee8e3d4b9cmr18014994wme.21.1680173246705; 
 Thu, 30 Mar 2023 03:47:26 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 t6-20020adff606000000b002d828a9f9ddsm24411856wrp.115.2023.03.30.03.47.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:47:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: drop unnecessary declare_dependency()
Date: Thu, 30 Mar 2023 12:47:25 +0200
Message-Id: <20230330104725.29248-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

The libvfio_user_dep variable of subprojects/libvfio-user/lib/meson.build
is already a dependency, so there is no need to wrap it with another
declare_dependency().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 3467159381b7..b8e3238df084 100644
--- a/meson.build
+++ b/meson.build
@@ -3011,9 +3011,7 @@ if have_system and vfio_user_server_allowed
 
   libvfio_user_proj = subproject('libvfio-user')
 
-  libvfio_user_lib = libvfio_user_proj.get_variable('libvfio_user_dep')
-
-  libvfio_user_dep = declare_dependency(dependencies: [libvfio_user_lib])
+  libvfio_user_dep = libvfio_user_proj.get_variable('libvfio_user_dep')
 endif
 
 fdt = not_found
-- 
2.39.2


