Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B084CB567
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:26:49 +0100 (CET)
Received: from localhost ([::1]:57544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPc76-0006wc-E1
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:26:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc34-0004Qr-Sn; Wed, 02 Mar 2022 22:22:38 -0500
Received: from [2607:f8b0:4864:20::735] (port=39431
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nPc30-0006ji-Ix; Wed, 02 Mar 2022 22:22:35 -0500
Received: by mail-qk1-x735.google.com with SMTP id t21so2999235qkg.6;
 Wed, 02 Mar 2022 19:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuSq9EQBTRF0fKgAQD8OtEtOTQQ7mwi4id5qcJdJRco=;
 b=V0I9rcx2w0T43KWvi79My09RP2pZgYLs5qOY+Xp9lpWlw8oN6tnv9TYWQ19QC7qRGT
 a31kTKU1i2HfGb53zCDphJZW+IqqvYD9ny60NpGpdP8dSfCwXTD6KBhWQXRvK8k8bSZR
 /ewcY1BN0HdNthBM/dZ974uwDaYUJIfTwaEzhAo+deqx5yh6Nf5k8LCLh3PoxXJLhd29
 BVta0bBsdoghKVO4Tcsvz0Sj6nqIPo1oa2zarjeMu2zg1cu0RlQhIPhWgszjcHmxVPzR
 mWyWr04CT03vnK/vrAEGKdE3bnnR36qH1VGX8/zrSGOKw+VAhZ0pTySR4uf1TvdPLoKF
 gRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xuSq9EQBTRF0fKgAQD8OtEtOTQQ7mwi4id5qcJdJRco=;
 b=BDs262HbRrEAoLfP7ERUcrnbaTylwRS6T+Det1tFJyc8P5JQRFTf3RDT0Ama8Bq0UQ
 nfj+XATqQcVjDjfw+w1YAP5oaKebnzbjeFuqbpwR81C6uUL/7D1TSVS6EN5cK2rNdw+Q
 mpvj60v95RiXsgHXS2U+pvWJDkeQkCJA78DserMcvml/zHm+uYD9aqEflhgZ41C2ecFI
 6VNf4hVkVlXTfeevEhVcQQ/+XWORi+sPkR17Sc+UcHnG/MJBdjy3XlA5FL7bZ4Ax46fJ
 LVmSneI/xQUXcYlsq2Sw9bqlpsX59u6363TqImDxrCbqi/5jlVDZbxWJyCtlD26OrhsZ
 LLfQ==
X-Gm-Message-State: AOAM531XoCZ1eLdyncbnBtx3Mp1HDUwkfrWzP19gjrkzrpXujo8RajZF
 3B2IZemEDyxJPTwIej7hQW3I7mua1Iv0SZ3dhaU=
X-Google-Smtp-Source: ABdhPJw3GgAg51NwogJYNE5mlPSk7ZlE4K775yXlc2EDVLYV7gPmHDmFnXhUP1jpfO/kqtB3BylnLg==
X-Received: by 2002:a05:620a:4481:b0:649:35d7:ec53 with SMTP id
 x1-20020a05620a448100b0064935d7ec53mr17762061qkp.735.1646277752547; 
 Wed, 02 Mar 2022 19:22:32 -0800 (PST)
Received: from localhost.localdomain (mont-dyn-147-183.pwrtc.com.
 [205.174.147.183]) by smtp.gmail.com with ESMTPSA id
 x15-20020a05622a000f00b002de2da5e5cdsm682213qtw.3.2022.03.02.19.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:22:32 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v1 0/2] s390x: Add support for Vector Enhancements Facility 2
Date: Wed,  2 Mar 2022 22:22:17 -0500
Message-Id: <20220303032219.17631-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=dmiller423@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, farman@linux.ibm.com,
 David Miller <dmiller423@gmail.com>, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend s390x z15 to support and test Vector Enhancements Facility 2 (vxeh2)


David Miller (2):
  s390x/tcg: Implement Vector-Enhancements Facility 2 for s390x
  tests/tcg/s390x: Tests for Vector Enhancements Facility 2

 include/qemu/bitops.h                |  26 ++
 target/s390x/gen-features.c          |   2 +-
 target/s390x/helper.h                |  12 +-
 target/s390x/tcg/insn-data.def       |  30 ++-
 target/s390x/tcg/translate.c         |   3 +-
 target/s390x/tcg/translate_vx.c.inc  | 377 ++++++++++++++++++++++++---
 target/s390x/tcg/vec.h               |  30 +++
 target/s390x/tcg/vec_fpu_helper.c    |  33 +++
 target/s390x/tcg/vec_helper.c        |  33 +++
 target/s390x/tcg/vec_int_helper.c    |  59 +++++
 target/s390x/tcg/vec_string_helper.c |  65 +++++
 tests/tcg/s390x/Makefile.target      |   8 +
 tests/tcg/s390x/vxeh2_vcvt.c         |  97 +++++++
 tests/tcg/s390x/vxeh2_vlstr.c        | 146 +++++++++++
 tests/tcg/s390x/vxeh2_vs.c           |  91 +++++++
 15 files changed, 968 insertions(+), 44 deletions(-)
 create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
 create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
 create mode 100644 tests/tcg/s390x/vxeh2_vs.c

-- 
2.34.1


