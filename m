Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3403682DB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:57:38 +0200 (CEST)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZalt-0008WU-1I
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajY-0007gR-7c
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lZajV-0000Kb-Ei
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619103307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cO+eCaUPcKADp1gobu7hh4iVwLzANmkFtCy3IrD9vUs=;
 b=Mc3YQr2JFVLSTMgih749+RFfKb6DT//hjGnj+OSlNl5Z6hpwK3Uwldg7oFo/OPU5OcbysO
 9sajrKMySiusxZFonudADoNng50AGKBR5SjHHAAExZ4rEhJQR7BIk7v2l/MRV8mtjyR7Ao
 iEGn0hVvokKPYZ892gxkwfYvIXp7bNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Wohl_EjzNDi-JQgjqVK5ag-1; Thu, 22 Apr 2021 10:55:03 -0400
X-MC-Unique: Wohl_EjzNDi-JQgjqVK5ag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D686883DD33;
 Thu, 22 Apr 2021 14:53:46 +0000 (UTC)
Received: from localhost (ovpn-113-187.ams2.redhat.com [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1625F5D9C6;
 Thu, 22 Apr 2021 14:53:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/2] block/export: Free ignored Error
Date: Thu, 22 Apr 2021 16:53:34 +0200
Message-Id: <20210422145335.65814-2-mreitz@redhat.com>
In-Reply-To: <20210422145335.65814-1-mreitz@redhat.com>
References: <20210422145335.65814-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When invoking block-export-add with some iothread and
fixed-iothread=false, and changing the node's iothread fails, the error
is supposed to be ignored.

However, it is still stored in *errp, which is wrong.  If a second error
occurs, the "*errp must be NULL" assertion in error_setv() fails:

  qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion
  `*errp == NULL' failed.

So the error from bdrv_try_set_aio_context() must be freed when it is
ignored.

Fixes: f51d23c80af73c95e0ce703ad06a300f1b3d63ef
       ("block/export: add iothread and fixed-iothread options")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/export/export.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/block/export/export.c b/block/export/export.c
index fec7d9f738..ce5dd3e59b 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -68,6 +68,7 @@ static const BlockExportDriver *blk_exp_find_driver(BlockExportType type)
 
 BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
 {
+    ERRP_GUARD();
     bool fixed_iothread = export->has_fixed_iothread && export->fixed_iothread;
     const BlockExportDriver *drv;
     BlockExport *exp = NULL;
@@ -127,6 +128,9 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
             ctx = new_ctx;
         } else if (fixed_iothread) {
             goto fail;
+        } else {
+            error_free(*errp);
+            *errp = NULL;
         }
     }
 
-- 
2.30.2


