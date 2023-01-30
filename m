Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A4681B63
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMae6-0005Y4-O7; Mon, 30 Jan 2023 15:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadL-0003Je-6Z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadJ-00075S-7P
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yXWQTZnfl7smKeiYCB+FKOZKyFdPsirvtVMwzfQ1w+c=;
 b=ElFIJC1pymoM46T2eefpp4+0a7OZLShvG/MO68dzWr7fUXmPmlqQgVTL+w3MjW47EpkZG9
 YoEiD27GJFd+xjXR12MyOtj8mfV+wpaHxJkhYZ6LxIJfAb35FKsAdJvGm7Y8HZmpV8c+J9
 SPKqBTL2/GD3ECc6yPBBUZGNaaFbLy0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-199-lG_yqiODNfSsMeF7oDnZIg-1; Mon, 30 Jan 2023 15:20:03 -0500
X-MC-Unique: lG_yqiODNfSsMeF7oDnZIg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z18-20020a05640235d200b0049d84165065so8983965edc.18
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXWQTZnfl7smKeiYCB+FKOZKyFdPsirvtVMwzfQ1w+c=;
 b=5T2cEDM0p9TuIN2RUbgWlLNo8pdr8OZPC810joHByEP3oBFN6zoiUJKXDStZKAP7MR
 wdHzYUPh1fx2RWQJx2PQyo9cvFNrDgLwWWIm9HyptOZSLuTeHwGwpnDKL3KtPWWyeUUf
 exgIbTamhC+EwwzecmIu8HXewdia6RXnLlgyOoEvXcJQ8LGWq4GLciHSmtRw1kMHyk5Y
 r64cufNkPHseAYpbx/YBgaDTupi3uP0SgDii3na0gPkPD4uS5wzUF1pxl3YuMtQudYJU
 nyMtMxeBItW3xuKooJk7ruaDKiUpVwFiO0vxXxvDZeiWTWv7vZmkzRBgYMEAGQXhUw+W
 +waQ==
X-Gm-Message-State: AFqh2kqtdsVEfGZoimJULArSq/zZBGLaYWAtmZkMVt0mCq50YXm6kAT8
 kGZBTWpfxgX8TYc1a2dTYOTdAMOIOy1hzLUSRZGOhFixd76XSDY5HxfEkQXqs49Oupq+3KCERm/
 FBR/9Xnz0IG01uMxZp4v6fch6dmDwymOVQBsabw7s3J8K17vnZ2GNepBY3IwD
X-Received: by 2002:a05:6402:2484:b0:497:233d:3ef5 with SMTP id
 q4-20020a056402248400b00497233d3ef5mr61046438eda.23.1675110001516; 
 Mon, 30 Jan 2023 12:20:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsEMYVoMYtUUrFvEDQD3JCbnXYPQ0p6M3sMAmrE0fBEWyYqfkj3QkIRXxwjuz4RDiq6IbNQcg==
X-Received: by 2002:a05:6402:2484:b0:497:233d:3ef5 with SMTP id
 q4-20020a056402248400b00497233d3ef5mr61046419eda.23.1675110001189; 
 Mon, 30 Jan 2023 12:20:01 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 r24-20020aa7cfd8000000b00495c3573b36sm7390353edy.32.2023.01.30.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:00 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 23/56] tests: boot_sector_test: avoid crashing if status is
 not available yet
Message-ID: <20230130201810.11518-24-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

If test case was started in paused mode (-S CLI option) and then
allowed to continue via QMP, boot_sector_test could assert on
transient state with following error:

   assertion failed (qdict_get_try_str(qret, "status") == "running"): (NULL == "running")

Instead of crashing test if 'status' is not available yet, skip check
and repeat iteration again after TEST_DELAY has elapsed.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/boot-sector.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/boot-sector.c b/tests/qtest/boot-sector.c
index 44a109abd8..d3f68018e7 100644
--- a/tests/qtest/boot-sector.c
+++ b/tests/qtest/boot-sector.c
@@ -160,7 +160,9 @@ void boot_sector_test(QTestState *qts)
         qrsp = qtest_qmp(qts, "{ 'execute': 'query-status' }");
         qret = qdict_get_qdict(qrsp, "return");
         g_assert_nonnull(qret);
-        g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        if (qdict_get_try_str(qret, "status")) {
+            g_assert_cmpstr(qdict_get_try_str(qret, "status"), ==, "running");
+        }
         qobject_unref(qrsp);
 
         g_usleep(TEST_DELAY);
-- 
MST


