Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A246EDCFF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMj-0006V1-Jz; Tue, 25 Apr 2023 03:45:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMQ-0006Ks-2a
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMO-0006c9-AY
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XpLwGyAuffmak/eTKXXpWJi44gue+ywAUu/QiqjzQo=;
 b=FNz7bSgjOeUKc5eVafHGJ0K+2DCkjStRnbgMKQcHje8HVKnwJrqh/9AfjDuMpyustDVZQy
 QZc1yyd7fhZreJzwy/Tf+DeLdT6abPY+wMLdAbIQvY9gA4pHh9CJlDtHqSbntezP85MWM2
 lwM2VbDYlx0lZe+NRcYl64pW2EImFqI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-SH2i4_KRMpq1c5qcbfU5Fw-1; Tue, 25 Apr 2023 03:45:10 -0400
X-MC-Unique: SH2i4_KRMpq1c5qcbfU5Fw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so51448885e9.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408708; x=1685000708;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XpLwGyAuffmak/eTKXXpWJi44gue+ywAUu/QiqjzQo=;
 b=DTEGNAPs9oTo+lW4NogqRrfg4i7JVSbD+LZ25GGCHQucKvp73CvY1GgDZ6VCZGyRlp
 GXZBh9gWYtoIpJSLx7RG7g6lxb+kqk25fhIY9orkfVTrSAHuhAUgNy01ucrIvI+LgsVY
 o2oojotZAibcVwAKOZNKQRr3h/cCMY2aR9xTRIRwTq4qLBy1RxyUtCklEwfxDiXnoroS
 IXO24Z42CinNzj0z5LgdWCZFiwq7jkppNCpnpvKNKV6s0VtTkZPZEUUWDIfrnQZsc43/
 x2PgC1VHO38NUlGsCt/vEZyDdA4iLKOjsaMYHdyjINgiP/NgSn6K7Id5vHGDjGnxMCpj
 Z07w==
X-Gm-Message-State: AAQBX9cwnStfc7pIKQ5Fe6OdPd2snuZwa+KlGTgsGQTcKDcHzZwXaYyp
 SRw3YKXN0gOF6inLaTwIF345j3tyKce4w6UEYiKRo0znEVpWo5qlqmKgpBd0TVWJAy0WUVIdNUJ
 JVLpo17OUSdZGtG+7L82gdcRo+1nYiJfmmJEObszXFVJFb5SC8AipzuFHIaiAZMUUJ0je
X-Received: by 2002:a7b:cc15:0:b0:3f1:65cb:8156 with SMTP id
 f21-20020a7bcc15000000b003f165cb8156mr9786377wmh.0.1682408708616; 
 Tue, 25 Apr 2023 00:45:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350b0ftLpcNmMZAotcWmhCi2AG3g1sGm/0QTnNWIGEyI04O318aNN9XkbMR4l9EWDFJl7Ar6Gkw==
X-Received: by 2002:a7b:cc15:0:b0:3f1:65cb:8156 with SMTP id
 f21-20020a7bcc15000000b003f165cb8156mr9786349wmh.0.1682408708255; 
 Tue, 25 Apr 2023 00:45:08 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 f22-20020a1c6a16000000b003f17e79d74asm14278190wmc.7.2023.04.25.00.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:07 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 06/31] docs: vhost-user: Define memory region separately
Message-ID: <17c67f6849551b2bbffb7a3a8b490b853df86129.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Viresh Kumar <viresh.kumar@linaro.org>

The same layout is defined twice, once in "single memory region
description" and then in "memory regions description".

Separate out details of memory region from these two and reuse the same
definition later on.

While at it, also rename "memory regions description" to "multiple
memory regions description", to avoid potential confusion around similar
names. And define single region before multiple ones.

This is just a documentation optimization, the protocol remains the same.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/interop/vhost-user.rst | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 8a5924ea75..1720d68126 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -130,18 +130,8 @@ A vring address description
 Note that a ring address is an IOVA if ``VIRTIO_F_IOMMU_PLATFORM`` has
 been negotiated. Otherwise it is a user address.
 
-Memory regions description
-^^^^^^^^^^^^^^^^^^^^^^^^^^
-
-+-------------+---------+---------+-----+---------+
-| num regions | padding | region0 | ... | region7 |
-+-------------+---------+---------+-----+---------+
-
-:num regions: a 32-bit number of regions
-
-:padding: 32-bit
-
-A region is:
+Memory region description
+^^^^^^^^^^^^^^^^^^^^^^^^^
 
 +---------------+------+--------------+-------------+
 | guest address | size | user address | mmap offset |
@@ -158,19 +148,26 @@ A region is:
 Single memory region description
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-+---------+---------------+------+--------------+-------------+
-| padding | guest address | size | user address | mmap offset |
-+---------+---------------+------+--------------+-------------+
++---------+--------+
+| padding | region |
++---------+--------+
 
 :padding: 64-bit
 
-:guest address: a 64-bit guest address of the region
+A region is represented by Memory region description.
 
-:size: a 64-bit size
+Multiple Memory regions description
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-:user address: a 64-bit user address
++-------------+---------+---------+-----+---------+
+| num regions | padding | region0 | ... | region7 |
++-------------+---------+---------+-----+---------+
 
-:mmap offset: 64-bit offset where region starts in the mapped memory
+:num regions: a 32-bit number of regions
+
+:padding: 32-bit
+
+A region is represented by Memory region description.
 
 Log description
 ^^^^^^^^^^^^^^^
@@ -952,8 +949,8 @@ Front-end message types
 ``VHOST_USER_SET_MEM_TABLE``
   :id: 5
   :equivalent ioctl: ``VHOST_SET_MEM_TABLE``
-  :request payload: memory regions description
-  :reply payload: (postcopy only) memory regions description
+  :request payload: multiple memory regions description
+  :reply payload: (postcopy only) multiple memory regions description
 
   Sets the memory map regions on the back-end so it can translate the
   vring addresses. In the ancillary data there is an array of file
-- 
MST


