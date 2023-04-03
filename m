Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA766D4BD0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:27:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjM45-0005ET-UO; Mon, 03 Apr 2023 11:25:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjM43-0005EK-O3
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:25:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pjM41-0000rJ-R9
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:25:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680535544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hYZNmMXnuPu5gzV66PycqU2IkPFa1vaX3QeY+2NUyiY=;
 b=SlJwWRS7VpQzA0LgEGVPqrdW4icpp7Bd1CQlgF98XJlmdw03hzCOxtMbWfrySqMNwbLlIp
 XxygCE72TMm7WEjQE3KSfgxbQlAvsvtx+INdJUv4erv1MVUb5fd/DzBnFBvGkFFWSDPuH5
 oHpAgexMiO8Ll8RkWt3CjNq/MMO+GHs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-4XJ16FUFMPW8VDrQwHz0kA-1; Mon, 03 Apr 2023 11:25:42 -0400
X-MC-Unique: 4XJ16FUFMPW8VDrQwHz0kA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i42-20020a0564020f2a00b004fd23c238beso41646581eda.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 08:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535541; x=1683127541;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hYZNmMXnuPu5gzV66PycqU2IkPFa1vaX3QeY+2NUyiY=;
 b=04HKYjAUT5V3ctJy7YqiuE5gFTKEbHiyzwwglGcxLxIuo39154STHCBYHaXWpONQ2U
 6zzm1DiVEcR005mqk+8Bs42ZXsTRgWBy+0HHYiutFERaiKshkgVeiU2PjCrFc9E5/Wy8
 CAS+1JEtvDDisKXeelSPskJUVGzNl1QHbrE7iibn9E6zMr5xmWSAqtBP34qhGb4DJFJ8
 wGI/cRO9Gd5qMV9tzBZp0hMp5FqDsbXeznF2UFVfkphCdOKtB6MsMTpG2EqVLSsBXzll
 8yzQe7YdIWbKLhzY408dUKi9qmgGORe4Sw9e1fVySzu3rvwChCaeBZKBeDOwtuFHeGt9
 etWw==
X-Gm-Message-State: AAQBX9fGfWxkNxt1dWttSnEQABewvNeljDtXrTRbqr+VMB+VWhYXlKjU
 O8dp+quX642OA+w1RXjOyr68Nut4P0q1IOdbKxP+Y+Mlm6tYJd6KCLOwZT6frzPOLkz0tXkeUDI
 4MXqb7zaWa04gfwqmCP2cKBRBbHEZSnMYkXaHHre1JZ5caSk8+b6ewzLY42v6gK+WwNExDbaMEP
 eQFw==
X-Received: by 2002:a17:907:a40e:b0:948:b9ea:3302 with SMTP id
 sg14-20020a170907a40e00b00948b9ea3302mr2338485ejc.1.1680535540987; 
 Mon, 03 Apr 2023 08:25:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7pruzwnaBasbGCSv3csDLg4qMsMJ53VkGFh1UrSXx+ouDYdSEEzWiUtYB3350C+bEwwc9sg==
X-Received: by 2002:a17:907:a40e:b0:948:b9ea:3302 with SMTP id
 sg14-20020a170907a40e00b00948b9ea3302mr2338456ejc.1.1680535540558; 
 Mon, 03 Apr 2023 08:25:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bo13-20020a170906d04d00b00931d3509af1sm4677375ejb.222.2023.04.03.08.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 08:25:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH] coverity: update COMPONENTS.md
Date: Mon,  3 Apr 2023 17:25:39 +0200
Message-Id: <20230403152539.379399-1-pbonzini@redhat.com>
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

Hexagon is split into two components because it has hundreds of false positives
in the generated files.

capstone and slirp have been removed.

hw/nvme is added to block.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/COMPONENTS.md | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index 639dcee45a01..7c48e0f1d215 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -12,6 +12,9 @@ avr
 cris
   ~ (/qemu)?((/include)?/hw/cris/.*|/target/cris/.*)
 
+hexagon-gen (component should be ignored in analysis)
+  ~ (/qemu)?(/target/hexagon/.*generated.*)
+
 hexagon
   ~ (/qemu)?(/target/hexagon/.*)
 
@@ -64,14 +67,11 @@ audio
   ~ (/qemu)?((/include)?/(audio|hw/audio)/.*)
 
 block
-  ~ (/qemu)?(/block.*|(/include?)(/hw)?/(block|storage-daemon)/.*|(/include)?/hw/ide/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
+  ~ (/qemu)?(/block.*|(/include?)/(block|storage-daemon)/.*|(/include)?/hw/(block|ide|nvme)/.*|/qemu-(img|io).*|/util/(aio|async|thread-pool).*)
 
 char
   ~ (/qemu)?(/qemu-char\.c|/include/sysemu/char\.h|(/include)?/hw/char/.*)
 
-capstone
-  ~ (/qemu)?(/capstone/.*)
-
 crypto
   ~ (/qemu)?((/include)?/crypto/.*|/hw/.*/crypto.*)
 
@@ -108,9 +108,6 @@ qemu-ga
 scsi
   ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
 
-slirp (component should be ignored in analysis)
-  ~ (/qemu)?(/slirp/.*)
-
 tcg
   ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
 
-- 
2.39.2


