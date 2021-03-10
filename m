Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00267334A0D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 22:48:18 +0100 (CET)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK6gj-0005nb-UX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 16:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6dv-00036D-As; Wed, 10 Mar 2021 16:45:23 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lK6ds-0004M3-Mj; Wed, 10 Mar 2021 16:45:23 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MxmJs-1lfjSm08eE-00zG7S; Wed, 10 Mar 2021 22:45:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/22] vhost_user_gpu: Drop dead check for g_malloc() failure
Date: Wed, 10 Mar 2021 22:44:48 +0100
Message-Id: <20210310214504.1183162-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310214504.1183162-1-laurent@vivier.eu>
References: <20210310214504.1183162-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:joF+7Op07AnlQ2ARWcILEwHspJJyNNJB14om5MzuapInB4JfnvA
 k7FKzLTGb8yzljyN5Ob7TmUS3e3gH5XCqvt9vIxw43NbSHxh19XHi5YI72F2wPSIYW8R69K
 jvV0bGiamwHkINVOfnCaZzjG0cfq90eQ36WsGVFt521XE0EZKvC7xHBin4JdeMTzM8w+/3s
 t3a138Zs4GA2ltF4Pojzg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zjYCjs1DAWA=:sAR3mfqVmCh5R40lAGMHE4
 ImGemp3jPig0XKObzYPh4cjoyKPxtEmyxyJDrIY8G/xTE10or4WR5kKrO7a/8tSeISHFDgn1f
 d7N/G03sBCVs3UkhoKBjgLanMBdDjx3aib7mM89dwpTwsuFajAAMsV1w5r0xjzdUYR5TeSBro
 pvpYYoGINfsnK3ocQbNI5cflqtFOkJQTJwgYnFHOMFmoHhLloWtqWTlv/zdzBu3xnr8myKn+/
 KUlvPMlYRyx/kEZuJJ3j/znqtUCzIu1YPYaEH2qi46p3SYyxsEGaIBk7+yjgM5z5ne6e+1B/M
 nKF7dxVMIM44nHvFhDcKe5VMydEx+QrN/8m8MbY8ncri+YaRaJYfFU4bpAW3eVciTT/QSS3+I
 8/+62FIS8DEtVBhQi+izbeDZywnzgGNlwEop5wOicevEJiBELm8+fAIS2TOBIeTXGLzsFPn7w
 flaXwg73Sg==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210126124240.2081959-3-armbru@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/display/vhost-user-gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index a01f9315e199..6cdaa1c73b9b 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -325,7 +325,6 @@ vhost_user_gpu_chr_read(void *opaque)
     }
 
     msg = g_malloc(VHOST_USER_GPU_HDR_SIZE + size);
-    g_return_if_fail(msg != NULL);
 
     r = qemu_chr_fe_read_all(&g->vhost_chr,
                              (uint8_t *)&msg->payload, size);
-- 
2.29.2


