Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4085666097
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:34:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe1P-0001Ko-MA; Wed, 11 Jan 2023 11:32:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1O-0001Kb-Cs
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:14 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1M-0006DA-5B
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:14 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z5so14571668wrt.6
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrOBk17TMa2OWZz0SbjtOf4ZOsu6Ap5uvaat2NYfOGU=;
 b=j98uTUob0WJmHtLZZ15lWN950JCotVwZSfoUbkTpeYNiQP4wEs/qDi6sdabZQbnooE
 w9AIelEvdKQD3SxTKGPAL3ao4eSJWl3OMdljno8scrgdK8crXrqnJwp7VinGien/m263
 A7qOmHGP/wbtrejcX3aykbhc1L0/iC/F5txk3oVM2e4zIjkM3ogIVz2ZD/48CCLPOmSs
 KTp0uMj99dQ1HOypOKks4Sr7IfrJdFxTdUM+Dyve7bN2MhR7gTKhI/CL6tcaIpbgMWNN
 nBy/HfqgOtDTxnxr+hmadjAefXRfzDzyd/Akg5shY39vHfNQKxiu5F6mEjOwThIRcUw6
 x5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrOBk17TMa2OWZz0SbjtOf4ZOsu6Ap5uvaat2NYfOGU=;
 b=gVFShC59baP7RaCYnQBqCNTJ5G7E2V+pcZOboiI/klEyNy10ynabQowYVDPVYLENSY
 pBMgVZGo3Mclojf9UKuMpx/jllaBaxuygPM6NKHQWcon+V9QILsKkdxDNMOvZD36GrDK
 HcxvR+Uk+aSq/3MCFMXlz2IFqIN2rYBwDYuhp1dttLbohkOm8OR1jPpLJOj+YvCxxJhR
 yPyufFvI0BWZmUjSiIPJmp2bKesiUgZ2qGIzDJHK+sI+oyjUX80Y8UlNzaVv6atmvV5q
 JYj6yCXiMMPb1kH1Y0DYNhnfWvBguSeZez4WP0oiNRMIqg7o6Xt54/GMvh3aT2+tVPLj
 5Jyg==
X-Gm-Message-State: AFqh2kquXBeNw6btgJX6O4UrgSrLcgaY4puSdvWiNFDYangLqg1X3aJ6
 oD/z+BIaPcRGOlsj/BNsz24byEMYcabwuaRl
X-Google-Smtp-Source: AMrXdXv68f3ENSiVKIEZN5HCP9jH5Fn+3cw4plSd00jXPANBFa2eZJjHBgWHY5nYz45PjvgOFUWCyg==
X-Received: by 2002:a05:6000:1f1b:b0:2b8:27df:d43f with SMTP id
 bv27-20020a0560001f1b00b002b827dfd43fmr21198814wrb.24.1673454730705; 
 Wed, 11 Jan 2023 08:32:10 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d67cd000000b002bdcce37d31sm319808wrw.99.2023.01.11.08.32.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:32:10 -0800 (PST)
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
 David Carlier <devnexen@gmail.com>, Carlo Arenas <carenas@gmail.com>
Subject: [PATCH v3 4/6] qemu/bswap: Use compiler __builtin_bswap() on Haiku
Date: Wed, 11 Jan 2023 17:31:45 +0100
Message-Id: <20230111163147.71761-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
Remove the Haiku specific ifdef'ry.

This reverts commit 652a46ebba970017c7a23767dcc983265cdb8eb7
("bswap.h: Include <endian.h> on Haiku for bswap operations").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: David Carlier <devnexen@gmail.com>
Cc: Carlo Arenas <carenas@gmail.com>
---
 include/qemu/bswap.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index fd5a98125a..8cd5a2b02e 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -6,8 +6,6 @@
 # include <machine/bswap.h>
 #elif defined(__FreeBSD__)
 # include <sys/endian.h>
-#elif defined(__HAIKU__)
-# include <endian.h>
 # else
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
-- 
2.38.1


