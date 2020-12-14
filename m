Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB422DA319
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 23:15:48 +0100 (CET)
Received: from localhost ([::1]:38624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kow8C-00011o-1s
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 17:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6T-0008SU-Fs
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:01 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kow6R-0004aK-L9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 17:14:00 -0500
Received: by mail-ot1-x344.google.com with SMTP id w3so17376046otp.13
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 14:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mo3jZv6+qLcS9/RPyw+XlvoWGWRTMmEVplexje7I4pc=;
 b=gQD1rWvEzDP8Z8kFmDQhNFgHQ5Nm4KLv3mnKPKfmkMyxiXCj1h4qpwUR1813dIoprg
 6jdI65wwFq6wCTbJLSETbnD3XhjLqfzgrzjXcAtRQIUkWgyjqut67tBzzg93iOrr5V4Y
 pysxFsfs1EB9drCDwtf1bY/u7WRW3bx6SrcO6UvR6ZplKffV/k3daxb2yc4i6obNkfBb
 UJG/Sozy47dGMdw8y5dSEh6C4DKIvWVpDI9D18oVlnTbShYE16ABaU94uRi2W0D4xhrN
 52Q8NG4tiGVy6+1D2yIEmFdQsqJEdRARWphvQqGkK8qiXqXW3wL5+NHpm6qzzwQy0hCA
 tJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mo3jZv6+qLcS9/RPyw+XlvoWGWRTMmEVplexje7I4pc=;
 b=mfBhYELZLQgwm8v6YMZ0HCEPDG+d9KxKaoNLqqt68RPnjBdJE/mTW7JzqATNLsJe+C
 C3YqzsjLD7EVcrm5LLzJiESlwasl0bEF3D5NtxORHBgOFHA/0Y60OOmEpUrGQ37CF5cD
 UnWxQdsDGO4hwZIQ0rc4IYgme2bQMfSIjMmAXKt3I9LIx5VaGfgYx7jz3CoywYOs622f
 ina5lsXK8fiKI6Ee4tnxDHNKwHSg3qPrV/erVnYFOYVTg8mTvAYnrw29hLZf3Yf/dzru
 P2wqjLMJ39ONw2rjPoFEIDKHlQGzoQxY43jzXHyvBxo0bBMKjl2w7fxchvSVOY5Fnf5A
 EKpw==
X-Gm-Message-State: AOAM5302Lq43L5GSv9VohzW8flwORt1q+Lb0yWrL/G+2VzeMA4oKa/ga
 QkUhG+8Jg/vtx3gy8mwOkBkMT2TFaMaEbegp
X-Google-Smtp-Source: ABdhPJxxxNAxhbMz4DiG7vNsPKovZGK8fcffLqwozegl9qd8bjN5A9LurI/Cdy/U97i1qWT730bb6Q==
X-Received: by 2002:a9d:1cae:: with SMTP id l46mr5439723ota.249.1607984038200; 
 Mon, 14 Dec 2020 14:13:58 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b71sm2193033oii.5.2020.12.14.14.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 14:13:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] target/s390x: Improve carry computation
Date: Mon, 14 Dec 2020 16:13:52 -0600
Message-Id: <20201214221356.68039-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While testing the float128_muladd changes for s390x host,
emulating under x86_64 of course, I noticed that the code
we generate for strings of ALCGR and SLBGR is pretty awful.

I realized that we were missing a trick: the output cc is
based only on the output (result and carry) and so we don't
need to save the inputs.  And once we do that, we can use
the output carry as a direct input to the next insn.

Changes for v3:
  * Rebased.
Changes for v2:
  * Add a few more comments, and enhance the patch descriptions.


r~

Richard Henderson (4):
  target/s390x: Improve cc computation for ADD LOGICAL
  target/s390x: Improve ADD LOGICAL WITH CARRY
  target/s390x: Improve cc computation for SUBTRACT LOGICAL
  target/s390x: Improve SUB LOGICAL WITH BORROW

 target/s390x/internal.h    |  11 +-
 target/s390x/cc_helper.c   | 123 +++-------------
 target/s390x/helper.c      |  10 +-
 target/s390x/translate.c   | 289 ++++++++++++++++++++-----------------
 target/s390x/insn-data.def |  76 +++++-----
 5 files changed, 216 insertions(+), 293 deletions(-)

-- 
2.25.1


