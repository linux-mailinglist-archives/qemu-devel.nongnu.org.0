Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B364579B51
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:26:26 +0200 (CEST)
Received: from localhost ([::1]:41356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmIz-0003oE-85
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oDmGr-0000pI-Mb
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:24:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oDmGn-0003Ux-Hx
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:24:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658233448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aPtsR3S3j5ard9Ji7jOZXxYGmOs/zrd3T188Sx+XMI4=;
 b=Yt70s0sf8jNxIfnnntIP1xAVL00UT8J1kNAGZ8OpUn4aHEXHYg6ezWAIaa6PF0N8z26aAZ
 6MGmWLPKSkdUkKbd2l9h7w+OsmIpRMgITj1iEyIWBAxTCRJRtcz+3ajsq/p1sCGwmWC3c0
 1w4NQrwz1HN2VMq3utbKME7EyB4vWzM=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-rt2EbNWMNUSBzkykFIZajA-1; Tue, 19 Jul 2022 08:24:06 -0400
X-MC-Unique: rt2EbNWMNUSBzkykFIZajA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-10d7a610a64so95017fac.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPtsR3S3j5ard9Ji7jOZXxYGmOs/zrd3T188Sx+XMI4=;
 b=guWQaoJn1cG+v6VJDtBDFJt7RUQ4PwBWrMm+UoulPD2LrCBKtYALRJQfQ6JP0sV1MK
 W2X/2C3GUZQKW6zma8EqBzOL3nW2XVjndh1CByjGYRYpr9I46ITppCWBkAt85LJjO5DT
 INrNvWfgGrSZaeqZYoG3tpjalQ1se+4060vauxF0dRuap2q9lcIgAjtG08VluQR2mxs4
 hnYyyA1U3roFP3Q+ztVKk3ASdnUJVJUtFD98wymwYAnAsiO9NwjhwoaDbtVvhuPBJi5B
 ilJTlI2VGvbV6yxX7dnycRL7FkUBFh8TdTlSI+M9Yxc7uCZRioZRlloricPwVPUWdf2Y
 1uxg==
X-Gm-Message-State: AJIora+jcnkzOoN9hNowMCXcR2fitKnMLXx5wqtCnR5fAbnjwh5WCbEk
 0btNKtzysIcgaoRXPSBkyMCWc5GWCcZbvqedYj5Dle/tJYwlPl/2L19kDssd8ayJRTvepHcIW20
 DFTyrQrmUUVUbT8g=
X-Received: by 2002:a05:6870:2103:b0:101:4016:b2c6 with SMTP id
 f3-20020a056870210300b001014016b2c6mr17508994oae.32.1658233446088; 
 Tue, 19 Jul 2022 05:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vTA1s4krlAQ902AibHoNi+hp1k/6esqLlXvU9JM7z7oAPYM6awu81PunVYEfxEdJYTFj8Wdw==
X-Received: by 2002:a05:6870:2103:b0:101:4016:b2c6 with SMTP id
 f3-20020a056870210300b001014016b2c6mr17508984oae.32.1658233445850; 
 Tue, 19 Jul 2022 05:24:05 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f1:970e:3c78:65ba:6740:6ae3])
 by smtp.gmail.com with ESMTPSA id
 p83-20020acad856000000b0033a4a58fa19sm4557261oig.22.2022.07.19.05.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 05:24:05 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] migration: Avoid false-positive on non-supported
 scenarios for zero-copy-send
Date: Tue, 19 Jul 2022 09:23:45 -0300
Message-Id: <20220719122345.253713-1-leobras@redhat.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Migration with zero-copy-send currently has it's limitations, as it can't
be used with TLS nor any kind of compression. In such scenarios, it should
output errors during parameter / capability setting.

But currently there are some ways of setting this not-supported scenarios
without printing the error message:

!) For 'compression' capability, it works by enabling it together with
zero-copy-send. This happens because the validity test for zero-copy uses
the helper unction migrate_use_compression(), which check for compression
presence in s->enabled_capabilities[MIGRATION_CAPABILITY_COMPRESS].

The point here is: the validity test happens before the capability gets
enabled. If all of them get enabled together, this test will not return
error.

In order to fix that, replace migrate_use_compression() by directly testing
the cap_list parameter migrate_caps_check().

2) For features enabled by parameters such as TLS & 'multifd_compression',
there was also a possibility of setting non-supported scenarios: setting
zero-copy-send first, then setting the unsupported parameter.

In order to fix that, also add a check for parameters conflicting with
zero-copy-send on migrate_params_check().

3) XBZRLE is also a compression capability, so it makes sense to also add
it to the list of capabilities which are not supported with zero-copy-send.

Fixes: 1abaec9a1b2c ("migration: Change zero_copy_send from migration parameter to migration capability")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/migration.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 78f5057373..c6260e54bf 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1274,7 +1274,9 @@ static bool migrate_caps_check(bool *cap_list,
 #ifdef CONFIG_LINUX
     if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND] &&
         (!cap_list[MIGRATION_CAPABILITY_MULTIFD] ||
-         migrate_use_compression() ||
+         cap_list[MIGRATION_CAPABILITY_COMPRESS] ||
+         cap_list[MIGRATION_CAPABILITY_XBZRLE] ||
+         migrate_multifd_compression() ||
          migrate_use_tls())) {
         error_setg(errp,
                    "Zero copy only available for non-compressed non-TLS multifd migration");
@@ -1511,6 +1513,17 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
         error_prepend(errp, "Invalid mapping given for block-bitmap-mapping: ");
         return false;
     }
+
+#ifdef CONFIG_LINUX
+    if (migrate_use_zero_copy_send() &&
+        ((params->has_multifd_compression && params->multifd_compression) ||
+         (params->has_tls_creds && params->tls_creds && *params->tls_creds))) {
+        error_setg(errp,
+                   "Zero copy only available for non-compressed non-TLS multifd migration");
+        return false;
+    }
+#endif
+
     return true;
 }
 
-- 
2.37.1


