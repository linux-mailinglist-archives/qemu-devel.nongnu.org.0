Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964E12B39E7
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 23:32:49 +0100 (CET)
Received: from localhost ([::1]:39522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keQZg-0005PN-V9
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 17:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUu-0000SL-Mg
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1keQUs-0001ZE-BP
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 17:27:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605479265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iWsO4tI4todI9tjh9pOi03bo9125ZEGAQbWUj8yyq+s=;
 b=h64pUX8c8oaq1FDQ6YUgINgCyzRWOGMWOntJM60Sa1tb9+OEy+ONQj+XFiGbFJluZI4D+W
 mwPOP+1NoH2MmctlmXbqNzLbFS7V47uArtuXRWnmdkgmVeDL0AFZNvP+jfsREZwlabTM2v
 f5xltNP39C59wOPfUxvvY6IGDLDZNxQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-FASzANa9P4eOVZGC23YZPQ-1; Sun, 15 Nov 2020 17:27:43 -0500
X-MC-Unique: FASzANa9P4eOVZGC23YZPQ-1
Received: by mail-wr1-f72.google.com with SMTP id h11so9779347wrq.20
 for <qemu-devel@nongnu.org>; Sun, 15 Nov 2020 14:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iWsO4tI4todI9tjh9pOi03bo9125ZEGAQbWUj8yyq+s=;
 b=oligH5vSGNRuysH/B7XKxgqUK0FRHMmYQvLvYs1WPiZicd38B7LIEhbENrtBiTBENR
 kWcOWEvfz9BMhkBh8BxiVuqyAkunsnOSrezbEhHbZ7Y0BhuTOPw6zESHTCt6c0xeuBn9
 +MkZvVej0T7zo7Li5n7D8oya4cGsZBSlsfkISd05XFxdlfKDu3thP21stxIsS4UI00AV
 atGsCgfGLlKcWtDrhyD1Mq1tKnstaOHvNT9QRXPrifDoztnsqPJNafZDlt1N63/pREiR
 tBIC8uSRvKhkXSGxywtAU2ltteVdID3DNpxecdZvsbQycItNVGsOZIfFBL6sPe01AgOO
 oLuw==
X-Gm-Message-State: AOAM532HG6jkUaTxoTm11QfvSiQmhaUQtbosKMtiBF+lShqlgARTuX6E
 j1m31Tw8Gj2xlK7DWTzlBF4lYD+CG3knZIs+sqYXuDIyXojh+c6wo4CFMnYaqsOJCewPD9tZnqh
 oFkQoy1WC+FMZGHfa7f+4skSIcw2pk3C19ORSufsaZFBnLIL+eZgx0TeEsZ1h
X-Received: by 2002:adf:f644:: with SMTP id x4mr16305196wrp.5.1605479261967;
 Sun, 15 Nov 2020 14:27:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws0dhCUzt0ISFlAq5Cc2RSqUG8fGEjo3gmpPyCrHG5J6/78IFFB2o1Yi0Mg0VSwZ6LH9XIrA==
X-Received: by 2002:adf:f644:: with SMTP id x4mr16305184wrp.5.1605479261819;
 Sun, 15 Nov 2020 14:27:41 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id n11sm19420769wru.38.2020.11.15.14.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 14:27:41 -0800 (PST)
Date: Sun, 15 Nov 2020 17:27:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] vhost-user-blk-test: drop unused return value
Message-ID: <20201115220740.488850-12-mst@redhat.com>
References: <20201115220740.488850-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201115220740.488850-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 17:27:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The sock_path return value was unused and bogus (it doesn't make sense
when there are multiple drives because only the last path is arbitrarily
returned).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20201111124331.1393747-7-stefanha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 4019a72ac0..c5ff610d7a 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -705,8 +705,8 @@ static void quit_storage_daemon(void *qmp_test_state)
     g_free(qmp_test_state);
 }
 
-static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
-                                  int num_queues)
+static void start_vhost_user_blk(GString *cmd_line, int vus_instances,
+                                 int num_queues)
 {
     const char *vhost_user_blk_bin = qtest_qemu_storage_daemon_binary();
     int fd, qmp_fd, i;
@@ -772,7 +772,6 @@ static char *start_vhost_user_blk(GString *cmd_line, int vus_instances,
     g_test_queue_destroy(quit_storage_daemon, qmp_test_state);
 
     qobject_unref(qtest_qmp(qmp_test_state, "{'execute': 'qmp_capabilities'}"));
-    return sock_path;
 }
 
 static void *vhost_user_blk_test_setup(GString *cmd_line, void *arg)
-- 
MST


