Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C6430F8E8
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:03:25 +0100 (CET)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7i2O-00013v-5K
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hgG-0000su-Hf
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7hg4-0004if-Ig
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612456819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vXMSx8tBHjuAR1hOP6K8bLGwgTN6GjxBU+w/TaZl5M=;
 b=PLfFuZAbbqaUYwdB1VlUm07aBCf3Qf6I53lbyR/DYpxtmU5btHXWxHgb1FL6Z0amrBfmSa
 qlAILb0pM+rJk4li0BLaH01BG9XQvyVMhZQFaB4zGKTnJdDmcv8BjXRIeI+5Qnkenr9EMc
 7bs2WKA9iK/BdCc8nCm4cYrQJTxzFT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-0I8otypBPVOUyXK7fItCqA-1; Thu, 04 Feb 2021 11:40:17 -0500
X-MC-Unique: 0I8otypBPVOUyXK7fItCqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5EE1935790;
 Thu,  4 Feb 2021 16:40:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D781A38C;
 Thu,  4 Feb 2021 16:40:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com, berrange@redhat.com,
 gaojinhao@huawei.com, armbru@redhat.com, mst@redhat.com, philmd@redhat.com,
 wainersm@redhat.com
Subject: [PULL 04/27] migration/qemu-file: Fix maybe uninitialized on
 qemu_get_buffer_in_place()
Date: Thu,  4 Feb 2021 16:39:36 +0000
Message-Id: <20210204163959.377618-5-dgilbert@redhat.com>
In-Reply-To: <20210204163959.377618-1-dgilbert@redhat.com>
References: <20210204163959.377618-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Fixed error when compiling migration/qemu-file.c with -Werror=maybe-uninitialized
as shown here:

../migration/qemu-file.c: In function 'qemu_get_buffer_in_place':
../migration/qemu-file.c:604:18: error: 'src' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  604 |             *buf = src;
      |             ~~~~~^~~~~
cc1: all warnings being treated as errors

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210128130625.569900-1-wainersm@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index be21518c57..d6e03dbc0e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -595,7 +595,7 @@ size_t qemu_get_buffer_in_place(QEMUFile *f, uint8_t **buf, size_t size)
 {
     if (size < IO_BUF_SIZE) {
         size_t res;
-        uint8_t *src;
+        uint8_t *src = NULL;
 
         res = qemu_peek_buffer(f, &src, size, 0);
 
-- 
2.29.2


