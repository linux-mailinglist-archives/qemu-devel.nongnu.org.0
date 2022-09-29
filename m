Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5F5EF5DF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 14:58:27 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odt7S-0006xB-Q7
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 08:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw6-0004Na-2D
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:39 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odrw3-0001CC-DZ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:42:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 c192-20020a1c35c9000000b003b51339d350so3048814wma.3
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wHR3jK6kXQ31QwdzvCyerN1s1Kpqv3ZTDSaBoALKKnM=;
 b=j7aV+1R7+2myKSxXMopBfSeXoWJhGN5fjOD8dcJXJp1jikX7pXL1HY6J/K+nUVtDJ5
 BWXQ/t0pkjlLcRIkkTugZ71Ir4eVbeG3dPQTVT3wWYyqNyw3VWR4EyF0Kh4IZNFmXcXV
 YCaQ/Cm6TVu9r82FTtSOqPvW/WFVSnHy2HKfxKtbETucl5Uls1Sf7OwafTlljbxx0wY7
 fm9HKjKdEaCt1jd3twReEmf0VOUnjixM5Nw0CTFWj1Q2k6Zy0vOENdXtxo8mUrCgSxjI
 4g9u4hII4W8gO4Q4AtqO2lKZECHwiwTwlwGiKGhfibCNs712ybdWrcaKYC+pbCojlW7Z
 a/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wHR3jK6kXQ31QwdzvCyerN1s1Kpqv3ZTDSaBoALKKnM=;
 b=S1LC5+ZZWFW/siyRtQqqdk3Xaj5YYv8zs90Z9qE7rUY4OASOdKiyLW6F3or71xTDwn
 SPeVj35dLIf63glQRh7flIzduTI3zEnzS1LCAFOjc+JVTpJ+DPS+jFcfadsisXX1j5ZP
 3O6vf7N86RcmyHibhTf8GmRfALtqXlhaAzI4T0u+b/HfNF7KoRLIPr3GyFZqB0teHlyb
 YH1ecKtZEY+77tH+1H2lxyS7MGW7eBLNz9re/KCwuxLI5A6tbFrmLMs/iuEQad88Ae62
 O/CFZASKZkwtS78Yg0FXpynAVOmQDVglMdSgRkZFl/aQL4LiRtLQ5IDcuWfb1go7BGzP
 Q02w==
X-Gm-Message-State: ACrzQf1qBeeKZVIc+KS7qs9P8JXnHPKq02SqCcb6SIvRDBS5ufQF2L54
 I2A7DgoBIoxdF/JXZuBGdK3RLA==
X-Google-Smtp-Source: AMsMyM4kV9VUFDxMM2RNN2WrmvpNBjDb814e7HRKVctc7ThXwK/Q8bIoiK8CtrVtcPXw/m3dECtgvg==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id
 g2-20020a7bc4c2000000b003b4fdc46df9mr1939967wmk.123.1664451753532; 
 Thu, 29 Sep 2022 04:42:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a056000004100b00228dbf15072sm1917941wrx.62.2022.09.29.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:42:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6A2B51FFBA;
 Thu, 29 Sep 2022 12:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 02/51] scripts/ci/setup: Fix libxen requirements
Date: Thu, 29 Sep 2022 12:41:42 +0100
Message-Id: <20220929114231.583801-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

XEN hypervisor is only available in ARM and x86, but the yaml only
checked if the architecture is different from s390x, changed it to
a more accurate test.
Tested this change on a Ubuntu 20.04 ppc64le.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220922135516.33627-3-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index b5acaf9118..49292715d3 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -97,7 +97,7 @@
         state: present
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['architecture'] != 's390x'
+        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
 
     - name: Install basic packages to build QEMU on Ubuntu 20.04
       package:
-- 
2.34.1


