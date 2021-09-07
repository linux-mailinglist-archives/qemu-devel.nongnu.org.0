Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCFD40291A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:42:40 +0200 (CEST)
Received: from localhost ([::1]:47196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaQx-0003J9-O2
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAf-0000DY-13
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAd-0000Ax-J4
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VDwZXCjEM5XnH20/7boa1NK72U/Rb4QIQRCe6M3ph1g=;
 b=bZ864QX5yTWPq4lb6r5Qf/zgw61rpAGzr9D2e9voe2QSMQOfjVaLPFnvaQ+jJ/fW5cxhTF
 0cRMqMXl/DB2ckfEGNvgbQ4mPx4jVVlpn1Zho6kU4eDZhPREY0iRg0rpttDf4HKCZcUEoi
 dU6I/1YcuXAWld+vqeekCA0ong+X61A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-c5z-wWgcOx-MaXSjRkIz3w-1; Tue, 07 Sep 2021 08:25:46 -0400
X-MC-Unique: c5z-wWgcOx-MaXSjRkIz3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F040194092C
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:25:45 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE6B68D7A;
 Tue,  7 Sep 2021 12:25:35 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 26/32] qga/rust: check the Rust C binding
Date: Tue,  7 Sep 2021 16:19:37 +0400
Message-Id: <20210907121943.3498701-27-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Compare the matching C and the Rust C ABI FFI dumps.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/qga/meson.build b/qga/meson.build
index fd840f5c73..f2064c1874 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -96,6 +96,11 @@ if with_rust
                                            'qapi-cabi-rs',
                                            '--', '--cfg', 'QAPI_CABI'])
 
+  test('QGA CABI',
+       diff_commands,
+       args: [qga_qapi_cabi.full_path(), cargo_qga_cabi.full_path()],
+       depends: [qga_qapi_cabi, cargo_qga_cabi],
+       suite: ['qga'])
 endif
 
 qga = executable('qemu-ga', qga_ss.sources(),
-- 
2.33.0.113.g6c40894d24


