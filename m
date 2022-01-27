Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C38249E0B3
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:23:51 +0100 (CET)
Received: from localhost ([::1]:49962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2sY-00056t-GJ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fu-0006lk-Eo
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from [2a00:1450:4864:20::431] (port=44788
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fr-000677-CP
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:44 -0500
Received: by mail-wr1-x431.google.com with SMTP id k18so4021311wrg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DhWFk/TxKIkkJpeksTWTEGSvTtXd1rBTWFImb/7k2E=;
 b=ToUA8E69KhA2+EFbRjkWKsN48UENP+WICBnXjT3MuHemino9jYuNyTPSAwnmxG5SKq
 /XQ+2Rjh+B2gZTjPavhqRTT3ksbIQJ7XUrCL4X2jQ9nZqx2K/XYbrKl22sk6KIS296kD
 pQEf0vyTsvnh7fnpGk4nFqXEVMnHN5thGDNO4gp+ehU9M61x4C20VkJSjxi5MzueiXjZ
 yoojPJCn0mZFHme1jFB/aL4deTsZ2JKjVxcMu1vI3gdn9WD3LmBRE/N7TJYI0rOcT8OU
 HSUT1skK3hxYySSMyIh/pA8HZwc9vw4nziNWXohGajbA6MED/LwrYTYzUpYspR9Qy5Zc
 zplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4DhWFk/TxKIkkJpeksTWTEGSvTtXd1rBTWFImb/7k2E=;
 b=hdIzX3ScyjlewqbNcI2pv1A2o0SJN2odKh7M24aD3G7aAvfHllNKjwx1SSr1OQKq1U
 11pOa/YNjv2iWLoKV8/WLyh5dKkZ00DGty4Fn6Pf/Zsqs5i9LWaRaqIJ+Zxi6IWW4zmb
 0zvXbbQ68n1vzbiJvqD6r+ASrht2ujcfDvCaYjhotIcbyPp6bRjidP/Zl8kFP5DozzM1
 tvsySgPp/tE+ipYYt7mvWaVXDvmlixzYDXqUflCkiFjfbYEp3RCE7dnV71K681PuUN+u
 OTg+q4IbmLoCFxk+mVwrowHkgk7JQJ4V7y4K0Dn0NBoNx7iM/2Fj4DHzxpCuHwkPoh6k
 wbnA==
X-Gm-Message-State: AOAM532sqUwWiwIODvtrue94iruTMtJCtfMck9uy5EFZZ23GvtrrGaNT
 cs5bnVX+jIv6hNVUTkCfNgFSWBo30uM=
X-Google-Smtp-Source: ABdhPJxZifv3/eo0xvbeyvHR68LZjQ+V7tfQSI0IbXv3mIz6k3ok1WUenIxO/qKkacKNKJT/R6FzbA==
X-Received: by 2002:adf:e489:: with SMTP id i9mr2562742wrm.107.1643281842159; 
 Thu, 27 Jan 2022 03:10:42 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] docker: add msitools to Fedora/mingw cross
Date: Thu, 27 Jan 2022 12:10:26 +0100
Message-Id: <20220127111037.457901-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

That should help catch build issues/regressions with wixl.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220114084312.3725242-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
index aad39dd97f..d80e66c651 100644
--- a/tests/docker/dockerfiles/fedora-win32-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
@@ -29,6 +29,7 @@ ENV PACKAGES \
     mingw32-pixman \
     mingw32-pkg-config \
     mingw32-SDL2 \
+    msitools \
     perl \
     perl-Test-Harness \
     python3 \
diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index 9a224a619b..2b12b94ccf 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -26,6 +26,7 @@ ENV PACKAGES \
     mingw64-libusbx \
     mingw64-pixman \
     mingw64-pkg-config \
+    msitools \
     perl \
     perl-Test-Harness \
     python3 \
-- 
2.34.1



