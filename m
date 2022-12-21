Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A1652D67
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:45:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tkq-00070P-B6; Wed, 21 Dec 2022 02:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tke-0006zY-RI
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:56 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkc-00048a-W4
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:56 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso813118wmo.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=etP2h5UOgxyD1g2PWXehDiF8c3xFUHhjjtIkvhRulcs=;
 b=w7g8dth1VdNOaNVZ81OAEx5TTDwd0vTJ56EDWi7ti11z4vMfKEKSLqFpgsbKWRcMnN
 2HOJoYCgosjpUWKL2Aunmjb350J65aNIjMgHn+M3jXnsnVeHCAiL1AOuzmf3Hdd95UO0
 +W3E5Drvxld3NNN27eecuzqb4J1zF0jkTYI0pBDQlmo4SFUs8smPg0XYMbn+0QZKIY69
 vv4Epq3bo8hvCEN/faBr0vSsnbQWtFlYQ0rXYf++YurXa8XPghakP8J08KdxglbtXyc1
 9ND2CQ8uD6Y41PGBz/yAwIG84fwjQJGBq8HJG31/omL8JCz6zwLO/58miMu+XdVnysOI
 KM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=etP2h5UOgxyD1g2PWXehDiF8c3xFUHhjjtIkvhRulcs=;
 b=AKD2l2yi/Hqr29q6m08PpJwyPPagMVJOJo+f2yTNqOkrt82Dyb7rJO8ypQ8GHzJYa0
 eI+AnsqXuusjqeVhBK3n30YrxNbK00NnCCa+N/FhRWcAh2LIp8IPW25odLgi61ZNLIYs
 sVKLqCpnrtHH+hDmz4jplRmGSKgH/ai5Qq4tnve5iUMeaAgxr3nkJTpT2vvdvQtDHwfo
 J1HxCoNQeFqjiiYAJJz3k7kW9nkGPZh8mdzfEY0Uj6criW849ihZegnSqZtrRRmCFCPb
 jP7TNuY0m4p1aEJPpBgQxEfatdzD6DvwX7grO3ljamaYSJAc6iMs2eWI3k2VThN8nTRf
 Ev6w==
X-Gm-Message-State: AFqh2krtJex69M9QM2rs/remfySEzcx7gSoc1TFsgVHmg8rL5PpHtorp
 YDB7yjL+07QkV1i9t3Q/cyLpFQ==
X-Google-Smtp-Source: AMrXdXuxe/FYHsNxwXnp+toR8WSPrhMBwyMZZhVnDvK9dk+5TCKOmPj+oSXDkcAbEoACWE0sgyjiMw==
X-Received: by 2002:a05:600c:4fc6:b0:3d3:4a47:52e9 with SMTP id
 o6-20020a05600c4fc600b003d34a4752e9mr881916wmq.15.1671608573524; 
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c458d00b003d34f170487sm1744649wmo.0.2022.12.20.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7620B1FFB8;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [[PATCH]--edit 1/6] configure: Fix check-tcg not executing any tests
Date: Wed, 21 Dec 2022 07:42:47 +0000
Message-Id: <20221221074252.1962896-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221074252.1962896-1-alex.bennee@linaro.org>
References: <20221221074252.1962896-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>

After configuring with --target-list=hexagon-linux-user
running `make check-tcg` just prints the following:

```
make: Nothing to be done for 'check-tcg'
```

In the probe_target_compiler function, the 'break'
command is used incorrectly. There are no lexically
enclosing loops associated with that break command which
is an unspecfied behaviour in the POSIX standard.

The dash shell implementation aborts the currently executing
loop, in this case, causing the rest of the logic for the loop
in line 2490 to be skipped, which means no Makefiles are
generated for the tcg target tests.

Fixes: c3b570b5a9a24d25 (configure: don't enable
cross compilers unless in target_list)

Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Link: https://patchew.org/QEMU/20221207082309.9966-1-quic._5Fmthiyaga@quicinc.com/
Message-Id: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/configure b/configure
index 26c7bc5154..7a804fb657 100755
--- a/configure
+++ b/configure
@@ -1881,9 +1881,7 @@ probe_target_compiler() {
   # We shall skip configuring the target compiler if the user didn't
   # bother enabling an appropriate guest. This avoids building
   # extraneous firmware images and tests.
-  if test "${target_list#*$1}" != "$1"; then
-      break;
-  else
+  if test "${target_list#*$1}" = "$1"; then
       return 1
   fi
 
-- 
2.34.1


