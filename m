Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64F570C92
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:15:36 +0200 (CEST)
Received: from localhost ([::1]:42368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB0kh-0000hb-92
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0h2-0003W6-RQ
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oB0h1-0004bO-8y
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:11:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657573906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1cZnN6gjKaE1lxGysABJPYP86zhw9qlbCgi9BNOBrc=;
 b=GfF36Ka93UBppMzXX5N7BE+CANrreBrGHJIb/K0nSydYmfopUV08kartFbtUdqZE+x6VJ+
 8ehe21yiuY8xgJHcasV7Byp6Q86WZ6OeCOEog47XWJPFq79J99xh6V380sfwRaAkxzW+OI
 CXZA/Dn/zdSzAQonsNoXS4yI5808y1A=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-0mJMWzvQPh-xYhEPwVIazg-1; Mon, 11 Jul 2022 17:11:43 -0400
X-MC-Unique: 0mJMWzvQPh-xYhEPwVIazg-1
Received: by mail-ot1-f71.google.com with SMTP id
 n21-20020a9d7415000000b0061c30887d34so2064888otk.17
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:11:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b1cZnN6gjKaE1lxGysABJPYP86zhw9qlbCgi9BNOBrc=;
 b=WcOkKxChPJSmPJ1H4u/fb3hpX2QjlxmnxZFYVB1FSnd26LcwGi/YUi1z+8bQOEN+JC
 p28QfczZRKuwzM3b6x52FLz4N/PFmi5tpGVoCUocTAB1kAC5ms1DV9jx3ShjOPkNv3FN
 X6qD+M088XymLQq0qfJ3JTerWdrRaF0mO/56OqQDQoOlzKysUfoVDeU88mibt0oUMSEU
 SCiKxpHj+JHFY1wH3MRQNMJ5HSk/cLazX39PrZyyiXN58CodCeZt1wt3SWRo/C1Uxzjb
 85lcAG7p14KCUpSfX5wg/YAkEOLkIj0+W5ZThoW+onuquBnFc4POvVAS4p4blB7gHoUP
 300A==
X-Gm-Message-State: AJIora/u//BffhCAVM4DSl5tvaLvYnVoCaUT2ZpkAB85DWPBDPbPmO2P
 2kppWapDtWjmqfiYDFVPIkMb7Yyg7JCxf61mRWkmX0ICYp3s1Hv7t59rVWRmiW6avpvwNzirSip
 uLhXpJqCt5zi28Mg=
X-Received: by 2002:a05:6820:1886:b0:434:7842:bd6 with SMTP id
 bm6-20020a056820188600b0043478420bd6mr4409632oob.23.1657573902847; 
 Mon, 11 Jul 2022 14:11:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tscn8KYRhYFpcbTafZI6lg9h9WmOd/UTR4IrHVxRveJ/fMyulCUX8gd1Zq8mIQGht+SqJoqQ==
X-Received: by 2002:a05:6820:1886:b0:434:7842:bd6 with SMTP id
 bm6-20020a056820188600b0043478420bd6mr4409620oob.23.1657573902638; 
 Mon, 11 Jul 2022 14:11:42 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:d647:bb68:29a5:e512:2c8b])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a0568080a8700b00339eb701c6csm3140343oij.41.2022.07.11.14.11.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 14:11:42 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] migration/multifd: Report to user when zerocopy not
 working
Date: Mon, 11 Jul 2022 18:11:13 -0300
Message-Id: <20220711211112.18951-4-leobras@redhat.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711211112.18951-1-leobras@redhat.com>
References: <20220711211112.18951-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Some errors, like the lack of Scatter-Gather support by the network
interface(NETIF_F_SG) may cause sendmsg(...,MSG_ZEROCOPY) to fail on using
zero-copy, which causes it to fall back to the default copying mechanism.

After each full dirty-bitmap scan there should be a zero-copy flush
happening, which checks for errors each of the previous calls to
sendmsg(...,MSG_ZEROCOPY). If all of them failed to use zero-copy, then
increment dirty_sync_missed_zero_copy migration stat to let the user know
about it.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/ram.h     | 2 ++
 migration/multifd.c | 2 ++
 migration/ram.c     | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/migration/ram.h b/migration/ram.h
index ded0a3a086..d3c7eb96f5 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -87,4 +87,6 @@ void ram_write_tracking_prepare(void);
 int ram_write_tracking_start(void);
 void ram_write_tracking_stop(void);
 
+void dirty_sync_missed_zero_copy(void);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..3909b34967 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -624,6 +624,8 @@ int multifd_send_sync_main(QEMUFile *f)
             if (ret < 0) {
                 error_report_err(err);
                 return -1;
+            } else if (ret == 1) {
+                dirty_sync_missed_zero_copy();
             }
         }
     }
diff --git a/migration/ram.c b/migration/ram.c
index 01f9cc1d72..db948c4787 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -407,6 +407,11 @@ static void ram_transferred_add(uint64_t bytes)
     ram_counters.transferred += bytes;
 }
 
+void dirty_sync_missed_zero_copy(void)
+{
+    ram_counters.dirty_sync_missed_zero_copy++;
+}
+
 /* used by the search for pages to send */
 struct PageSearchStatus {
     /* Current block being searched */
-- 
2.37.0


