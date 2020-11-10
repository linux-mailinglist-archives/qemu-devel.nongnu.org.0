Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78DD2AD588
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:45:18 +0100 (CET)
Received: from localhost ([::1]:35416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcS5N-0006jc-R1
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRpw-0007Jk-Uy
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRpt-0001bp-OI
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605007756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ushcjN77hW0DH/FdTQOmHmkRzbg59lIqm6mDE7smTss=;
 b=Psj3yrCEBKZ77hWxp1VZPLMn7Sr8BSoqiIs026FrcrwCZ6Z0G8Ujnvm41/I9wjZ0+wgmeg
 v6iop2kQai45toQCoiwQKNc63NXCXOEw/HNq8mvGxpgqAhveUPKgcCP7WkXEQw0G1T5Egl
 BIgYofXtcKGzEeCq30TLNE2oxv6mv4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-GSUCCD4JOnS9B1Kdn3jCcA-1; Tue, 10 Nov 2020 06:29:14 -0500
X-MC-Unique: GSUCCD4JOnS9B1Kdn3jCcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1331074656;
 Tue, 10 Nov 2020 11:29:13 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDAC26345;
 Tue, 10 Nov 2020 11:29:12 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] physmem: improve ram size error messages
Date: Tue, 10 Nov 2020 06:29:08 -0500
Message-Id: <20201110112909.1103518-6-pbonzini@redhat.com>
In-Reply-To: <20201110112909.1103518-1-pbonzini@redhat.com>
References: <20201110112909.1103518-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Zhang <li.zhang@cloud.ionos.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

 Ram size mismatch condition logs below message.

   "Length mismatch: pc.ram: 0x80000000 in != 0x180000000: Invalid argument"

 This patch improves the readability of error messages.
 Removed the superflous "in" and changed "Length" to "Size".

Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Reported-by: Li Zhang <li.zhang@cloud.ionos.com>
Message-Id: <20201022111302.8105-1-pankaj.gupta.linux@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 0b31be2928..dd60ff79e9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1756,15 +1756,15 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
 
     if (!(block->flags & RAM_RESIZEABLE)) {
         error_setg_errno(errp, EINVAL,
-                         "Length mismatch: %s: 0x" RAM_ADDR_FMT
-                         " in != 0x" RAM_ADDR_FMT, block->idstr,
+                         "Size mismatch: %s: 0x" RAM_ADDR_FMT
+                         " != 0x" RAM_ADDR_FMT, block->idstr,
                          newsize, block->used_length);
         return -EINVAL;
     }
 
     if (block->max_length < newsize) {
         error_setg_errno(errp, EINVAL,
-                         "Length too large: %s: 0x" RAM_ADDR_FMT
+                         "Size too large: %s: 0x" RAM_ADDR_FMT
                          " > 0x" RAM_ADDR_FMT, block->idstr,
                          newsize, block->max_length);
         return -EINVAL;
-- 
2.26.2



