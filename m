Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA35F440B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:18:19 +0200 (CEST)
Received: from localhost ([::1]:58886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofhoQ-0007db-Uw
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYR-0008FY-Kk
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:52 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhYO-0007Mz-1a
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:01:46 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bu30so1323412wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=VFN4sW6keUVYNwvkm2pyXUk12EUjNrkHvkCTvvRa17I=;
 b=bJdj78RkWeWqZ//rT4ow5sWgFnUBQIfgKt5dsxgNA8nTQ712iPntEXsNwtU1A7GrfC
 P+/SWvPBEyypIoGJyUqngzEKdvyFL8cxui6F8EHn3e4uajKh1qfnT+vI9nsKbqiAIdm/
 HV0wkJTZdkZRkUWn032qEAL3lH0uwbYQel/hjOON1O2vsujauETB5OhvGJQ9YcYGH8k4
 6Ao7etU2WlxlU0n+41qYR8mhOyJlaDaJCzHCxd3NCX3tag090bpTtdj9A+DW88O+mK77
 1S/ZEqqhthXj2WLETEZ4j8mbMp2Z25xm6Gs/F99LP1pelmuUaW8WuVwmCdOXDn1NOQ3L
 BSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VFN4sW6keUVYNwvkm2pyXUk12EUjNrkHvkCTvvRa17I=;
 b=GBsx+t16/ertnozCDXGdisdMDflpde8RIxC/8wcMp1zskPV3RX38L4Ssua3gCp6Lek
 57IIo0eYi6kP4cHhiO3xQeeGUwDaLtz+chw+kOc+8DKI2dCSA4D4RgxEYDLExJzqFcuw
 2lGhIMrDjNhA1l3O9xCeUgLglygmDQTR21cT02foL2GnyzQpbIAa85c0rHwgRDeof4Yp
 j5Wa8xWESTNLjSVrQoYyXT6oBT0H4dsyqiLxUeLTfXm4xRwPyRifl7KXC19zsJePKw0E
 +Nft84jMFoUbw9YbUUkgkgmsbBrEgxd2+GNOWhj4vVPFlAqn42YcKT+MywvxCZ+RLD6I
 Caog==
X-Gm-Message-State: ACrzQf3mb0LGtic5HQ9NDZSgXKgnXJS8BSRo9qqSiQiW1PE5dMkaM4mF
 wb3+xEZ3NU8jI31Vmva+UlK7w8i5XTawqw==
X-Google-Smtp-Source: AMsMyM5QIEUU+Uyjqer3vueIvS/uIbhcC19TL8weZo8QkjzNc/D95ZEl+Xf3iW9dq89EAf2bD3li4g==
X-Received: by 2002:adf:dbc5:0:b0:22c:c605:3b81 with SMTP id
 e5-20020adfdbc5000000b0022cc6053b81mr15993686wrj.218.1664888502733; 
 Tue, 04 Oct 2022 06:01:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k25-20020adfd239000000b0022af865810esm12114845wrh.75.2022.10.04.06.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:01:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B74AF1FFBC;
 Tue,  4 Oct 2022 14:01:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 04/54] tests/docker: run script use realpath instead of readlink
Date: Tue,  4 Oct 2022 14:00:48 +0100
Message-Id: <20221004130138.2299307-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

The alpine docker image only comes with busybox, which doesn't have the
'-e' option on its readlink, so change it to 'realpath' to avoid that
problem.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20220922135516.33627-5-lucas.araujo@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220929114231.583801-5-alex.bennee@linaro.org>

diff --git a/tests/docker/run b/tests/docker/run
index 421393046b..9eb96129da 100755
--- a/tests/docker/run
+++ b/tests/docker/run
@@ -15,7 +15,7 @@ if test -n "$V"; then
     set -x
 fi
 
-BASE="$(dirname $(readlink -e $0))"
+BASE="$(dirname $(realpath $0))"
 
 # Prepare the environment
 export PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
-- 
2.34.1


