Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F74D46176D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:03:43 +0100 (CET)
Received: from localhost ([::1]:50254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhFu-00066l-HO
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrh53-0004Vt-KV
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:52:30 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:39802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1mrh4y-0003DU-L9
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:52:27 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id AC9512E13C2;
 Mon, 29 Nov 2021 16:52:20 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 u3H65lwW26-qKsq2H3G; Mon, 29 Nov 2021 16:52:20 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1638193940; bh=qWMvYmdvJktGDY85/6G6xNORdiAMl+yHtV1dHflWVvA=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=WGFhLg62NDb6f7+UmVKPZN1RZOne8fH8y5kC2zqZMJTuV0YHHqTB4M/mpy0egg6OL
 9PMSQzG6+5M5Q2YsxlhD5ovESj85Dwhe9+ZWM/B/02FZydkCp5da4qDfLVSRhKjDCw
 Ctcz/t5oBQ1Z9bhcCh9n7wwGH5mZpwn9G5eSgvI4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from d-tatianin-nix.yandex-team.ru (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1216::1:11])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 edSpNKAq6U-qKwuvqJ4; Mon, 29 Nov 2021 16:52:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] hw/smbios: verify header type for file before using it
Date: Mon, 29 Nov 2021 16:52:11 +0300
Message-Id: <20211129135211.1114466-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ani@anisinha.ca, imammedo@redhat.com, yc-core@yandex-team.ru,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7397e56737..c55f77368a 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1163,6 +1163,12 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             return;
         }
 
+        if (header->type > SMBIOS_MAX_TYPE) {
+            error_setg(errp,
+                       "invalid header type %d!", header->type);
+            return;
+        }
+
         if (test_bit(header->type, have_fields_bitmap)) {
             error_setg(errp,
                        "can't load type %d struct, fields already specified!",
-- 
2.25.1


