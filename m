Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4C34ADE20
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:18:28 +0100 (CET)
Received: from localhost ([::1]:56972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTCE-0001H2-E0
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:18:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKj-000874-2h
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:09 -0500
Received: from [2607:f8b0:4864:20::434] (port=44964
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSKh-0000Ie-Kc
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:08 -0500
Received: by mail-pf1-x434.google.com with SMTP id n32so19401146pfv.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9EXID/rfj16zUB/LB4uRhHEEJYpJqPDVp6AaGWqd0oM=;
 b=EayZ/toVohhnYBxSg9ibDCVg1YUvsXmlAfeOLSzpC14y5RBeej55KUIubBirFJif7Q
 7rLrqu8O3foGs+YiGAG18miyn0kjOV9A4PrQXdoyE9/gB1GGXGWMX2/3MyVHyS+JLbLb
 yx3f4fTSGHn83jp02NSh8DT+DzMz+A51wdOecD0A1xmzxfbUi25+lJhO/ubK0yW/nQkx
 iiMB7LchR2sZM+RpecC5mTzMu06L2/yg6g6I+V7Bg3x1QqfJzCRlWJYsLs5g3nKUEGU3
 cEG6Qo9xq5CzOUmOTcSz6Tp0m2eqgw1IML8i6gC/lOSTnTkFVwGPQeGF+0V5hD+FI00G
 Ke0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9EXID/rfj16zUB/LB4uRhHEEJYpJqPDVp6AaGWqd0oM=;
 b=rpGHLdsmeWXnQ7vvTAaeRvgbcn5/94rlCW1+iyKYvt2JOfGn2avthT7qN4RHQHtWxC
 x5yk+Ukoo7XK250IXniHzx1E52uAV68iTgUXRGXp9ug0vI1OykencnZbT2zSfuEAcPyS
 QbeNTQgl6YQQSBQz0mAaU08sYSKGAkbc/siFEaUjsnOMNORlkmo7CZBIB5zQHN/h1EeH
 zuXBham1P5CLzSvFGgp/KV5pFTYnedfOlLSoIkfr02GbnglU8+6tzZMc0zwqldbWMbmf
 l7f9lWZ6DzAgRUufPkg9LKLaVLHOfa6SdAPI0nOAAZm79Cqnov5bSyL7hUen2ARztWUW
 Oa7g==
X-Gm-Message-State: AOAM5305w6k86l+Izu5EDIReyI7l3VmAOo3nzBK86+Z/mJGZPUiqEhWr
 GGrUrgfVd1eFbvLY49gvx6pNuqh/qdA=
X-Google-Smtp-Source: ABdhPJwrODLlJYP3MnfPqLVYLrpw3DG6gozWq4bYBUJY5ZtmyTEvvVl+eOWG0yqBVddfYJ2XesgHEg==
X-Received: by 2002:a62:848c:: with SMTP id k134mr2052132pfd.86.1644333785929; 
 Tue, 08 Feb 2022 07:23:05 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id a22sm10122524pfv.185.2022.02.08.07.23.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:05 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 02/13] exec/cpu_ldst: Include 'cpu.h' to get target_ulong
 definition
Date: Tue,  8 Feb 2022 16:22:32 +0100
Message-Id: <20220208152243.16452-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/cpu_ldst.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a878fd0105..5c999966de 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -64,6 +64,7 @@
 
 #include "exec/memopidx.h"
 #include "qemu/int128.h"
+#include "cpu.h"
 
 #if defined(CONFIG_USER_ONLY)
 /* sparc32plus has 64bit long but 32bit space address
-- 
2.34.1


