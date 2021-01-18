Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C42F9FA6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:31:24 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tgq-00080r-1Q
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1Tex-00073y-TH
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:29:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1l1Tel-0001Ci-E1
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610972952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hVkbCDDe6GP/snPuyUbCebZQ1YhfYX9em7wyDOa37Rk=;
 b=aAcFUOxtNdnQjutLQZ+sC40ksAnxoP8/ignSNI7gghm4Q5jFcArQsFe8Nk6RUfwal3Jlp2
 yV7Mo8h5fMU74id23SAjhNxHH93l8q1foitrdOsg8OHHVkwXJ8dhkRtPrxmfNImFVQIW/z
 418h2dUIkqTrOhFhMGeC24sQyFqgzi8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-5h78o7Y5NSmZE9d04HzywQ-1; Mon, 18 Jan 2021 07:29:10 -0500
X-MC-Unique: 5h78o7Y5NSmZE9d04HzywQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BC21107ACE3;
 Mon, 18 Jan 2021 12:29:09 +0000 (UTC)
Received: from kaapi (unknown [10.40.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1715160861;
 Mon, 18 Jan 2021 12:29:05 +0000 (UTC)
Date: Mon, 18 Jan 2021 17:59:00 +0530 (IST)
From: P J P <ppandit@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] ide: atapi: check logical block address and read size
 (CVE-2020-29443)
In-Reply-To: <7b7771b7-cdba-01a4-67a7-c9cb3e9e33ca@redhat.com>
Message-ID: <s218282-33rp-63nn-q469-6s3227353nsq@erqung.pbz>
References: <20210118063229.442350-1-ppandit@redhat.com>
 <cdd8168a-3362-e038-8e7e-0a082a2f1917@redhat.com>
 <4q98o1s-r5r4-14s9-nnr4-4p2q16roqro@erqung.pbz>
 <7b7771b7-cdba-01a4-67a7-c9cb3e9e33ca@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Wenxiang Qian <leonwxqian@gmail.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+-- On Mon, 18 Jan 2021, Paolo Bonzini wrote --+
| s->nb_sectors is in units of 512B, so the limit would be 4TB.  The purpose 
| is to limit the lba and nb_sectors arguments (which are in 2048B units) of 
| ide_atapi_cmd_read_{dma,pio} to INT_MAX.

* If it's for IDE_CD type, does the patch below look okay?
===
diff --git a/hw/ide/core.c b/hw/ide/core.c
index b49e4cfbc6..034c84b350 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -1169,7 +1169,7 @@ static void ide_cd_change_cb(void *opaque, bool load, 
Error **errp)
 
     s->tray_open = !load;
     blk_get_geometry(s->blk, &nb_sectors);
-    s->nb_sectors = nb_sectors;
+    s->nb_sectors = nb_sectors & (uint64_t)INT_MAX << 2;
 
     /*
      * First indicate to the guest that a CD has been removed.  That's
@@ -2530,6 +2530,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, 
IDEDriveKind kind,
     s->smart_errors = 0;
     s->smart_selftest_count = 0;
     if (kind == IDE_CD) {
+        s->nb_sectors &= (uint64_t)INT_MAX << 2;
         blk_set_dev_ops(blk, &ide_cd_block_ops, s);
         blk_set_guest_block_size(blk, 2048);
===

* Isn't 4TB limit more for IDE_CD type? Maybe UINT32_MAX?


Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


