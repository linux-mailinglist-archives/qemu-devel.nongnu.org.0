Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96F73287EB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:33:14 +0100 (CET)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGmPx-0001mN-Sn
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:33:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGmLk-0007dN-1b
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:28:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lGmLg-000321-0f
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 12:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614619726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fSg5u7cAR09t67MDMS84eP2ISKD4ICBgfUfMXJF2eJc=;
 b=FEfr/zCKYVHgKbG5ukRlPBvcw5pZygm1L2KDuzCOjxVwi65JkNNysQLmAKvelbyKENL4iO
 Nck0D1EoivwR/hZ1/1b0gpOZ3OXVn+ZVjPmOg0RmnKVW4gFE2QL3Kj0CnKP2oH6S+dUaRY
 b6NSuw7ZAD3j8/nqzbpk/Xi1nCMGJ7A=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-FzNXdeuCO7W_vZU0sRt67w-1; Mon, 01 Mar 2021 12:28:39 -0500
X-MC-Unique: FzNXdeuCO7W_vZU0sRt67w-1
Received: by mail-ot1-f70.google.com with SMTP id h19so11026848ots.12
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 09:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fSg5u7cAR09t67MDMS84eP2ISKD4ICBgfUfMXJF2eJc=;
 b=LfG6dOaGW2GHb0ZbHR+ju7LqSRHQKhqdq8LQzYnM55Obu0QAqKOkWrqkJrdV9pUuBp
 SYVsYCgmVDxE1opn6F3Shd0wkmKSapaRocNRrIQb0g6+kJp1tOl+Ca553H025t7SXfIT
 UILBYmVZXCeQXcie6XTOmJbHX8bfFPQgW7so1gMOeqvC6QD1a2gQUtMcJ8YxKB1Fbx7Q
 /49Nj0wsWlkl/AIxsIP0T3tg2Mk2oKWcrjnhVPPZ5UTREEdXMOJogp2kBgaG7pFRsvoW
 2BbuLKZpBjoWH3bfuvVeqjhLxs5M4hnNQ8Qspr9mItaQVgwFyYsZ7wMhnb6l8sr3KRIQ
 tUUQ==
X-Gm-Message-State: AOAM532cXZ99d7FX68l+E3x1CwBl46Fn7GswjkCuuKJdH/otWv9krmJ1
 LROsDFb462QMSjmpQy1tHGAeA82FfFP9jogiA607VkcAiNjf16Bb9zA60IbT0MNzE5SoDdSsJfo
 AO2qKKUjvF2d1TuNiqBJB6GJbjOVy6wiJE8e0iGd1Fcom1j4fLAOeNnKV7SUN70hI
X-Received: by 2002:a9d:6193:: with SMTP id g19mr14830754otk.359.1614619719013; 
 Mon, 01 Mar 2021 09:28:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1uI+DemQ2iiawyAne2F/6wr82swN9VKikpuKh4ISrQ6QiVj7EE7oG7yMFCwWLKciAmOKCaw==
X-Received: by 2002:a9d:6193:: with SMTP id g19mr14830718otk.359.1614619718663; 
 Mon, 01 Mar 2021 09:28:38 -0800 (PST)
Received: from redhat.redhat.com (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id y11sm3508909oov.9.2021.03.01.09.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 09:28:38 -0800 (PST)
From: Connor Kuehl <ckuehl@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Document qemu-img options data_file and data_file_raw
Date: Mon,  1 Mar 2021 11:28:37 -0600
Message-Id: <20210301172837.20146-1-ckuehl@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jsnow@redhat.com, hhan@redhat.com, stefanha@redhat.com, mreitz@redhat.com
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

Reported-by: Han Han <hhan@redhat.com>
Co-developed-by: Han Han <hhan@redhat.com>
Fixes: https://bugzilla.redhat.com/1763105
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
---
 docs/tools/qemu-img.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index b615aa8419..5cc585dc27 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -866,6 +866,18 @@ Supported image file formats:
     issue ``lsattr filename`` to check if the NOCOW flag is set or not
     (Capital 'C' is NOCOW flag).
 
+  ``data_file``
+    Pathname that refers to a file that will store all guest data. If
+    this option is used, the qcow2 file will only contain the image's
+    metadata.
+
+  ``data_file_raw``
+    If this option is set to ``on``, QEMU will always keep the external
+    data file consistent as a standalone read-only raw image. The default
+    value is ``off``.
+
+    This option can only be enabled if ``data_file`` is set.
+
 ``Other``
 
   QEMU also supports various other image file formats for
-- 
2.29.2


