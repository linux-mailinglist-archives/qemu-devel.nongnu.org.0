Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F13A482245
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 06:36:08 +0100 (CET)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3AaA-0004RZ-A3
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 00:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3AW5-0003c5-3g
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:31:49 -0500
Received: from [2607:f8b0:4864:20::42b] (port=40779
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3AW3-0006O9-FM
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 00:31:48 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q3so18596487pfs.7
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 21:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=QAgEJIRRBAZylL6H02PJOXJNznUkkSamGtgEb4TwxslEVLskFGhyzC43s+CiSyB9a1
 y5cUryx+5FG8HnG7qxSLHQsULD9cG7PFprK/a/P8NJxmGfzueUdi9vcJ1+Pb7ZdmZ3mI
 7ftUEicYE//Fw/qtV0x5lhwJ8O+Gkkv06/nHvsHzjmFpWNb9ahVzpQfiz6JYu1+IRWqw
 /zwngkkDwOEbu4Og4o+J/G3jEJUaw/GW/uzmfYYMfG1L7txo6wH+oVNohpcfzPBnKye/
 Aih0Ns3XMqDGbUDmbrvDe55k8k53AHHrQAqrjklavmZ77MBVYqhMwSn3WiA4GalH8TXy
 32nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d5gaGDZ+99ggf9ZXPhFh9Enr0XUZOvFdyJRvEuhLCgk=;
 b=f+MkplbKH2SgJ5mTBcnOCMINJQ/5ss7fGkNie8Ka46ee8zSAMkAdF4e5fou2ktpIpw
 25cNz/68iNlNekxvm8azll0+qPUI5paKDW2jWj8c7onpD8yVE44ZngTtQtncJ10egqV6
 VVtDssWNimWusqItM5PcUuR0Qc0Z3uVG5Xtfb35cyJQFtS/h2IBPDV9ZDOf7ny2+WgC8
 0qZLVzQPjtpIcjeXRQ5aQ/esy7JTfY6n052T6xONqu9xWXusYhctQFBTd7+B6BeDQid3
 c2Z6Ru48VDCT5wy9KD2R69/fpEgxq6OexVD0D7kDjVVGUKKz2i5Nfi4TutaFKlhf27tB
 3U4A==
X-Gm-Message-State: AOAM530QX4waPmre5hLMjV2Ofq3bqD0r0c24suB1kWK4dtFPkcsdz2kT
 HUZwWpAqBupbV0/LFLKeOb+g/0XCFH5zYg==
X-Google-Smtp-Source: ABdhPJxz+pdZQbqmuY1SBLklCkjnoHV9lHyNqwC/zmJPDKOkC9FjBagOMi6vzElQ4YjyxDk8DNZ7BQ==
X-Received: by 2002:a63:2c11:: with SMTP id s17mr29815937pgs.435.1640928705691; 
 Thu, 30 Dec 2021 21:31:45 -0800 (PST)
Received: from stoup.hsd1.or.comcast.net
 ([2601:1c0:6101:be80:23dc:65c4:ecfd:93ff])
 by smtp.gmail.com with ESMTPSA id k20sm27209536pfk.111.2021.12.30.21.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 21:31:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: Unify mips and mips64 in host_arch
Date: Thu, 30 Dec 2021 21:31:44 -0800
Message-Id: <20211231053144.59017-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


