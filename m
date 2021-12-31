Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C9A4825AD
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 20:54:39 +0100 (CET)
Received: from localhost ([::1]:32822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3Nz4-0004lO-AL
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 14:54:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3Nxa-00041v-96
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:53:06 -0500
Received: from [2607:f8b0:4864:20::42f] (port=38493
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3NxY-0005sV-Hn
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 14:53:05 -0500
Received: by mail-pf1-x42f.google.com with SMTP id b22so24359574pfb.5
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 11:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=JIY/a8WQGPPnb1jQxI061HO9EE8SrDrCiOBk6Ar5BeGsHr1e2FtUtEMzcUd77qyDsv
 jar23Ks93J0mYpSi9LnzFZ6ROhvXDQjT2YL/HqNlUae9AjsD3V1GvlEXLSLHTXPqRM8J
 Ri7BJ4Skz1LA5tdh6dJ2tLwMSqXP0hVbMlKb9BaKrG+cPY3wrDLxYBr2Yd5h7aW15YTJ
 8Pp6QmTIN/i1Q1cl3ivGlCCt/NvOi9wijz8F3yYmgYTD56dQusvDVaIMgytHXIwN1FbY
 EAYqCStUpyWl8lLSAfELO7JnBuwPB/veIXhuoZh47q4didGIHdq8+xgBbo23dXZo1bLR
 6INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=RLCHJ/YuqTFNKHEfpHTl0uqQI7BT77gXtVkMaqhlQ3tjdUbMUOidNDVDBsZK7pYEyY
 wuS0spTd5Roo8LXIeK8gpAtnsu1x1bHOdfseaFwcWXh5xsUC1hu6uqQx2zKtq73G4UND
 g0SFCssaeS2RlTgaKJuq1eXAhqxpjsyM8xExJSQ8uDYqOAa8YsWDCR8Z9RF1pbLwrtoL
 qx3srALwULkU3MQtR8sDyOAohU5lVydS26RgH+c3GtpIUbOIUM3Hc85H5p+z3vQzDsDC
 kdaoP0wfQZoHonu08dVOp3zl2vl2P/bsSdfwyH5sUPMo0FjL93p2uqOj7DTlQ5ERd6Iz
 Uy/Q==
X-Gm-Message-State: AOAM5302Lt60v0gNni+08CvhY+F4kBEhltOwZheRZOFfNd7OdyCB7QUb
 cqSeh4FJoDKB6Eb1GgFuZKHo1N3TKAbSew==
X-Google-Smtp-Source: ABdhPJwHSq0xF/dVZX+r9Q3rMI/2Aed9E981XFRfMGU1Wkj0i5FSI4yKxBNXMWbzOrW/oMtdiMrl/g==
X-Received: by 2002:a63:4564:: with SMTP id u36mr31757466pgk.27.1640980382688; 
 Fri, 31 Dec 2021 11:53:02 -0800 (PST)
Received: from stoup.hsd1.or.comcast.net
 ([2601:1c0:6101:be80:9312:6940:7d21:4efb])
 by smtp.gmail.com with ESMTPSA id l6sm30741613pfu.63.2021.12.31.11.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 11:53:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Unify mips and mips64 in host_arch
Date: Fri, 31 Dec 2021 11:53:01 -0800
Message-Id: <20211231195301.228362-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes the build on a mips64 host.  Prior to the break, we identified
the arch via the __mips__ define; afterward we use meson's
host_machine.cpu_family().  Restore the previous combination.

Fixes: 823eb013452e ("configure, meson: move ARCH to meson.build")
Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 886f0a9343..53065e96ec 100644
--- a/meson.build
+++ b/meson.build
@@ -74,6 +74,8 @@ if cpu not in supported_cpus
   host_arch = 'unknown'
 elif cpu == 'x86'
   host_arch = 'i386'
+elif cpu == 'mips64'
+  host_arch = 'mips'
 else
   host_arch = cpu
 endif
-- 
2.25.1


