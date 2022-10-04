Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162C5F4433
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:23:16 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhtB-0004vL-Uh
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYN-0008FJ-Pz
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:51 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYL-0007MY-K2
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:43 -0400
Received: by mail-wr1-x432.google.com with SMTP id w18so12479932wro.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HZNboECUZJqpoKq3p0B5t93PUG2X2lku1/h5Nbn4Lrg=;
 b=cRchj4eF7GyXImBSmCYoTZG2EMdUsKefsihZmIZeXaOo+MPmTI9Eicydxn/arl566J
 3rnejhQippOfDZocu4jAOg8DclilxJ5Ac9eEafybRohsaJ0l85EwlyfTKSXSwPPPYQ+9
 VC52pRZLUWo1VDmX75jBtGOMPLXntGYWtlfO7XtKt2JDj+ukjhlhKXtqkMsIBgzAzFU8
 SmENB1lsxAa4tLcshPO/fIWMOK12x/xQ+Yx+JViLCCdp5mTH8XWkjscKiHIMRLil52kg
 tpiles+JDrCKF2aUZ0Y01EBWguuddEdIlQV/YhOlb0DYbkfuVyzobsSRoTeAc60YQphD
 LCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HZNboECUZJqpoKq3p0B5t93PUG2X2lku1/h5Nbn4Lrg=;
 b=Q7tVxb1dS2/IQgB3cnu2b0WRrKaEXmSLqEF8yjAdA/EYwRol1muQIOol+tooYhcXyp
 rzoZ6pBy/27THozCjXweCDLHU3qmvdzdaU7FBu4vfvoOns3IgKwmWAc6Y28XQYNTbBqI
 0NfWApUEfsZI4NU/FzCKkIpotR7hB4a4s7PUC8Ami460yxDo2SMaaR6WCqi4OxWhrzKS
 Du09rCNVKNtAa7euu+J8TmGSX4UdDO9wW2RnK5jePx5sZZg+cyzq/7cuW/4NwGhfu6sH
 IUOL8b7X+CISHCT+M/otMAl9GSTjC+ZjPsn+5gHVqCMLKECVkAlkc+Zjuxt0Suzhibtf
 DZFg==
X-Gm-Message-State: ACrzQf1fyQoEZBq1HpOmXrb/8loiXcLzqqPpIWOu6CGrTku28fkepfDR
 WTVGPyJKWfGiwTJebnLW7EEv0w==
X-Google-Smtp-Source: AMsMyM6hW+USUIuBHGRGXF1dvto0PqEQ+ohCJ4k/4tDj2P9xp5BJgpszZVbFOIOspqELmrdg7HDFVQ==
X-Received: by 2002:adf:e10a:0:b0:22e:3e36:d7ab with SMTP id
 t10-20020adfe10a000000b0022e3e36d7abmr5711553wrz.232.1664888499724; 
 Tue, 04 Oct 2022 06:01:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a5d5342000000b00228692033dcsm12196773wrv.91.2022.10.04.06.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F1F41FFB8;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 01/54] scripts/ci/setup: ninja missing from build-environment
Date: Tue,  4 Oct 2022 14:00:45 +0100
Message-Id: <20221004130138.2299307-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

ninja-build is missing from the RHEL environment, so a system prepared
with that script would still fail to compile QEMU.
Tested on a Fedora 36

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220922135516.33627-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-2-alex.bennee@linaro.org>

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 232525b91d..b5acaf9118 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -153,6 +153,7 @@
           - make
           - mesa-libEGL-devel
           - nettle-devel
+          - ninja-build
           - nmap-ncat
           - perl-Test-Harness
           - pixman-devel
-- 
2.34.1


