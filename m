Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44B369027E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:51:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ2dR-0006zY-3o; Thu, 09 Feb 2023 03:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dE-0006y1-So
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:18 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1pQ2dC-0007i2-OW
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:50:16 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso3323457wmp.3
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=83K8gJv8m+rAMAu5jjvXWH4/jsnR7tI2aYVC1+Boe0c=;
 b=laRSCcTl6qWyzZKlCJv9dwuZVzM/oaRjSzrzASmNJR4gV6HFn2XTivXT0a3firBncu
 vvTFRjfb/Ic/pj7+kXiSDwck3zongGXaX7i2hNgg4K1Zqd+hxxVrAjlbn9+QYiOIkr0r
 3rUBTDzXpxPbq+SXXdsPk1ShBQvHZxTmoXoLICV14wA/BdjdlaP6nmF8qa8cijHIUS11
 c4lk7dnpUc+fLGF6L0GNnPWtinClABdk0BT5mg1LJcNOIflyH4wl9sVkQ5BPJmK8vwPr
 FAZoSepM/4fHPGJQQhxHgZ8sk5Am2f5OIUtGEh++KcGfx3uEk4n4Fg9dmkspg58lohRP
 jmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83K8gJv8m+rAMAu5jjvXWH4/jsnR7tI2aYVC1+Boe0c=;
 b=lTwWqNTdlpYQVq8ZKFrcUwtbp1DTYPMyfEMQZMTKgTunjdDP6BKhfW5nSolLMaww/S
 xAOpqSuN6lRloJ/toxI4dhzidhmiKz3AL7a2mtytbzNpGV6WG8FzkAPLgkImp83jkQfe
 mRco6sv+QoOx5u0MIwmwEyY2L/b27UrVwxzFMUGQqdkypXprNt2QLjHd3TzR7APD033Q
 +1gYSyMaQJcLSLxUkMgHRHPK8gjR9W9GQRvVFrozhiiptOAa5t5+c5tuiipTVQtN/XNa
 zcyRDCSZZI38kGwXjLp6Vn2OSl/rWqqllRr5mxvsxL12rRAkjzQ/fEdAVecm4B/n1Mqo
 PT6g==
X-Gm-Message-State: AO0yUKXFhsIKLI2MopXX/R4ra8yMtTMJxYXOIVV+l5mVgfFpBehAo9bu
 fdE1j2yDvkTVUYlmNM6wpQBwYZbM1jteUZd4
X-Google-Smtp-Source: AK7set8KXiQeu+kHoiUl7GInxPfx69ErqaFexzrbFc0CFrbtIj91FHU8Z2tTtsvQ1CvkHjzXL/l6yA==
X-Received: by 2002:a05:600c:993:b0:3e1:577:80f5 with SMTP id
 w19-20020a05600c099300b003e1057780f5mr6887001wmp.31.1675932611681; 
 Thu, 09 Feb 2023 00:50:11 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 ay42-20020a05600c1e2a00b003dffe312925sm4169535wmb.15.2023.02.09.00.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 00:50:11 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 0/3] qga/win/vss: add VSS backup type options
Date: Thu,  9 Feb 2023 10:50:01 +0200
Message-Id: <20230209085004.2745131-1-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::330;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, URI_TRY_3LD=1.167 autolearn=no autolearn_force=no
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

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/775

The problem, VSS backup type VSS-FULL (the only available VSS backup type currently) can break other backups that use VSS-FULL(for example, Bareos-Fullbackup).

Fix, add other backup types.

Implementation, put the desired backup type number inside Regkey value HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QEMU Guest Agent VSS Provider\VssOption, so that the program can query the desired backup type.

VSS backup types:
number   type
1        VSS_BT_FULL
2        VSS_BT_INCREMENTAL
3        VSS_BT_DIFFERENTIAL
4        VSS_BT_LOG
5        VSS_BT_COPY

for more information about the different backup types https://learn.microsoft.com/en-us/windows/win32/vss/vss-backup-state

Additionally, the program would work as before with VSS-FULL in cases where VssOption doesn't exist, or VssOption value isn't a known backup type.

Kfir Manor (3):
  add VssOption to installer
  query VSS backup type
  requester_freeze changes

 qga/installer/qemu-ga.wxs   |  4 ++++
 qga/vss-win32/requester.cpp | 41 ++++++++++++++++++++++++++++++++++++-
 qga/vss-win32/vss-handles.h |  3 +++
 3 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.38.1


