Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F79C6B4FC2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:06:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5n-0001xJ-B6; Fri, 10 Mar 2023 13:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5h-0001tt-5p
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0004cD-IW
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id bw19so5816759wrb.13
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bn50gv6+vgVZ0F3fb1KsYuTmPLPUFUQUMHscQdDu3m4=;
 b=idLLgcnrHDR4O8+EG+dbhUUxCYd6JWlLB0KFeCYR5u86R7obm1RfrR6CenyKjf/Pdk
 hJxHLBnAewUnYUtzRaMkvnWSulttDZDIOBjuaaIQAbdK+DRrrQTdBphJIKZwI7wRh3pl
 Izmkybt6i8UE6Yw6yKSEEC+R7Yx+wC1/aaNtJgQbTxPJsnDHYwyHDjweirVYW8nYDrwL
 46jUbvd0s8DCRJJlJspguJCerbrQ3dJUleqaw3F1lt0oD7+WF7xM689PiIbzRm8OY/Po
 qCgOP4eqTjaaeHSk8hc8BuUUId6fcDis/sgxN0nByvDcm4/Kqnlx0VkXGnzTlC4GuIzK
 Ga0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bn50gv6+vgVZ0F3fb1KsYuTmPLPUFUQUMHscQdDu3m4=;
 b=E2xlrqZNEwHeH+SCVZSxLgpXuhO92k6WDIL2DYH37RIo3q7pBVDIGaWJhnaDZtl5wl
 /5L8VSM+Bpz7M0Xlt4lLTRVNGJmRzwn3usgCkSyni+2+jMR96S8OwlWFlRPgO/ZJTU4W
 sYwTeO6SWeq3rKa74+1En5JMaxFu0+Xq4XVUtVB1XJgyfwBg0B+dkju/yi+DBON+tsF/
 G4jaKmVuvbFK7DEQm/XoWHCE0yFk9xPhNkyX4u1MUkfz1Qkx9halhy1R44e9Bh/8YjcN
 sayH7imQqwCuNrKCkyiIq056HahAraRWKH54L+7tkIZ0Q+tf+rfyzSn/Y9m2Gz0tIITb
 E+Qg==
X-Gm-Message-State: AO0yUKU7CigiYAJYfRNpNI5e+W1iaG2WyueGIZ6ZvhJbVeZUaFLgrshD
 Uh9NfAJsLSsfAtYUjF6Vc6rHWA==
X-Google-Smtp-Source: AK7set+Mv5S3R7AgJ/qTLFj+cMhKpeLUz8vCpk4K6oTK+IkrW4Fq7b/oKeAvh2jHKCmzB3xtknANlA==
X-Received: by 2002:adf:fe83:0:b0:2c7:d7c:7d0 with SMTP id
 l3-20020adffe83000000b002c70d7c07d0mr2221758wrr.22.1678471416495; 
 Fri, 10 Mar 2023 10:03:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a056000010b00b002c71b4d476asm375580wrx.106.2023.03.10.10.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D368C1FFB8;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Vikram Garhwal <vikram.garhwal@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Tong Ho <tong.ho@xilinx.com>
Subject: [PATCH v2 10/10] contrib/gitdm: add group map for AMD
Date: Fri, 10 Mar 2023 18:03:32 +0000
Message-Id: <20230310180332.2274827-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

AMD recently acquired Xilinx and contributors have been transitioning
their emails across.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: Francisco Iglesias <francisco.iglesias@amd.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Cc: Tong Ho <tong.ho@xilinx.com>
---
 contrib/gitdm/domain-map    | 1 -
 contrib/gitdm/group-map-amd | 8 ++++++++
 gitdm.config                | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 contrib/gitdm/group-map-amd

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index ee0804b6ed..79fd65b077 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -50,6 +50,5 @@ virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
 wdc.com         Western Digital
 windriver.com   Wind River
-xilinx.com      Xilinx
 yadro.com       YADRO
 yandex-team.ru  Yandex
diff --git a/contrib/gitdm/group-map-amd b/contrib/gitdm/group-map-amd
new file mode 100644
index 0000000000..bda4239a8a
--- /dev/null
+++ b/contrib/gitdm/group-map-amd
@@ -0,0 +1,8 @@
+# AMD acquired Xilinx and contributors have been slowly updating emails
+
+edgar.iglesias@xilinx.com
+fnu.vikram@xilinx.com
+francisco.iglesias@xilinx.com
+sai.pavan.boddu@xilinx.com
+stefano.stabellini@xilinx.com
+tong.ho@xilinx.com
diff --git a/gitdm.config b/gitdm.config
index 6908ddbd19..c9d961dd23 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -32,6 +32,7 @@ EmailMap contrib/gitdm/domain-map
 #
 
 GroupMap contrib/gitdm/group-map-alibaba Alibaba
+GroupMap contrib/gitdm/group-map-amd AMD
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-facebook Facebook
-- 
2.39.2


