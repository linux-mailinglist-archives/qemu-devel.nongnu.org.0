Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493E85F7724
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:59:44 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogl4x-0004b3-Cd
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktt-0005PW-Ok
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktp-00036M-CA
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iMx0BlH40I5oytPM1g8+WFNlkj+8vJwA5jh1izJZAZY=;
 b=UHd3HunOR0VQ9LS3a0Ythks6Uw3zM4WnsBRMxbKAZaIsEwfADD2G6Vc0zkCLp61FeXXXtW
 lFizuuBsCtwVwphHzlNrv5q57hyIruB+0PsCcCm3D9VkHe/uoCOEl/7Dd5KaiVJ5P2+jcF
 Uj4InNnmgeNkLs3ncAgaRKJqlkhf8Ls=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-YNRH_wx9PcuDQs2jkYpPOA-1; Fri, 07 Oct 2022 06:48:06 -0400
X-MC-Unique: YNRH_wx9PcuDQs2jkYpPOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9468F1C0515C;
 Fri,  7 Oct 2022 10:48:06 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFE372024CBB;
 Fri,  7 Oct 2022 10:48:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 06/50] nbd: remove incorrect coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:08 +0200
Message-Id: <20221007104752.141361-7-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Paolo Bonzini <pbonzini@redhat.com>

nbd_co_establish_connection_cancel() cancels a coroutine but is not called
from coroutine context itself, for example in nbd_cancel_in_flight()
and in timer callbacks reconnect_delay_timer_cb() and open_timer_cb().

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-5-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index c74b7a9d2e..4ede3b2bd0 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -424,6 +424,6 @@ QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                             bool blocking, Error **errp);
 
-void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
 #endif
-- 
2.37.3


