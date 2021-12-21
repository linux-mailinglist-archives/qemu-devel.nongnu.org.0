Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970747BEC6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 12:20:25 +0100 (CET)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzdBv-0000LD-V2
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 06:20:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzdA5-00085g-0C
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:18:29 -0500
Received: from [2a00:1450:4864:20::333] (port=53954
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mzdA3-0006ia-8S
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 06:18:28 -0500
Received: by mail-wm1-x333.google.com with SMTP id y196so8809285wmc.3
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 03:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IVfIjOBgDVAnJGXtFop2GNWEoOYQETdwDWxVuiCNgqc=;
 b=nlBG//zsqUnOYFQxe6Zt88lvhD9wyPFAU6SuKOdHC8T1lnEEk3dGQW4TPVM2l5anZs
 xbAJj4WYG0S8d+uD+vqUZahsVxNVbRTMcdeTyLnGIUUGPbB2ly6RUKJETijLj/+JfIJZ
 dLRdyZjgyQXKVsYVIQHoJWl5v561HhQ503MPCT7mk/7FEG4YOkFiSdsBzhtXUQBn7AE1
 bVCggqyL7pynQARTUP/h+tHzNsSN61nxOWPSv+vgYflc4PMlqSRg2sXkVQXkuEpiOBJK
 hgbBn4+1dYF+9hjjVhCe+pRw4dOXmLo2FLD2fDFu4zJUMIQOXO0d56RAwe503JdlS6OR
 CMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IVfIjOBgDVAnJGXtFop2GNWEoOYQETdwDWxVuiCNgqc=;
 b=7wMiJJ/J4IkTVd+4qxhTt/vhEW2bPs2qOeBQYRruJb85Mw2n/MR2ukNOoVKfKpAPMl
 AGXQJB2Fpl4LpoHHUhxPO0nLaZskhdD8faG+1O63G14dna/bZ4abblnxZ+OTp/Ah8lMa
 fTVMsb1hFwFgfEQNsQiNC08V4+m3juNLMlHOIpLeSM8CSAE6y+3lhAzkb4VeZVlV6qKl
 kK3AWF55U+sNXwa3z8DZt6qi9M/dn/qlJeRnwVvOYjrKhRtRvSeY4T2ERjtt1+11m+IR
 /+gYu4RvwTBOUj7cRe6x39xQ53uIqwrBBAUSV8PKx7Cj7bg8OW5WhjnNGVGdzc/0NuP4
 BJtQ==
X-Gm-Message-State: AOAM5315+mgXW1dX/RuzWcjScTtmIWdSEnAZ+KukC9Tmb7ZmO41VG/6q
 HNYG11tECjHTd0kJJq5tJlCXcUCht0c=
X-Google-Smtp-Source: ABdhPJyHHl6+emb5IPcbk9b2IW/8caNaVFHADYwoMDK9C9LsjtYsC1mFVT9IhSMVf9+m2u8xRDSdBw==
X-Received: by 2002:a05:600c:2186:: with SMTP id
 e6mr2247646wme.153.1640085505849; 
 Tue, 21 Dec 2021 03:18:25 -0800 (PST)
Received: from avogadro.lan ([93.56.169.52])
 by smtp.gmail.com with ESMTPSA id m35sm5605635wms.1.2021.12.21.03.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 03:18:25 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docker: include bison in debian-tricore-cross
Date: Tue, 21 Dec 2021 12:16:24 +0100
Message-Id: <20211221111624.352804-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Binutils sometimes fail to build if bison is not installed:

  /bin/sh ./ylwrap `test -f arparse.y || echo ./`arparse.y y.tab.c arparse.c y.tab.h arparse.h y.output arparse.output --  -d
  ./ylwrap: 109: ./ylwrap: -d: not found

(the correct invocation of ylwrap would have "bison -d" after the double
dash).  Work around by installing it in the container.

Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/debian-tricore-cross.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
index d8df2c6117..3f6b55562c 100644
--- a/tests/docker/dockerfiles/debian-tricore-cross.docker
+++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
@@ -16,6 +16,7 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
     DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
+       bison \
        bzip2 \
        ca-certificates \
        ccache \
-- 
2.33.1


