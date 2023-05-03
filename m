Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70D6F5466
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:17:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Xn-0004Gx-BZ; Wed, 03 May 2023 05:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xh-0003sq-Vk
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pu8Xa-0005rm-10
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:12:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so31804195e9.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683105167; x=1685697167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BveVcekrEqMuGdceynK3ACbjL1BznGVXqW0kxg4Zi9U=;
 b=vXnuXQRgnYEmKu+qKU0G4Wqp4CCWuMj5jzcf1wf/4C7yafgLFJIn/idv1RaAj4U0jv
 nmBhIkNOPrkTvMSBUx9hOkIC3kaP3UboBgvXg6IMxqI1pjhLSC5FhEd2A7YrHYNiTfaO
 1T5Hx3auDaHMMvGtm5w14Ye5lPoqPoTg8DrFssTW1GZ6gwVKxxWKXDa6J3x0/Ojx+/VQ
 yBC8IHYFtt/uL27IO9U8FFPOi/ZM5djsn2EO4vaSJkZXALKyTBhZqJBR4CvlKgDjmnEf
 RIMnlp9X1uwrM5ojHyy2+u5mdmTIzPdqKkH+BImbMvApZDvkZ3iUbLK83ghngRdnGeZV
 p+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105167; x=1685697167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BveVcekrEqMuGdceynK3ACbjL1BznGVXqW0kxg4Zi9U=;
 b=H/OZhgIpImSf77whl+MlN0oaKEU9GnGBVlXNBBFjE0Bt0dRKOZHvdCRQLWS5fnal+7
 uaTvKUf4UN+950or6XoL7tehJYBFaHc1botTnu8gM+eESTkWgSYNxV7yqFgdOzXzp8Lr
 bYLhTlE++m9GgRv7aULafXsHscCp1zO5LsE/SX4x3qIy0WnLjE41UJlLeR+52AQwK9Zv
 j67dJbwtO+F5yJ0RTYwk/aQCkPV6/RXalgz7Q24NGrAu0v3Cfad5mc/RwQIblCQ5blbb
 aBcRUAr/Lc2cSVME/KMS4PcSRl2csHNBNJ2fDmIgkfQJfbDjthr0/yDXZ3mfYNixOEa3
 QAzQ==
X-Gm-Message-State: AC+VfDy3Jzi6M7jnoIgKhGC4zGZbAx+kHiCF/88Fw5vqrwrYUEBlQOXH
 Ls4/LWAbsffM0qOLXuQV2YdHAg==
X-Google-Smtp-Source: ACHHUZ5uElxBa43O7jhk4rXuOoFdlNXHk1SZgTHH6NbNrwCJhp36C9E/BZDmZYHjHUwZCz/8SRB70g==
X-Received: by 2002:a05:600c:22d2:b0:3f2:549b:3ede with SMTP id
 18-20020a05600c22d200b003f2549b3edemr13913621wmg.5.1683105167512; 
 Wed, 03 May 2023 02:12:47 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 18-20020a05600c229200b003f17a00c214sm1253060wmf.16.2023.05.03.02.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 701271FFBE;
 Wed,  3 May 2023 10:12:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/22] scripts/ci: add gitlab-runner to kvm group
Date: Wed,  3 May 2023 10:12:26 +0100
Message-Id: <20230503091244.1450613-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

One of the main reasons to have custom runners it so we can run KVM
tests. Enable the "kvm" additional group so we can access the feature
on the kernel.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1a1b270ff2..7bdafab511 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -26,6 +26,7 @@
       user:
         user: gitlab-runner
         group: gitlab-runner
+        groups: kvm
         comment: GitLab Runner
         home: /home/gitlab-runner
         shell: /bin/bash
-- 
2.39.2


