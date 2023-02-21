Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3639E69E36D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:31:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUbU-0002nI-3Y; Tue, 21 Feb 2023 10:30:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb6-0002Hj-9y
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:37 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pUUb4-0000Vp-LX
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:28 -0500
Received: by mail-wr1-x42b.google.com with SMTP id p8so4998040wrt.12
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aqBt2Wco0xHaQqloNdEBhTt2U0GhCudNuL+urVRzaIs=;
 b=yFkw8vnO0W08mYQXdGF9v//kpmBSkvorlyt8LTQym6NDyBlZETlnf2JRQKDHIXRYl6
 Nm28kxr+vL5C2Q4Zo3ggkJtoWsZeIfOz/Q12H3siw52hrmpRbZrBnA871qJSQxFWPvaX
 mfE6d4bkxujdhIcGTaacdy33bsldCY1nBQ//5blVzmCv6sJE09P4ZlhXbnqXoN3LTH3R
 j0lDFdYjRcw+fkX3i1d4HvplCgVvUcKwgQVzyfNk2n6B5ZQKWmsiDcIwKouyPW/w98kI
 Dfl5e2zZxG1eHGDPuSmfewTQ7urlwL9vK9bwBUS5/y4YeiZMZ2C2Okbi2kUo/s6d62TE
 kMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aqBt2Wco0xHaQqloNdEBhTt2U0GhCudNuL+urVRzaIs=;
 b=E7QPHRqX8Y49wnAtFXm8ijP0aTSMVwE+XaZWZVfBGGLGxekXJCRaOmPhO1jp299Gyz
 L6+CjAnbygf+T4f2rJEJ+5YSWhZywutMsFwiLjXcrPdHqKIZWXxwg4dAJy8vSdxnyeCE
 lwlmtvdbCAFafGTBmnjN4MiAApvRYQfViIjzK/3+baZ979/QgwoHK0LRd5p/aq3UrCkv
 pDNFSmWnfxceThX9IE1Ov0rmmbejBWfQUT+YYUY8+bke1ySp1PhXiXMqcrBPwxd3bbeD
 tsrt+ax6SmbyvccWuO/X9xMg0tuc1J9IbE0OCz3ABPhwwurPr1yFjTLAouDx5ic/h/Z9
 Othg==
X-Gm-Message-State: AO0yUKWf5uto/d5N/vU1nOHIjKrcMJRlGeN76juVJ3+aco2n/alObWH2
 I+Kbswc6UAMED1/4ym0hcvoEZQ2H0kEFH7VEeLI=
X-Google-Smtp-Source: AK7set9c88itMNFe57dLt5jCslblq1ZDwW3n3ckDXQNn7QTI007nLqEszeyb17XJo+RJXcRpzIPQBQ==
X-Received: by 2002:a5d:49c1:0:b0:2c5:5ca4:ef14 with SMTP id
 t1-20020a5d49c1000000b002c55ca4ef14mr3900482wrs.9.1676993424952; 
 Tue, 21 Feb 2023 07:30:24 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b002c5503a8d21sm2803417wrj.70.2023.02.21.07.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 07:30:24 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 3/4] qga/vss-win32: fix warning for clang++-15
Date: Tue, 21 Feb 2023 16:30:05 +0100
Message-Id: <20230221153006.20300-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wr1-x42b.google.com
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

Reported when compiling with clang-windows-arm64.

../qga/vss-win32/install.cpp:537:9: error: variable 'hr' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
    if (!(ControlService(service, SERVICE_CONTROL_STOP, NULL))) {
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../qga/vss-win32/install.cpp:545:12: note: uninitialized use occurs here
    return hr;
           ^~
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Fixes: 917ebcb170 ("qga-win: Fix QGA VSS Provider service stop failure")
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


