Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EDA6B4BCC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf8C-0006Wt-Ca; Fri, 10 Mar 2023 10:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7l-0006Uw-4P
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004KO-U8
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l25so5496090wrb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XrLMjayfogfDKZiC6WfoYhb5uBbHhPLMkq9B8laGqh0=;
 b=zACNbS2PbbWWwB45utja0Z9Km2jT7SxDotjgfSV5/2GZu92KMlvKBYtiHuvjK8jl7s
 nx0J+gDM368O3IR55joWF9dDLWJDFnKsuHnuS+A28D7RLBOzLuHMP2GFMeK3V016ZhBr
 ij8JHsNfEtHcA8F45IQY2UQwx0rGJqrYU84DD2QejL3wcYIH7oQM7qm2PiyENIXMIgr7
 qv2XUIzTPQ6tTRFTDcu3rs5avpWV7fZsiG94N14okQ/gH6tf0W0CU/VI3Xx6f4mS+NNb
 Xc4uP+v0Di9JKWEDoE9U9wMNxaDPJZ95Kh9MxqyUal6tdx1/E0DQV7GTKDG1q7mk9O36
 I0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrLMjayfogfDKZiC6WfoYhb5uBbHhPLMkq9B8laGqh0=;
 b=ymb8Br+Gg8zkN4aMOeeYJ5BnHYrRDByWF7Dut7wb4aihEpAursp9uSFd9/FOtI8YAm
 6MiGIOuncMRVDvgnvLtbMUK/jcmbGox0ndI2ce1GmaVR3M4OOr3ZTzN0Q3Npk7WACeP7
 oQVmn+a8XZMzsFQWnIwUwnQaja9wJjAKwfAi2kVNr6gN8sn20jIEOWzhLAdBim+9orP5
 yGT7D8JFpMlTLk8SGvK5/qltwvb7vTF9rM1nl7b7sx/qJQw+XsHiDln8Vl24Mx0HArNP
 UT0LOjpa1ahO81RQBbz25I9r21nFKL0KuA5XeV/DCiWvY77KJErftVKpYrhQ2VS8JEQ/
 hEuw==
X-Gm-Message-State: AO0yUKVUCDuL9STIMeGNu9buIg/tfyZv6exb2WCPW1mk9pvJ+CDydXWF
 3wun2hASP594A2/vU/sCqstEbw==
X-Google-Smtp-Source: AK7set/ZVCjvC9DGvVdd+NmfkpEBH/SSby63e6eP1olnZkdgXuoxlYA8gsRqaJE9RA/BcUD07Z5Amg==
X-Received: by 2002:adf:e585:0:b0:2c7:1e52:c5a8 with SMTP id
 l5-20020adfe585000000b002c71e52c5a8mr17030992wrm.21.1678463847573; 
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q6-20020adff946000000b002c703d59fa7sm158761wrr.12.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B37711FFB7;
 Fri, 10 Mar 2023 15:57:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 0/5] gitdm updates
Date: Fri, 10 Mar 2023 15:57:21 +0000
Message-Id: <20230310155726.2222233-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c9932:

  Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu into staging (2023-03-09 16:55:03 +0000)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-gitdm-100323-1

for you to fetch changes up to 0194e846c43f0ee18e0384c0c1f35757760e04ec:

  contrib/gitdm: add Idan to IBM's group map (2023-03-10 15:54:43 +0000)

----------------------------------------------------------------
gitdm updates for:

  - IBM
  - Facebook
  - Individual contributors
  - Ventana

----------------------------------------------------------------
Alex Bennée (5):
      contrib/gitdm: Add VRULL to the domain map
      contrib/gitdm: Add Ventana Micro Systems to the domain map
      contrib/gitdm: add Tsukasa as an individual contributor
      contrib/gitdm: Add Facebook the domain map
      contrib/gitdm: add Idan to IBM's group map

 contrib/gitdm/domain-map            | 3 +++
 contrib/gitdm/group-map-facebook    | 5 +++++
 contrib/gitdm/group-map-ibm         | 1 +
 contrib/gitdm/group-map-individuals | 1 +
 gitdm.config                        | 1 +
 5 files changed, 11 insertions(+)
 create mode 100644 contrib/gitdm/group-map-facebook

-- 
2.39.2


