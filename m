Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A4559E3F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 18:15:05 +0200 (CEST)
Received: from localhost ([::1]:58024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4lxY-0002mC-Gk
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 12:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lRC-0006fi-Kr
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1o4lR8-0000uZ-GT
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656085293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BU9K3IOvrk1T3eT2STc7Mv7/W0/S/Y+dlLuFQAJhhnQ=;
 b=e8+cZiK+Hd70vaTM+OIS2R743bipQaqbmcrlF/oaXUSDbCm0YF67CQjMYRTP/dmKlcgsP+
 CDEMas1yXKoehCXMnCcsfwnbTZcJdfpUP43p1nvoReyJ9LdDiBp/CQndqyTGqFMbT+AsPs
 x6dCf8i2ICH3FCO9Qqug1XNb/L5N8N0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-1zUJH27kNc-ZzNkfYVNLFg-1; Fri, 24 Jun 2022 11:41:30 -0400
X-MC-Unique: 1zUJH27kNc-ZzNkfYVNLFg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42F52811E75;
 Fri, 24 Jun 2022 15:41:30 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3334492C3B;
 Fri, 24 Jun 2022 15:41:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL v2 18/20] nbd: Drop dead code spotted by Coverity
Date: Fri, 24 Jun 2022 17:41:01 +0200
Message-Id: <20220624154103.185902-19-kwolf@redhat.com>
In-Reply-To: <20220624154103.185902-1-kwolf@redhat.com>
References: <20220624154103.185902-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Eric Blake <eblake@redhat.com>

CID 1488362 points out that the second 'rc >= 0' check is now dead
code.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 172f5f1a40(nbd: remove peppering of nbd_client_connected)
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20220516210519.76135-1-eblake@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/nbd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 6085ab1d2c..7f5f50ec46 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -521,12 +521,8 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
     if (qiov) {
         qio_channel_set_cork(s->ioc, true);
         rc = nbd_send_request(s->ioc, request);
-        if (rc >= 0) {
-            if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
-                                       NULL) < 0) {
-                rc = -EIO;
-            }
-        } else if (rc >= 0) {
+        if (rc >= 0 && qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
+                                              NULL) < 0) {
             rc = -EIO;
         }
         qio_channel_set_cork(s->ioc, false);
-- 
2.35.3


