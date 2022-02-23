Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C94C1E87
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:34:27 +0100 (CET)
Received: from localhost ([::1]:34932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0DK-0001XF-Vu
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:34:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0AY-00064B-MQ; Wed, 23 Feb 2022 17:31:34 -0500
Received: from [2607:f8b0:4864:20::f34] (port=45848
 helo=mail-qv1-xf34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nN0AW-00014Q-Os; Wed, 23 Feb 2022 17:31:34 -0500
Received: by mail-qv1-xf34.google.com with SMTP id h13so621588qvk.12;
 Wed, 23 Feb 2022 14:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bqu/RE/AV1hfWYNmv/cvyczx2fjTlpjyT9PCbLLfeGs=;
 b=QYh8xZLgU/K/9i/gi1TQ12SKCkt/T4DZr/1LyE7QJu3ponCY8d9CdtUwBP6oyOQ4Z4
 lSxBu2cWSdXFnPziMGnFTEdzWOSLNcgN9f6B4LpSXZH0oC184dX11pyvW+tSxJH6VUec
 kcyaUnQ5/vQ16Dg2HbQEVoltXHVPkc3GWhgbj6QAARf/fa1YdY98yrLfKuLAAFB2xrh1
 6uMeFMDn4cKry11dnC/6zxUBFSGq1a5iriiqm537G81Zp9zPl9sjcdlseiIPqpinPcxO
 E82h05N32qIGZK8n/cX+34aBesDP/vhF40Agi5wDNV5e9/cMGXxbKnAekRzS3HFsy06r
 oFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bqu/RE/AV1hfWYNmv/cvyczx2fjTlpjyT9PCbLLfeGs=;
 b=YMpmCCggUjDo/F3ou0k3Qu9SRvKRkeEzv0ClK16iuV5ucgZ6DIsIP8AALy7Syog6hE
 41SYF9H/mJNZYZ/m6TDmB9PbSvqyaydjdorTtmrs20NJfJzktf9U89RNhzTGS6ga8Q4Y
 fYpfWE4rQScWCfW7GHsfTc2iD4zv+Zf5bTPkelwKpl7JMc1aCLYGvztEBI4Crzu/qvzE
 QZ6pwUUCH4vecUnHYGTBa2Nq2gJZgr7DXQz0RxIUnZN242F+uTGJz8FGtKI9IFhEfw8D
 AilUEqmF2TCORR8Pobq5bXSryEfk16VTm9yP4z7B7JD0DTp1zhkTK+H2XKst38W0P2Q2
 F5rQ==
X-Gm-Message-State: AOAM531KAaFamJqDK6unrpOCuQnrgIVrQc0O+5JFU0yCRq/B4H/ys8Y6
 cL+0ygJwVERXotBmTNl9avnGPmZgHHeh36lAj7o=
X-Google-Smtp-Source: ABdhPJyxjv9aw6yR7UGOzAGDCXSk0E4DbEVcAiyHf2lHdxkSqW3lvVeH7Z4bKqU813f4CfeyOSTe9w==
X-Received: by 2002:ac8:5bc6:0:b0:2cf:7606:f32b with SMTP id
 b6-20020ac85bc6000000b002cf7606f32bmr1930021qtb.335.1645655491387; 
 Wed, 23 Feb 2022 14:31:31 -0800 (PST)
Received: from rygar.pwrtc.com (mont-dyn-147-119.pwrtc.com. [205.174.147.119])
 by smtp.gmail.com with ESMTPSA id
 o18sm618968qtv.26.2022.02.23.14.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:31 -0800 (PST)
From: David Miller <dmiller423@gmail.com>
To: qemu-s390x@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v7 0/4] s390x: Add partial z15 support and tests 
Date: Wed, 23 Feb 2022 17:31:13 -0500
Message-Id: <20220223223117.66660-1-dmiller423@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=dmiller423@gmail.com; helo=mail-qv1-xf34.google.com
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


v6 -> v7:
* Modified SELFHR insn-data + test to ensure high 32bits are copied.
* Changed m3 mask test value for popcnt to fix mie3 variant.

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
   * Reviewed-by: David Hildenbrand <david@redhat.com>
  s390x/cpumodel: Bump up QEMU model to a stripped-down IBM z15 GA1
   * Reviewed-by: David Hildenbrand <david@redhat.com>
  tests/tcg/s390x: Tests for Miscellaneous-Instruction-Extensions
    Facility 3
  tests/tcg/s390x: changed to using .insn for tests requiring z15
   * Reviewed-by: Thomas Huth <thuth@redhat.com>

 hw/s390x/s390-virtio-ccw.c      |  3 ++
 target/s390x/cpu_models.c       |  6 ++--
 target/s390x/gen-features.c     |  6 +++-
 target/s390x/helper.h           |  1 +
 target/s390x/tcg/insn-data.def  | 30 +++++++++++++++--
 target/s390x/tcg/mem_helper.c   | 20 +++++++++++
 target/s390x/tcg/translate.c    | 60 +++++++++++++++++++++++++++++++--
 tests/tcg/s390x/Makefile.target |  5 ++-
 tests/tcg/s390x/mie3-compl.c    | 56 ++++++++++++++++++++++++++++++
 tests/tcg/s390x/mie3-mvcrl.c    | 31 +++++++++++++++++
 tests/tcg/s390x/mie3-sel.c      | 42 +++++++++++++++++++++++
 11 files changed, 250 insertions(+), 10 deletions(-)
 create mode 100644 tests/tcg/s390x/mie3-compl.c
 create mode 100644 tests/tcg/s390x/mie3-mvcrl.c
 create mode 100644 tests/tcg/s390x/mie3-sel.c

-- 
2.32.0


