Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2F95EF5A8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:44:54 +0200 (CEST)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odsuL-0002CP-Vl
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw7-0004Nk-CB
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw4-0001Ch-Hm
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:38 -0400
Received: by mail-wm1-x331.google.com with SMTP id iv17so767334wmb.4
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/XRSkW0C7jayMRrat52qAwjXUjYVSmaLK9PMjNjbqoY=;
 b=NiCbuhAfgD611DVFtOiV433p34ngOWQs+e60199kzXV/MbTELqaLxd0/BsZG5UPJdm
 vVyn4hNaN6G3iC1lkAOAJZ5fXoTOkr325YDakI7YA/BQBWmud5AxM3abBz3szQFbdm5L
 DdmUs1prkYCoLhGWKBHBfotavwWNwUsvLd/xcy35Da1hjJUCF+5fmJLET66IO4KUXcVQ
 z1p4w0BrIAgxS8m/Y9Fw/zEOHXW3CTaekiSF+M4dltdVzA04CG0sfwHmwyoHrgx23P2B
 9xtjg440VfT9tUkW8RabVqI65ueYpwoHaqLQ6KfzqIh8yotId+3wGZpv3B4Dt/JNev5n
 m2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/XRSkW0C7jayMRrat52qAwjXUjYVSmaLK9PMjNjbqoY=;
 b=iufkbTsKiGR5gov9Fkts230io798d1usr4vIemXSawlKtLVpLpZe7crI87Jt8FQx5U
 xlnH7cB51EfkewbTZ7z62a2seVnihcsog3EKxM7z8oiMwcUcTIHtcOJUOjth2aB0dkW4
 GppYbi1Qw9n8vk0oKGgbzRSxMMP8ygC3ZA8NaRkE1rN+Ct9TPvQp6m8Wt9tiIZrUJSKo
 Kex5x0c1/MTtWMzhYk3LADFnVXd+BvxBAWB9QFnsLhCQ1RaJLoQQjZOGEFik7YrCfhNU
 rX7YeRZ+q+AYOFN/EhQYtcrlrF+JbgivCMPqa5RJZLUW1fGCSU3oeafd3dq9Wz4SmR5r
 Zfdg==
X-Gm-Message-State: ACrzQf0/N3ePkk0LGoxbgfeKcqx4o8nv78lbwa+qU4w4FT/6NCyEjXoY
 Yky81CNDw1cm7N9+Lo6WxLccSw==
X-Google-Smtp-Source: AMsMyM67NGT6Zeb1zueByAYR4f+OmvozJojrsRE+xEp9NKIrsACSKD3PAyvAENeb8vUYZ6ZNJs67AA==
X-Received: by 2002:a05:600c:3b12:b0:3b4:a6ea:1399 with SMTP id
 m18-20020a05600c3b1200b003b4a6ea1399mr10218273wms.49.1664451755158; 
 Thu, 29 Sep 2022 04:42:35 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a5d4481000000b0022ae401e9e0sm6361567wrq.78.2022.09.29.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8A471FFBE;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Anton Johansson <anjo@rev.ng>, Alessandro Di Federico <ale@rev.ng>,
 Paolo Montesel <babush@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 06/51] target/hexagon: add flex/bison/glib2 to qemu.yml
Date: Thu, 29 Sep 2022 12:41:46 +0100
Message-Id: <20220929114231.583801-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Johansson <anjo@rev.ng>

Note, the glib2-native mapping exists separately from the normal glib2
mapping. The latter uses a `foreign` cross-policy-default, and
libvirt-ci is not able to support package mappings for multiple
cross-compilation policies.

This will probably change in the future.

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Paolo Montesel <babush@rev.ng>
Signed-off-by: Anton Johansson <anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220804115548.13024-9-anjo@rev.ng>
---
 tests/lcitool/projects/qemu.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
index d9f826f8eb..0d92819249 100644
--- a/tests/lcitool/projects/qemu.yml
+++ b/tests/lcitool/projects/qemu.yml
@@ -3,6 +3,7 @@ packages:
  - alsa
  - bash
  - bc
+ - bison
  - brlapi
  - bzip2
  - bzip2-libs
@@ -19,6 +20,7 @@ packages:
  - diffutils
  - dtrace
  - findutils
+ - flex
  - fuse3
  - g++
  - gcc
@@ -26,6 +28,7 @@ packages:
  - gettext
  - genisoimage
  - glib2
+ - glib2-native
  - glib2-static
  - glusterfs
  - gnutls
-- 
2.34.1


