Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6528A40F41D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 10:28:34 +0200 (CEST)
Received: from localhost ([::1]:43298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR9EX-0006UO-BZ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 04:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9AW-0008VM-Ef
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mR9AU-0007Jm-O0
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 04:24:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=giCF5X6QHuaxy/rFHVj3LrYnzOy90fLAR9fPHT3E0J4=;
 b=S35194PYfoOOBISum3m7wHFWoZZopfGDD6VN2iKg7IaIUWg4tBov2Z5S+kL8QEXOov0K0H
 uY3LFBgQ989YpHi67h9hl7WMusQ6GigRGAhNz55ono0llFGSuTfex4l5QMWfXQ+tucwDis
 lI6uXSXnl00ygd+xF4oMijkI2PwluKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Zr_lwUVMNKCZU5AG3hf4jA-1; Fri, 17 Sep 2021 04:24:20 -0400
X-MC-Unique: Zr_lwUVMNKCZU5AG3hf4jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75710835DE0;
 Fri, 17 Sep 2021 08:24:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91C435D6B1;
 Fri, 17 Sep 2021 08:24:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 1/2] ebpf: only include in system emulators
Date: Fri, 17 Sep 2021 16:24:11 +0800
Message-Id: <20210917082412.75470-2-jasowang@redhat.com>
In-Reply-To: <20210917082412.75470-1-jasowang@redhat.com>
References: <20210917082412.75470-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

eBPF files are being included in user emulators, which is useless and
also breaks compilation because ebpf/trace-events is only processed
if a system emulator is included in the build.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 ebpf/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/meson.build b/ebpf/meson.build
index 9cd0635..2dd0fd8 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1 @@
-common_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
+softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.7.4


