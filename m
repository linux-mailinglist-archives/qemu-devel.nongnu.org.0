Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD8C270F49
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Sep 2020 18:08:04 +0200 (CEST)
Received: from localhost ([::1]:46580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJfP9-0005ZM-Lm
	for lists+qemu-devel@lfdr.de; Sat, 19 Sep 2020 12:08:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfGt-00059s-I2
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:59:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:20855
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJfGq-0007LP-QT
 for qemu-devel@nongnu.org; Sat, 19 Sep 2020 11:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600531168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvAHEXTUBzeIY8mtVJqgNnwDgQ8RGKYkHR8gkOm0/zo=;
 b=Mayj/sNb7k4xZiJx/8r6OA6RBwUbk2tQUzJLNZGrAvZtqJTwkQ0uwblws1mXygBcaWiOyB
 0TXAwTvhOdDA2MVBUPzxz4JvUbSW5iap4Bgrkt8i5YnuL76xKLZ+OqzsT2X/faRpH6C7PS
 BFnFbp0jxJ33wgkcNCPy1qTs/SPUyPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-iQrqmAWaNdSgOJLw0scd3Q-1; Sat, 19 Sep 2020 11:59:24 -0400
X-MC-Unique: iQrqmAWaNdSgOJLw0scd3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FE41074644
 for <qemu-devel@nongnu.org>; Sat, 19 Sep 2020 15:59:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C966410016DA;
 Sat, 19 Sep 2020 15:59:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/57] meson: fix MSI rule
Date: Sat, 19 Sep 2020 11:58:24 -0400
Message-Id: <20200919155916.1046398-6-pbonzini@redhat.com>
In-Reply-To: <20200919155916.1046398-1-pbonzini@redhat.com>
References: <20200919155916.1046398-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 11:26:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The environment variables can't be passed through an env: argument
yet (meson#2723), use 'env' as suggested in:
https://github.com/mesonbuild/meson/issues/2723#issuecomment-348630957

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qga/meson.build b/qga/meson.build
index e5c5778a3e..c10a0526b2 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -70,6 +70,7 @@ if targetos == 'windows'
                             output: 'qemu-ga-@0@.msi'.format(config_host['ARCH']),
                             depends: deps,
                             command: [
+                              find_program('env'),
                               'QEMU_GA_VERSION=' + config_host['QEMU_GA_VERSION'],
                               'QEMU_GA_MANUFACTURER=' + config_host['QEMU_GA_MANUFACTURER'],
                               'QEMU_GA_DISTRO=' + config_host['QEMU_GA_DISTRO'],
-- 
2.26.2



