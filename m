Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F38681AAF
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:41:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMa0z-0006uz-Ax; Mon, 30 Jan 2023 14:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pMZUd-000830-4V; Mon, 30 Jan 2023 14:07:03 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pMZUb-0002qX-PD; Mon, 30 Jan 2023 14:07:02 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 3021211EF13;
 Mon, 30 Jan 2023 19:07:00 +0000 (UTC)
From: ~vlaomao <vlaomao@git.sr.ht>
Date: Mon, 30 Jan 2023 20:28:44 +0300
Subject: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
MIME-Version: 1.0
Message-ID: <167510561992.30819.15402058368832100381-1@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <167510561992.30819.15402058368832100381-0@git.sr.ht>
To: dmitry@daynix.com
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:40:26 -0500
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
Reply-To: ~vlaomao <vlaomao@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: VlaoMao <vlaomao@gmail.com>

Changing the address with a subsequent reboot makes this address permanent un=
til the vm is turned off
---
Signed-off-by: Vlao Mao <vlaomao@gmail.com>

 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 04159c822..695ca2f92 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
     s->drv_shmem =3D 0;
     s->tx_sop =3D true;
     s->skip_current_tx_pkt =3D false;
+
+    vmxnet3_reset_mac(s);
 }
=20
 static void vmxnet3_update_rx_mode(VMXNET3State *s)
--=20
2.34.5

