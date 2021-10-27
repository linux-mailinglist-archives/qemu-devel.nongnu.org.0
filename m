Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26D743C1F2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:59:02 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfb1h-0007rD-D1
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaz0-00057J-4q; Wed, 27 Oct 2021 00:56:14 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfayy-0004Xf-Aq; Wed, 27 Oct 2021 00:56:13 -0400
Received: by mail-wr1-x429.google.com with SMTP id u18so1900379wrg.5;
 Tue, 26 Oct 2021 21:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUYvKN0nrYC/b3FlkEYPfUG+RYTxEleEkUfmOtCednU=;
 b=O46u0qkQxqQG+cXPunDjsWuBf5O52MTZ+BsgSMiS5YCVvwEvzonLBbctU9qmDOqPEQ
 V9MStovnpglgLKcFg0F/didAhyDnfrsfIPvu6+PAA2I+618900TTFXn7Lc28RaDkEIoy
 Oop+M+h8tJKMThEO/zpmfUMIYkDmNys2VnGvHvSKBrdqS3eHkwYzBC1VGGtQunhlNVWS
 0TsSnYRNYCCA98COGDe9I1S2K8eHm+WA56k6ZwhRHnpkXKeFpyRNIss4r/wRNVof3GLl
 +JbXvi5aIefTobifVDQttKd1Aei7vDBeEKa0WpZWGJgYZGCm+Mls1gxzD/arlnitIwqt
 2B+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=rUYvKN0nrYC/b3FlkEYPfUG+RYTxEleEkUfmOtCednU=;
 b=nxr3dCMUz2cpe9ygR0hnPQUb07kJVpIkpju8g2KiF0rx96dqKlqPibug1Pg/pNRAXC
 bS5Sr83rEEeyqW0AH9sth3l9GH4tPfE8y2HwHqcmKBekRmLVRkZ91r85KmECbxYNTPVt
 Bcvxj5qCJaVXjbDG1PJlTUq/jv1B08HPp1emaD1//BZTjfck6xeThFpq+FEFt/PhgHPT
 kl84eTqXEeobocryeHVcvtcxRmFntQgHyre/urpZ5TZP+vEiP5007shPOSsapeEBlUoG
 nwMxpXat+1iTH9LuPTBvh7WBnEMtnJw/lYvQrukv5bqub2EacFA5dPfILvwJYVSQ1Sj9
 kI9Q==
X-Gm-Message-State: AOAM533XhM3ybJw9UUSUhyNeYV7pdPE51m9IjXRQ4/c7C2b0DdG2TzzU
 r56bBMfvn2NRjMiQiTFe3B2kBx6+RlA=
X-Google-Smtp-Source: ABdhPJwFfmGoHnIu6unnw3HvQk8eg6XcVW4txDOGA/W4qnmZxFH+xkRRjCI7+UxLc1+POPWbJf9Sug==
X-Received: by 2002:a5d:6b04:: with SMTP id v4mr37387900wrw.148.1635310569626; 
 Tue, 26 Oct 2021 21:56:09 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z2sm2213232wmk.19.2021.10.26.21.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:56:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] target/arm: Use tcg_constant_*
Date: Wed, 27 Oct 2021 06:56:03 +0200
Message-Id: <20211027045607.1261526-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review: patch #2=0D
=0D
Introduce store_cpu_field_constant() helper to avoid using temporary=0D
when the value is constant (and read-only).=0D
=0D
Since v1:=0D
- Really use tcg_constant() in patch 2 (Richard)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  target/arm: Use tcg_constant_i32() in op_smlad()=0D
  target/arm: Introduce store_cpu_field_constant() helper=0D
  target/arm: Use the constant variant of store_cpu_field() when=0D
    possible=0D
  target/arm: Use tcg_constant_i64() in do_sat_addsub_64()=0D
=0D
 target/arm/translate-a32.h | 11 ++++++++---=0D
 target/arm/translate-sve.c | 17 ++++++++---------=0D
 target/arm/translate.c     | 26 ++++++++------------------=0D
 3 files changed, 24 insertions(+), 30 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

