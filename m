Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FA13A8138
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:45:03 +0200 (CEST)
Received: from localhost ([::1]:48042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9NF-0005pJ-On
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0005Zy-Ts; Tue, 15 Jun 2021 09:39:05 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HS-0002ez-TA; Tue, 15 Jun 2021 09:39:04 -0400
Received: by mail-ed1-x52b.google.com with SMTP id t7so5973436edd.5;
 Tue, 15 Jun 2021 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=heHCUXk2lYlY4womrST8MVwquaQIh6Pc6yFu//DhDE0=;
 b=QeAucoDTJvp3la0vtvXgglrQd7Kjq7ikSZi6O/Fhbut7WjAfGF2itw64+u85q2lBCQ
 QYwCncHaKtd2d9t4YlfuoLld5vdkFjZeJ63TtX1dJrCFzo/gu+NfgZTHoCfcF5hdqQlV
 71q/8lzS3I1hoMaYWahw0//O0HCv/g3LYCa7zvjmuSVS4DQ3fKJyz7XjjnyKCCMoWQhu
 ssHcc8B8dG2nO4k2wJ+cs0lpqrXJa8+p90LktKVxJxtwndPhczGlN5JJhvranWpi2vn/
 6ST5QgPuOtP1MX1iHimTMj1JmhaCPzBMr245M/SWFZgpyObk/Mp3aoD+9L5TMn9izNpA
 jSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=heHCUXk2lYlY4womrST8MVwquaQIh6Pc6yFu//DhDE0=;
 b=RRT5oM/2st7SLwTT27tsPRoxlPCQnH36iEiuUonYBagdxI9xYAa5QGkCXHRT5XTFEs
 gElrAfQWowMsTa1a36PNxsPbTwRiXf7xvQANZrpsBszasGouqWDamohnDGl1eM+507hu
 nUDqF+UgpgGxLS+A4dhTLcmj1lYqPBDcel5qHVACiBrWDQCNQfrSNr5JBrRm0NYiAPlk
 HWC747+r2Oe1SWl5nDvbpUFIKzJdjW9hb9+GS27ZC0LqRgMJRu2K1zKXxe/b2uNd+vvA
 D59nEwRRbu6dWos7wgbi+oL4LyJzIA3KZJSonS/Ll1Eh6B//r4xoXMdTxUgu3qTGztaK
 C92Q==
X-Gm-Message-State: AOAM533ctEiGp2mhiLRhdjHwBAkqxZhATdr3eKIcjQS8XYljPUtrFbYQ
 DU84CQZFvokmfo7LgRMHSEI0uZWREQQ=
X-Google-Smtp-Source: ABdhPJz1Koj3D+JjGoqXOykqQvHnDVhK2vKqaVg7louEg7L9qufyH1kb3AaWx40yQLZCwyv4KlYe/g==
X-Received: by 2002:a05:6402:1d0c:: with SMTP id
 dg12mr23211277edb.155.1623764341245; 
 Tue, 15 Jun 2021 06:39:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] runstate: Initialize Error * to NULL
Date: Tue, 15 Jun 2021 15:38:27 +0200
Message-Id: <20210615133855.775687-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: Peng Liang <liangpeng10@huawei.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Liang <liangpeng10@huawei.com>

Based on the description of error_setg(), the local variable err in
qemu_init_subsystems() should be initialized to NULL.

Fixes: efd7ab22fb ("vl: extract qemu_init_subsystems")
Cc: qemu-stable@nongnu.org
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
Message-Id: <20210610131729.3906565-1-liangpeng10@huawei.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/runstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 15640572c0..10d9b7365a 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -747,7 +747,7 @@ static void qemu_run_exit_notifiers(void)
 
 void qemu_init_subsystems(void)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_set_line_buffering();
 
-- 
2.31.1



