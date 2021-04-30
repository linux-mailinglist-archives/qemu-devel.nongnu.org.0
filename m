Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9236FBCD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:56:02 +0200 (CEST)
Received: from localhost ([::1]:52524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTcf-0003Z6-4G
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTIY-000560-9W
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lcTIL-0007qT-1N
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 09:35:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619789697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=grzWLZRznpxqzFOGgX9dbi9o7h4KuPzbTBVqPKPVJcw=;
 b=NHPQxMARwqkB3MazH1/aWLixOPnh36bRxeM65Cj8qxyA2a35PYUDz6GlrmdrwF1Pa5O5eo
 RO/J9wG9/hg+6MD6Thh12Yu8UCZW1fbj14v53oPTX7RbaWxNxd0dn3LerPl5x+gC99jz35
 lH4tATLPSdj5PD+SJ7ZslgHvNpf//jI=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-HNlSSHhZP5mEJpNT5QjYYw-1; Fri, 30 Apr 2021 09:34:55 -0400
X-MC-Unique: HNlSSHhZP5mEJpNT5QjYYw-1
Received: by mail-ot1-f72.google.com with SMTP id
 e4-20020a05683013c4b02902a2640456dcso17605583otq.23
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 06:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=grzWLZRznpxqzFOGgX9dbi9o7h4KuPzbTBVqPKPVJcw=;
 b=a90/lXtnfwiIwWKpmN8YacencQFHUTIgE+2xbD47pmo3DKpmENvPKDw6LWJH2b3UdS
 giPZomz7ooznMBdGQhf2KjQK27vLqyQkFBjG+/Du4f5wU/i/VHW+VN8TlINDLY9U0gjJ
 /8/sySkwyKSMLpgKf+xffyUJuQgWpWfizF+Ejh1+dshdqb0UU3yuts6C54OSX9Is7qi+
 n3vXzON2OiHiYJvAZ3q/wAz4mtUzYcVyTjQWyjJDXZ1N+6PKETDW9MsFuS8zcq26qBaA
 PQxpePqsV2bHxKlV8TryedDPIu5nsVuV03YY1/5kTnGJdUI5Hobb/mjU7pYxazaOL13v
 krnQ==
X-Gm-Message-State: AOAM5322HqDvjekG6+MwTVQxRjrBrRGetLjsfY911sYNsgty8ZjxpIJu
 kJVeBdFXaTEfbuhldogAr8vn+UHHIfzQyOGiN/e5AoFqBkRWzx4ZP1vkRDs1V6/Q4L7FvtGDK59
 tLorur/78lHG2pm8=
X-Received: by 2002:a9d:7e95:: with SMTP id m21mr3718053otp.76.1619789693923; 
 Fri, 30 Apr 2021 06:34:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy59wG3E45InoeuXvyuHwFwB8Flv852G//m598bBrjlzwGjB+RuBfDRSaGKUaKrSoTVWuZnpw==
X-Received: by 2002:a9d:7e95:: with SMTP id m21mr3718040otp.76.1619789693732; 
 Fri, 30 Apr 2021 06:34:53 -0700 (PDT)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id r189sm787546oif.8.2021.04.30.06.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 06:34:53 -0700 (PDT)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2] Document qemu-img options data_file and data_file_raw
Date: Fri, 30 Apr 2021 08:34:52 -0500
Message-Id: <20210430133452.253102-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The contents of this patch were initially developed and posted by Han
Han[1], however, it appears the original patch was not applied. Since
then, the relevant documentation has been moved and adapted to a new
format.

I've taken most of the original wording and tweaked it according to
some of the feedback from the original patch submission. I've also
adapted it to restructured text, which is the format the documentation
currently uses.

[1] https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg01253.html

Fixes: https://bugzilla.redhat.com/1763105
Signed-off-by: Han Han <hhan@redhat.com>
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
Changes since v1:
  * Clarify different behaviors with these options when using qemu-img
    create vs amend (Max)
  * Touch on the negative case of how the file becomes inconsistent
    (John)

 docs/tools/qemu-img.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index c9efcfaefc..87b4a65535 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -866,6 +866,26 @@ Supported image file formats:
     issue ``lsattr filename`` to check if the NOCOW flag is set or not
     (Capital 'C' is NOCOW flag).
 
+  ``data_file``
+    Filename where all guest data will be stored. If this option is used,
+    the qcow2 file will only contain the image's metadata.
+
+    Note: Data loss will occur if the given filename already exists when
+    using this option with ``qemu-img create`` since ``qemu-img`` will create
+    the data file anew, overwriting the file's original contents. To simply
+    update the reference to point to the given pre-existing file, use
+    ``qemu-img amend``.
+
+  ``data_file_raw``
+    If this option is set to ``on``, QEMU will always keep the external
+    data file consistent as a standalone read-only raw image. It does
+    this by forwarding updates through to the raw image in addition to
+    updating the image metadata. If set to ``off``, QEMU will only
+    update the image metadata without forwarding the changes through
+    to the raw image. The default value is ``off``.
+
+    This option can only be enabled if ``data_file`` is set.
+
 ``Other``
 
   QEMU also supports various other image file formats for
-- 
2.30.2


