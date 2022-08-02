Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04209587D4D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 15:43:32 +0200 (CEST)
Received: from localhost ([::1]:57582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsBH-0005Jr-3a
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 09:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs69-0003fR-DO
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oIs67-0002cN-HW
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 09:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659447490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2IcXm2h1OLjaX+Qr7URbmt3haEdF1o8m6pzbGWZXudU=;
 b=ELVXwEqmBDccDOuPofExN9ShXAvXjI/gWt8P16FJI4c7R+H2KnLNEtmpc5HyAuaoj9NmTV
 dWbZFw4fP/U+MzzztiHLTIvxBzAss5yjqblXSVsdcgGEtwEfGmAnIY2LXjWDS84bbYJPap
 8iwZXfj7BwS2Ebe+bpq3/+vXCkQoezI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-7MvS9m8sNYOIGtpf1V3Bbw-1; Tue, 02 Aug 2022 09:38:07 -0400
X-MC-Unique: 7MvS9m8sNYOIGtpf1V3Bbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4F08280D209;
 Tue,  2 Aug 2022 13:38:06 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39B4E2166B26;
 Tue,  2 Aug 2022 13:38:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/block/hd-geometry: Do not override specified
 bios-chs-trans
Date: Tue,  2 Aug 2022 15:37:55 +0200
Message-Id: <20220802133757.138016-6-kwolf@redhat.com>
In-Reply-To: <20220802133757.138016-1-kwolf@redhat.com>
References: <20220802133757.138016-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Lev Kujawski <lkujaw@member.fsf.org>

For small disk images (<4 GiB), QEMU and SeaBIOS default to the
LARGE/ECHS disk translation method, but it is not uncommon for other
BIOS software to use LBA in these cases as well.  Some operating
system boot loaders (e.g., NT 4) do not handle LARGE translations
outside of fixed configurations.  See, e.g., Q154052:

"When starting an x86 based computer, Ntdetect.com retrieves and
stores Interrupt 13 information. . . If the disk controller is using a
32 sector/64 head translation scheme, this boundary will be 1 GB. If
the controller uses 63 sector/255 head translation [AUTHOR: i.e.,
LBA], the limit will be 4 GB."

To accommodate these situations, hd_geometry_guess() now follows the
disk translation specified by the user even when the ATA disk geometry
is guessed.

hd_geometry_guess():
* Only set the disk translation when translation is AUTO.
* Show the soon-to-be active translation (*ptrans) in the trace rather
  than what was guessed.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/56
Buglink: https://bugs.launchpad.net/qemu/+bug/1745312

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
Message-Id: <20220707204045.999544-1-lkujaw@member.fsf.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/hd-geometry.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/block/hd-geometry.c b/hw/block/hd-geometry.c
index 112094358e..dae13ab14d 100644
--- a/hw/block/hd-geometry.c
+++ b/hw/block/hd-geometry.c
@@ -150,7 +150,12 @@ void hd_geometry_guess(BlockBackend *blk,
         translation = BIOS_ATA_TRANSLATION_NONE;
     }
     if (ptrans) {
-        *ptrans = translation;
+        if (*ptrans == BIOS_ATA_TRANSLATION_AUTO) {
+            *ptrans = translation;
+        } else {
+            /* Defer to the translation specified by the user.  */
+            translation = *ptrans;
+        }
     }
     trace_hd_geometry_guess(blk, *pcyls, *pheads, *psecs, translation);
 }
-- 
2.35.3


