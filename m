Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC678ECD
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 17:12:45 +0200 (CEST)
Received: from localhost ([::1]:53258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs7KO-0003xy-J9
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 11:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39563)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs798-0007EC-AL
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs796-0006U0-SS
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 11:01:06 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49062)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78u-0005Tu-K7; Mon, 29 Jul 2019 11:00:53 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 225ED96FE3;
 Mon, 29 Jul 2019 14:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5l1fmWgkohnYfqwDvu/gGAV5E6NY7tIcptUny/2QoI=;
 b=xTKf3JbPAx1i2E2+hOM1o5Jx5CwFUMK0mIg6d0hDPA2uq9XqrC1hjAi2W7Zc3ZuBdJ/MJJ
 2bqPdU5HT0Jaed7xGUl83+xBk+wceANeKoF43MYFjxaoyp1iAqnzcn9FwNbQ6qP9cGUSNf
 /AtZkXhDEzCmPNZBkas1dlzL7wadFcY=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:46 +0200
Message-Id: <20190729145654.14644-26-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p5l1fmWgkohnYfqwDvu/gGAV5E6NY7tIcptUny/2QoI=;
 b=zY+GYV/DDvu/oLJcsLrR2NFWMFitWRZDW+El9glEQer/WSvDFVosPPMXAL8jMBvWIrtfVk
 03kXZFsjdImszCQLyJfEdO0R/wOvY/9/GYN2B5eZyj6pgPf4/w/gHBv/yIrsGM3JIQj5oG
 ++1GOidE8bU5UXt0D9+CUzKGgBQk8BI=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412365; a=rsa-sha256; cv=none;
 b=AkHvT+/uLNLqiZknofRYqcrNzI/hWV7H8OW87AWt1E7g0UbyoydnSKYMrAqOpX1xWyJGDF
 XoVq69K1PEFFfHH8C5HlpKJZKf2ACiT+dj+kginTeGqR3gsbVtxky8cUbflOCv47ANvef1
 8GUKdWPUaRDbFV8EvpXsyZwCnT8iPPg=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-devel] [PATCH v3 25/33] hw/i386/pc.c: remove
 device_legacy_reset call
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, rth@twiddle.net,
 thuth@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace additional APIC legacy reset by device_reset_cold.

The new function propagates also the reset to the sub-buses tree.
APIC does not have any so it should have no impact on behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/i386/pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c0f20fe8aa..a175d76819 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2823,7 +2823,7 @@ static void pc_machine_reset(MachineState *machine)
         cpu =3D X86_CPU(cs);
=20
         if (cpu->apic_state) {
-            device_legacy_reset(cpu->apic_state);
+            device_reset_cold(cpu->apic_state);
         }
     }
 }
--=20
2.22.0


