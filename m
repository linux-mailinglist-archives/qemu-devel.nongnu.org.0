Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 022724964AC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:58:44 +0100 (CET)
Received: from localhost ([::1]:41798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAyBP-0008CT-46
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:58:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNM-0008GX-U6
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxNK-0000Up-MO
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Zu0le7ww2is+iI+MZm0kwCNFz8yC2guzWVhSaHUvLk=;
 b=Hnuu4Gg+pzb1RK2HoXbpd0CizUzPy1FvBbi7YOEXtgb0NcvS+SjVNbuG7q7RFEt/M1q9W1
 aBgyXB3vViObvxLKlSBMjoBwkiZ5CCiiy3ruN4zpxwcXpbVm/UlB9PRNj7VKsCIqgNjL4d
 kIrHL9lpiQcvd3gJVq90yfQ0eGflEKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-cOKGrxYuPn25n2sK_-PR-w-1; Fri, 21 Jan 2022 12:06:54 -0500
X-MC-Unique: cOKGrxYuPn25n2sK_-PR-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 849BF363A7;
 Fri, 21 Jan 2022 17:06:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5D1C7EBE8;
 Fri, 21 Jan 2022 17:06:50 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 30/33] include/block/block_int-common.h: introduce
 bdrv_amend_pre_run and bdrv_amend_clean
Date: Fri, 21 Jan 2022 12:05:41 -0500
Message-Id: <20220121170544.2049944-31-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two callbacks will be invoked by job callbacks to execute
driver-specific code while still being in BQL.
In this example, we want the amend JobDriver to execute the
permission check (bdrv_child_refresh_perms) currently only
done in block/crypto.c block_crypto_amend_options_generic_luks()
to all its bdrv.
This is achieved by introducing callbacks in the JobDriver, but
we also need to make sure that crypto->updating_keys is true
before refreshing the permissions the first time, so that
WRITE perm is temporarly given to qcrypto_block_amend_options(),
and set it to false when permissions are restored.

Therefore bdrv_amend_pre_run() and bdrv_amend_clean() will take care of
just temporarly setting the crypto-specific updating_keys flag.

Note that at this stage, they are not yet invoked.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/crypto.c                   | 16 ++++++++++++++++
 include/block/block_int-common.h | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..f5e0c7b7c0 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -777,6 +777,20 @@ block_crypto_get_specific_info_luks(BlockDriverState *bs, Error **errp)
     return spec_info;
 }
 
+static void
+block_crypto_amend_pre_run(BlockDriverState *bs)
+{
+    BlockCrypto *crypto = bs->opaque;
+    crypto->updating_keys = true;
+}
+
+static void
+block_crypto_amend_cleanup(BlockDriverState *bs)
+{
+    BlockCrypto *crypto = bs->opaque;
+    crypto->updating_keys = false;
+}
+
 static int
 block_crypto_amend_options_generic_luks(BlockDriverState *bs,
                                         QCryptoBlockAmendOptions *amend_options,
@@ -931,6 +945,8 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_get_specific_info = block_crypto_get_specific_info_luks,
     .bdrv_amend_options = block_crypto_amend_options_luks,
     .bdrv_co_amend      = block_crypto_co_amend_luks,
+    .bdrv_amend_pre_run       = block_crypto_amend_pre_run,
+    .bdrv_amend_clean         = block_crypto_amend_cleanup,
 
     .is_format          = true,
 
diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index cc8c8835ba..9d28396978 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -189,6 +189,19 @@ struct BlockDriver {
      * the GS API.
      */
 
+    /*
+     * Called inside job->pre_run() callback, it is useful
+     * to perform driver-specific initialization code under
+     * BQL, like setting up specific permission flags.
+     */
+    void (*bdrv_amend_pre_run)(BlockDriverState *bs);
+    /*
+     * Called inside job->clean() callback, it undoes
+     * the driver-specific initialization code done in amend_pre_run.
+     * Also this function is under BQL.
+     */
+    void (*bdrv_amend_clean)(BlockDriverState *bs);
+
     /*
      * Return true if @to_replace can be replaced by a BDS with the
      * same data as @bs without it affecting @bs's behavior (that is,
-- 
2.31.1


