Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 768CB52AC78
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:08:41 +0200 (CEST)
Received: from localhost ([::1]:57574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Ui-0005D5-Fj
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:08:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KO-0003FT-40
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KK-0002Lm-SE
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZDB5VoKb/iE9I0kcFermoLkNx+MSf7R/KQ2tlndX6g=;
 b=Uzk6pz7k5Euq0nsPU6JyxmLYKpqLz9fooPsg96Cx4tp/8DBYEipbKN5kTwfR53AJQ0URtp
 pasLh31vMHTS8diuRaqVpOOLUV7IYrzOnweZnN4mRXaSM+h1T8XJJKI0N+Pg8MAA8SFmSV
 /U6mTQ/r3mXPSConNLBlSpi8ds/+OFs=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-D8TFARdwPpKVc_yZseq9LA-1; Tue, 17 May 2022 15:57:49 -0400
X-MC-Unique: D8TFARdwPpKVc_yZseq9LA-1
Received: by mail-io1-f70.google.com with SMTP id
 t1-20020a056602140100b0065393cc1dc3so13095419iov.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eZDB5VoKb/iE9I0kcFermoLkNx+MSf7R/KQ2tlndX6g=;
 b=meZjndpW7nzI7we3UdcsBvbpFyD9Uq8PywijSdXfhya6d3qV+r8Y7rxn8Ixfn/LSsO
 HX9r7S49bT3HfzasXrw4vnIvD9CLupygvSXl2M/XL3nUd5P3BuB2ApmZF2jXGZkKiDzj
 TkdrvdROKx2UgS/82Ym8L+KQYJCbmCHT1t7upp0Dm/1CYnNzVNcWMzhZcwswCKLEAS/r
 5/1JN6yMMU1KcBXIQsi3tLQnXWrsYnIb37tbULpZJSrIm2esChL2XPzLqf/RqxLGjzaA
 CsT/G5xgaC7+d113XYO4Vi5FSar8u2ij9ltcqOU1uUumUiDsniSwGJC6PBKWxQQ57LSs
 eOWA==
X-Gm-Message-State: AOAM532TWF8po9AsW70hq+0viHkqYKeO5cqWeIft40wbVZzDCryeuCpm
 fzLBIiwfcR0EtkT9GOdbZY7eAvZ9cQN0HqnZHg4D65cY7uohlP3+cBLD5KrFo6B143zH1hAmF9s
 MRsjPv2fFhLkumot0o0h4dQ5pvJ2up+t3NK9krd+KMdqqzpCnV4c+wzfRdIY9O5e6
X-Received: by 2002:a05:6602:2c8b:b0:65a:df00:f3b3 with SMTP id
 i11-20020a0566022c8b00b0065adf00f3b3mr11507254iow.125.1652817467723; 
 Tue, 17 May 2022 12:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVN0q4v4zQWV240UsMg7LQ2awGzy35HXontqbdRR4hpSAb5dkAS/0hnvHsnOzecVXAiISCVA==
X-Received: by 2002:a05:6602:2c8b:b0:65a:df00:f3b3 with SMTP id
 i11-20020a0566022c8b00b0065adf00f3b3mr11507232iow.125.1652817467432; 
 Tue, 17 May 2022 12:57:47 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:46 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 08/13] migration: Export tls-[creds|hostname|authz] params
 to cmdline too
Date: Tue, 17 May 2022 15:57:25 -0400
Message-Id: <20220517195730.32312-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It's useful for specifying tls credentials all in the cmdline (along with
the -object tls-creds-*), especially for debugging purpose.

The trick here is we must remember to not free these fields again in the
finalize() function of migration object, otherwise it'll cause double-free.

The thing is when destroying an object, we'll first destroy the properties
that bound to the object, then the object itself.  To be explicit, when
destroy the object in object_finalize() we have such sequence of
operations:

    object_property_del_all(obj);
    object_deinit(obj, ti);

So after this change the two fields are properly released already even
before reaching the finalize() function but in object_property_del_all(),
hence we don't need to free them anymore in finalize() or it's double-free.

This also fixes a trivial memory leak for tls-authz as we forgot to free it
before this patch.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index d17f435d08..aa4185148c 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -4379,6 +4379,9 @@ static Property migration_properties[] = {
                       DEFAULT_MIGRATE_ANNOUNCE_STEP),
     DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
                       postcopy_preempt_break_huge, true),
+    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
+    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
+    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
 
     /* Migration capabilities */
     DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
@@ -4412,12 +4415,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
 static void migration_instance_finalize(Object *obj)
 {
     MigrationState *ms = MIGRATION_OBJ(obj);
-    MigrationParameters *params = &ms->parameters;
 
     qemu_mutex_destroy(&ms->error_mutex);
     qemu_mutex_destroy(&ms->qemu_file_lock);
-    g_free(params->tls_hostname);
-    g_free(params->tls_creds);
     qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
-- 
2.32.0


