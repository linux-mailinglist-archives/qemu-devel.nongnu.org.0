Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD6564F67
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:12:35 +0200 (CEST)
Received: from localhost ([::1]:47146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HC6-00053I-Rb
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzx-0002Je-Ey
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o8Gzu-0007ff-V7
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656921597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hommaXIVvndUX4ym/deZGPDDEn+t48mF6l13jYObGTc=;
 b=ZJzXcVIYYQt96EFz94lExvLWzu53yGJgFM/c0rikcWbFuECxJecGEo4mEC9R9yD7dso4zW
 xoGYPEZFdKXgKUMHzR6ejEH+0doltJ2YSkAQtLxBqJO57z8tmODHrkaCKMuS7edPX0Hiqy
 KIX6D4kgKHI+EvZ2PPc3VW/c0HALJis=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-K8E6wNFnN96bpicICQJAiQ-1; Mon, 04 Jul 2022 03:59:52 -0400
X-MC-Unique: K8E6wNFnN96bpicICQJAiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D51171C18265;
 Mon,  4 Jul 2022 07:59:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC12409B3E3;
 Mon,  4 Jul 2022 07:59:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CD7871800790; Mon,  4 Jul 2022 09:59:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>,
 MkfsSion <myychina28759@gmail.com>
Subject: [PULL 5/8] hw/usb/canokey: Fix CCID ZLP
Date: Mon,  4 Jul 2022 09:59:43 +0200
Message-Id: <20220704075946.921883-6-kraxel@redhat.com>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
References: <20220704075946.921883-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

CCID could send zero-length packet (ZLP)
if we invoke two data_in, two packets would be concated
and we could not distinguish them.

The CANOKEY_EMU_EP_CTAPHID is imported from canokey-qemu.h

Reported-by: MkfsSion <myychina28759@gmail.com>
Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YqcqGz0s3+LE42ms@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/canokey.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/usb/canokey.c b/hw/usb/canokey.c
index 4a08b1cbd776..86548923eb16 100644
--- a/hw/usb/canokey.c
+++ b/hw/usb/canokey.c
@@ -109,11 +109,10 @@ int canokey_emu_transmit(
      * Note: this is a quirk for CanoKey CTAPHID
      * because it calls multiple emu_transmit in one device_loop
      * but w/o data_in it would stuck in device_loop
-     * This has no side effect for CCID as it is strictly
-     * OUT then IN transfer
-     * However it has side effect for Control transfer
+     * This has side effect for CCID since CCID can send ZLP
+     * This also has side effect for Control transfer
      */
-    if (ep_in != 0) {
+    if (ep_in == CANOKEY_EMU_EP_CTAPHID) {
         canokey_emu_data_in(ep_in);
     }
     return 0;
-- 
2.36.1


