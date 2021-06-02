Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3458D39834B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:41:32 +0200 (CEST)
Received: from localhost ([::1]:42624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLVL-0001oJ-7E
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQj-0000LU-1K
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQc-0003vz-FW
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NgRKcLK9qdYY7w/xFFlwcjUzNjE5viejz2sZhpICtfc=;
 b=IL4oU+QvdtZu/0neHyGINzoVOCAuaodTVyDuvWn3WavB2w2BiNwBlomqQdHrB8XNV9qEjl
 Ptnc6ModMUghbChtdiPrAv7sQ6Si304y5oFlZicoXtFrvXvh9nUIKg2JM++hkCDWp0DiUA
 mAqxk0cM5jdyjt28aGFX37qc0nqzs4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-uxb0VdW6Oaq-i-szA47UUw-1; Wed, 02 Jun 2021 03:36:35 -0400
X-MC-Unique: uxb0VdW6Oaq-i-szA47UUw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EEB1800D55;
 Wed,  2 Jun 2021 07:36:34 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F8E65C729;
 Wed,  2 Jun 2021 07:36:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/17] crypto: drop used conditional check
Date: Wed,  2 Jun 2021 09:36:01 +0200
Message-Id: <20210602073606.338994-13-thuth@redhat.com>
In-Reply-To: <20210602073606.338994-1-thuth@redhat.com>
References: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The condition being tested has never been set since the day the code was
first introduced.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210514120415.1368922-8-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 crypto/tlscredsx509.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index bc503bab55..d9d6f4421e 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -354,11 +354,9 @@ qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
             reason = "The certificate has been revoked";
         }
 
-#ifndef GNUTLS_1_0_COMPAT
         if (status & GNUTLS_CERT_INSECURE_ALGORITHM) {
             reason = "The certificate uses an insecure algorithm";
         }
-#endif
 
         error_setg(errp,
                    "Our own certificate %s failed validation against %s: %s",
-- 
2.27.0


