Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8ED6C972D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 19:27:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgU7u-0000lb-AA; Sun, 26 Mar 2023 13:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7t-0000lI-24
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pgU7r-0003ku-IT
 for qemu-devel@nongnu.org; Sun, 26 Mar 2023 13:25:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679851550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OHuopxQt6ihuoU9SCqe4c53FaZyeCMXaLseFI7BFD8g=;
 b=YV49tByNBAfcdjFYkre+8uSG1r/3tSRYCc//vCxfY/BRG/RCHpHTYl8XJCbyV5WYSrLxL9
 l1hUkOrPqMGlPL7oHHLVmTQHCqtm/Bj94vviJyRFC7qK4wXTqrifnw8KM1CJJoXaHEWbK2
 Pk0sk9n2WLMetRPUNNmlf0pV+OU8rYE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-B99xo856MPGHyvD9OXtQrg-1; Sun, 26 Mar 2023 13:25:46 -0400
X-MC-Unique: B99xo856MPGHyvD9OXtQrg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-5417f156cb9so66247857b3.8
 for <qemu-devel@nongnu.org>; Sun, 26 Mar 2023 10:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679851545; x=1682443545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHuopxQt6ihuoU9SCqe4c53FaZyeCMXaLseFI7BFD8g=;
 b=nIJMI8BHzJDtzngOcznoMn012noB7hDS+dogMIxJNggCF3rsJzlnBsVGVApPCVjXdn
 uvTkhllV2PyWtYNVEtlwFv9NZhpuxFFow8y/jkFh/ZZ5hOitIm+SUaZMI+Znavis6X0r
 1ImJXq9oU3TWrKZU6qgkVXhakBQxP83o97RzQq0L9nfVDopDgxXS7muoRyxJFI6iXhpD
 vDzw0qL0cVsl9a/gk2eCG80CYfGEamy4IfdmBY/u5xZsh+Fb7SD3AyArTZMDN1BNHadO
 EAHZhy+s4F3IiW2YSWWSSTbD1P7znoPEO9mobJs+Metc17A6ajxVHx1ZDwUS/pVTYPAx
 EGwg==
X-Gm-Message-State: AAQBX9ckIAX5DXewprEUXcy8WTQuMLEEvdSRr7OIB9NAj68WFFuP1aM2
 mSBFuEBFi3Lvp4TBfpWGBkY0mGL6dk8wOQzYvhAl8z7wAcuFkJI6ZJtK7oNc8tdX3cPf+5qPL/Z
 i7MSfwiXFjc4RxXqtv+oo3tTZucugMIRcZwtGn8K1tAJnMmEno25pZK5K66a1La3kjjjDSpb7
X-Received: by 2002:a81:1cd4:0:b0:52e:e77b:d5c with SMTP id
 c203-20020a811cd4000000b0052ee77b0d5cmr8501371ywc.4.1679851545012; 
 Sun, 26 Mar 2023 10:25:45 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWWBqacolCZNSVe8J23S9h01Gdondf6nzcT5dxhLWIiqc+7ToOA7ZjnIZgUXbXLQQ3+JlVJA==
X-Received: by 2002:a81:1cd4:0:b0:52e:e77b:d5c with SMTP id
 c203-20020a811cd4000000b0052ee77b0d5cmr8501360ywc.4.1679851544744; 
 Sun, 26 Mar 2023 10:25:44 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a818d08000000b00545a0818501sm1529454ywg.145.2023.03.26.10.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 10:25:43 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH for-8.0 1/3] io: tls: Inherit QIO_CHANNEL_FEATURE_SHUTDOWN on
 server side
Date: Sun, 26 Mar 2023 13:25:38 -0400
Message-Id: <20230326172540.2571110-2-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230326172540.2571110-1-peterx@redhat.com>
References: <20230326172540.2571110-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

TLS iochannel will inherit io_shutdown() from the master ioc, however we
missed to do that on the server side.

This will e.g. allow qemu_file_shutdown() to work on dest QEMU too for
migration.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 io/channel-tls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/io/channel-tls.c b/io/channel-tls.c
index 5a7a3d48d6..9805dd0a3f 100644
--- a/io/channel-tls.c
+++ b/io/channel-tls.c
@@ -74,6 +74,9 @@ qio_channel_tls_new_server(QIOChannel *master,
     ioc = QIO_CHANNEL_TLS(object_new(TYPE_QIO_CHANNEL_TLS));
 
     ioc->master = master;
+    if (qio_channel_has_feature(master, QIO_CHANNEL_FEATURE_SHUTDOWN)) {
+        qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_SHUTDOWN);
+    }
     object_ref(OBJECT(master));
 
     ioc->session = qcrypto_tls_session_new(
-- 
2.39.1


