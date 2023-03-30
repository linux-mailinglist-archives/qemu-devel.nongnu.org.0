Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5256D00C8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG8-0007YL-Jj; Thu, 30 Mar 2023 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG2-0007UU-7M
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:51 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFy-0000HP-2c
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 t17-20020a05600c451100b003edc906aeeaso3036001wmo.1
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N6sz1M7T3yD0wZFnzMX54YCnX2Tqb42vTWqBIcF5gCE=;
 b=Bdjj8WKrzy6Wdg1DGEaGjGZqSRqCX4DgewBrwqWLgCJfv7taZDI5horHeWiQ/SzUbW
 KUw0qONWZ7GUfScfifJfjJBELg9DRU3pNKA68IvNJA8yDF24yTw5S0fqUPCwAyHavis6
 4wMMGRPEo61C2jcj1SNVFjlPKi1/B03K12kIx5SNHB3Jp+EL2Sv5w0Ej0z8SobzUEGp+
 neL8EvuF26pDUFmjW8AfJXIXt7ELFgT87rThfLQMIbYCBteJbQy49TNalCmFoOvXFcP4
 1DzzL3GU0Kv8FMac39kqMMgC1Xx7gmZIdlBF9V0OKxcrK1y651ssQswBfS91N2EWzA+J
 HAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171104;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N6sz1M7T3yD0wZFnzMX54YCnX2Tqb42vTWqBIcF5gCE=;
 b=za282lpb/Qcz91SKehwDvq9h/vSR5g9X+iVjgpKn2BYK5bUKKdKhSqTJdIDqXkAGw7
 kiM5IpACNrNDVX/icHcQfrQqWuSQuIY3a/6v9Dy8Urx0yyi/XNSG7AUoadj0GUnUbWu6
 S7NWP+5gFxn+fe75Ly/j1gtztTGWWlJ2wQKhK9hsLjJlWn5BY7fD8KaoCWBt+/H2OIln
 uTIAaEzq12KVZx43lC61nfe8Wj/LQlTblTjKo+PJ/e2E9Rybnt3flZCh9SpjBWwcOzgR
 dd4p9ObiUvDXGKCiiJqP52kekwX+d7NB6CFJyyQPWEezufw+aHTATmVExl7ygqQTDvqb
 SGSQ==
X-Gm-Message-State: AO0yUKXaSM0OCF2Pqwy9DHE7A0XowugpPY/Pjv6FJo2GF1+ryAJOg0k4
 jxG+KV+C+s/5PzkFJPUpwEtjKQ==
X-Google-Smtp-Source: AK7set8e7DIZ9wbF6cWc7Prknb2w+iA0IoNlLrjES/47mo6sMIdmtQK3AeHHrj8OE3q0qKcxmp7iyA==
X-Received: by 2002:a05:600c:21d8:b0:3ee:5d1d:6c2d with SMTP id
 x24-20020a05600c21d800b003ee5d1d6c2dmr16597876wmj.35.1680171104125; 
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 iw13-20020a05600c54cd00b003ef6988e54csm5414825wmb.15.2023.03.30.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EB4C1FFBC;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 04/11] qemu-options: finesse the recommendations around
 -blockdev
Date: Thu, 30 Mar 2023 11:11:34 +0100
Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

We are a bit premature in recommending -blockdev/-device as the best
way to configure block devices, especially in the common case.
Improve the language to hopefully make things clearer.

Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 qemu-options.hx | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..9a69ed838e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1143,10 +1143,14 @@ have gone through several iterations as the feature set and complexity
 of the block layer have grown. Many online guides to QEMU often
 reference older and deprecated options, which can lead to confusion.
 
-The recommended modern way to describe disks is to use a combination of
+The most explicit way to describe disks is to use a combination of
 ``-device`` to specify the hardware device and ``-blockdev`` to
 describe the backend. The device defines what the guest sees and the
-backend describes how QEMU handles the data.
+backend describes how QEMU handles the data. The ``-drive`` option
+combines the device and backend into a single command line options
+which is useful in the majority of cases. Older options like ``-hda``
+bake in a lot of assumptions from the days when QEMU was emulating a
+legacy PC, they are not recommended for modern configurations.
 
 ERST
 
-- 
2.39.2


