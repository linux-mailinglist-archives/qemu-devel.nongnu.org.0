Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF483FFF3E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:33:27 +0200 (CEST)
Received: from localhost ([::1]:33508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7Rm-0000aO-7F
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM7Ep-0002e8-QF
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:20:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM7Eo-0007xa-8W
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630668001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dJwik153XkNmqJfLX2OaJbitNFOzhpORupSCbSGdFBs=;
 b=apfo9CF2S45jFlq2bzmaSN7qoGd9Nig4vBfLmMiQbpZpJxNJMT0oPBp075A4eyCnbeBQE0
 TWkWv5Ui+8nbyOSfrdZAARt6MnPZvoNjeM6nlZFE2TeieyCXbA++yqyW48LkBeBv0KlJPi
 kDaCct4E9trwuVWLW+jAjuJu4b0Csys=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-rrPYA-0bOGOpZAk_5Pjqzg-1; Fri, 03 Sep 2021 07:08:32 -0400
X-MC-Unique: rrPYA-0bOGOpZAk_5Pjqzg-1
Received: by mail-wr1-f71.google.com with SMTP id
 m16-20020a056000181000b0015964e4ae48so417708wrh.14
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJwik153XkNmqJfLX2OaJbitNFOzhpORupSCbSGdFBs=;
 b=I1nMNJ9ED/NKWUYRlsA1knqso8BK+VkywppLR32vjjK+b1zeGtf5b53w0wPCfMcE5Q
 +J7wf07c27S8hM53VKcHfaFBYAuosFrem88eYgpzuNxTNoPTI4J5+Yw6IafaybA5SXT4
 w6Uo8WOs1QeD2FuH+2mtVMrALriRFtxWkk4oTnfCr/saYA4VeWrIM7myXMa2dFJNHu80
 mGue9rNBqEMamO7eOoIKcymiU8tAtDY1kKGC6f0Xefl5D9eJPdSxlEF393YgemFLV0c9
 HY4DmA5IG1oWch0FuJCKF1uVJus7z0iTXGh36hr9BDKYYWlcRACXjw8fOzbDWdmg3Wzw
 35Vg==
X-Gm-Message-State: AOAM5318lrPZee52wEtZz4h0yLqyQJvZxOUP8Aa99AKnUq+mML675gRq
 eBdC/Lu46mQefnQsH2QEobO7xIs8Ham21wx7SlTFRG3fi84+FBz0Kl6jczFjwoVu50/wdGL493f
 NIryXBbC/fQs3fi/lQv3GCMq6Btoh8oTtU0i+BmpnwgZ4QeFhycAowOJVKFFo00kP
X-Received: by 2002:a1c:3587:: with SMTP id c129mr7583869wma.57.1630667311259; 
 Fri, 03 Sep 2021 04:08:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5r0XeeX6oDBAmIiFbFCHjKsXYnfVoM/it+dWZcDkZmIgH65YEMVRXHS9DXEpfLuhGguK5bg==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr7583780wma.57.1630667310694; 
 Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x21sm890930wmc.14.2021.09.03.04.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:08:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/28] hw/scsi/mptsas: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:49 +0200
Message-Id: <20210903110702.588291-16-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/mptsas.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index db3219e7d20..d05735d3e11 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -449,7 +449,8 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             } else {
                 MPTSASCancelNotifier *notifier;
 
-                reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+                reply_async = g_memdup2_qemu(&reply,
+                                             sizeof(MPIMsgSCSITaskMgmtReply));
                 reply_async->IOCLogInfo = INT_MAX;
 
                 count = 1;
@@ -476,7 +477,7 @@ static void mptsas_process_scsi_task_mgmt(MPTSASState *s, MPIMsgSCSITaskMgmt *re
             goto out;
         }
 
-        reply_async = g_memdup(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
+        reply_async = g_memdup2_qemu(&reply, sizeof(MPIMsgSCSITaskMgmtReply));
         reply_async->IOCLogInfo = INT_MAX;
 
         count = 0;
-- 
2.31.1


