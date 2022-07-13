Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C6573697
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 14:50:18 +0200 (CEST)
Received: from localhost ([::1]:34074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBboo-0002y6-2p
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 08:50:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBbkO-0007BY-DM
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:45:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBbkL-0005HG-Pa
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 08:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657716339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MtsR/tM7k67a4bE2GsvxVx53jg+bM1PYQJk4fjczQuA=;
 b=d1YqS2OHwJISqYDXxXapqCmRKhj2yZ+xvKI+JJqXYd/byLEa6v9Hxn9QTAoQaG6HG1He1+
 Hf/XstCBeGEpFfTKPO+zK1yH7Y4bRnUt3fYuOGL5L9wUWv0p00Np50AfVA2LrabIcB+2Tq
 myZt+IoFIICELlZgXhPgqFPkuR0yKIM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-FCzd2ykzPmiknr3o405DEw-1; Wed, 13 Jul 2022 08:45:38 -0400
X-MC-Unique: FCzd2ykzPmiknr3o405DEw-1
Received: by mail-ed1-f72.google.com with SMTP id
 h17-20020a056402281100b0043aa5c0493dso8352858ede.16
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 05:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MtsR/tM7k67a4bE2GsvxVx53jg+bM1PYQJk4fjczQuA=;
 b=HB7e3lPmDcQjNL9zyYX+yRiso8BxExY0JN+0LcA0Xr1jPIHzgkJ6MGANgZCMYcEYaU
 v9FAn945+6KK531ItTcRxeidXvYhQkM9rIQSIQ7jJLfYU0s4T3ume9EeuZ5NNt5gZty1
 g11oVpcwKy858yoddj9aQ47PDtklv4NbjCbfohuHCqOCBOT28KuOEczT8iBx+aJL0TG5
 mHMFvumE4f1PRpiWlo20O7Wvd1cU2RuldnL4gjpEzw2A1l5tzKWLt14+QLLsZpYytphI
 ibdukxVJlyF4BQyGv2xveYxT+GV5VtS7q4IiPQPEf4woWfzM5tDOrmh6dQ8k/vg5Bs2o
 BsOQ==
X-Gm-Message-State: AJIora+NiXC18Eb2848WxwfnUrT8LS/pvi3lHd9QXSMp/ooTAfffrolw
 LK0Duae1cM7Tz4dUNx+vbT2UjeqN0tFifqcqYOB/kXUyiXcjQxSzT6O8Y1VLlxUOdNMwvU6dn+F
 nXljDCj3dUqVVCPK8lvyDQnCOslQUd3LnAcpMY1QlMQj0Ts96jqC58wlZWEFDNdAEe4o=
X-Received: by 2002:a05:6402:f10:b0:43a:b4cb:4d04 with SMTP id
 i16-20020a0564020f1000b0043ab4cb4d04mr4801925eda.305.1657716337090; 
 Wed, 13 Jul 2022 05:45:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulxkf4RuL+c+3yIhCbQc4ubJhDWz97APPak9Y50HVRk0WVfg4ePjvBibteieJQkFAXun1LiQ==
X-Received: by 2002:a05:6402:f10:b0:43a:b4cb:4d04 with SMTP id
 i16-20020a0564020f1000b0043ab4cb4d04mr4801882eda.305.1657716336778; 
 Wed, 13 Jul 2022 05:45:36 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 c5-20020aa7c745000000b0043a706d3a48sm7953991eds.76.2022.07.13.05.45.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 05:45:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pc-bios/s390-ccw: add -Wno-array-bounds
Date: Wed, 13 Jul 2022 14:45:35 +0200
Message-Id: <20220713124535.247989-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The option generates a lot of warnings for integers casted to pointers,
for example:

/home/pbonzini/work/upstream/qemu/pc-bios/s390-ccw/dasd-ipl.c:174:19: warning: array subscript 0 is outside array bounds of ‘CcwSeekData[0]’ [-Warray-bounds]
  174 |     seekData->cyl = 0x00;
      |     ~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 26ad40f94e..c8784c2a08 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -35,6 +35,7 @@ EXTRA_CFLAGS += $(call cc-option,-Werror $(EXTRA_CFLAGS),-Wno-stringop-overflow)
 EXTRA_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks -fno-common -fPIE
 EXTRA_CFLAGS += -fwrapv -fno-strict-aliasing -fno-asynchronous-unwind-tables
 EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -fno-stack-protector)
+EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS), -Wno-array-bounds)
 EXTRA_CFLAGS += -msoft-float
 EXTRA_CFLAGS += $(call cc-option, $(EXTRA_CFLAGS),-march=z900,-march=z10)
 EXTRA_CFLAGS += -std=gnu99
-- 
2.36.1


