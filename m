Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991F6D0445
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:04:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phr07-00019C-QN; Thu, 30 Mar 2023 08:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phr05-00018u-On
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:03:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1phr04-0005Ks-4s
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680177806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7SxR26WpUGPC6DMrsV9hRY20AKFzWhBO2csovETj7nY=;
 b=IdfVOB5EJCUO2sWYmnwr0RyX0Z1mdxclro5EPHD2sFzJgsjzun8jbpLj3POekIAxOYQbOY
 fL5L3LYbZplp4PT5BJQMBz0rkEEdgMDE4Yv61SwslGVC7xCyl7IxiBzUHw3JxZPX6U3ZzL
 p7NXfCj3SQSwBwhB4aKkjN6ciMjKUjs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-rwfkJtN1NXOiDlTSFeIaIA-1; Thu, 30 Mar 2023 08:03:24 -0400
X-MC-Unique: rwfkJtN1NXOiDlTSFeIaIA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k16-20020adfd230000000b002cfe7555486so1956024wrh.13
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680177803; x=1682769803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7SxR26WpUGPC6DMrsV9hRY20AKFzWhBO2csovETj7nY=;
 b=GzSKyI0HDA/naP+c7V5aSfgBcfmJ+XsDvXHJGZwJORXH2la1dtxhxQDGJ98+EmWOw+
 IpFNBEUEKeDaZ2lK/m9zFZUY8N1NvdoHrNE8BWzDs7R4FRRF2sb7JMwXWtR9h1Z5j21x
 FfJjpDw1wuYlCNMdLvIww7FnKyVWtGV5YXtF3yINx2zFEp2Yr2ZIB19XgQNjXt4GLRVs
 tr0cbQM4f6/Z+nMqbCmEy4FHhxMOsiQeuswjqQpZxuZcuRh7c0nwgwLKoFd952VN+3is
 /r4MVBuJ9WBH2rKMxzGm7qwv5iV8jmDVxGJFU+BYvpNAn8+vyRj/AJ6v14uaoUOxjdpp
 fttg==
X-Gm-Message-State: AO0yUKVyjwERiLgojMIHC9AqiWJ2gBiCuEMJdWf4WXzYCakjTOPMOf7m
 9wqmouZ+Nfor0xw90E7pgE/25r0xiYepPNu3CewS2oEj6EMcrGmdmtviU7hkEiOK/pObl5Pl8sA
 decoElYOU/vdiYCKWx8TNj+nzOMq6oqA6tmCNzRMaPU0b4CsvEGNd1pxLPKGGuNXWCIeFINhCwy
 vBlg==
X-Received: by 2002:a7b:cd0d:0:b0:3ed:df74:bac7 with SMTP id
 f13-20020a7bcd0d000000b003eddf74bac7mr18073693wmj.21.1680177803135; 
 Thu, 30 Mar 2023 05:03:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set9RLVVPoRbCW7btjIqtDMrYq8eWX9ITQLQAAwM2lXrRsQxI7DSFkaHLm3JP3E+F7oi5ni6uCw==
X-Received: by 2002:a7b:cd0d:0:b0:3ed:df74:bac7 with SMTP id
 f13-20020a7bcd0d000000b003eddf74bac7mr18073666wmj.21.1680177802738; 
 Thu, 30 Mar 2023 05:03:22 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c204200b003ed2c0a0f37sm5552174wmg.35.2023.03.30.05.03.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 05:03:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] lasi: fix RTC
Date: Thu, 30 Mar 2023 14:03:19 +0200
Message-Id: <20230330120319.36069-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Migrate rtc_ref (which only needs to be 32-bit because it is summed to
a 32-bit register) and drop the write-only field rtc from LasiState.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/misc/lasi.c         | 2 +-
 include/hw/misc/lasi.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/misc/lasi.c b/hw/misc/lasi.c
index 23a7634a8c3a..5d07bc801a84 100644
--- a/hw/misc/lasi.c
+++ b/hw/misc/lasi.c
@@ -204,6 +204,7 @@ static const VMStateDescription vmstate_lasi = {
         VMSTATE_UINT32(iar, LasiState),
         VMSTATE_UINT32(errlog, LasiState),
         VMSTATE_UINT32(amr, LasiState),
+        VMSTATE_UINT32(rtc_ref, LasiState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -233,7 +234,6 @@ static void lasi_reset(DeviceState *dev)
     s->iar = 0xFFFB0000 + 3; /* CPU_HPA + 3 */
 
     /* Real time clock (RTC), it's only one 32-bit counter @9000 */
-    s->rtc = time(NULL);
     s->rtc_ref = 0;
 }
 
diff --git a/include/hw/misc/lasi.h b/include/hw/misc/lasi.h
index ecc7065ce858..0a8c7352be21 100644
--- a/include/hw/misc/lasi.h
+++ b/include/hw/misc/lasi.h
@@ -69,8 +69,7 @@ struct LasiState {
 
     uint32_t errlog;
     uint32_t amr;
-    uint32_t rtc;
-    time_t rtc_ref;
+    uint32_t rtc_ref;
 
     MemoryRegion this_mem;
 };
-- 
2.39.2


