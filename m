Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934E84D5143
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 19:31:54 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSNZp-00028P-7A
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 13:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYP-0007nI-GO; Thu, 10 Mar 2022 13:30:25 -0500
Received: from [2607:f8b0:4864:20::229] (port=46665
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nSNYN-0006OP-Qa; Thu, 10 Mar 2022 13:30:25 -0500
Received: by mail-oi1-x229.google.com with SMTP id b188so6782802oia.13;
 Thu, 10 Mar 2022 10:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMJWaE7VYMHkCnA8z3i1ED3bjb4ObufIZrfnbMiBlY4=;
 b=hljzdUJnHGXV6HgjiyAiE7dyrHjf4DZT/oAIKuUMGnyOJmtpG7gPr+oc1sXRWeo91r
 aWvb0EEFW+DJfWO7DGrAoWVSrFrw/qy1ykdkjOIVGNQ1BiI/ld+LeskQCQLxxgdU8xze
 eIKrGiH9IyIQii3r0bb5/VuMVNcwjWQtM+S1hT9kF/zUPVg9I9jfrXuZ9LIK58sxm99Y
 s596i+hu4FOfMS0zRIblxbbE2X5rvqt9myAdUUk2+rWxVF0aOWRGmEK/yv3M67Qy9ntg
 c3x7pmIt1hWQJg7xO7drFz3R31DoSAKFjGH21jam4clVvU/23Z1GH5S02VHMNqzn+9Hs
 Ek9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMJWaE7VYMHkCnA8z3i1ED3bjb4ObufIZrfnbMiBlY4=;
 b=xZJky5BSU5kTdh5CYDrs4HSjeEUW8s1TA2SaNFWgZ5JfvBmVkgvytNbFYhM6BqcK77
 DWBD9TOdXRE/JoiH6Kd61XLRt6noR/FP+ssrhLU3v/8p/UVnGq1i4GXRBGgyG3MrIida
 9Fhg9zVYfv9jbGBPH/I9Sm05TW/dpYQPU8leIFPwpwgDQO6uIR6nRkOh7X6WogaaYO6w
 iH57VKvDKjFtfqV9EcTnAEfl02jQ6UjyEQ1t4c0qlmqoV0/tAmF9ORMmkZBGFA2psfCt
 t/Lj9ioiSaLfsrpf7ph5yxmn7OMmCWn5ljIMKie0BFw3oG+5H/ar62hih8yU0IEUP0yt
 Z1GQ==
X-Gm-Message-State: AOAM531XQzqR5uQUG5YPfDLJNXMHQzWdUTf98rUowfkLY32hvxIAosvY
 /vzozq0RT+uckPFGhb2Y9YOnQ9B563s=
X-Google-Smtp-Source: ABdhPJyNY4W8Xz0z8VTxyprO/WXVfvriDf1i4b1ZQyKzCA/iYEn+u7isdALn73ebXKNfAiKrqSvsEA==
X-Received: by 2002:a05:6808:f0b:b0:2d9:a01a:4bce with SMTP id
 m11-20020a0568080f0b00b002d9a01a4bcemr4010781oiw.245.1646937022243; 
 Thu, 10 Mar 2022 10:30:22 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:5655:fd2a:accf:db6c:e4fd])
 by smtp.gmail.com with ESMTPSA id
 a7-20020a4aae47000000b0031d17643eaasm2763175oon.22.2022.03.10.10.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 10:30:21 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] --disable-tcg avocado fixes for ppc-softmmu
Date: Thu, 10 Mar 2022 15:30:02 -0300
Message-Id: <20220310183011.110391-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
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
Cc: farosas@linux.ibm.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, clg@kaod.org, muriloo@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These are more test fixes that I missed from my first series [1]. Thanks
Murilo Opsfelder and Fabiano for letting me know that we still had broken
tests to deal with.

All these tests were either a case of 'this needs kvm_pr' or 'this needs
kvm_hv'. Since avocado doesn't have yet a way of detecting if the host
is running kvm_hv or kvm_pr, the workaround for now is to skip them if
TCG isn't available.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg00866.html


Daniel Henrique Barboza (9):
  avocado/boot_linux_console.py: check TCG accel in test_ppc_g3beige()
  avocado/boot_linux_console.py: check TCG accel in test_ppc_mac99()
  avocado/ppc_405.py: remove test_ppc_taihu()
  avocado/ppc_405.py: check TCG accel in test_ppc_ref405ep()
  avocado/ppc_74xx.py: check TCG accel for all tests
  avocado/ppc_bamboo.py: check TCG accel in test_ppc_bamboo()
  avocado/ppc_mpc8544ds.py: check TCG accel in test_ppc_mpc8544ds()
  avocado/ppc_prep_40p.py: check TCG accel in all tests
  avocado/ppc_virtex_ml507.py: check TCG accel in
    test_ppc_virtex_ml507()

 tests/avocado/boot_linux_console.py | 12 ++++++++++++
 tests/avocado/ppc_405.py            | 10 ++--------
 tests/avocado/ppc_74xx.py           | 13 +++++++++++++
 tests/avocado/ppc_bamboo.py         |  2 ++
 tests/avocado/ppc_mpc8544ds.py      |  2 ++
 tests/avocado/ppc_prep_40p.py       |  6 ++++++
 tests/avocado/ppc_virtex_ml507.py   |  2 ++
 7 files changed, 39 insertions(+), 8 deletions(-)

-- 
2.35.1


