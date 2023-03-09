Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D7A6B1EC9
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:52:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBzY-0007qU-GQ; Thu, 09 Mar 2023 03:51:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzV-0007pl-D9
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:13 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1paBzT-00024c-II
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:51:13 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 fr5-20020a17090ae2c500b0023af8a036d2so4522210pjb.5
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678351870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+i0w9WqIL9ZPbYW/Yv5TskuJR8MxXHPruOqgSTtE0fY=;
 b=iItvA+MzNT8mtvCs1pj16AOETtyxbqTr+dOV2gyWwiGrlDOUIbmxTiVtMssA8AGSe0
 ssXoV06reFUqYX2L4ZPPv+dz1lqMKrTx/PmWKAVmXdGbnIPKewkh+WMrQqAfgB2QnUmE
 6pce2D05X0M5Rm2lNGjZv2+sO2UvA6ycCKlOZAoJ7oKmBRYWtg8+kWW4FNwwe9mg6PdC
 LrPJ7WaEqhbB1p9bzfp1xqEVNvIMjvFwn0LyF53RZDubZ8foPyhpJUEygKc8wzSNPnj6
 pJJ4ZeIPwh9sx//Y+qpgWODeO8siuMaVzploDGKCpQBmmMn0zcZb5j2UYyaA7qG3sx61
 VU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+i0w9WqIL9ZPbYW/Yv5TskuJR8MxXHPruOqgSTtE0fY=;
 b=WdBlXJhgFutiu2VplnyKRhD9Uuvwj/7LKuTUym1UzIypdlZJrMb5N7Xjts6IQxskFJ
 S+3D3yzu8lGMxs6kwNP0UhcakRNo7Bv03MXJtArCGQCsAxzbKk2OCRuWz6CH+et6C96u
 Zh7AV9W1nyJEr6ldXobsZU78RACl6ht+9miz9zLpl5J2FfwIq4TKpXVHOM+K3aoD3qUe
 fWFXT9U9yBvHheVbOuMBNspFuy2nOiE7aLx57WI/48VMx9yFczMWs0PgxNzV8ZrFptXq
 ehvuMzUXGLDwY3AAYPr9SGq9i6T1UiDwddPMcFxpDWkZAjDrReYeUdK2DDEfDg6XmFBb
 4KoA==
X-Gm-Message-State: AO0yUKVgK+Gbgv6Pmp0RAoxl/+iuxw1c0eOHbH4sNqZU8pq1Tfw2Ccr3
 4XvG0WXotGiW5KCWxDxFoTPblPvyq223kkHjOeI=
X-Google-Smtp-Source: AK7set8ftWQHv1D5/0RoFpnuh7BmT9reUnqkwdpkJf4bmvLnd2t//tccurlO9OTQd3vpqPWi5PediQ==
X-Received: by 2002:a05:6a20:6a9e:b0:cc:f047:afaf with SMTP id
 bi30-20020a056a206a9e00b000ccf047afafmr18297962pzb.11.1678351869994; 
 Thu, 09 Mar 2023 00:51:09 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 v18-20020aa78092000000b00597caf6236esm10571382pff.150.2023.03.09.00.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:51:09 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org, virtio-dev@lists.oasis-open.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Liu Jiang <gerry@linux.alibaba.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH V3 1/2] docs: vhost-user: Define memory region separately
Date: Thu,  9 Mar 2023 14:21:00 +0530
Message-Id: <7c3718e5eb99178b22696682ae73aca6df1899c7.1678351495.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1678351495.git.viresh.kumar@linaro.org>
References: <cover.1678351495.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The same layout is defined twice, once in "single memory region
description" and then in "memory regions description".

Separate out details of memory region from these two and reuse the same
definition later on.

While at it, also rename "memory regions description" to "multiple
memory regions description", to avoid potential confusion around similar
names. And define single region before multiple ones.

This is just a documentation optimization, the protocol remains the same.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 docs/interop/vhost-user.rst | 39 +++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 8a5924ea75ab..1720d681264d 100644
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
@@ -158,19 +148,26 @@ Memory regions description
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
2.31.1.272.g89b43f80a514


