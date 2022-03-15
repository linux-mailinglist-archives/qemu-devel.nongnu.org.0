Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4734D9B51
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:33:59 +0100 (CET)
Received: from localhost ([::1]:56994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6NC-0001KL-33
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:33:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU69q-0006Ph-3l
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:20:11 -0400
Received: from [2a00:1450:4864:20::630] (port=45704
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU69o-00024v-Gk
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:20:09 -0400
Received: by mail-ej1-x630.google.com with SMTP id qa43so40598968ejc.12
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bI4+xTYHm4q+VWNxKhiA4l4STLYt0F0ObpWtUNKMw30=;
 b=VGk0M/LGcgGgQq8Xj3a6tkCDdhghdpPRKTo3iXlJfgS/+sIvjhvszy4vzKAWadOeeN
 VCb6cq1Qml9aW7yjhzOzsjTBHBsdzU+OJ7KfuFt6clpk3KdmjiaYYBPS4LKxX3riO2Qt
 AQi1N+H0voOmw4IZSJtAc8W/WQ30DAdN6pq/fjSdd1gTSq/fee90DqLR2J9rTWf4ZPoT
 zvP9AkKm6jQUnVecJ/ZjpCHPrGBNE9Vf0YfOBjBrDvaf7HA3Rcs9l7fqwjjiWmAO/JW5
 RB/0wXOCNOJUxoBkSjPNk2mQjHPLcmsHBEEW/58uo0cLRKGQ0+XhJIHdGkR/TEkqIEPv
 xy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bI4+xTYHm4q+VWNxKhiA4l4STLYt0F0ObpWtUNKMw30=;
 b=aEJJ5kbRvfly/V9Vgw3oi/IJnRyc1olmQ74K2NiAORmQDhbUZ7VKDJibbEQIKJMdFN
 zcdiDOgXxez2eUgqBjsgsyce5BHA+vuZFlYfzOQg0ifo3IDenpnMdNp8pv+x1DjaczWe
 5TbAmfSHhpvwiTggL4OXpaIsB/oOqOH+v8QFSK7S63wdk6Hhiv9IJ3KV4I3MkztxU2CP
 7PVVDSztnQzbwv/3upbMgAqyePJ8KWh9ywPFma5Emfl9VbjZpJfAHk0/LgnQ55Mnroz9
 3CkLrKzpvSp4X1ppn813cunY7kp224lbi4tbCN2r2afenb/q1MzYhvB7XbnLQKFQFeXM
 kR7Q==
X-Gm-Message-State: AOAM533mXsUfd/+VTQCgtdraVPHXhYZe7k5iAb15z8SkbZKRhAQAPEUl
 iO2f5UPJ7R4sqvwTmFkX1AHoTQ==
X-Google-Smtp-Source: ABdhPJxnXQtBjSsVxDgARSKpoGFzrhyif1gurt3x4u4ehwFqpESxZUjwGagalvKrRD26lGj+q1nELA==
X-Received: by 2002:a17:907:d04:b0:6db:56be:ef8 with SMTP id
 gn4-20020a1709070d0400b006db56be0ef8mr23960580ejc.188.1647346806197; 
 Tue, 15 Mar 2022 05:20:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm8093695ejb.194.2022.03.15.05.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:20:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 479CE1FFB7;
 Tue, 15 Mar 2022 12:20:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] gitlab: include new aarch32 job in custom-runners
Date: Tue, 15 Mar 2022 12:19:54 +0000
Message-Id: <20220315121954.2283887-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-9-alex.bennee@linaro.org>
References: <20220315121251.2280317-9-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without linking it in it won't be presented on the UI. Also while
doing that fix the misnamed job from 20.40 to 20.04.

Fixes: cc44a16002 ("gitlab: add a new aarch32 custom runner definition")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - argggggg!!!!!
---
 .gitlab-ci.d/custom-runners.yml                                  | 1 +
 .../{ubuntu-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml}       | 0
 2 files changed, 1 insertion(+)
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml} (100%)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 3e76a2034a..15aaccc481 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -16,4 +16,5 @@ variables:
 include:
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
similarity index 100%
rename from .gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
-- 
2.30.2


