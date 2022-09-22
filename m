Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635D5E699D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 19:27:24 +0200 (CEST)
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obPyt-0002QR-ID
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 13:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBK-0002G3-H3
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:14 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBB-0005T1-Uk
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:09 -0400
Received: by mail-wr1-x436.google.com with SMTP id r7so16472060wrm.2
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=fRuzNdVxdAJZ2ReB6Zxl4KaSdRZlenZ74jhT7D/lFHc=;
 b=t11A2SKE4HFIm1qec5RSAY7xAvyKl9il+QXZQeH0OB5d1Q24Yc9oKOSF/VSmf1eFUC
 aggiPhRILWbjpzGkuAjSrdI8x6icF7smKCPT32UuRiXwp8P4/nK5aKfubA4zlmqzaBMq
 07UjKev09+KC+vE0Sa/gXmxH3KHU+22rEOH+QUXePDt64aIoAZPSFTHBoE22WbR09Q85
 u/cdsGiMYlN4IPGUnhlGukHnaTkQXWL/49z8jwZ658phrCgkWSWont1x9DUbn8xCXxiF
 WBDGimWbAA4V0ZAts5fn16TjRogIttAvDY70Ps/jIPThhPwg1ruOGwqxZSWM/Vs3hPx3
 v3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fRuzNdVxdAJZ2ReB6Zxl4KaSdRZlenZ74jhT7D/lFHc=;
 b=DOBp29yoAw5s7cYhT3ZymP0XlTpCECYeFDDuyLvUxdx9FL4KVX8zmRM9L7rLRwFNX/
 X6yeVMYlrz1GWZB38vIHc97OeUl+D3pgbGmWrzk7yVR+fM7jOJhJEjclBXBEJNP5ILOg
 wQl17FNe7ooNSjnyrMz4vvj5ulcMoQBQTaRtMHZGKGxZXT1dQHhy6d5wT6EBuaPUeGK3
 Kjh//SnuwWflz/A1WPCRZYDlj4BFw2r9h81WVMOz9hmlIK1i7U3SwQS8i/s8nQ8s4HOF
 dc7qSmHk3vHOrSd71wuVzGBxqIBtjxJrYz0yDP5eCUQ+imyr/k+Hdc3yCB9DHLg4yzym
 HqxQ==
X-Gm-Message-State: ACrzQf2KmsY7Pbe+Ciy5+F8cv7qB8Qb79vBbyn4liMOgJswCEAfoFeYN
 m73dxJUhnb8g7kJdecvzA/rsgfJfck+qkA==
X-Google-Smtp-Source: AMsMyM5BjBZFyt99rInzS6GZQZG8bcunMndMCt7titQ811FkwpTkp3AfBrwRMUm5Y7AKBJXGprznPA==
X-Received: by 2002:a05:6000:1d84:b0:224:f447:b1a7 with SMTP id
 bk4-20020a0560001d8400b00224f447b1a7mr2544801wrb.688.1663864559477; 
 Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.35.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:35:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/39] configure: Remove unused python_version variable
Date: Thu, 22 Sep 2022 17:35:30 +0100
Message-Id: <20220922163536.1096175-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shellcheck correctly reports that we set python_version and never use
it.  This is a leftover from commit f9332757898a7: we used to use
python_version purely to as part of the summary information printed
at the end of a configure run, and that commit changed to printing
the information from meson (which looks up the python version
itself). Remove the unused variable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-2-peter.maydell@linaro.org
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 0bbf9d28af7..b5ace4cb49e 100755
--- a/configure
+++ b/configure
@@ -1112,9 +1112,6 @@ if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
-# Preserve python version since some functionality is dependent on it
-python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0], sys.version_info[1], sys.version_info[2]))' 2>/dev/null)
-
 # Suppress writing compiled files
 python="$python -B"
 
-- 
2.25.1


