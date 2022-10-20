Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159026065F2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:38:38 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYZ2-000158-QN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:38:37 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYG1-0002Rw-NB
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDQ-0000bj-7f
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDN-000503-RO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bk15so33980440wrb.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SzAr/vuWvX+J4SSUaSRUOc+zGR29CAkOND/bkbQMiUQ=;
 b=mvwiiFMvQJxQobAJYz7KTLbaYctl3coppazsCf/2J29RTKJQxwSg4zeKFo9rkXqLEY
 V4EOyS+JQjMT+aJFRkYElbhRVRPXXv9N6niaT9av77uP05r6D1dBMCpSab6Vyzzqh2qo
 eRcE/rD5uU8aUY/hIleDERWfKpx0a0vfGQmRv9i5gwObxfCZYAqoOnOtlJSMD0xx1Y4I
 znNjL0g/4h1JO+MmLru3gk9sFpkPI900QNhm2V28tKRqAwNKKjl3OojIDeA2oJ3hepTW
 zUq9y1lNs6K6FAU373sJCXbfjXAXN58WESA8GJ9n0uXern54axI9aaHRpZtsO2XdV9PV
 yf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SzAr/vuWvX+J4SSUaSRUOc+zGR29CAkOND/bkbQMiUQ=;
 b=lvL/fX7X8DFC5BaO+K2ehhk7yCEUkIuHCx7GeUwViX2U3fWlvSQFLmJ8NDGyqWOeSS
 ev6OcIt7CqGFC1dK0J7+wUCuuQnCkoMADQRZqVH3J0kUGHj8VLKpTwUea+PGUXwqjwKN
 tQGj1xK27cnwAxGfuv4JgyM10hC12BF2warkNYf61q/e9WlpoIpUWNzUoCA/giVpdF66
 AmTYcOpLtepRKs1n4GI22Dfijh8AzuEVC5SErjhAzzFpeVZu4+DuCwrbtmpTIqPfeoP2
 7PRxRrRPaCXlgy8JnSgLCLXURt7IA9qYSF6NKtdVedMPDvmeWfCysrps6vMZxTKbDnpa
 0zxw==
X-Gm-Message-State: ACrzQf10ObH/YaIm3vmmeJEDmxmWTqIdoBXYXiEbAbw8D3Ct8zPd2Dtj
 NPegncPn0zCdQJfLQs4OKRzSAg==
X-Google-Smtp-Source: AMsMyM7J2ZghDCEakN+dqCHR1VbDBFdv52163Bh6CIiFFLW5iU6HCl58DrR4zSuzWnL/cX+Zzb+vgA==
X-Received: by 2002:adf:d4c3:0:b0:22e:326f:e8ef with SMTP id
 w3-20020adfd4c3000000b0022e326fe8efmr7817002wrk.242.1666267197006; 
 Thu, 20 Oct 2022 04:59:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a5d5009000000b0022e3d7c9887sm16091124wrt.101.2022.10.20.04.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 881651FFC7;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 16/26] MAINTAINERS: add features_to_c.sh to gdbstub files
Date: Thu, 20 Oct 2022 12:51:59 +0100
Message-Id: <20221020115209.1761864-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6a6f4d62bd..0f4c50e8eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2693,6 +2693,7 @@ F: gdbstub/*
 F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
+F: scripts/feature_to_c.sh
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
-- 
2.34.1


