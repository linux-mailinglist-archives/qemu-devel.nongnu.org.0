Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675B92B5BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:22:24 +0100 (CET)
Received: from localhost ([::1]:48444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexBv-0007RK-9B
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex93-0002QG-Fh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kex91-0006UE-MO
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTDyF8qZ/+kyOvEMv/zkAMXekpV6mWj/zaDDozu+j7g=;
 b=SjBcjYZmJBdImdOsARh5cxj64mXqujGubyHR7mIgKSH5e0vlF2sK4p4o8c31/E9OQYQqjG
 2Dm4UZYn3mSFRYSqARKNJoM5slE0G4lqVlwBPz/X1mhrD4/J5Jh8pbiiX+0KIqtbHj2MBM
 kFrwt8hnDJpFBYISrgvPs8kgXhDL/+0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-fvVvmPcpNxS9-bVZDuhh8Q-1; Tue, 17 Nov 2020 04:19:20 -0500
X-MC-Unique: fvVvmPcpNxS9-bVZDuhh8Q-1
Received: by mail-wr1-f70.google.com with SMTP id d8so12697322wrr.10
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eTDyF8qZ/+kyOvEMv/zkAMXekpV6mWj/zaDDozu+j7g=;
 b=Y+7LpDp9rT8WEYTc35U0RZaOaxl0Lx04EQHxWperYHE4Xq0+I2uMTIGwTM1vxzUDyz
 lPPbTchgHSPvlLTMtY5TuNZLVtFTZlEQ/LamMN4n9mV8NCah7LsNP5z7ekS1wIkR3/44
 /Ftjdq+7vAiIEQmgUPfJDcI6tvipmCxc0NrMXlf6mjBmI5aFfZlghuW3/jewwfsM25ao
 sOL0ZmD4tpw+LIG1pmw92YIX2Hu5K+n1M0P5r61efU8xqq+AOkVsUzR4UrKklUKfUnQi
 Q/vb4vMBN8Yni9VO0o0i4ip8AIdtUeYfvNQ9Ig93n+clAUnvJi7Hd9HwHi0Pzog6dQKc
 Hsmw==
X-Gm-Message-State: AOAM530TLYXbtisxJEldnfCJ5SAA5/PedBLQAZ1quNzO/zc8mbLgDNS+
 FqZwmssii65KiTvp8TidgZCzZnQnsIW7Vqqsq7m1BXlexYCv4Wu2K8ONdUINNoD2mZCABAS/feH
 DmvYb28tbXya2iR0dD+NIDo7Kuk3NJEUfwUCZohNtrykkouOdlz0QoMDT8rXR
X-Received: by 2002:a5d:6744:: with SMTP id l4mr23263562wrw.378.1605604759447; 
 Tue, 17 Nov 2020 01:19:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBRX4KtkANmoXwUrNvk56/4h6tepZigh9tHtMmw1pPvsjuBqg7qgvMcHmFlPY4cPjYujh3uw==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr23263537wrw.378.1605604759160; 
 Tue, 17 Nov 2020 01:19:19 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id g23sm2658260wmh.21.2020.11.17.01.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:19:18 -0800 (PST)
Date: Tue, 17 Nov 2020 04:19:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 7/7] vhost-user-blk/scsi: Fix broken error handling for
 socket call
Message-ID: <20201117091848.695370-8-mst@redhat.com>
References: <20201117091848.695370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201117091848.695370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: AlexChen <alex.chen@huawei.com>, Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: AlexChen <alex.chen@huawei.com>

When socket() fails, it returns -1, 0 is the normal return value and should not return error.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
Message-Id: <5F9A5B48.9030509@huawei.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
 contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
index caad88637e..dc981bf945 100644
--- a/contrib/vhost-user-blk/vhost-user-blk.c
+++ b/contrib/vhost-user-blk/vhost-user-blk.c
@@ -476,7 +476,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);
 
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
index 3c912384e9..0f9ba4b2a2 100644
--- a/contrib/vhost-user-scsi/vhost-user-scsi.c
+++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
@@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
     assert(unix_fn);
 
     sock = socket(AF_UNIX, SOCK_STREAM, 0);
-    if (sock <= 0) {
+    if (sock < 0) {
         perror("socket");
         return -1;
     }
-- 
MST


