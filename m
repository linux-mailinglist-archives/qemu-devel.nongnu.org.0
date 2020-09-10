Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C11126434D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 12:09:41 +0200 (CEST)
Received: from localhost ([::1]:57320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGJWO-0006KK-EI
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 06:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGJTS-0000DQ-AL
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 06:06:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kGJTQ-0007h0-I3
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 06:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599732396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VbA/0OZZqYQXGOKSJcnbgEpaJYkroA6FF95iuoW/fyc=;
 b=aSBsCPChqyHaRG+y/bsFg8KfdmuoIv2/iX/QHv99cUt2JfEJZtVK/qzDayqPY5ZiAavuiE
 RouAgRJBLRxHGjlLOFKr4kn7gkt9jef8cpsD2WJbe3JUo18gPyaW3NP2ShS5Df0Dsrivb9
 cqICxO0WIiF0BzCdzLeukCA9su9kYtk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-beKPAsqGMwyrFiUs6GdnWg-1; Thu, 10 Sep 2020 06:06:33 -0400
X-MC-Unique: beKPAsqGMwyrFiUs6GdnWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC8A118BA283;
 Thu, 10 Sep 2020 10:06:32 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-4.ams2.redhat.com
 [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC33E1002D41;
 Thu, 10 Sep 2020 10:06:31 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/17] crypto/nettle: Fix xts_encrypt arguments
Date: Thu, 10 Sep 2020 11:06:11 +0100
Message-Id: <20200910100623.1088965-6-berrange@redhat.com>
In-Reply-To: <20200910100623.1088965-1-berrange@redhat.com>
References: <20200910100623.1088965-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 03:02:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The fourth argument to xts_encrypt should be the decrypt
callback; we were accidentally passing encrypt twice.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-nettle.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/cipher-nettle.c.inc b/crypto/cipher-nettle.c.inc
index 256931a823..0404cfc6da 100644
--- a/crypto/cipher-nettle.c.inc
+++ b/crypto/cipher-nettle.c.inc
@@ -632,7 +632,7 @@ qcrypto_nettle_cipher_encrypt(QCryptoCipher *cipher,
     case QCRYPTO_CIPHER_MODE_XTS:
 #ifdef CONFIG_QEMU_PRIVATE_XTS
         xts_encrypt(ctx->ctx, ctx->ctx_tweak,
-                    ctx->alg_encrypt_wrapper, ctx->alg_encrypt_wrapper,
+                    ctx->alg_encrypt_wrapper, ctx->alg_decrypt_wrapper,
                     ctx->iv, len, out, in);
 #else
         xts_encrypt_message(ctx->ctx, ctx->ctx_tweak,
-- 
2.26.2


