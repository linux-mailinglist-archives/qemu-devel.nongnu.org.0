Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002E64FB88
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 19:10:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6bcD-0007bx-0j; Sat, 17 Dec 2022 13:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p6bcB-0007bQ-5W
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:08:51 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raj.khem@gmail.com>)
 id 1p6bc9-00018R-Nd
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 13:08:50 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so5336531pjj.4
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 10:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=227vY8wHOBn394+gP4giZDODdkOUTNJv9R3CKA39eQY=;
 b=KP4IPeq7ePv4Tpq6fxxmCUEJQREVxT0S5Izmzyw+rCR1g5rssfU6J6vIzT+mru8kaa
 OC2uLocsxHUTrOJOLvIE2q1H4Vyjk4HuwCCeZQioE+ILdDdNmXD2CnTizNhXBIIz06jT
 Oxvd3cmNlN4P8r/x7R+rimmM7GSR0WT8cCYhTsMpHRjfbbOMLJNXXOTNJZZKDjAjIC7l
 q/taYjYyKwzaXXJq9ZomI67OgFhrBwL6uMelSgxSGXbO2tKEEIwXpKWjfY+P2rB57jko
 +15B40d1gr1NfTARnKXc9wQgYwjYBdU0dxJJd42tbZOKYXAhw37jnglHgsK4szhfdXJg
 2Fow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=227vY8wHOBn394+gP4giZDODdkOUTNJv9R3CKA39eQY=;
 b=sPoGC7vxC3aj+yiJ3j0Gf8xct104UKyBrZJbXdqzwaJQ6Xv424ymG5g2eTeCNEdGy1
 zPDaVrtrejkXu9GLDqC1OoJl5d62G5o7g50Aycx9XsbxVOLUCXfcEExYdXwAxe12nW1J
 vARavrlCe+EefT4w/5JMLoC6HY1NJk2FRYuUax5EBXclkZIoG/F9jiVDn4UVvE5xsPRd
 byt1DtdlURJBCb57rFmO0uezlNSYfIUFyDjas/+ud4/1w3cIMNKLGyXjSEosCp8qE0rH
 Rm75lTtdrA1tN/8TeGVwxUvjPTJwtwTTKzV1EOGb/TWWlRO7dr24S/lDpwSG1XHnz/86
 gpaQ==
X-Gm-Message-State: AFqh2krmto5sonA3iQtfP2VOpvr4/4qJJg3dOvscXRgb7iivDLxOuxuS
 0TRgd29F5SjI8wzDmgMktlB2G9rRHm8=
X-Google-Smtp-Source: AMrXdXuW9kYLew/ld4uSmgqqvsr6+kOS7OpwFD9pgT9Z5m3JOHGsLVGaXMo3h6+EXJqvGwBezBVOKg==
X-Received: by 2002:a17:902:d4ce:b0:191:770:328d with SMTP id
 o14-20020a170902d4ce00b001910770328dmr3685124plg.46.1671300527326; 
 Sat, 17 Dec 2022 10:08:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a170902784500b0018685257c0dsm3839457pln.58.2022.12.17.10.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 10:08:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: qemu-devel@nongnu.org
Cc: Khem Raj <raj.khem@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Subject: [PATCH 1/2] contrib/vhost-user-blk: Replace lseek64 with lseek
Date: Sat, 17 Dec 2022 10:08:43 -0800
Message-Id: <20221217180844.3453267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=raj.khem@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
already. Using lseek/off_t also makes it work with latest must without
using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
when using glibc but not with musl.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index aa99877fcd..7941694e53 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
 static void
 vub_initialize_config(int fd, struct virtio_blk_config *config)
 {
-    off64_t capacity;
+    off_t capacity;
 
-    capacity = lseek64(fd, 0, SEEK_END);
+    capacity = lseek(fd, 0, SEEK_END);
     config->capacity = capacity >> 9;
     config->blk_size = vub_get_blocksize(fd);
     config->size_max = 65536;
-- 
2.39.0


