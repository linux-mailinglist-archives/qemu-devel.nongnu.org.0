Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A93AAFE7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:38:18 +0200 (CEST)
Received: from localhost ([::1]:52380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoTZ-0006cl-2y
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNH-0002ir-Lp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:48 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNF-000673-Su
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:47 -0400
Received: by mail-ej1-x62d.google.com with SMTP id hv20so2771531ejc.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8yAiDOeaxKnyfPeM12ZDJuul1W643A7dHP5nn5YjE8=;
 b=TNvsFmWjs9hjhtdz/NTLh0EI3exvLmAcIIkw80pNCbZ78y9/hIYjmjQ+eLCPQSPa0/
 NzUAxMrV6mIGlrDl1UI4A0glTkDeYI+fmgQxbgRLudMLKu0n1gmXcPnd9Tz4J/z7LXhi
 uriPNtBd//YopURF6XXudnjpRVbM9PCkK6s6gLLAj/eP1pBpaMVb0bm8loB2Zmaj0yBo
 U0iTjaevevsh87VqzWREnr2A0akl1JERblZo/xHYqC0RuAjoL9Db74IhwZgpCJfjsGaD
 rQPQIDh+yM/NJA74YTDZhfyC4VUPT6OTV+f6zdshA7W7KuTkRT/EimOfM3DzQVeH0xs4
 mfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O8yAiDOeaxKnyfPeM12ZDJuul1W643A7dHP5nn5YjE8=;
 b=Oj/yO7e+PLOaf4JrWSl90kku8nc2JWbm3TiiKdXRUPKBL0FyfPGsjGcRte9fFu6Z/e
 VDawKkEiavt9sjRAM3pEm/GpEFRTdTrFRP++ybKtTjobjt2qcNul9VtUiqTBtatYTy8/
 arBlgwAOAG1oDni8r8JB/Rn7tfXHq5d0w3qtqxKzXwSyoEFG//dRiKCzdt129p2z2ToS
 JL+q9Gc25lxOebClGp5ctM0scc3iMmIy34IArzfOcg8KqR1Pin/FllI03jxFV1OzvBZk
 9ZaSxQbqKgdUv2SdGdIcDQv2ILK5I1oziOJ7Ap+UGICVDas4G4F+yLxmo1M21lddGyqA
 hWjQ==
X-Gm-Message-State: AOAM530bttM93ftx9wHmmdaLd45bJdTuP797Jdf+20wiv9+yzKPHa/pq
 GKjq9zew/X1G5kBV8KvHl2QXuXaNwWc=
X-Google-Smtp-Source: ABdhPJzqIc/ZXEo/kZxdVlcTKJ6jGYG9JokWsAbhNSlLY6dtY19GJFnulOHMCf/WltSNcpYFg5QPoQ==
X-Received: by 2002:a17:906:4e96:: with SMTP id
 v22mr4165085eju.23.1623922304468; 
 Thu, 17 Jun 2021 02:31:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/45] esp: fix migration version check in esp_is_version_5()
Date: Thu, 17 Jun 2021 11:31:02 +0200
Message-Id: <20210617093134.900014-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Commit 4e78f3bf35 "esp: defer command completion interrupt on incoming data
transfers" added a version check for use with VMSTATE_*_TEST macros to allow
migration from older QEMU versions. Unfortunately the version check fails to
work in its current form since if the VMStateDescription version_id is
incremented, the test returns false and so the fields are not included in the
outgoing migration stream.

Change the version check to use >= rather == to ensure that migration works
correctly when the ESPState VMStateDescription has version_id > 5.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Fixes: 4e78f3bf35 ("esp: defer command completion interrupt on incoming data transfers")
Message-Id: <20210613102614.5438-1-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/scsi/esp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
index 3e6f4094fc..8fad87be9d 100644
--- a/hw/scsi/esp.c
+++ b/hw/scsi/esp.c
@@ -1128,7 +1128,7 @@ static bool esp_is_version_5(void *opaque, int version_id)
     ESPState *s = ESP(opaque);
 
     version_id = MIN(version_id, s->mig_version_id);
-    return version_id == 5;
+    return version_id >= 5;
 }
 
 int esp_pre_save(void *opaque)
-- 
2.31.1



