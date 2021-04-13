Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537035DDF5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:43:33 +0200 (CEST)
Received: from localhost ([::1]:60018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHS8-0001AG-F2
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMY-0005mQ-KK
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lWHMX-0005GV-5E
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 07:37:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id x12so4574258ejc.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=ZOOQ+n+wCsKkFdMB31nAe8ddEInJJ/7wxVf2O0UgGS5yxToQxTVGNQRZOhV+h40q1x
 mUsW6WpR2sKpqYUDQExAOQOPrDbCAhGFXKEbV7J+MO8Gd/3DPU/S92W+4MoxNrYv4CiO
 ntceUNVM4hz8EWfkgH/+XQlMM38CLNaFQJl9FkGg4d1Ul+Bwtmi9+dFYnGrUKlVKFhAK
 O814qqhnoAjbMM6J8Az6GCbsrc2yOuneDxGc4eU2fV/i5uAHrJBSZIDCf9K7Neg82itF
 2b+yQ+648g7CnHx9KQzmLP2cwIHkxzao6bc3p5Yce5rGHKt/5TWlbfDPAhBKHh+CtsKk
 94iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GYYM676T6K8E6MUwjt+OWaC5EYYCUhAjll3beQRTaTY=;
 b=NanDjR8YMuLJJhRzzIO6xVheB7Tj24PIGZKFgxlsyN58k+S45TVqz+mxVgz6eOEyLL
 KegiAQ0H6rfZeatQI3na/LCZptHvGxF5hGimsLr798gT/qIcxaygsQFnCxLcgZq6LU6+
 uaxldGijHd6zk1FA9fJMnec4uF9SdR7zbld7lgzqfojR1CTK1kKp0VohJ7GIH+tMLnjI
 wz3IA5HkJI4I7MYsSbaostw7uDeeszWW7eiE7kIVBnjp93ld3k8NJWlz86vg0hEqGfM2
 OZqhssQCNPA9ymCr0planAnadP8+2sV/1oAapnlkkRbza5thlXkRIvEFZILsUkuGJhsd
 yAUQ==
X-Gm-Message-State: AOAM532dFREMIbBFUlyevq1jmkGoskNT1e4a5s0h7N6fTodobU/ERUXx
 d1FwHDc8RoMxfRIcCQCHEkuoMnIKia8=
X-Google-Smtp-Source: ABdhPJyQEOV8TsQ2TurAQZ2x9KvvevJaA0ZgtdHiJ9LCZWiCuKNOSn3xJhfuRclaTreqJsUB2OZsIQ==
X-Received: by 2002:a17:906:c0c8:: with SMTP id
 bn8mr31114484ejb.445.1618313863453; 
 Tue, 13 Apr 2021 04:37:43 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s17sm7640965ejx.10.2021.04.13.04.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:37:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] osdep: include glib-compat.h before other QEMU headers
Date: Tue, 13 Apr 2021 13:37:40 +0200
Message-Id: <20210413113741.214867-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413113741.214867-1-pbonzini@redhat.com>
References: <20210413113741.214867-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

glib-compat.h is sort of like a system header, and it needs to include
system headers (glib.h) that may dislike being included under
'extern "C"'.  Move it right after all system headers and before
all other QEMU headers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/osdep.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..b67b0a1e8c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -111,6 +111,8 @@ extern int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+#include "glib-compat.h"
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -123,7 +125,6 @@ extern int daemon(int, int);
 #include <AvailabilityMacros.h>
 #endif
 
-#include "glib-compat.h"
 #include "qemu/typedefs.h"
 
 /*
-- 
2.30.1



