Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376F3CFA07
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:02:45 +0200 (CEST)
Received: from localhost ([::1]:36388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pOW-0002B6-5I
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGS-0004pL-1d
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGO-0008IX-GJ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kmyyrQh4WbaJa96S+gdsxXqP2gWB1mm55dgiENtRKF8=;
 b=cD87NcfEKfeK9vMs3zJWSfoyEoxTj8oZlzxZn6cVaVWb8zVWr0fqItUawLNj60LeRMC0aK
 No7Jh+G1kbzKD+Y0zfTG3BPgJNR09n0GN/kPA4DDt+ZFLhYNiztqHmpbt9Aozbhz5d8WoU
 qxG8Ju8hrON/DPbNl0W/LEN3MHhyDsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-IqIFePIHN-ytwQUYH6ht9w-1; Tue, 20 Jul 2021 08:54:18 -0400
X-MC-Unique: IqIFePIHN-ytwQUYH6ht9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCB4A81C85F
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 085225D6D7;
 Tue, 20 Jul 2021 12:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1589E112D84E; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/16] microvm: Drop dead error handling in
 microvm_machine_state_init()
Date: Tue, 20 Jul 2021 14:54:03 +0200
Message-Id: <20210720125408.387910-12-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stillborn in commit 0ebf007dda "hw/i386: Introduce the microvm machine
type".

Cc: Sergio Lopez <slp@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/i386/microvm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index aba0c83219..f257ec5a0b 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -458,15 +458,10 @@ static void microvm_machine_state_init(MachineState *machine)
 {
     MicrovmMachineState *mms = MICROVM_MACHINE(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
-    Error *local_err = NULL;
 
     microvm_memory_init(mms);
 
     x86_cpus_init(x86ms, CPU_VERSION_LATEST);
-    if (local_err) {
-        error_report_err(local_err);
-        exit(1);
-    }
 
     microvm_devices_init(mms);
 }
-- 
2.31.1


