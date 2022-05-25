Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4726533D0B
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 14:56:36 +0200 (CEST)
Received: from localhost ([::1]:45220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntqYh-0004bB-Uw
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 08:56:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqRy-00088W-3p
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ntqRw-0001RP-Jv
 for qemu-devel@nongnu.org; Wed, 25 May 2022 08:49:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653482956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rU7l8xlD2MeuxNA1qZCXLl42flQoNt46o75cEXPKe8o=;
 b=IicxF2/0OBRiijmjLXDg+SmL7DZlDvo2q9NiIhsHexymVdSOFikfJMTrOZbukoiEpaCdrF
 hh1qoTyIqxJZSrX6WoJbyIZXKVUB8ESR7tmmst/wdiczdGAnHjSnDdpi8ZwdGp9akqf+3v
 T2b/wAk5fGRVmcK2J51qAMC+vXUrgLU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-fESqEJhPMeSXxt_CNMFxCA-1; Wed, 25 May 2022 08:49:12 -0400
X-MC-Unique: fESqEJhPMeSXxt_CNMFxCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C6B780159B;
 Wed, 25 May 2022 12:49:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C583C159B3;
 Wed, 25 May 2022 12:49:11 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 <qemu-block@nongnu.org>, Liu Yiding <liuyd.fnst@fujitsu.com>,
 Vivek Goyal <vgoyal@redhat.com>
Subject: [PULL 1/1] docs: Correct the default thread-pool-size
Date: Wed, 25 May 2022 13:49:09 +0100
Message-Id: <20220525124909.867787-2-stefanha@redhat.com>
In-Reply-To: <20220525124909.867787-1-stefanha@redhat.com>
References: <20220525124909.867787-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Refer to 26ec190964 virtiofsd: Do not use a thread pool by default

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Acked-by: Vivek Goyal <vgoyal@redhat.com>
Message-id: 20220413042054.1484640-1-liuyd.fnst@fujitsu.com
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/tools/virtiofsd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index e457b13d56..5f5ac9dd56 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -132,7 +132,7 @@ Options
 .. option:: --thread-pool-size=NUM
 
   Restrict the number of worker threads per request queue to NUM.  The default
-  is 64.
+  is 0.
 
 .. option:: --cache=none|auto|always
 
-- 
2.36.1


