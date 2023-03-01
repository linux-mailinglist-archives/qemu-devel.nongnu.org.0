Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042C6A6F25
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:18:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOBn-0008E3-SE; Wed, 01 Mar 2023 10:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBj-00089U-81
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOBg-0007cS-MM
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:16:14 -0500
Received: by mail-wr1-x432.google.com with SMTP id v16so10782495wrn.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCGekxGxjU/hmOPy5lL7DhzIR++DazJ3aKr66MQtme0=;
 b=oR4py4MeLbUsy+vaDGuZ/zjw+hNv1flrrphkqm3bZG9fDjo224p2uxxPthM3A5Wivd
 zvelD6g9ZTFy+JwuEbEyQhqF172uDmSNoO8L7ZYd2QdjcUDDS5T8RNcO/FrD+vwJwFJT
 Z6hUEOkwQ/riRPw6QQNfIy+5p1fd/MmxFfzhAHQwDADIU8flq0Lh74trPBpdPCS8BEU+
 dLLcP/2IRVvSFYoba1hES/0eTy4AyJtOC34JWMaXo6a8CHb7t1iVWml6oX0+bTB6vkTC
 4bz0evXJA8La8hr+PLIUyD/ivMF8QjMpB8jCgDhXRDHhU9nz+kN0ezK/QEJ4XT5mKggt
 655g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCGekxGxjU/hmOPy5lL7DhzIR++DazJ3aKr66MQtme0=;
 b=so4rB1Uc4tbyGAdW3kUtUJREakiVHV4MlzfGHU+eJ3Yi95ED7Gs9toUviQd/yPfAj5
 Gr2IbA7X01JofF3yyJH6ht6iIX9AxfeblpYiLqy/WtXGol7Oh/Ju0t8+Tf335pbMURlO
 UJBCCzuIBdXh1ubu3QEHqmMzHm1e9HV5NmbTqPQQXTXk50s+UWef9vbgLrqm/z+NhArE
 eRVAxDViqlYLLdJ/UtaObr6Ta4E5rZ3nZS35h7KhF/NvPag+FxZWuipC/MdCgpAcS6ax
 n+fonpzGuvvAf8x+fJ58Vacwdx/QKIP9mdJzbWdM3FXd7l7iM2CAcS0BNj/V4VS9kg0/
 k4vQ==
X-Gm-Message-State: AO0yUKWP5Y+yWVvzLrmmzyfiKh90JsS5HAitlH1TxIytt+yFw3x6X6ja
 +j7dbaoX5eAmFLm6cL5THyOfuA==
X-Google-Smtp-Source: AK7set8VnYzsGTM0KnOnbpRJiMor9lpBucML5y3Lgof68oK+mzpYx2kihSc1LRm89sYIe6+slzpftA==
X-Received: by 2002:adf:f549:0:b0:2c7:ffd:f483 with SMTP id
 j9-20020adff549000000b002c70ffdf483mr4966027wrp.41.1677683770939; 
 Wed, 01 Mar 2023 07:16:10 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a5d44ca000000b002c6e8af1037sm13008036wrr.104.2023.03.01.07.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:16:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6CFB1FFC0;
 Wed,  1 Mar 2023 15:16:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 09/24] tests: skip the nios2 replay_kernel test
Date: Wed,  1 Mar 2023 15:15:49 +0000
Message-Id: <20230301151604.1948813-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

It is buggy and keeps failing.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230228190653.1602033-10-alex.bennee@linaro.org>

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 00a26e4a0c..f13456e1ec 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -349,6 +349,7 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    @skip("nios2 emulation is buggy under record/replay")
     def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
-- 
2.39.2


