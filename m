Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334F35F775C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:23:44 +0200 (CEST)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglS9-0006Rp-Uw
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktj-0005Ld-CP
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkth-00034g-0p
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KH9ecPfpCDGtNqTteMztaemnMjGKkKmgqXChdWnE9Ro=;
 b=OmuO5PvHqlky91WLQtirsoqMLKcnlY6EaEawzUB88W48EQiGXUf1ipWZfHCeyIHs6u/LQ+
 h/SdB5BS3f3FS+merHTlGN5+ZjvJHJEnEnIgOFQ3zguqTnmDhCT4/7XQIvKgZwLKchta50
 vY4Xf/hheuQPlK1q0M6LANffFxaKSRg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-ZePZvM9DN7GSVyklyvZLuQ-1; Fri, 07 Oct 2022 06:48:03 -0400
X-MC-Unique: ZePZvM9DN7GSVyklyvZLuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A46D0382624C;
 Fri,  7 Oct 2022 10:48:02 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E44A62028DC1;
 Fri,  7 Oct 2022 10:48:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 02/50] coroutine: Drop coroutine_fn annotation from
 qemu_coroutine_self()
Date: Fri,  7 Oct 2022 12:47:04 +0200
Message-Id: <20221007104752.141361-3-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

qemu_coroutine_self() can be called from outside coroutine context,
returning the leader coroutine, and several such invocations currently
exist (mostly in qcow2 tracing calls).

Signed-off-by: Alberto Faria <afaria@redhat.com>
Message-Id: <20221005175209.975797-1-afaria@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 08c5bb3c76..414b677302 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -97,7 +97,7 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
 /**
  * Get the currently executing coroutine
  */
-Coroutine *coroutine_fn qemu_coroutine_self(void);
+Coroutine *qemu_coroutine_self(void);
 
 /**
  * Return whether or not currently inside a coroutine
-- 
2.37.3


