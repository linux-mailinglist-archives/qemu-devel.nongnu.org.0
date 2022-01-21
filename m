Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B701495FFA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 14:50:18 +0100 (CET)
Received: from localhost ([::1]:48314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAuIz-00016A-0K
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 08:50:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtZ2-0008OF-82
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:03:01 -0500
Received: from [2a00:1450:4864:20::32f] (port=52159
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAtYv-0000Gz-He
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 08:02:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c2so17853567wml.1
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHVrZYilprbADKL6sDkzZ5rkDTLaol2IUVJ3O0h2GR0=;
 b=QsXzbmxzIPJKXHo2M3By8RCchOyRQOTPY9uNPQOwY8fwffPq6OOjiTGyZSvPIVAMnO
 7MH/4rwLLEqs9mISStJSQsWoEg6e8qdvsXyL+3g0QvWbqu5Y+N9XmDeby6LNIqnvgsg3
 WF2QkI0/XXSyALxyCFzCKoEbWEnkKxQ2ZHPD6Onko2jABX9YVjFtvxj44ZDR8Of4OFXv
 vHapI9QNIspV8PP4KXL9LhiK7zQmWtknxSNlFaGvBCDbFM2QKIunKg8tWNETSQhfPBvK
 h7KZDnmcwNbVIFnsxwa0aKtfFDLOy5O0jTCaoUYYi8k60hu9z8nVKYz0G99Zwzbkim78
 F2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qHVrZYilprbADKL6sDkzZ5rkDTLaol2IUVJ3O0h2GR0=;
 b=eeRP1qgx6Ack6NGyfsvNFlFQon3b0jsWYLHi5Bp3m5WSV1Gl/b98/mOrxI2d1yIT+T
 7NdB3GFvK6i4ofAPCzYXkH4eCGmGpRf7kZsoof8ji9SZ9k3o3y5RBf0bshzYn3zPkwfH
 vwYO5yZH1DH7WwKRfhcYFt4vltXtN0MGWACtuPaQx1ccyn4b5DfeOjAebkxzSIR6G6qD
 Q4lApIKjjaH8cifVMw5rZgaBYG5GEU/tm5VIRtjfuCbyLJ+PeOB3puXVamhUEwEpmG7G
 OMrMDDRVopsaipCGF3qQ7SvAe8mtWJDiEaQwa7lo24fJdAgv0hVbi+mNq/5KaStee4AB
 BQBA==
X-Gm-Message-State: AOAM532YaweIiz5tivNve3y6A1amE57KWNMR5/yeCdHqVobAQQEvcDBc
 LPvTOB9oih2imYD7lajd14e2ks0ICcc=
X-Google-Smtp-Source: ABdhPJxwQO7P35FB5wTWumlUBODL5qpBY7GZaIK6N+Dtu1yTHsyeVb5nWUPO8JoxdgiELLnEH5CrYA==
X-Received: by 2002:adf:b601:: with SMTP id f1mr3780955wre.271.1642770149892; 
 Fri, 21 Jan 2022 05:02:29 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 n6sm6531183wra.54.2022.01.21.05.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 05:02:29 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 1/7] MAINTAINERS: Cover lcitool submodule with build test /
 automation
Date: Fri, 21 Jan 2022 14:02:16 +0100
Message-Id: <20220121130222.302540-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121130222.302540-1-f4bug@amsat.org>
References: <20220121130222.302540-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

lcitool is used by build test / automation, we want maintainers
to get notified if the submodule is updated.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4b3a4bcdf4..6d5539d46f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3579,6 +3579,7 @@ F: .travis.yml
 F: scripts/ci/
 F: tests/docker/
 F: tests/vm/
+F: tests/lcitool/
 F: scripts/archive-source.sh
 W: https://gitlab.com/qemu-project/qemu/pipelines
 W: https://travis-ci.org/qemu/qemu
-- 
2.34.1


