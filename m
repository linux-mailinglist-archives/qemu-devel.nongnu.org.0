Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D33D41A1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 22:35:55 +0200 (CEST)
Received: from localhost ([::1]:53564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71ti-0002Jj-Rt
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 16:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rj-000056-SZ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:51 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:52046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rh-0008AZ-Iw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id mt6so3902518pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94RKL2dHCWN4arLXkSKmP5N4w53Eo7Be2NyOw7kSRDg=;
 b=VoxlA6uZVEbU9RDiYFH7KK6JZBfFWwt1rYggooljZk6FRUH1uYmwF/PYbrAnXAweR7
 7AjeX11ZUGFTVTIA+sk3t6wq7f/2vrnOQIUFeb5C8DuNWi0L5GKMAF2gDY1Jk209Hyod
 h7HraWTnCnKMVZlNJ1br9MLaXQwXAKDA3TZKejRdKnCL+pFbLDMOcWd4TvKxWbFQ2fbz
 o4lTUpnzez0LUNuMYFVD3/aswHMjvWriQ8i6kUQY2N37P8aZp5+vtiejZUNN7RGBNdV+
 fdryR4W7sJSNOJvLPaKuAeku6h5t69Vnebba/GpQIGW38XSq2hXIx9/r4++zbGD2zmWM
 pAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=94RKL2dHCWN4arLXkSKmP5N4w53Eo7Be2NyOw7kSRDg=;
 b=KlKT9gP6LMUAc6iArEklQjOSYDMPGvdN5Y18h2RLl2jumRuubrmwPuqwej6EFK57em
 2ntr+hRJaJR5KeW0IQdmW1LhFpcrkWJPQlvXNl75D2/J7OysY+eIMVzri0atoe26ACb9
 RHfPCR68QpwVQqmpr+/QHH7HBYcFsXFNWvl0qNM182e7jOE/f53MBEaM4vLqEHKN6gXF
 GkJU8YrZl9jFNgB2U0bpWyxc3YP4W1FISWLSMxKw5Q5BbqFqrKHZV22QOKbd7AGCqUFR
 1rghYkdw+Dbe2coX7eUZfUS0uWG87QaucNeBbL/H9dSQJg+Bn1QgLH6GfviQQPgWBNju
 twQA==
X-Gm-Message-State: AOAM531W4TIg89M2IMKzxz0Wcj6GguIMzX6Qt+3ZlOlvwE++3juw7+9K
 KM75VEARFm7QIcQmgyQxrB5B+DdvKW+zgA==
X-Google-Smtp-Source: ABdhPJz7n2eezBno+Uenh3J7ozt08aU99sPMedts1wVnbaYZNwMu7UghJYFh9qPkyFneM4UEEogDUA==
X-Received: by 2002:a17:90b:207:: with SMTP id
 fy7mr4892969pjb.18.1627072427557; 
 Fri, 23 Jul 2021 13:33:47 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v23sm6904754pje.33.2021.07.23.13.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu property
Date: Fri, 23 Jul 2021 10:33:41 -1000
Message-Id: <20210723203344.968563-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is intended to resolve #482.

Changes for v2:
  * Split out length bounding fix to new patch.
  * Use byte units for sve-default-vector-length.
  * Support undocumented -1 "maximum".
  * Add documentation.


r~


Richard Henderson (3):
  target/arm: Correctly bound length in sve_zcr_get_valid_len
  target/arm: Export aarch64_sve_zcr_get_valid_len
  target/arm: Add sve-default-vector-length cpu property

 docs/system/arm/cpu-features.rst | 11 ++++++
 target/arm/cpu.h                 |  5 +++
 target/arm/internals.h           | 10 ++++++
 target/arm/cpu.c                 | 14 ++++++--
 target/arm/cpu64.c               | 60 ++++++++++++++++++++++++++++++++
 target/arm/helper.c              |  8 +++--
 6 files changed, 103 insertions(+), 5 deletions(-)

-- 
2.25.1


