Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D035F5A26C6
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 13:22:55 +0200 (CEST)
Received: from localhost ([::1]:60016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRXQM-0003zk-E1
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 07:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRX4s-0008GS-KG
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRX4m-0002AW-Vc
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 07:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661511634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WInGbJIK/LxgFJYTQ9+yP9omIG6ujCCLe3ETTNob4Jw=;
 b=DOF5jnQyVqZQpbtrp54+9tczb1vIjTXoKKZpaGPoKvVFEQbZWH8ui1wCMV75eSjL//oO0F
 Y7pX7NOpKhhyLNMPltIaSv/xsy3OOadvEhvGIlAQP49jw2NMplu0hq3kwigwxGNhLgDzlh
 v+/xz4SjqXyEZ5nD2ewjKt2oaw8Cots=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-576-tnYUY0q2PgScATEBfye7MA-1; Fri, 26 Aug 2022 07:00:32 -0400
X-MC-Unique: tnYUY0q2PgScATEBfye7MA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y14-20020a056402440e00b0044301c7ccd9so889689eda.19
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 04:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=WInGbJIK/LxgFJYTQ9+yP9omIG6ujCCLe3ETTNob4Jw=;
 b=Uo0mL3+/wJBYrM+AyQI7s2plYKMqcYoEJDErGQ+pDG/JG/gA8uJRLTGfqB65pNdcOq
 EU2Z8gDKlrKnqUBgHMb49rmk05YR7PMsn5gLFwpDRLYTAYR3UJ99uP30Rc2smqKP5XPj
 J0thazQgNuHcDdfnqK7AspRjuPIadmjVPaKO4w7+9ur4rWa2T2cVAu/t7jOEGJPNLAq1
 Grs+cnrmlqOKYswoqN9UfQpO3WERt9XiNHlBIu5zG5XPbVYEhD2guUaGnQqfpOFIKP88
 PQhF0aF2tHymxNlKSNtmEGTEPZaEDIGtt5QshoNyTlpCgIPr5kWW1hRPj/Ragdo71WRN
 sTMg==
X-Gm-Message-State: ACgBeo39h4t/MoPyFcQ2V41NDXbYqQhczqrADLlSlZaoiDLtnwCtbh/E
 R/stvpdwZ+lX3zK1x2iNxk8kk3KshltsXAflP5MDyif2OfptLS/O8SeR4CNQ/UPCVckxgzTONnz
 WuwxyFRc19KIqfHqab/Ny3EXV4CJp1zTxHM8zjsmNkKGKkJ0J8WdwHvh3cIH7huj8hyg=
X-Received: by 2002:a17:907:7202:b0:73d:6478:5ba5 with SMTP id
 dr2-20020a170907720200b0073d64785ba5mr5144684ejc.640.1661511631257; 
 Fri, 26 Aug 2022 04:00:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ukjxK7zbEStC1RaP+z3W1OcdycaKp5XVFq+gVrLjTJSIgli1jMlOF+8nJIyu2MzzDrkJ1EQ==
X-Received: by 2002:a17:907:7202:b0:73d:6478:5ba5 with SMTP id
 dr2-20020a170907720200b0073d64785ba5mr5144663ejc.640.1661511630923; 
 Fri, 26 Aug 2022 04:00:30 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 v23-20020aa7cd57000000b0043a61f6c389sm1131751edw.4.2022.08.26.04.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 04:00:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH] KVM: dirty ring: add missing memory barrier
Date: Fri, 26 Aug 2022 13:00:29 +0200
Message-Id: <20220826110029.59382-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The KVM_DIRTY_GFN_F_DIRTY flag ensures that the entry is valid.  If
the read of the fields are not ordered after the read of the flag,
QEMU might see stale values.

Cc: Peter Xu <peterx@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 8d81ab74de..f49643cd24 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -719,7 +719,7 @@ static void kvm_dirty_ring_mark_page(KVMState *s, uint32_t as_id,
 
 static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
 {
-    return gfn->flags == KVM_DIRTY_GFN_F_DIRTY;
+    return qatomic_load_acquire(&gfn->flags, KVM_DIRTY_GFN_F_DIRTY);
 }
 
 static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
-- 
2.37.1


