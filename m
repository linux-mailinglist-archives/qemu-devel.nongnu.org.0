Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2F4298F62
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 15:33:57 +0100 (CET)
Received: from localhost ([::1]:48000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX3ZM-0005tx-Bj
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 10:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3W8-00042w-Fg
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3W6-0007ye-Ki
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603722633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqsl7zZ6X1tK0MSIXvFwmd7obaqTWznFlFsRMz4wnrU=;
 b=ENSUSzPVgZkfmsmZRePkj8HhqTPFJMnZRQ7261MjcHDNHUmPV8VbCi3D/Ubgd2z6qXSszJ
 heGF+4ocNQMYmhZyNJ5nh9wezz1Aw0QlZaFYaIcL+10sJbKuVgNcM0Zkom6RJODOrn+XmP
 2GXdu8nq92Ffgxh7ROxa2xqXICq9hIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-N_jYoP8VOQSh_x0yGPcL9g-1; Mon, 26 Oct 2020 10:30:31 -0400
X-MC-Unique: N_jYoP8VOQSh_x0yGPcL9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 555FDCFF26;
 Mon, 26 Oct 2020 14:30:30 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1406A104326F;
 Mon, 26 Oct 2020 14:30:30 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] digic: stash firmware into DigicState
Date: Mon, 26 Oct 2020 10:30:15 -0400
Message-Id: <20201026143028.3034018-3-pbonzini@redhat.com>
In-Reply-To: <20201026143028.3034018-1-pbonzini@redhat.com>
References: <20201026143028.3034018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare for removing bios_name.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/digic_boards.c  | 5 +++--
 include/hw/arm/digic.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index d5524d3e72..d320b54c44 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -55,6 +55,7 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
     DigicState *s = DIGIC(object_new(TYPE_DIGIC));
     MachineClass *mc = MACHINE_GET_CLASS(machine);
 
+    s->firmware = machine->firmware;
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
         error_report("Invalid RAM size, should be %s", sz);
@@ -91,8 +92,8 @@ static void digic_load_rom(DigicState *s, hwaddr addr,
         return;
     }
 
-    if (bios_name) {
-        filename = bios_name;
+    if (s->firmware) {
+        filename = s->firmware;
     } else {
         filename = def_filename;
     }
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 8f2735c284..421dae937e 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -36,6 +36,7 @@ struct DigicState {
 
     ARMCPU cpu;
 
+    const char *firmware;
     DigicTimerState timer[DIGIC4_NB_TIMERS];
     DigicUartState uart;
 };
-- 
2.26.2



