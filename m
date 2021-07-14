Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584423C8200
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:45:35 +0200 (CEST)
Received: from localhost ([::1]:41822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bSQ-0000ms-9y
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:45:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bK0-0001wd-PB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJz-0004J6-3r
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:52 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so3487483wms.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iypXcdw5mlwuIysZPQWovjCubqXhpHUzMF180LrBYeI=;
 b=YV6s4S45wruuKlTWS1n1PBEVH2wxuSNLr7i87XMMRBmb6lo0WdDthheCceWhvrDM6S
 QtDxKR+d3k5yEgwaSAygJxFSyZIhomo4HWVmhKWwsojkKR8G1tPX6C49RT8R8fQenZam
 IhOMMT5/1/Je+63BxZkxUEUGYUoSM1WtTerdB98/Ud/D0GISLebSECeOk3s1kZ/IC+cW
 CqI6wfcckGcLLiANr7VPWBr+uoDaLtyuWockE1V0LQsb423ABPjIStyIIgmEWj33z/v4
 P5Q+hPxVACNk+ObX7sYOcGfFgAlTGMQBm3nhDulkXwGjjA/FFa+TeJ6+vyGAtQ3GdObR
 tmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iypXcdw5mlwuIysZPQWovjCubqXhpHUzMF180LrBYeI=;
 b=rkb9x6NQYezVeTljRSguzHI1zq8XxHfooa1C+irAylRUwv+ZNdGV7GDo2JpxMkCfAP
 9kuopW8V1GSurZAza4/K1AckxRbWoAXl/drFATsS4Z+Wzflh2WDHYkdQo/qD6CxbvuJk
 ZRIbzGLpsudxS6Vms5KNmvwnFnvZBcLHrSc5C19DbVijtjjeMOVfPXCqgFjA6nwIBCie
 d5xpBkgmqLB7b04BAeZbVaPZ1sId0Q/mVTnEFBa3oli8enT0P3hkt5r+DoanFHFY17/y
 kX42gMN9+ZlkO2V8fWYzy4UUOmPaM1vYBdt+h8z0D9toGjnVFu7j1GrjM3e632UbYbnB
 8ODA==
X-Gm-Message-State: AOAM5334NzjBPKrIrpevvFWFGiVB5LxpKlXdIrBRyP2NC3fOdN2psuJg
 /+uDQBnHOcrPtmUpOONJfIHROg==
X-Google-Smtp-Source: ABdhPJwVMw5x4rCgr4a998u4676F2l1YJvkdduN/pcZdaXWWgl1Yta2bp1YwpF3B/2CAz++GRLoc9A==
X-Received: by 2002:a1c:493:: with SMTP id 141mr5810389wme.172.1626255409243; 
 Wed, 14 Jul 2021 02:36:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y3sm1941871wrh.16.2021.07.14.02.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8862D1FF93;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/21] contrib/gitdm: add domain-map for MontaVista
Date: Wed, 14 Jul 2021 10:36:24 +0100
Message-Id: <20210714093638.21077-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Corey Minyard <minyard@mvista.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Corey Minyard <minyard@mvista.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0074da618f..efbbb15643 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
 microsoft.com   Microsoft
+mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
 oracle.com      Oracle
-- 
2.20.1


