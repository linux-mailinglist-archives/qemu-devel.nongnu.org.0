Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC2E69522B
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfkv-0000rb-As; Mon, 13 Feb 2023 15:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbT2-00083U-Iq
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:12 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pRbT1-0005jy-2k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:14:12 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so9448036wms.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCtcRsma4Lb/eGzY1J2Zycrim3J1natcTOS1qZitV64=;
 b=ZhhgDXVN7p55YgzqReoCQBHVWmTiH9uwZ4CAumPnALVEk3RTKDJluWi7l1P48y3X//
 7K7xCMRrzhLYgiAMcDioXViq2Vt/za3+Gik6EKdwMYn+qsscJLpjyZTQKY6gdPAMFoKJ
 rna9pTHdd13UJkZoxmNZoXhD7gn86kftqtKmpbOX92hijF2cfoekec4V5dWg+aCdebHc
 xf6gB/NSjuREWh+j109sASh8uGWdwWgp9TX2O1RG2HuuU9xmysSAtdT9tgRcG7aNoiXe
 pn6VwhvReLzFGjUt7/C/PFVv8y3nPWK3XHp1X3E/du9nQ/B6CoS7xux1qJPEQ/ru5S+k
 iNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCtcRsma4Lb/eGzY1J2Zycrim3J1natcTOS1qZitV64=;
 b=XGEOLKA9uZFGcs9jBSBOZq0x4bTIHTGAT86dPVFXbm/7dgUm4jff4gSXx2cyF3yndc
 mboujcJKaZ69DNPAPdPNLvE7Qjn98vtf8GzJi5p/ohWnHsm3Pl+vvtA2dFispDAqyrq0
 fpHFIwd2mlGXazdVmqftw0bO6UhTfIDY/6k/ifMxKfrAGrQuEn5QTBTtir2oYKEVPv68
 m7tbgqYusk+gToIQv+SUIPrbFv8KzyNMA6w83BPCqRavDdHODT/TRcT6nWEzF7nIKcSv
 d3jonUoMFSrAvu7jyef0N3t6HHiCvVWO56W/pRRul7j6OI73PHiY5lv/AqikoQiEjEnK
 JxZw==
X-Gm-Message-State: AO0yUKWaOqEMLq+IbvctbgugLHt5NYDFC9c9Lh5Txwd3CEc/fdwEboQM
 et97XN9Ke3KD8A20n8Y80ueBm4k+Jtuw+9UNt9s=
X-Google-Smtp-Source: AK7set8vMfndlR8S9+sV+oOSmRQ2UJ1kmuJg3X96hcV6MTEye76BO4l3y42L5qHXigDyEMFqtG3fMQ==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:5b48:ee5 with SMTP id
 b26-20020a05600c4a9a00b003dc5b480ee5mr19187770wmp.2.1676304848584; 
 Mon, 13 Feb 2023 08:14:08 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:8df5:e191:f2b0:5825])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b002c557f82e27sm3582882wrm.99.2023.02.13.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 08:14:08 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 3/4] qga/vss-win32: fix warning for clang++-15
Date: Mon, 13 Feb 2023 17:13:51 +0100
Message-Id: <20230213161352.17199-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 15:48:53 -0500
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

Reported when compiling with clang-windows-arm64.

../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
    return hr;
           ^~
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 qga/vss-win32/install.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
index b57508fbe0..b8087e5baa 100644
--- a/qga/vss-win32/install.cpp
+++ b/qga/vss-win32/install.cpp
@@ -518,7 +518,7 @@ namespace _com_util
 /* Stop QGA VSS provider service using Winsvc API  */
 STDAPI StopService(void)
 {
-    HRESULT hr;
+    HRESULT hr = S_OK;
     SC_HANDLE manager = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);
     SC_HANDLE service = NULL;
 
-- 
2.30.2


