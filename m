Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E41422F9F
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 20:06:31 +0200 (CEST)
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXopi-00031H-5G
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 14:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYQ-00081Q-6K
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:34 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYA-0003wX-Ob
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:33 -0400
Received: by mail-ed1-x52b.google.com with SMTP id g8so1226552edt.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=55CXRtQhweAX0BfwwY0fYtxLpWQtmPQ9uVNse1thpew=;
 b=TOqG/LLWUAGNL24NnNHlr8Vxp4JWmzFjEH00di5VJXvg23ZqtlXudQEeivN+sewf6F
 wpLyloBJCiOPc/GjcAu+uYFyEQGRfu2J8hhKxLXqOR0m/WcRgtEPc3VyDFoATnw8xOx6
 hkBFfuXUR8psy/ODEeaM4mRuZXJf1inVRWjfQtgIiM478IszYHe6r7D/n3+MfDum4ZvJ
 3FUX4pedgfh3B3vnbSd1FRwh43nBaqNdqC6EXc5GZSDchcf6wx1CTRnAeg6n1KwC1HMI
 8m6jdB5vIdAT/HKaNulKZNRar+0O+HRuWw0ScSUqb3o29/Q3LQLZ7aqrEDm7+gZwMj7H
 gbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=55CXRtQhweAX0BfwwY0fYtxLpWQtmPQ9uVNse1thpew=;
 b=3H48J4W45fhCDuZW+0NZrWzA/mK9cCP5TZo3ujTDRo3aYUOFHeL51cadNGjAmOINJp
 N9jpzp6QkbW2zcoQv65zrlQFIrFwBBBwYTQOrsROK7lwqhK0vii1rpudcdkzK2kI0JIB
 JIvnLA4CSGDnKoZMAVFPotMqzV11kGolK9AXpq61WnsVB81N5DByv9qeNpPDxzlxWdgX
 TxtugI1n2g9ZSEB4kXzLgJv+ulZ5q8m/aEAQ1mZmpegdOFn8M/eI0I8ZHHqT2H5JIcbN
 R3w3mWFxFY/cqP38d5DumAlJve2KSEhBacXzp5etRjWhpen7GSzIZ7NfNZmDZjdIoSC0
 h8SQ==
X-Gm-Message-State: AOAM532gzkwQEVMO5rY3djzaBrxJOZbc1sM5G5ElvyUKWE7Zy7YGFZ43
 Ye0Ytt5lHbO1am/7WRWZAoVR5CDIkSQ=
X-Google-Smtp-Source: ABdhPJzZVIwuqufXRNkDndMUaKsUTi9N9M7O8Gi9ywIO+M5upw01rEXsMzsmHKkmTIxRWHRAiiXpoQ==
X-Received: by 2002:a17:906:f208:: with SMTP id
 gt8mr16061985ejb.522.1633452257281; 
 Tue, 05 Oct 2021 09:44:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/12] migration: block-dirty-bitmap: add missing
 qemu_mutex_lock_iothread
Date: Tue,  5 Oct 2021 18:44:02 +0200
Message-Id: <20211005164408.288128-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

init_dirty_bitmap_migration assumes the iothread lock (BQL)
to be held, but instead it isn't.

Instead of adding the lock to qemu_savevm_state_setup(),
follow the same pattern as the other ->save_setup callbacks
and lock+unlock inside dirty_bitmap_save_setup().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211005080751.3797161-2-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/block-dirty-bitmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 35f5ef688d..9aba7d9c22 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -1215,7 +1215,10 @@ static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)
 {
     DBMSaveState *s = &((DBMState *)opaque)->save;
     SaveBitmapState *dbms = NULL;
+
+    qemu_mutex_lock_iothread();
     if (init_dirty_bitmap_migration(s) < 0) {
+        qemu_mutex_unlock_iothread();
         return -1;
     }
 
@@ -1223,7 +1226,7 @@ static int dirty_bitmap_save_setup(QEMUFile *f, void *opaque)
         send_bitmap_start(f, s, dbms);
     }
     qemu_put_bitmap_flags(f, DIRTY_BITMAP_MIG_FLAG_EOS);
-
+    qemu_mutex_unlock_iothread();
     return 0;
 }
 
-- 
2.31.1



