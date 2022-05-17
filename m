Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6116752AC7B
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:11:23 +0200 (CEST)
Received: from localhost ([::1]:34814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3XJ-0000ku-GN
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KS-0003KI-1l
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KQ-0002OH-E0
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLt0famyQutAM8iwQss0PPkwkiMER0ka83O5+25DRD4=;
 b=Q8wG5lyxpb8fLrb9oBERyjHhXGoG8xvM1VJvgnvlispXFrygRXK45fox/9R24nN42DZHRH
 yBBgWdwInDOGSsOzN1bWimZ8H18HRZkm5bNeZx4l+tHuygCoQrYk5sekq7P+dtOqk7BXBQ
 3/u6a/iReiPu90RDv4QdHL/xuM5veF4=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-Qx4L-F61PKSG-_W3Kj0AaQ-1; Tue, 17 May 2022 15:57:56 -0400
X-MC-Unique: Qx4L-F61PKSG-_W3Kj0AaQ-1
Received: by mail-io1-f70.google.com with SMTP id
 y13-20020a056602164d00b0065a9dec1ef2so13035964iow.23
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLt0famyQutAM8iwQss0PPkwkiMER0ka83O5+25DRD4=;
 b=aNayc5j/6uKSJx4fTxlmabpf+yA/K1jhFaAk2E8IeGyx2Fav8zBp8kwLx3gJ3r/eAh
 NWR+jAPSq4XomlFsKrXh2taDtdlu7uVrWn9W1i7fmFJEd8mpLAxNVKbBUpbwJ1+GcfpN
 nGIxY1V7JqbkKgMBN2v4+ILhUsNkdgU10FaJodKJemU0KZVYmdA5aFFLdBiMwVHmpVn4
 iwgLYMqnNskOD//aSjna/olA6xHzHmOKjrEkBOVrDaOZEc0M2SdiCESpbekz8DJ7Bjq0
 9LnovYzlYHizwTJ9vz51tNH18uKXe8rPZn0G8VBoUBV9Ao+21R5DOSi0p8tud49w869i
 g0sg==
X-Gm-Message-State: AOAM533bQelGvgHaQ/FvOY+oe9K/WtFp2rQqS6dz82mTxQ/bv8AdDEG/
 rhogvftPbiWzDjhrCzhKuvXRr6seqxzP/DRbayP/xk3Do9NwnDIJlTIcQSiFVVNsYZsoYSWM7GV
 NGZ/xEzyX9vtLYrTYwcatE8c/7vunWiTi9BtmaMu/b8X/gsfWpd/30cS/PSyrGQw6
X-Received: by 2002:a05:6e02:1c4a:b0:2d1:49f1:6318 with SMTP id
 d10-20020a056e021c4a00b002d149f16318mr1085745ilg.56.1652817474814; 
 Tue, 17 May 2022 12:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcwGF/0RywfW8BYAvu65rxF8xsc9KrZFVxmWw4e9My1YZF+/KNsHbKvqKdLDaoUtWWdhqkuA==
X-Received: by 2002:a05:6e02:1c4a:b0:2d1:49f1:6318 with SMTP id
 d10-20020a056e021c4a00b002d149f16318mr1085730ilg.56.1652817474507; 
 Tue, 17 May 2022 12:57:54 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 12/13] tests: Add postcopy tls recovery migration test
Date: Tue, 17 May 2022 15:57:29 -0400
Message-Id: <20220517195730.32312-13-peterx@redhat.com>
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

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index e8304aa454..ba7e4a2ed2 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1058,15 +1058,15 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateStart *args)
 {
-    MigrateStart args = {
-        .hide_stderr = true,
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateStart args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2170,7 +2184,12 @@ int main(int argc, char **argv)
      */
     qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #endif /* CONFIG_GNUTLS */
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery/plain",
+                   test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                   test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


