Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666264470F8
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Nov 2021 00:31:37 +0100 (CET)
Received: from localhost ([::1]:33704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjV9s-0003LD-0N
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 19:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV8C-0001N1-H4
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mjV88-0000B2-Nj
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 19:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636241387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYs9w+TU8A8Kwh3aAef272qquxD3vmzyplq4dxBKtMM=;
 b=PXSQ5c6L9DfW8e+91qbTl22vaxlQ0DI8VKHJhzsMd3YQrByXMA+c+JBJ0MR1Tul4dgiHeo
 BkyBUlDRBI8Ln8uZ4ep2EFFQpwcwgiEEst5mqIkRQsmzW0VaAUF/Eat0RQASvLKHpX1z1+
 oIDOVwKB+ipwaOmGnFPvDL9wWby+/PA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-ytgH-O1CPXmvwlUWAP4yhQ-1; Sat, 06 Nov 2021 19:29:45 -0400
X-MC-Unique: ytgH-O1CPXmvwlUWAP4yhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so4628515wms.8
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 16:29:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mYs9w+TU8A8Kwh3aAef272qquxD3vmzyplq4dxBKtMM=;
 b=zgPqpYjwtpe2BuzP+rBHFPN60NRWGnm0EdYi+bfTGXmnTdv/VDheVZ7Q2SVxCxjlLS
 lPX68dBbDUHRjcq0Mvpw3pnZ+Rfrmjr7GI7ZTLsRnxmID3oKpry+BYdOn6zw57pHiZQC
 OqZYn0t201bR8TMMn2usldKN/DhiwGZMx+uF0HicwemVeadj+L9Y7P6qEwB94FQ6460+
 FSETHijwF71ONrlr9xcnzLZ0vt2NdocDbudIi2dYesoArbhY1z4lKDS56skS+mEsdj3q
 GXmu3vnhrYmcj/+RevNj1BDEYO11cEzBott/U/6gqIWaL7IMnHKypW7wQPIjQm7B9vr0
 o9xg==
X-Gm-Message-State: AOAM5322B001jhVDC0ci84qGZMkrJkaS36qHIbGoz4gUTZZEBgmAHSd0
 UGnlDovOEFCJg20emNWtCy0JauUaDoT3B0hdS71eG2CCBR1TD1O/wodLx6tzZ1NUcEfNm3nAUL4
 OwXxBz/Rkw8AF4ZZuuB+S0ot3NGNAlnNwGB1Qjh/ArKzj4QcaDw7152GC75BOXkSXu4w=
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr41266725wmc.75.1636241384381; 
 Sat, 06 Nov 2021 16:29:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2WaD70xsx8XvhDniGo2BFjocogpUBEiVKyN28LuiaTA/R8m7d691y3llLkeePHr5XgYlaOA==
X-Received: by 2002:a1c:7c14:: with SMTP id x20mr41266699wmc.75.1636241384117; 
 Sat, 06 Nov 2021 16:29:44 -0700 (PDT)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id s26sm9545610wmc.0.2021.11.06.16.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 16:29:43 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] migration: Check that postcopy fd's are not NULL
Date: Sun,  7 Nov 2021 00:29:40 +0100
Message-Id: <20211106232941.46184-2-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211106232941.46184-1-quintela@redhat.com>
References: <20211106232941.46184-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.735,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If postcopy has finished, it frees the array.
But vhost-user unregister it at cleanup time.

fixes: c4f7538
Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index e721f69d0f..d18b5d05b2 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1457,6 +1457,10 @@ void postcopy_unregister_shared_ufd(struct PostCopyFD *pcfd)
     MigrationIncomingState *mis = migration_incoming_get_current();
     GArray *pcrfds = mis->postcopy_remote_fds;
 
+    if (!pcrfds) {
+        /* migration has already finished and freed the array */
+        return;
+    }
     for (i = 0; i < pcrfds->len; i++) {
         struct PostCopyFD *cur = &g_array_index(pcrfds, struct PostCopyFD, i);
         if (cur->fd == pcfd->fd) {
-- 
2.33.1


