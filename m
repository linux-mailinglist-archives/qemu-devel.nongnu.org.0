Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E3452E66
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 10:52:12 +0100 (CET)
Received: from localhost ([::1]:59072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmv8M-0004yq-Os
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 04:52:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmv72-0004Aa-9i
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:50:50 -0500
Received: from [2a00:1450:4864:20::331] (port=37462
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmv70-0004d7-Oq
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 04:50:47 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1436784wms.2
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1L/V/Krd0XVpaocVCwvQSkrCguQOwUnlMgaDUewsAPQ=;
 b=PnVZKFu6NBuwCUR2EIweUUdKIFeyMjtqYumf4WEvQAjj1LBE5mNTxZSdvHjHwt6FmQ
 Uap9XoR2wa9VRtc37StblbQWosZPUsSRKtvzdOosS782aLto48RdjJ5ec5KIiIv9v8Vz
 Dv0dN1L/r88DlGaceGlKSmWiUsp2Cp0Q+ubMIS+i/HX9XfLDqEUqGrLsIUwpieYQyS9I
 /5q0TKlqHk7N1czJIF2d4dpxmgPPIYILBWLTqsY8OLrRKb0mbsJ/kVYdntj4GkIxUnyz
 KNf2Jga9CerqzkwUgaw9+8cG+ORRSzZ+M/IM7XUtEAQHhUtHDgcVPkzSzjKEIbhV67Dt
 ajrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1L/V/Krd0XVpaocVCwvQSkrCguQOwUnlMgaDUewsAPQ=;
 b=atQAkbIsIyYG7RcH9WAaJ67jXbFD7htOjz009rKPCvpHhujPX00hnkQSNC2pAm285A
 hhNhuI161d1D9E8qbbuG0WDFtxOvSejqJjhU+vxQ9m3ruuSxUPAszLqut/HRJm8Gy/Ry
 t1WDX3C+e5IVD19urRDgJ0uEENJUgeuFH87XVVeQylwsC5YeFc59C5YCl7jRc7TxjN8X
 DEU3TOOzqwVRsZwmNSGz+b4VNVsd0ly0RDMWa1QClrbl3nHvhIhK3+u3okz0tkWly1o0
 frZ12HseGHhs+sE1dXfzpaFU/Ha0wgZIF58od5JAPo1v/fmbCX+iCO75UupGd0gjkAKF
 StsQ==
X-Gm-Message-State: AOAM531WBY19GqlZosTlGrmoYVJf2ZZm3Ktp3+m7HaEIgRDQiiRXz/+s
 dvTK9O0zSa24THQLb/CBL0OH6RAapP+T5wimJ1M=
X-Google-Smtp-Source: ABdhPJywiKhxYMO2yKEUmGGGlLA5zkAzqYPJBm8QmtE3kaUQreYgw2keyhoCCm4d/m5DSOmgPq7u0g==
X-Received: by 2002:a05:600c:378b:: with SMTP id
 o11mr69368257wmr.157.1637056245220; 
 Tue, 16 Nov 2021 01:50:45 -0800 (PST)
Received: from localhost.localdomain
 (145.red-37-158-173.dynamicip.rima-tde.net. [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id r17sm2191394wmq.11.2021.11.16.01.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 01:50:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] meson.build: Merge riscv32 and riscv64 cpu family
Date: Tue, 16 Nov 2021 10:50:42 +0100
Message-Id: <20211116095042.335224-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: pbonzini@redhat.com, alistair.francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In ba0e73336200, we merged riscv32 and riscv64 in configure.
However, meson does not treat them the same.  We need to merge
them here as well.

Fixes: ba0e73336200
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

At the moment, configure for riscv64 host fails during meson.


r~

---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 2ece4fe088..ccc6cefc25 100644
--- a/meson.build
+++ b/meson.build
@@ -59,6 +59,12 @@ supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
   'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
+
+# Unify riscv* to a single family.
+if cpu in ['riscv32', 'riscv64']
+  cpu = 'riscv'
+endif
+
 targetos = host_machine.system()
 
 if cpu in ['x86', 'x86_64']
-- 
2.25.1


