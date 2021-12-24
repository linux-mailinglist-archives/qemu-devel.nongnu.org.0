Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7737E47F186
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Dec 2021 00:46:47 +0100 (CET)
Received: from localhost ([::1]:47364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0uGs-0006DU-4k
	for lists+qemu-devel@lfdr.de; Fri, 24 Dec 2021 18:46:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0uFV-0005MY-Vr
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 18:45:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0uFS-0007eC-J9
 for qemu-devel@nongnu.org; Fri, 24 Dec 2021 18:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640389517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=djtV4Zg+5Y2t9qXSDNiQLJloqba1CwpOshfT6XZOspA=;
 b=BDDUcrvL9LUYbOFfoyDczHDNj1A4oopVrlapGqJQgmMMVpul95NWADA6yC4B6+SiPHDH2N
 cM8ZoBHzVmFN2hfyk81mrai3/NW0Gas5IOkFgDWAnrKaopdb1z15D9jDLsNWDS2f6+5Ff+
 hGTtDYU8hsJzmVhIMKauOCKUZ8dr8T0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-Fk4Xbac_NJi27wpRgR4zRg-1; Fri, 24 Dec 2021 18:45:16 -0500
X-MC-Unique: Fk4Xbac_NJi27wpRgR4zRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m19-20020a05600c4f5300b00345cb6e8dd4so3391949wmq.3
 for <qemu-devel@nongnu.org>; Fri, 24 Dec 2021 15:45:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=djtV4Zg+5Y2t9qXSDNiQLJloqba1CwpOshfT6XZOspA=;
 b=wxIF3X8NwoqhIDmG5Ra9LMfmkryeOr2WWQN9gDpVW1ja8w8La9M8Rqf7ijW0qQ3vAR
 M8tLhz/l2Uxbvr4ZxbuGbMoah8Sf9HFDZMZKOe8GyDxtTGg1cOMNnEhiAnkW9mccWAMp
 fsQ1guKDgv2gJ7BBhn4feuDN4hthWk9cYwpxUaWLzTJqWtKOwRPW5GOOi6D+F/BkI/hj
 Q5o7GtHMpTS9vtwlxZR/uKKGpt4LWuqBa66uBqaveFscKGOCgn39n8ZT6y3Go9YBjBFl
 XdWl4/IV7PPxKG3W+ZXa5wBPFBFJJVTdT2a91LAs8/tIKzwfNFMSg2HepqcfUJsWHkl8
 1fMg==
X-Gm-Message-State: AOAM533/Uc7SsqsIHQ0xdcxt7soXXroLEj2U99AoVQ+wWnZEENIm70yx
 lra7sB/ds7pHl9FWPZfyhxeHgliyNdfnwYJBk9l0pqveKmpBK8gy4Qd1N9VP0Kz+te+j/kLl5cA
 F+HbVB1a7zrXi7+Yb8W4TAR+NGIUrhvqRGAxuFtRAEhFp9o6ShaGe3LahPHMPnMyF
X-Received: by 2002:adf:ec85:: with SMTP id z5mr5836464wrn.568.1640389514229; 
 Fri, 24 Dec 2021 15:45:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxwfXTXvZngkVd3lvDxTxowWvcYlkt/nFGVEaGHQbMnhcSQSIvNZ0BS8pIqAte4y5L2CUAmw==
X-Received: by 2002:adf:ec85:: with SMTP id z5mr5836446wrn.568.1640389513859; 
 Fri, 24 Dec 2021 15:45:13 -0800 (PST)
Received: from localhost.localdomain
 (adijon-655-1-69-27.w90-13.abo.wanadoo.fr. [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id bg34sm13174955wmb.47.2021.12.24.15.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Dec 2021 15:45:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/unit/test-util-sockets: Use g_file_open_tmp() to create
 temp file
Date: Sat, 25 Dec 2021 00:45:04 +0100
Message-Id: <20211224234504.3413370-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
Use g_file_open_tmp() to create temporary file"), avoid calling
g_test_rand_int() before g_test_init(): use g_file_open_tmp().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/unit/test-util-sockets.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 72b92465298..896247e3ed3 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
     };
     int i;
 
+    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
+    g_assert_true(i >= 0);
+    close(i);
+
     addr.type = SOCKET_ADDRESS_TYPE_UNIX;
-    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
-                                         getpid(), g_random_int());
     addr.u.q_unix.has_abstract = true;
     addr.u.q_unix.abstract = true;
     addr.u.q_unix.has_tight = false;
-- 
2.33.1


