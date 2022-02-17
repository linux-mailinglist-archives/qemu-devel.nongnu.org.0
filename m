Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415B24BAD28
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 00:19:57 +0100 (CET)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKq43-0002Fe-Ql
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 18:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1w-0000FJ-Bw; Thu, 17 Feb 2022 18:17:44 -0500
Received: from [2607:f8b0:4864:20::f2b] (port=43893
 helo=mail-qv1-xf2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nKq1u-00084z-RI; Thu, 17 Feb 2022 18:17:44 -0500
Received: by mail-qv1-xf2b.google.com with SMTP id a28so11370392qvb.10;
 Thu, 17 Feb 2022 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGpDObpsa3Ygi/AImksjWDq8VH26ZxfAFX26paCxGus=;
 b=H30zr8LMIjkacRdam2mM+jQd2iX5xpXhqy2OJvlDx8qVRaH8BKeu3jnKvu+dmzvK1T
 fuM/kZEErPQclWxRgsZ3ueFh0fYuGf77F7aUrKhZVs4/2/gCPCLBM7b0zeBxtVNPBKjJ
 k5XERBmeWF5tnVDKTmg2JV1UBMM2+BbJXwS4Gd19HXbe9sXKENhm6lB3cXZOpOQoOgTZ
 +RhM1hedH0ekzYTZTbRU9jB+osdEPY5Afs/4/4X/+pzgM3AbztDPCPDc+kb5aNpSoK1w
 LxJU+nCsOHN2vExc0JlwMlixwdKedFcHdPeCUHEUOnYnCKmyaiP232IysZ7Kn6j/LXLV
 EQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PGpDObpsa3Ygi/AImksjWDq8VH26ZxfAFX26paCxGus=;
 b=fF0LPb8Hs3Zd5glCcPpuiHYEwy5lWiuXYXrwIgEnjEQfE6FVYZdsV5u54RAGetKlwd
 8lfc9mJtRKBfxcNHzInYny4ni/MCNR234cXgA60vBwkI7Ob5ET9TsEOb7KXfQy8VDHsO
 UBK8p8vPQYUdPwXhG1M/mZhsmaH/ih3H95jQO/oC0qYh1I5OVQD4uW6u6brfPQDLH7Su
 OKQUhr/UcoIMzuG4ZKCz6ZJVjknsEopcwbmvjfUEkjx8A2zltfpk34AXuZ6W4PM+VUuP
 xFhkywwYkKU9mhEuS94ST0uJo1caqb3bIFUcLVfcPUoRqQ7aI7UHuIIxlR6lKrvrWFzC
 KwhQ==
X-Gm-Message-State: AOAM531/KnWcMyEZFe8bdHLzETpZved8erSE0r8A97cHHttThmB4+WiS
 42jUV9tigbqL/JcRtXX1hm5woTYXj/2hLOXDlvRt44+X
X-Google-Smtp-Source: ABdhPJwOmUH75dMf9onCyaRSmF0tKlQFu6cU701lhjBj6tecyqiRep7YP+ynZxbIx4Dh9j7BibujdQ==
X-Received: by 2002:a05:6214:300a:b0:430:c41:3d92 with SMTP id
 ke10-20020a056214300a00b004300c413d92mr3898710qvb.53.1645139860835; 
 Thu, 17 Feb 2022 15:17:40 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 h10sm21272939qko.92.2022.02.17.15.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:17:40 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v6 0/4] s390x: Add partial z15 support and tests 
Date: Thu, 17 Feb 2022 18:17:24 -0500
Message-Id: <20220217231728.13932-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf2b.google.com
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

Add partial support for s390x z15 ga1 and specific tests for mie3 

v5 -> v6:
* Swap operands for sel* instructions 
* Use .insn in tests for z15 arch instructions

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


David Miller (4):
  s390x/tcg: Implement Miscellaneous-Instruction-Extensions Facility 3
    for the s390x
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
  tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions
    Facility 3
  tests/tcg/s390x: changed to using .insn for tests requiring z15

 hw/s390x/s390-virtio-ccw.c      |  3 ++
 target/s390x/cpu_models.c       |  6 ++--
 target/s390x/gen-features.c     |  6 +++-
 target/s390x/helper.h           |  1 +
 target/s390x/tcg/insn-data.def  | 30 ++++++++++++++++--
 target/s390x/tcg/mem_helper.c   | 20 ++++++++++++
 target/s390x/tcg/translate.c    | 53 +++++++++++++++++++++++++++++--
 tests/tcg/s390x/Makefile.target |  5 ++-
 tests/tcg/s390x/mie3-compl.c    | 56 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c    | 31 ++++++++++++++++++
 tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++++
 11 files changed, 243 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c

-- 
2.32.0


