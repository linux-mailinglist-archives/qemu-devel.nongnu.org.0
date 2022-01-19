Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76746493F36
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:43:12 +0100 (CET)
Received: from localhost ([::1]:55840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEzH-0007RJ-JY
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbM-0002AT-NW
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nAEbJ-00005d-SN
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKqSfJX1eSL3Y5vEMztTEg55ka0gOaU3BSMULpZ81VU=;
 b=B5EFwgf5uA4k3S7Zhw6gUzzMLsKLt2PUXVBh3mMeW3Qtohr17bw7EwJ5L1siNn8vnpRF/R
 LGW/6ZZtf6qJlV735cOCjikoYg8IP/zESxKjgqZaOa6MCoEuASwA4ZlFoBgbfL6y1pZYVg
 KCM/xxvhWCIiXJkR+llX8dV9TMn+MBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-rFg3uYP2Pu2wFhRXwaeWdg-1; Wed, 19 Jan 2022 12:18:05 -0500
X-MC-Unique: rFg3uYP2Pu2wFhRXwaeWdg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B10E1966321;
 Wed, 19 Jan 2022 17:18:05 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.194.80])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD057F80D;
 Wed, 19 Jan 2022 17:18:03 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] meson: Don't force use of libgcrypt-config
Date: Wed, 19 Jan 2022 18:17:58 +0100
Message-Id: <20220119171800.491703-2-abologna@redhat.com>
In-Reply-To: <20220119171800.491703-1-abologna@redhat.com>
References: <20220119171800.491703-1-abologna@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=abologna@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

libgcrypt 1.9.0 (released in 2021-01) ships with a proper
pkg-config file, which Meson's libgcrypt detection code can use
if available.

Passing 'config-tool' as 'method' when calling dependency(),
however, forces Meson to ignore the pkg-config file and always
use libgcrypt-config instead.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
---
 meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meson.build b/meson.build
index 762d7cee85..bc17ba67fd 100644
--- a/meson.build
+++ b/meson.build
@@ -1036,7 +1036,6 @@ endif
 if not gnutls_crypto.found()
   if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
     gcrypt = dependency('libgcrypt', version: '>=1.8',
-                        method: 'config-tool',
                         required: get_option('gcrypt'),
                         kwargs: static_kwargs)
     # Debian has removed -lgpg-error from libgcrypt-config
-- 
2.34.1


