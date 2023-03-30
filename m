Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B026D00D5
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpGA-0007a7-LN; Thu, 30 Mar 2023 06:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG4-0007VQ-86
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:53 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFy-0000Hm-Nn
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id p34so10550172wms.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DSpoqIko9lkJ1FYEf4OS/seXi4zTLld6phvSoMKotZg=;
 b=WB7h6Vrn7wMsdPeKfDuZwWMTZP8assCSflyxJXVlciE1rlxqCxAid+Biqqd11XYHE1
 dWNKRMkze8s/GsedQ9dXwd3MdJcN7fgwcoyng7ZesBneQOp/W5HV0R2hzzwe1NOlNbEM
 smwWeVOq/IvECdOZoTcNfey9vIilpA4NtivhLopGCrIHI0liF8felpCa6MVKtDXZtd3c
 Bg1YeTHj5wm+m3KGAQtEiVROMHU8Ao070F557RMSr5Z34qMSxpTqVanyZAnLuHAyM5iR
 5UQ3QvQARm323Rvww/KG1aPWro3PCtg1ZgJTEtUbxFN1qTV5E4IS7Tan4q7Z889dYXoM
 bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DSpoqIko9lkJ1FYEf4OS/seXi4zTLld6phvSoMKotZg=;
 b=YPfojX+UBmiOjiNYYq2nzAlKqTYM2W27e3lSXyb9BJOPt3O/VIBtTOEbiJn1wGb1NV
 Vbvbe81NjO27emW23eBwyvwplS9YPN7iC9BY/FWxzBN0NS1HfJuI/CpVKxFNo5Z3hDzW
 5sAiQYS149COdpuwRTJ2BKb2P0eC05MSr8W0ru9VeryDCaiw9P+YqwECw5WtQ+z602gg
 0LqhuoSFp8C3VCHXt9l+QnC7VCi2L/jwybQpAB7NqnTPB1oDX5PXRHQTl7FKVsO+WyC+
 ZwKJAOVamZH7jlWz4OY3A9EaLSZGFwfBq5+oUGHPku4Mr/u9EgQvyFZlzZf0uxCV/iAH
 w9Fg==
X-Gm-Message-State: AO0yUKVvBGrukJq6Gg/S4OxbgFI/YNF1/MkxdXuzfA3JHvlH7xRt6cm0
 ob6ySwtt95WsJIxQNhByQAuTqld+ChQP+gTu/6M=
X-Google-Smtp-Source: AK7set8DfRtrX6GRNT4H5JR2JEZvMjqvHPxmEERzr6PC+O0sx+V0AxDt69BlmRoJ31ciQYCQkLKNog==
X-Received: by 2002:a1c:7207:0:b0:3ed:2606:d236 with SMTP id
 n7-20020a1c7207000000b003ed2606d236mr17014619wmc.38.1680171105431; 
 Thu, 30 Mar 2023 03:11:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05600c475400b003f034c76e85sm2315656wmo.38.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F39AB1FFC0;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Subject: [PATCH 09/11] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Date: Thu, 30 Mar 2023 11:11:39 +0100
Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Kautuk Consul <kconsul@linux.vnet.ibm.com>

Avocado version 101.0 has a fix to re-compute the checksum
of an asset file if the algorithm used in the *-CHECKSUM
file isn't the same as the one being passed to it by the
avocado user (i.e. the avocado_qemu python module).
In the earlier avocado versions this fix wasn't there due
to which if the checksum wouldn't match the earlier
checksum (calculated by a different algorithm), the avocado
code would start downloading a fresh image from the internet
URL thus making the test-cases take longer to execute.

Bump up the avocado-framework version to 101.0.

Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
---
 tests/requirements.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/requirements.txt b/tests/requirements.txt
index 0ba561b6bd..a6f73da681 100644
--- a/tests/requirements.txt
+++ b/tests/requirements.txt
@@ -2,5 +2,5 @@
 # in the tests/venv Python virtual environment. For more info,
 # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
 # Note that qemu.git/python/ is always implicitly installed.
-avocado-framework==88.1
+avocado-framework==101.0
 pycdlib==1.11.0
-- 
2.39.2


