Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7F5F43F3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:11:14 +0200 (CEST)
Received: from localhost ([::1]:38062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhhY-0008RN-G2
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYN-0008FK-T0
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:51 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYL-0007MZ-Ne
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:43 -0400
Received: by mail-wr1-x434.google.com with SMTP id w18so12479967wro.7
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gQqgg5f/egxvi99aS1qEctCqnWlivYyyMVbQtjrj3sg=;
 b=ztXyn+25rguDT4HCMDiCINnzU9mP4vm8KjM6cfB4By2ihxDDYL3XKd0D59/b3RVW5N
 ijVdz5zUy3r2ZSmt4aeBDJULs18IE8Qer3i4kQVf6HnhGh1Xg2w8dzT2KAH/MMwAnCT4
 aJtqYXKnYvP5MeHDT5ILPa6m/21hgaJudVwwVzNtaCzkNVpACwyQ4pHz/V3rL1LrlLQq
 lvPg+uN7N0mZZ33Otm3YXD9RTDLnwumzmpYxSzAcBuw0rOFRDh5FAuUn4bkKZftb6dEQ
 lXj+VX17P9JkF2fqymi9Y4D8661KhV7PW0QJ2dsSypL9IDaKTqjVx6KsvkzKfnpMHnVk
 AotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gQqgg5f/egxvi99aS1qEctCqnWlivYyyMVbQtjrj3sg=;
 b=fSjbznjEnBzEO54e8Y1pqmTdoht4ddb0z4c39iLQ3OsxzwgZFhEc6NYIJXF24FdNiF
 GZYZAqf4yLFEfcPpYPRxOBinALPGwWAUqmYgpCLNsEndsm8S1qQm77At2KEXILSC08a0
 85Ta38W8ONYq//L1imOxVH8qfXIIsdrKM9PRaYja0rKix3nX0p+ocvO+Ii4VWV7L8Juw
 gASrFXCxAE2qRp+K2wAS0XNJys4JM3iukuAL4IbK8tohfqqHE0IR9mfMPyhorsKOLfjN
 3lYV1wzh+8Y9NGkqvqAwktWYmxBoHYU2l/rPu1jUN2bkqU7oz5DMtutPMeqhrbckdvFm
 lvPQ==
X-Gm-Message-State: ACrzQf2g+wdvSuYl2mz1fKPTvPeZ4z7cdxlv2LQFKT8Uvq7VgpPxi7cK
 XMjjZv4MRR86B86A8anXsUtYcg==
X-Google-Smtp-Source: AMsMyM50vQvtFTa35KXHD4gNy5kJ+O50u2vT7zjStn/jouNyMerGIRA92aHxO/w9WXNauQh1neMmxQ==
X-Received: by 2002:a5d:4e09:0:b0:22e:3a03:a860 with SMTP id
 p9-20020a5d4e09000000b0022e3a03a860mr6853462wrt.289.1664888500102; 
 Tue, 04 Oct 2022 06:01:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a056000022900b0022b315b4649sm11998436wrz.26.2022.10.04.06.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 866871FFBA;
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
Subject: [PULL 02/54] scripts/ci/setup: Fix libxen requirements
Date: Tue,  4 Oct 2022 14:00:46 +0100
Message-Id: <20221004130138.2299307-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Message-Id: <20220929114231.583801-3-alex.bennee@linaro.org>

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


