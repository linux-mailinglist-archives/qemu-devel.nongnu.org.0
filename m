Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F503422F4B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:34:45 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoKy-0003xG-Df
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYE-0007qk-RC
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:23 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYC-0003xz-FS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:21 -0400
Received: by mail-ed1-x533.google.com with SMTP id dj4so1217488edb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Un1yFg3Apodja50rdrPE+6MDcr8WTBDb0TUSxvICIbI=;
 b=RFYMLBr5o29OTr/R0bNe26Ua+Y9Ori8HRUSdY9d9jBi0l+pphBXiID0gyX4XzJ42H3
 CiDvrhDar+5XXrIKp11z5j06oha5PJMCzvzsVA5mxosLErQ8YZS2hcl/gEFB2R19osjC
 pWsN2jJmQIkJUvBaV5OzMhzDo+bHI/Hvr4JxfLP8hLr6577OxnqbjdOFTBNhesg8qvOe
 f2yVv6mafdGnqRVPkPCS99VS/Xqw+zLnSN8zteBnLhHr6xhoNGvNXa/YnsnvfAVyk3iC
 CoYAmplP7U3M1CSdy3iQJYH8/f9FF78roUiHkMGHNnSjSjsxUv0dxwdyvWGyh+MM5R5X
 4x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Un1yFg3Apodja50rdrPE+6MDcr8WTBDb0TUSxvICIbI=;
 b=iD99pKFnNwiZdcPZFXT36vfv0zRDs6NBnW1ysRh5QoOeVQjrLvyVCZXUuFruj24tHC
 AP2VLIF8TpHf3m7qWcFE6of+6BU9QPCxaAho3f8cchLTIUsC/pG6ff6NFHmGKLdblFYb
 zq6CiyHWn6jmoRNpV+cbwIzHfArK7qPw8b0lsbtB2afLG2KRRS8yeheuHHfpljRMoyEg
 A7sx6zieuN9awKtkL/1Hwv3k1RKcMuUfMlphYkoFPHyw77kxZsy1LrWEaGJs9UaCNxph
 vpvdQYZyQ3ntCv7Kftdb1yMQs5GdIFRfrbAYD+M0mgahtSezlSNshOIzrclfjaOVvhgZ
 O+ZA==
X-Gm-Message-State: AOAM5322ncVEJ3FHCsICfKu1uB7PPalxVFW9oM8kTSlpJP8fwoK5XEiO
 B8m4EPBvMkRST1cNhpBevLlY7cHTEU4=
X-Google-Smtp-Source: ABdhPJyxfmjojn3A05gaqCa8yq8XUYlV+t5QCopl+/iUnqZX0DC7KwFsdrIL5j6QFV5Vn0mgq6dAug==
X-Received: by 2002:a05:6402:35c8:: with SMTP id
 z8mr9783367edc.129.1633452258148; 
 Tue, 05 Oct 2021 09:44:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/12] migration: add missing qemu_mutex_lock_iothread in
 migration_completion
Date: Tue,  5 Oct 2021 18:44:03 +0200
Message-Id: <20211005164408.288128-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

qemu_savevm_state_complete_postcopy assumes the iothread lock (BQL)
to be held, but instead it isn't.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20211005080751.3797161-3-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/migration.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index bb909781b7..6ac807ef3d 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3168,7 +3168,10 @@ static void migration_completion(MigrationState *s)
     } else if (s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE) {
         trace_migration_completion_postcopy_end();
 
+        qemu_mutex_lock_iothread();
         qemu_savevm_state_complete_postcopy(s->to_dst_file);
+        qemu_mutex_unlock_iothread();
+
         trace_migration_completion_postcopy_end_after_complete();
     } else if (s->state == MIGRATION_STATUS_CANCELLING) {
         goto fail;
-- 
2.31.1



