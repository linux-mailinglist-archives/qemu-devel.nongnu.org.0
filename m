Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF43A8147
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:46:27 +0200 (CEST)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Ob-0000I9-41
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hd-0005kj-Kl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:14 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hb-0002jA-Uq
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:13 -0400
Received: by mail-ej1-x629.google.com with SMTP id my49so22667312ejc.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8yAiDOeaxKnyfPeM12ZDJuul1W643A7dHP5nn5YjE8=;
 b=vV6UiTi0RwHsWL9cNKIhG1JRLJoeLBU6PnxrWABwCQoosiq/jBJt5ZjZXXD3jyFk6f
 oPx1YLjfzYDV3ucSBkWj/NwOoo/bEgyicJiUWJO5ugcZWqWIR2bnn0K4sjufMb1ABI/b
 03NEZd6XEUrj6ng5pSAbOHRjXkDgHNAciiFd1A7SdjapSuHEocGECZNZfT7KxvbHGhVv
 AB+hoHBvEu1dn3Hs/dsZ00VZdtFKoQZm6OjFPz0M0p6dpShl/F7oBN7JgTnkK/dVTykl
 idz5Ucp56DDZybWw7ItTBRlvynnUdPZPJapD7VLqCUG3edM3SetmyxaNDVRYhD8CgmRm
 QuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O8yAiDOeaxKnyfPeM12ZDJuul1W643A7dHP5nn5YjE8=;
 b=lDA4eiWtxuedpbkpGdJyBCbnVftnLAEbtiw7P6I+NDCZng0LPXDVxDEEOkaq2GEUcn
 Xv/7jvN2B5XMp2ykGKt3rvw0na0S5ABrLURxkkrxGhllY/BSeJTLycI4hKtcyi/rSuXj
 GQa6PWrQDlfOneTsLw8G6kJ9DSG5NEA2bf4NluXRm5LhdPmuhLGvbzMzpN4HNHPfQQ6J
 vDgD34W7PRouryxZ0cCLQRSzlBPHoEUMBqjeFe9Li6XT58StDfZNFtjcKTPGVaZaJojw
 LIULJUWNLIHD3qJKE1xy1UtV7t2XSj7CBCY+glRn1G9XJ/Lfcv5Ks7zfbvGdIeWXJRJG
 /NBA==
X-Gm-Message-State: AOAM530VHJuVr23t3kT5XeCBi51lsT5JJDWVW+F+r6EoLcrIwzSAnitm
 wqIu01xUubltafRvZZP6AxQgeymYi70=
X-Google-Smtp-Source: ABdhPJxZP5W7D0UUtOMw9j3WtO3OHXKxXA9webSPnkzPWQ+xZdgMGGyBpHPgy0aTEqtz8TeA72ub3Q==
X-Received: by 2002:a17:907:a9c:: with SMTP id
 by28mr486442ejc.308.1623764350768; 
 Tue, 15 Jun 2021 06:39:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] esp: fix migration version check in esp_is_version_5()
Date: Tue, 15 Jun 2021 15:38:35 +0200
Message-Id: <20210615133855.775687-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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



