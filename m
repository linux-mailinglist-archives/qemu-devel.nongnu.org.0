Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F654B928E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 21:42:34 +0100 (CET)
Received: from localhost ([::1]:43668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKR8D-0000GU-Qc
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 15:42:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKR0R-00026i-G9; Wed, 16 Feb 2022 15:34:31 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39564
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKR0O-0005i5-Dw; Wed, 16 Feb 2022 15:34:31 -0500
Received: by mail-io1-xd2a.google.com with SMTP id a26so1183623iot.6;
 Wed, 16 Feb 2022 12:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qu5XmcyCLZPo/i6/dDNT6f21sEzfco6fzVqV37QcCtE=;
 b=DSV4MWHm473VylFw7tGzbrVoNNyEpbmHXElGzcZ9MaCTHVc3N4DmcNCbYy3motwACh
 qy0qFNxFYh8SjVkEUoH0YJGS/25w+nWcN5Vx6EAzQEDbW1QpS0U4XrQ6FjBnh91WBiwH
 JCUVYQXA0aWTG1D/cCuWfjhZ/hfaNtantibnWFqENI0wYnuzCr0b6PidTFoWwvxhHoIb
 2IIE/1iRspY4Vma/hra3Ozt4N0LBzpq3l0J6O99QsH8L33HfmGwzbcE0fKvIRyLxQp4e
 sFpvCfduIdDkiehfsM/TnDmDRIt4LBO6M6aZM3eqeI9VdzC+bOP1v+cKq/MCBQKqQYsX
 oLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qu5XmcyCLZPo/i6/dDNT6f21sEzfco6fzVqV37QcCtE=;
 b=aq04U7aFc//ZY72WPT+uiiuN7qBNDZRgu9ZyUFvO4r6o4D9JDO0MT6vmLZtFpG1KiW
 CjR/U/6F9ol9BA2PT4EkRdpYsXkNUP07lYf5jHUa7SOR/KG8YMP9qV89lo8MyoByWWCY
 CWppj0rEvDcRot2UPF4pKy41L+DnxDfMn25ukSuPDqFb8+uinmuL8pMSptzEBkXOT3m+
 gYv9lYfGbt1LyO1owTSR38H7PrBOR9YSCEMr9AuBMX58BkPBG9asqOQsPgKc3Y/7SVD2
 C8slvM7j3mAyqRgeEybfqQnKtQStIFO2BcnpPTTrCZEsVd0sr8Cvf7ELyjMyG/UJ/9wL
 yseg==
X-Gm-Message-State: AOAM532Yg5A3Vgcy21g4qRJeW6WA0bGMwz3Hs+m+aJ3nPQ9CYTJizER9
 VHYbwvkajLrhld9MZYYPtYmgxuC8eIiJ0KdZ3YY=
X-Google-Smtp-Source: ABdhPJyx6tJZUVv2HW1yzmO31lphFZX82K+GOdcbPal/mqRw0KUBPEzGoToHmCuMrwAybuL4d8EEJg==
X-Received: by 2002:a5e:9309:0:b0:604:e472:d39b with SMTP id
 k9-20020a5e9309000000b00604e472d39bmr2938432iom.216.1645043661576; 
 Wed, 16 Feb 2022 12:34:21 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 d12sm511990ilv.42.2022.02.16.12.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:34:21 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 0/3] s390x: Add partial z15 support and tests 
Date: Wed, 16 Feb 2022 15:34:12 -0500
Message-Id: <20220216203415.138819-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=dmiller423@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.978,
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

Add partial support for s390x z15 ga1 and specific tests for mie3 

v4 -> v5:
* Readd missing tests/tcg/s390x/mie3-*.c to patch

v3 -> v4:
* Change popcnt encoding RRE -> RRF_c
* Remove redundant code op_sel -> op_loc
* Cleanup for checkpatch.pl
* Readded mie3-* to Makefile.target

v2 -> v3:
* Moved tests to separate patch.
* Combined patches into series.


David Miller (3):
  s390x/tcg: Implement Miscellaneous-Instruction-Extensions Facility 3
    for the s390x
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
  tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions
    Facility 3

 hw/s390x/s390-virtio-ccw.c      |  3 ++
 target/s390x/cpu_models.c       |  6 ++--
 target/s390x/gen-features.c     |  6 +++-
 target/s390x/helper.h           |  1 +
 target/s390x/tcg/insn-data.def  | 30 ++++++++++++++++--
 target/s390x/tcg/mem_helper.c   | 20 ++++++++++++
 target/s390x/tcg/translate.c    | 53 +++++++++++++++++++++++++++++--
 tests/tcg/s390x/Makefile.target |  5 ++-
 tests/tcg/s390x/mie3-compl.c    | 55 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c    | 31 +++++++++++++++++++
 tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
 11 files changed, 242 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c

-- 
2.32.0


