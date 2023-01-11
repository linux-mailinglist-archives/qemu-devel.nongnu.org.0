Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86E7666091
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe1w-0001RG-Vq; Wed, 11 Jan 2023 11:32:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1S-0001NJ-US
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:21 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1R-0006EC-9m
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so15617757wrz.12
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yTlzIhdQXGUOdGXpzVVk0JZtLKwh1GWYTc0XjOdq0Rw=;
 b=HhwMvMjZefnlS3XTu7tLa78f6HUUKlfh85uF2QyzmYosgXHYEiaJnUjeAVrgILfPkD
 4ian8UBPAUxls+YM+E2RWzgnh6Nn+DotQKmvxVFu5hSGRRrPotRHbMGBk8cYMWcbrsNH
 TT5yNuCbgbUyXGlp2lkLoolJIXk+h4oIuJG+DNoFEe5oqvPJEiXxK4X3SrF1CYIzs1Z/
 3hJybHdLWlYhuVTt4mJg8j7/s5tAQX9L63r+MJTWxgiuwGJhGpRWhJ5I5fBo++ejcQT6
 SYoJRM1RLUQsuWhXW9cCk7yX1Pj6rbHgxLu/9uPM+yp+ZLSrmi3KLfMnWuKCqhrx0jX0
 3guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTlzIhdQXGUOdGXpzVVk0JZtLKwh1GWYTc0XjOdq0Rw=;
 b=eTjmCMDqT3cklpfwIDLaJLOe2bA7uAdhX01zan5P4aJuC7V/x6WTCtv6aU7av0hCCS
 zKK1pLdDrU/dXHRLo2wW5lH3tHOjKj03a9yrR/fsuoFOlSH8ZGkVUfX90E07U3OBKp6P
 YpffEnZrqJ4059sc3J6bMNPQgCWmHwcDFQyNZNx8nI14HTypWLAeQb22M7eh9BLwZYLf
 9dPyKBHwXcbwI6ceCDT8gFNR3GbhnMt9uaXrSQu2m3Q3o9kKExk8AEHU6x/YdBnRBb/5
 +SW28Zg0afFDU7+KMtiWWD33WJUHfM+gidBIMMft0p2BUPPT1orL9D6sUqr6ohTAxd78
 vyNQ==
X-Gm-Message-State: AFqh2kqATS+w2nG2oOSrypOfVoLSKpGD/BO7exGq5UE61Gg42GChMXUy
 CohMgxJWBW1Nf/tqCMs3Dej1ai7xGiBlUc7+
X-Google-Smtp-Source: AMrXdXsRaRUCxxEmGHD8ecag6bc3ujcRPq/FUURFTYdsATcZqRNOZSOxWhzAYL49mIPpr4RIi0yASQ==
X-Received: by 2002:a05:6000:a19:b0:2bd:c477:8d6b with SMTP id
 co25-20020a0560000a1900b002bdc4778d6bmr2174471wrb.42.1673454735773; 
 Wed, 11 Jan 2023 08:32:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfd229000000b002bdbef07f7csm3151033wrh.50.2023.01.11.08.32.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:32:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Ed Maste <emaste@freebsd.org>
Subject: [PATCH v3 5/6] qemu/bswap: Use compiler __builtin_bswap() on FreeBSD
Date: Wed, 11 Jan 2023 17:31:46 +0100
Message-Id: <20230111163147.71761-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Remove the FreeBSD specific ifdef'ry.

This reverts commit de03c3164accc21311c39327601fcdd95da301f3
("bswap: Fix build on FreeBSD 10.0").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Ed Maste <emaste@freebsd.org>
---
 include/qemu/bswap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 8cd5a2b02e..32d5cdec27 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -4,8 +4,6 @@
 #ifdef CONFIG_MACHINE_BSWAP_H
 # include <sys/endian.h>
 # include <machine/bswap.h>
-#elif defined(__FreeBSD__)
-# include <sys/endian.h>
 # else
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
-- 
2.38.1


