Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA02F3C8214
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:52:20 +0200 (CEST)
Received: from localhost ([::1]:39272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bYx-0001DQ-Ts
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK9-0002Pl-Do
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:01 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK6-0004Nm-7Y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:01 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l17-20020a05600c1d11b029021f84fcaf75so3482534wms.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rG24NOR91Qg2+XeFSWWcaoLy60AMCL04c6OnSuNktSk=;
 b=w7h70in4Q96oWgKRUSQInBv/qXHfr0tGHyh16PX/aTdWJxjPVb/dilVl83a+sFFwrk
 HqNpCaF3WP4sdsAyrppDvK4fAgrvoaWu7Af+hm/Rd/sACOuaAYnpdmBiC82MwS/iGD50
 lJlCSp6DphFpX+QCiz9ydJGZXjUheh19bqnlUqS5cZkqv/8udZoV1GZ/mbVh65V6h6cD
 ZuQimbcw7fPzs/I5cUN8E9N9tZNAAuZFcijNhBQn1gh1OqIgqIdLmhHVa1BmrYmagQtv
 vSIpVdvOZhmH5SAeq2hRXS8lgN4+a8DyFbSg3mK82SUFtwVlIZ5QBI5VeH8EFI4mKDvM
 m7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rG24NOR91Qg2+XeFSWWcaoLy60AMCL04c6OnSuNktSk=;
 b=Wkz95/IHMXF+S5gUT/mjxDgzTQftt0LZZ4oB9ah0HeUDKjlZA6tXMbCMds8ayUxdXH
 hICtKUDfq3UxWiQaAh8qGO/LLEA/2v3z97ukRK8TSHEFet+hCH72piLbkDyG1dSBDBt0
 lxtg6L7mbBOaVnoXdnj+JgGI9vmy1GPFojKONPn5iU+xNFyzrx7cZI08kadQlD0D9Jjg
 syqEOJOmdW9rK2rdtD6RXKH3qKICKEGL+jnOi1Mdxh0ec4L5Zn6FR+NVyVmAY4rxUzlw
 oqQi5owzX8A4zLQgxcnki0uJRCANeu5d2xnsKM0li2fbu2XMJzV7wEKcpD3Gc4h2wjCW
 Uu6g==
X-Gm-Message-State: AOAM530jN/b4dcf4VkNJtuGTqHp4CsDqucZ03GVcuPIYm7YZfGuhLptf
 OhqPETLLq3jArIfslM5DEB39vbgrK0H7DQ==
X-Google-Smtp-Source: ABdhPJx4a7Yb8Ko9uv8KhYtxxdcGPuWXOxjUiu0gb2p+U2t2ZFpuvsblyjyee+VRZ0ILafriCdNuTw==
X-Received: by 2002:a1c:1dd4:: with SMTP id d203mr2984970wmd.28.1626255416945; 
 Wed, 14 Jul 2021 02:36:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm1591777wmj.11.2021.07.14.02.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 215621FF9C;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/21] contrib/gitdm: un-ironically add a mapping for LWN
Date: Wed, 14 Jul 2021 10:36:30 +0100
Message-Id: <20210714093638.21077-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this mainly comes from kernel-doc stuff imported into the QEMU
tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
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
2.20.1


