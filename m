Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C9E2B798D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:55:23 +0100 (CET)
Received: from localhost ([::1]:57816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJFL-0000hM-2b
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:55:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIyg-0002Pd-Db
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1kfIye-0005Xg-Bd
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d4sASdiOBxcUCw9YqrDuOiiCFz7HXE2/vEeYC4wwCPs=;
 b=GkhKqeupggc2cFRjTWf+EbdCIqOAljKMd7YzTL5XzX5ktfyr1gpjl5SqWfShK6wVMPyone
 fdI/+bmo7ypZr7OHarhuLDfN3YZEPJhL934/nUpMIcJlNWHT6G43f9gLqmybVrh/7ahQ4L
 DBUl+D1O9Q/TRmat1V5DytB6ICXueCM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-F6LKR9TiNBm8dk0YgB212Q-1; Wed, 18 Nov 2020 03:38:05 -0500
X-MC-Unique: F6LKR9TiNBm8dk0YgB212Q-1
Received: by mail-wr1-f71.google.com with SMTP id g5so631728wrp.5
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:38:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d4sASdiOBxcUCw9YqrDuOiiCFz7HXE2/vEeYC4wwCPs=;
 b=TnOXgtZBhGsUfLOGUnSZc8smZTGUi3GsiIMg9WhUFPKib+ox9ik5I5uVI0A2Spd1Cb
 Twei3jti4CSdArrENWRO4mhnUvoiqyxk+6mcvPq1l47+dQSfz+vua8h4So0wtADV4x99
 /cWTtMPH9C+h10ciGFVvqzNRVdYXrJ7BJPbrT74JbPAX7k0CtFgCI1wJ9WTqaorNq3EA
 T+YbhaUhrY1tepD8FVlLnj7pgEzdSYhdFqxM7TbPSz16JZuzxuQtAG+QpPQugr3AkhzT
 08cd89ZWJmp13wf4wsBj3vCCH4D5U21RmVrtveKHDNUgYHJoEw6DrJ1Y6NiZd5Utm3Mu
 TxpA==
X-Gm-Message-State: AOAM532t9QUSRrwFyw2AiIXL1zSAdWZmf2SK9QKWOMgoA88F3zEjTXMs
 Wh9zvc7nV8FjZmXRwVbo+X4Aa/rbKGyiYLOTicbP1FrjLpwfV77lsjcdUHHxHdLZRXe296tgY7b
 pqtJa7hngbdMaz+QzmgDelpL5MQQYGPQn24QqUld88fU4Cpgfq0CJyzlrMhjDAnrXDho=
X-Received: by 2002:a05:600c:1497:: with SMTP id
 c23mr1311613wmh.86.1605688684418; 
 Wed, 18 Nov 2020 00:38:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4RHk4DPWQA17Cv3vBmd7UuQXljSvS5n8HOT/acGwvF9810WTzygnkhPUIuNUVyCoNRXRnLQ==
X-Received: by 2002:a05:600c:1497:: with SMTP id
 c23mr1311595wmh.86.1605688684276; 
 Wed, 18 Nov 2020 00:38:04 -0800 (PST)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
 by smtp.gmail.com with ESMTPSA id b14sm30469014wrq.47.2020.11.18.00.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:38:03 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/27] failover: g_strcmp0() knows how to handle NULL
Date: Wed, 18 Nov 2020 09:37:30 +0100
Message-Id: <20201118083748.1328-10-quintela@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201118083748.1328-1-quintela@redhat.com>
References: <20201118083748.1328-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/net/virtio-net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index c221671852..e334f05352 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -818,7 +818,7 @@ static int is_my_primary(void *opaque, QemuOpts *opts, Error **errp)
     int ret = 0;
     const char *standby_id = qemu_opt_get(opts, "failover_pair_id");
 
-    if (standby_id != NULL && (g_strcmp0(standby_id, n->netclient_name) == 0)) {
+    if (g_strcmp0(standby_id, n->netclient_name) == 0) {
         n->primary_device_id = g_strdup(opts->id);
         ret = 1;
     }
-- 
2.26.2


