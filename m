Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751AE3FE9B4
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:05:36 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLgn1-0007J8-Fw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiL-0000Un-48
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLgiJ-0007wy-JT
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630566039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bBtss4QrAZvCKlRzk4+0XN0kMEBQG8X7JlDa7aeGGM4=;
 b=PcwSbdDJg+CxCRHyyjz0/9VjlFVf9jS84uWoBU5fcl59NHZ4c683Y5MrasNpeKbq4xeFc+
 kAkP8hZdJ4yX4DEukGnbDlwJ5cVqdiSIE3tOnBP4lxZTU9jw7mjUNEViXnYsyYUCwlrBhX
 SxV9ZAKSQrFrAt5I6VbNq4xCclgjj/s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-nCsJYiAzPPeCvvuI_8g1jg-1; Thu, 02 Sep 2021 03:00:38 -0400
X-MC-Unique: nCsJYiAzPPeCvvuI_8g1jg-1
Received: by mail-wm1-f71.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so334736wmr.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bBtss4QrAZvCKlRzk4+0XN0kMEBQG8X7JlDa7aeGGM4=;
 b=IzQp9YokMPYdymxofvXYBwPtKBmCKtKRI6rm/tl27GiwVX0LMc+07GsIuAA8KlLEuW
 HGI+HprDATmiBY9jhmZh4smWt4Kz37H7xiDjgbWP27mKSA2DLNRbgYb6UkalHfpnCMLz
 FmfjglB18uINrKalKa8MBWIEmj70gExIjktp12GF0aHCNJM42xBe2gQ5DScsF+g+ny+F
 txssNs14sRc1omn3czXabFC6p7GBa2bHGo9Zbw1MhSFWL4AScEPrxP+8gVmprc2+EuWF
 ko0kJHPosQ/yn1AM+mcDui4mOUjlP9UPDYsyuBQ0S0Zvxm3tKHwsDAjZHfDWwm2VvTh6
 yyuw==
X-Gm-Message-State: AOAM5337UN44LV8iIU9g++OjqFWDj9eRQTfgV0u1OWOJzyQeKznfKi81
 Mh+GUDDA/QBYTFgQmlCsBVXQA3ZRkVPfgXKWjWWwR/HY6ifsexh6oQxwi5IbYHHNzsm97UhMYsu
 Zuaez/40H/YP9KQBA+1TXTQs1buy84AKnhmTn32bNk+w9qUxem6rHTUm1a3e8a1vn
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1511152wmi.69.1630566036753;
 Thu, 02 Sep 2021 00:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqzlcRd6hLENRtIYmXuNe2XYP5FMGyq04M4x0uGtqjDbinDjdqTxZZXnD6HnxGookx9mDnpg==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr1511125wmi.69.1630566036532;
 Thu, 02 Sep 2021 00:00:36 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id t7sm1012543wrq.90.2021.09.02.00.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 00:00:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/11] util/vfio-helpers: Let qemu_vfio_verify_mappings()
 use error_report()
Date: Thu,  2 Sep 2021 09:00:16 +0200
Message-Id: <20210902070025.197072-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902070025.197072-1-philmd@redhat.com>
References: <20210902070025.197072-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of displaying the error on stderr, use error_report()
which also report to the monitor.

Reviewed-by: Fam Zheng <fam@euphon.net>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 911115b86e6..1d149136299 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -660,13 +660,13 @@ static bool qemu_vfio_verify_mappings(QEMUVFIOState *s)
     if (QEMU_VFIO_DEBUG) {
         for (i = 0; i < s->nr_mappings - 1; ++i) {
             if (!(s->mappings[i].host < s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d not sorted!\n", i);
+                error_report("item %d not sorted!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
             if (!(s->mappings[i].host + s->mappings[i].size <=
                   s->mappings[i + 1].host)) {
-                fprintf(stderr, "item %d overlap with next!\n", i);
+                error_report("item %d overlap with next!", i);
                 qemu_vfio_dump_mappings(s);
                 return false;
             }
-- 
2.31.1


