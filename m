Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1B376753
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 16:58:07 +0200 (CEST)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf1va-0005T2-Tn
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 10:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1ii-0008CH-Bc
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lf1ic-00016R-2f
 for qemu-devel@nongnu.org; Fri, 07 May 2021 10:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620398680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZhnR5sl6IQkPWyz310rG2u37bBKdYZca+FWR4sH4smk=;
 b=b+lmaPB1mIOv6vsS5qpY+naTHzrYqavCja3GAJVzhVzDXSIIUuYZ3+Br9n5gmwN3wquORh
 R1aHq/Cagw2mRdgxPqzdg/8juBvhYYGEPvFV6aJ8wMYcDTLYPF+5Co33KdOvE11jdOHNRN
 /7pzKTOoWmnf+DR9GuXOP7DozqljlHQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505--vS3DOM6PiOwt6qVs9MHSw-1; Fri, 07 May 2021 10:44:36 -0400
X-MC-Unique: -vS3DOM6PiOwt6qVs9MHSw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso1464674wmb.5
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 07:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZhnR5sl6IQkPWyz310rG2u37bBKdYZca+FWR4sH4smk=;
 b=fjmS/U6TuEXjS9cJybZFPpIEarEY/4RoeMldrqfs/N0LmOM7t4EF8bwyXBDVaGp193
 kYWj3o3/fEufiOtsDib4SG05iPf3fVq1nbRKEUrF6gwfK3xisQJi4zn0ynfwsAPgLjzr
 6fEVPZkAkdui9nyD9Qp9skX2qN2A94ShV8JNKjtMfbEVxd/MY0ZsVu0hlMn5z7Om6QrK
 wk0UAN25+Va+8tK/3uu+cOOlwPG+M7cMhJzSK+yRXw7KroYAOLVmFoppYYJwrIzi4DYJ
 v4u23I6vV5cs8RgcQsK1dNneWpGmHxNBE+YqbvKqcsCudSZvDIcDROoK8eX7dDJcb/95
 9KFw==
X-Gm-Message-State: AOAM530duUBUBM0q9n38dSK1Ad/Upi5AEp/EI4KynRRMzJgmSoNiHtCQ
 krpv2hJtNz/3Zf3a1C8jJk3kVFc6eRaL8QNW9IH046YIoJxDK8Xw7mItPHkzp2anDHkWH+7cQqW
 XCMhPMgmVXsFi8Yemdc4X/HFpnf1NTtb4sSaQP/m99c6LhfrjWBbu+4HMSWVTG0Wb
X-Received: by 2002:a5d:6981:: with SMTP id g1mr12599763wru.426.1620398675169; 
 Fri, 07 May 2021 07:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy8lnmrGYH8Fsy8pQZm8qEaMhZejrbeQOUztL4n5JHO8452/CrhiGGEhSj68CBg7KRdDUmFg==
X-Received: by 2002:a5d:6981:: with SMTP id g1mr12599729wru.426.1620398674953; 
 Fri, 07 May 2021 07:44:34 -0700 (PDT)
Received: from localhost.localdomain
 (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr. [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id v21sm13520162wml.5.2021.05.07.07.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 07:44:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/17] configure: Prohibit alloca() by using -Walloca
 CPPFLAG
Date: Fri,  7 May 2021 16:43:14 +0200
Message-Id: <20210507144315.1994337-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210507144315.1994337-1-philmd@redhat.com>
References: <20210507144315.1994337-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we removed all alloca() calls in the repository, add the
-Walloca CPPFLAG to trigger a build failure if such stack allocation
is used.

Rationale: The ALLOCA(3) man-page mentions its "use is discouraged".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
As there is an alloca() call in libslirp, this patch is pending
on the following libslirp patch to be merged:
https://lists.freedesktop.org/archives/slirp/2021-May/000150.html
(and the submodule updated).
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4f374b48890..67cb6d5421c 100755
--- a/configure
+++ b/configure
@@ -552,7 +552,7 @@ ARFLAGS="${ARFLAGS-rv}"
 # provides these semantics.)
 QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
 QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
-QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
+QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls -Walloca $QEMU_CFLAGS"
 QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
 
 # Flags that are needed during configure but later taken care of by Meson
-- 
2.26.3


