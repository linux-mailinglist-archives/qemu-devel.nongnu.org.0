Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6063D0563
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:29:29 +0200 (CEST)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zB2-0006N0-SD
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z91-0003bo-40
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:23 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8z-0005i1-GY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:22 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2399666wmb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kk4C1NWtP4i3ex9C7jyQhWqVHRq6RtdVldnUJBr4KfQ=;
 b=hpjwAecevG5TSUmDGhEuJ6dqruyT8BTRd0tBdwudpIoizvb+vTHok640omjc4c2DVF
 XhDMJfe9Ht2jZiY7CEeW8VcpJx1NJ69lYsQC+Xhnez6BAxHvauXhq540Zh/4XsxIjV0i
 iy5QH0SvKcpN5NvQ3MvJpJVwI+JpiMhbZBybaBS4fHzl7rUpl1OQlmZPxikLKMf5xBWZ
 sUo8whwHAuq/UgfNH3/Oubdwy6PJPQa4/+5QtaB0XpBb7MH/bEnZilGRYxENuSHwDgvj
 5qtyw4U3ZTqg94Vd9AUk+CJBHgzBgX7fT6CuIl+ADlDowbQ1kIRxGAcbLaQYPrv7kQQA
 C19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kk4C1NWtP4i3ex9C7jyQhWqVHRq6RtdVldnUJBr4KfQ=;
 b=AIq5r2oqB63kGlCU0SJZqLj/2aZ0sdn0LNbs0IvVf8gipc/Ru9zj3/IapgHOZECgzU
 Hxk03AkCDNIZlnMiqcdaQ3eeDxrvUO6yrJFqie+lDSfUqPoNPppNY+sh0DUDZCOsqBwl
 H6UA2xdOTXQtF8FChFj2vO+R1svpiFwX+CVDgelZvq4FxuD2SFBXF1rPzwI2nLy2QTxK
 ovE59VVQxaAtgWlYfo6Ii15FJpagxw0S1zxsHPWpf+bKyvl4Zg8eHspdzHKi1tmQW2Nr
 Aj6v4PxT1lik5l/CFFRenXuv7W9ZHWgN5VONe0PLub3mhBurzca8ZvIN3MJ3X9IIXa0I
 tnTg==
X-Gm-Message-State: AOAM533sA7m53wYUgBrv+06DNdc3O6fN66OzWLrfD7wAZV8FiHGmMQPy
 QNL5sdDy7CkpZdxm3c+oPZELEw==
X-Google-Smtp-Source: ABdhPJyXbYzQxokJQnsC8D1awugi3lgtc7hiMT9lX7CGVKidjDQzzRY4zLgeg7bh9nfSycYsnt2b1g==
X-Received: by 2002:a05:600c:4fcf:: with SMTP id
 o15mr918568wmq.116.1626823640238; 
 Tue, 20 Jul 2021 16:27:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h20sm3738497wmb.17.2021.07.20.16.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04F6C1FF9C;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/29] contrib/gitdm: un-ironically add a mapping for LWN
Date: Wed, 21 Jul 2021 00:26:47 +0100
Message-Id: <20210720232703.10650-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, Jonathan Corbet <corbet@lwn.net>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this mainly comes from kernel-doc stuff imported into the QEMU
tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Message-Id: <20210714182056.25888-14-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 27b8fbdf8a..5ac8288716 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
-- 
2.32.0.264.g75ae10bc75


