Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB69F5FDC35
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:15:53 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiz04-0005nO-HP
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiy1R-0004M3-Vi
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:13:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiy1P-0002Ll-H3
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665666790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=55hvTOn3Z7hIweYsTXdtgJt3cf5wqIwdhV5MxRsnZuk=;
 b=ePvqJBo28792+kQ6vNhj2o+jVSdi0RDcBsPm4DLzS5ds2MlAYesZdGg301oIUgD+J3ymH3
 0NMLyj+dNdM3MXocgJs0Xr/UN5z/X4pBTwRJybutJfuoTF3r1olAHACAgNzJ5M8WdiUBZE
 9EKL/DB1fRzZQZsC6TxSqWOCkPJhvQg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-195-S-4LjCvFOhSGXfud4Otvcw-1; Thu, 13 Oct 2022 09:13:09 -0400
X-MC-Unique: S-4LjCvFOhSGXfud4Otvcw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qa14-20020a170907868e00b0078db5ba61bdso873633ejc.12
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=55hvTOn3Z7hIweYsTXdtgJt3cf5wqIwdhV5MxRsnZuk=;
 b=JRfb4zz6QGb+QloHkKQZ59m481QCt8MKdaPhtyN8ZjK1zy/yDl9rJ6woGhBUkGWDzH
 hiLyHCNEQETtu6vSDTaw9wN9ef3zRsAZL4sB/DNqzH7KA2xhx0njyMtyvuN85cg8qkZe
 TXMxHe/vAsL3u3slLK4D7oiM/n44d+UK807gUjipMbzoNPPpJrqVVqkLcmFEldCmW50J
 0kxU5bZZ3M7zdULh53ERDA+rXmA6N8l3gr8giV6wbzGFKEjWFbfjEy/V5dJxdE6840Rw
 ZG4CwMAAbQyM9+BnLVxanQF4aRsOJ4Wjl42ceYZsOoT9hA29VzfhxtiFGA2P5x39W1DV
 BUnw==
X-Gm-Message-State: ACrzQf2EiKnFCjE8qxN+vHrXdTK5JqOQFcI/Ozgxf80C0u2TsnblqmfC
 LWumL44vnRslkBCC2+GVVdXt1tin9jt/r1LYlvoYGLXEf0HdeVCisuWJrPzfN6LsaX3jKSbu+o3
 GHS53CNPxN2pG9E9BUPICcUKzjta4HvA4BC0VoWpcLHJVLHQdPt9y6CpN4tVr/NAXv1E=
X-Received: by 2002:a50:fe0a:0:b0:458:dce8:2b6b with SMTP id
 f10-20020a50fe0a000000b00458dce82b6bmr32014392edt.84.1665666787897; 
 Thu, 13 Oct 2022 06:13:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6BZD+DHB5rkn32u3SUUJg6FYKmlQu6v37RfL/HMzvA5Gdu1/v0XhrjIEhriD9sNZn4jbtHcw==
X-Received: by 2002:a50:fe0a:0:b0:458:dce8:2b6b with SMTP id
 f10-20020a50fe0a000000b00458dce82b6bmr32014364edt.84.1665666787521; 
 Thu, 13 Oct 2022 06:13:07 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7c157000000b0044e937ddcabsm13397031edp.77.2022.10.13.06.13.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 06:13:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg: include CONFIG_PLUGIN in config-host.mak
Date: Thu, 13 Oct 2022 15:13:04 +0200
Message-Id: <20221013131304.623740-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index f4ff1cf305..a5af9c524f 100755
--- a/configure
+++ b/configure
@@ -2474,6 +2474,9 @@ echo "HOST_CC=$host_cc" >> $config_host_mak
 if test -n "$gdb_bin"; then
     echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
 fi
+if test "$plugins" = "yes" ; then
+    echo "CONFIG_PLUGIN=y" >> $config_host_mak
+fi
 
 tcg_tests_targets=
 for target in $target_list; do
-- 
2.37.3


