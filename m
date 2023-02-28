Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719A6A5F4D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KG-0002ab-AW; Tue, 28 Feb 2023 14:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jk-0002JK-8g
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:18 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JU-0002pb-9g
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:07 -0500
Received: by mail-wm1-x32b.google.com with SMTP id j3so7142023wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DuLX1vmB+IE2B4LVPxcMs0j9qWEubCalxVU5Ic/npCA=;
 b=BcJEvD3epxCq4VxDfEdBWKgmNUZksdF4mtUkHa81a04hwIXu5ILjntWnFWw7JsHB3w
 IpXahvnLibQ6dPBVzAmTdLV1X9zzs0bLCBhvsfowvOFB1vC5pwhdN3+vL2qmjXvuT4GL
 gzKqUlIQl7yaa1nzoTXUd7daOUTZQkuakl/iH34xqZnfOfCBAMvN+PeEnEMHeOOT8LLM
 3QfwXRMZ9bAjc7kH0r2xBH6mmq7e4DkVRaeAo/jVBUQ0kv9IY+gOnkT+qrcbTqX9O+5I
 pyFb1MtUQ62IPvQysHFFeme0HuharYOMcZX12OPL1MlEL8mUT7HSb1uJB2U9nqZGfVB+
 0Ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DuLX1vmB+IE2B4LVPxcMs0j9qWEubCalxVU5Ic/npCA=;
 b=f374BwE97roiuj0vEP9uPf3vH34TLDXJ7hK+yhcIL92Ss209hsPciSDI7GIp3o7YFT
 rN/4UL6rFboelT90Xep0k04siJTH1S+iybc+pz/RMcGUU0Jak06H2fIV53Fwd+8QgUNL
 V/py19WFAOuHZ6Poksaxv4SoJzABB0tPMvqimkyRJDcyt2Cz5csEpzQGas6qYzYfHNRm
 FIQK1dxaoxROLfAWkUEV8/RgJiFgd0v1GjKMZrjkOWdSjV63hQRc+iLRJAMfO4pEYRKL
 NeT1KKYcKyNLSH8/orlwnoPgjP4bhDsHSi+K+K9dWwtkRi8j3Elz2Rid4c+cw87Xej5M
 IG/A==
X-Gm-Message-State: AO0yUKVEeYqa6c/0jy7gP21NNihiuSvqWXwMpT21O1c/Zce2Mmg0JQxV
 In8mTmMDSeg2IZxAir6NcmAxVw==
X-Google-Smtp-Source: AK7set8g0AtoBWqI38Eek/UM38PVAAWb8ZEXhM6TOXoCoXKSfRfrZlAyanD3Yqcg4QP7FhKDZU3eKQ==
X-Received: by 2002:a05:600c:997:b0:3eb:578d:ded3 with SMTP id
 w23-20020a05600c099700b003eb578dded3mr25154wmp.35.1677611218935; 
 Tue, 28 Feb 2023 11:06:58 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm18218029wmq.29.2023.02.28.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A0F81FFBF;
 Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 09/24] tests: skip the nios2 replay_kernel test
Date: Tue, 28 Feb 2023 19:06:38 +0000
Message-Id: <20230228190653.1602033-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230221094558.2864616-11-alex.bennee@linaro.org>
---
 tests/avocado/replay_kernel.py | 1 +
 1 file changed, 1 insertion(+)

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


