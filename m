Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 664574C8898
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:58:02 +0100 (CET)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzGb-0007rQ-G7
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:58:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6J-00037w-1X
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:23 -0500
Received: from [2a00:1450:4864:20::433] (port=42626
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6H-00075b-Ks
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:22 -0500
Received: by mail-wr1-x433.google.com with SMTP id d17so19491056wrc.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u81EJy7XqBdByVSMZLAh8b/eyJK89yLSXUUVQK5TqdE=;
 b=i9FK7mMnSMttA1UOy+ZrBE8E7Dv7hSIR+YAh6aJ/Qy0MEhlcN8N2rik9syB0cRDrI6
 /wFLAtEaBgIhbvR0zcb+KLWjJbVS8QIoTmr6K2OLls2MRuNcfhzgcp9G7ts4ic+BORL8
 8ZmE3NSaAt6EeLLCooJbD5iMxFTJZVwUG/R7/cjJgBWQGsYnYIh3yg+OmV5IoX2JO1LQ
 mh7/NQiwjafQONYS0TfIbIiGYHQ21NxxB8lPZ03uNgL5YXgaKPiZqeeH73k63rse0qYt
 YK43GiG/qjvwoP8c13L51TF9tokM5cWTadELLH1h9NGzsmw4kUEWBaynOPvjfzQ9HJxf
 6XzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u81EJy7XqBdByVSMZLAh8b/eyJK89yLSXUUVQK5TqdE=;
 b=l1Mnv5gucqMpgd2Ui1QS6jUh7xd9xiqbfhBnUQn66wGM58SDYmzh8fy7zZPPaur5RA
 ac9zXrNYgvk6lluI2jUAqh20/nHcl24iGGSvNDBK9xA9b6r2XdHaBkbluxBGLed4ijTP
 +IeWnlQWk0ZRk9hcsmTUf+RDda3zhCV7MAXGFB4wQB0Uv8bklooAMHuDulNBWdDod7HF
 Ik605x4T8J6p8xdSbqAa/XorEJvSGFUSU5C/5tkcwZHip8Dd984EOC+Qtya3H6Rp7f7y
 9vmtiqauH3VCMBOSlrFHt7+lbcVr7T9q+cbzAw6G9nTehmyjZ7o2ox1etdsHWQ2Qf3yV
 koJA==
X-Gm-Message-State: AOAM530wzNNl2PJ0MWnxwJtbOjMCfQkpmFrIJGENfXYisdsVlEkPsIUN
 fUcchTHDpg69XCpM1s3W6sclaA==
X-Google-Smtp-Source: ABdhPJxH3HTkrYdTYTy6ExEC+qsQjxmgOZ3NPm911EwRgkNRpFVImSlbESpC0XcJ/gICKkDh70okqg==
X-Received: by 2002:adf:f04f:0:b0:1ef:7e8b:2c34 with SMTP id
 t15-20020adff04f000000b001ef7e8b2c34mr12198098wro.325.1646128040362; 
 Tue, 01 Mar 2022 01:47:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b0038140136ff6sm2636310wmc.5.2022.03.01.01.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 797CF1FFBA;
 Tue,  1 Mar 2022 09:47:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/18] tests/docker: add NOUSER for alpine image
Date: Tue,  1 Mar 2022 09:46:59 +0000
Message-Id: <20220301094715.550871-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alpine image doesn't have a standard useradd binary so disable
this convenience feature for it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-3-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 0ec59b2193..286f0ac5b5 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
 docker-image-debian10: NOUSER=1
 docker-image-debian11: NOUSER=1
 
+# alpine has no adduser
+docker-image-alpine: NOUSER=1
+
 #
 # The build rule for hexagon-cross is special in so far for most of
 # the time we don't want to build it. While dockers caching does avoid
-- 
2.30.2


