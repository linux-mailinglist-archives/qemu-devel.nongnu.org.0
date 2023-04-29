Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ED46F249F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 14:18:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psjVy-0006wE-HN; Sat, 29 Apr 2023 08:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVh-0006JT-2y
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1psjVf-0004wL-2e
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 08:17:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682770622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1tVVKWLeIMR9DWlb5Rsf5pMPPF9IxoYoOF9wINtHKaI=;
 b=IbOnbbjlrhhIFERfWCw1Ad+CVBEZqfjVPhbr2pBS6mBmKtgkFdf8SFTNYSPKO+XakRnrG4
 wnmUKxJ+bYoN5xvHvPAXlnKJXiblzg+jeoycn1S5ytLVuxoBPdNswNyYICH7PlnjwssEfC
 VZnZzGEPYSDrPxxhJkir2U54je21dFA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-XszKcEpVMNycFXj5_PB8xQ-1; Sat, 29 Apr 2023 08:17:01 -0400
X-MC-Unique: XszKcEpVMNycFXj5_PB8xQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94ee1fc1233so81547266b.1
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 05:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682770619; x=1685362619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1tVVKWLeIMR9DWlb5Rsf5pMPPF9IxoYoOF9wINtHKaI=;
 b=EKzikDPdpFMMwbOGaBsY5ouBTO2Dmz6HdymMfCM+JJZMEoE/RPDF53VgXvhwfwsYhc
 vL8pU6hYYq9EdWdl0bJWJUMXpWtBqJNLRPOv82c9iK1+0ungc4xs3j3+pVDOsiDiVTCj
 aEZQaiqhG97QlBVcINANb0EsJBMbOXwaLnGt31EuwC1RZTmM86FhMPKVT45wcKJfuFdx
 nFkzrwvn1/cOOWFR3YPFZaA79XmmmAClxDzm79Vu1v+pMQMg8Izihjuul7dxZbbwjxY4
 Un4Znxypb4VJAddtJFLl+7z+Wog5TpysC3ZiDprhBOLE9u5HUNPJYxzxpPFn5JFSRo24
 5k7Q==
X-Gm-Message-State: AC+VfDy8VL5XjAK4diWw0or37h5Ff7q4GD46E/CrdqyTlXjefmtpZVv2
 VRhSdO+NGCZY2fEuNn11NM4XzkzyyksppTsEW7U2I7PGzS7I1qxCCyvgRNcTzWeSl4NXZLHvjsD
 3W8LkobCT0J1kVbN+3y7ko95KQIFYXHTLaT8xjXfRMYUAmTtP2hjcFIUg4pLR0SwPUtbrso7MBi
 I=
X-Received: by 2002:a17:907:a4c:b0:95e:c549:9ace with SMTP id
 be12-20020a1709070a4c00b0095ec5499acemr7118534ejc.62.1682770619585; 
 Sat, 29 Apr 2023 05:16:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Pwwgq267fx7sOqAlHVFA8kvERrqY2ZWRD2MMmOaMPC/7xlQWFE55MRq+6jXLw7JBrn+F3ug==
X-Received: by 2002:a17:907:a4c:b0:95e:c549:9ace with SMTP id
 be12-20020a1709070a4c00b0095ec5499acemr7118521ejc.62.1682770619306; 
 Sat, 29 Apr 2023 05:16:59 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170906348d00b0095337c5da35sm12601514ejb.15.2023.04.29.05.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 05:16:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David 'Digit' Turner <digit@google.com>
Subject: [PULL 11/17] Fix libvhost-user.c compilation.
Date: Sat, 29 Apr 2023 14:16:30 +0200
Message-Id: <20230429121636.230934-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230429121636.230934-1-pbonzini@redhat.com>
References: <20230429121636.230934-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: David 'Digit' Turner <digit@google.com>

The source file uses VIRTIO_F_VERSION_1 which is
not defined by <linux/virtio_config.h> on Debian 10.

The system-provided <linux/virtio_config.h> which
does not include the macro definition is included
through <linux/vhost.h>, so fix the issue by including
the standard-headers version before that.

Signed-off-by: David 'Digit' Turner <digit@google.com>
Message-Id: <20230405125920.2951721-2-digit@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0abd898a52c4..8fb61e2df2fe 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -32,6 +32,12 @@
 #include <sys/mman.h>
 #include <endian.h>
 
+/* Necessary to provide VIRTIO_F_VERSION_1 on system
+ * with older linux headers. Must appear before
+ * <linux/vhost.h> below.
+ */
+#include "standard-headers/linux/virtio_config.h"
+
 #if defined(__linux__)
 #include <sys/syscall.h>
 #include <fcntl.h>
-- 
2.40.0


