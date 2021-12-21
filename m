Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1F47C3D1
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:35:43 +0100 (CET)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzi74-0004xJ-H2
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:35:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4k-0003Ue-DK
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mzi4g-0004r6-7A
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:33:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640104388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y5oX9qzG39mxZevA0tFyDwIjiq2HrlVXDbm0BWWuoI=;
 b=ZNXkh3fqLFCsrs31DUMRLcUgpkhWymNc4u5nVCb3o1ChTG3DNV128yKSksvS8dMQe8OCI6
 32vQGx5arsMDJWDbNQ64r16rfxRohIsgCFedsEtuHgPM4sIBFlwMu6WA9N6Aa/SlpzyOax
 QKYMXo36nFl772eDPOuc4FIUzYPZih0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-uA8x1IWFOBa79ypL7uhf0Q-1; Tue, 21 Dec 2021 11:33:05 -0500
X-MC-Unique: uA8x1IWFOBa79ypL7uhf0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA3C5101F003;
 Tue, 21 Dec 2021 16:33:03 +0000 (UTC)
Received: from avogadro.lan (unknown [10.39.193.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECC1210911A5;
 Tue, 21 Dec 2021 16:33:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] meson: reuse common_user_inc when building files specific
 to user-mode emulators
Date: Tue, 21 Dec 2021 17:32:58 +0100
Message-Id: <20211221163300.453146-2-pbonzini@redhat.com>
In-Reply-To: <20211221163300.453146-1-pbonzini@redhat.com>
References: <20211221163300.453146-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: lvivier@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index f45ecf31bd..b0af02b805 100644
--- a/meson.build
+++ b/meson.build
@@ -2897,6 +2897,7 @@ foreach target : target_dirs
   else
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
+    target_inc += common_user_inc
     qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
@@ -2905,7 +2906,6 @@ foreach target : target_dirs
     endif
     if 'CONFIG_LINUX_USER' in config_target
       base_dir = 'linux-user'
-      target_inc += include_directories('linux-user/host/' / host_arch)
     endif
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
-- 
2.33.1



