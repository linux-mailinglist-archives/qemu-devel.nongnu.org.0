Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25AC5AE45D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:37:27 +0200 (CEST)
Received: from localhost ([::1]:35068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVV1F-00034O-Du
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:37:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9g-0006pA-6c
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:42:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oVU9d-0006N2-UQ
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662453716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8WwqP2iHXD1er/XMHyl6qGLc4jHDx0WUlj9QZIdWW8=;
 b=D9AFTH4O77jXg2rYMOF8SsxUgLk2efT2ZEHvgHyl/DAaI/U8fR7p2wexvXU2pvNN5rUvp8
 dJN1fzOA8h6ZhlM4CoVGsjfNw7Dl7oxzajvrdPrwtrsIKxvZScxEfhY0A3Ap0CggzNNG85
 9kBIkehHZtzLUGIo3qkRnguTDR064pU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-L50WOxKtMJi5562Wn5lr7w-1; Tue, 06 Sep 2022 04:41:55 -0400
X-MC-Unique: L50WOxKtMJi5562Wn5lr7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA8C63C0E200
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 08:41:54 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14D47C15BB3;
 Tue,  6 Sep 2022 08:41:53 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>
Subject: [PATCH 05/11] crypto: strengthen the check for key slots overlapping
 with LUKS header
Date: Tue,  6 Sep 2022 09:41:41 +0100
Message-Id: <20220906084147.1423045-6-berrange@redhat.com>
In-Reply-To: <20220906084147.1423045-1-berrange@redhat.com>
References: <20220906084147.1423045-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The LUKS header data on disk is a fixed size, however, there's expected
to be a gap between the end of the header and the first key slot to get
alignment with the 2nd sector on 4k drives. This wasn't originally part
of the LUKS spec, but was always part of the reference implementation,
so it is worth validating this.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/block-luks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index f22bc63e54..e6ee8506b2 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -602,7 +602,7 @@ qcrypto_block_luks_check_header(const QCryptoBlockLUKS *luks, Error **errp)
             return -1;
         }
 
-        if (start1 < DIV_ROUND_UP(sizeof(QCryptoBlockLUKSHeader),
+        if (start1 < DIV_ROUND_UP(QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET,
                                   QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) {
             error_setg(errp,
                        "Keyslot %zu is overlapping with the LUKS header",
-- 
2.37.2


