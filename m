Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718E56B4FBB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5l-0001wK-HK; Fri, 10 Mar 2023 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0001tL-Vt
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:39 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5d-0004bw-4n
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:38 -0500
Received: by mail-wr1-x434.google.com with SMTP id g3so5845957wri.6
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bx6TPTTNCRJLDvJsFAvDdd+22wUA1I4Yr7f+owZFKdM=;
 b=b4biTcxNdUADgyazoUwwGvHxIGjaul/IXryrP2be6QfMh2OJxwMcODqxCo6pQb7NRz
 eOgIlczhMqDvG8aWIA7nrpa027mjsGNSMyvrbntzea+3eYnNlnphXyIEqo42xjVSitEl
 xwFE+Ot57HFvfQ+D0I6A5rKJM+cIQGRSERu/ZSBn7PK45Fv9n4X/DJ9iaXE9sKVL3ULa
 UsH/oTJyOOILATnchLQunRvOAuFm3sxgG8bNY/IKGQ/khUoysJEhIc2utajxIZ5d92ke
 LA3FX0vjkHrfsjjB9xd50TbqWurxLryqaVrKa/1YGCkc3dQSN0HD0Lmnj7IgQhjm6ccL
 MNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bx6TPTTNCRJLDvJsFAvDdd+22wUA1I4Yr7f+owZFKdM=;
 b=Av58UzEp6xDCSBqTwaKstIWCVoBYdWfiriy084WB14ZCGk2iE3Ius2jxx8xoLDDauI
 M2Pe7z1L35q+eeXE2aif2CpjyiEBiOUf0ckrTzJyNjY7DUOdSUAogYAJcgQdbd5EiKeL
 GMSmNPfA4OAV28Huq+VqRwpfOckQ6JNZVOsAl9EmB7zTcxLoqRxo6KdONdqw+FY5ds49
 bR29jXN9SHjnE0nWEZoe/3qwet/OKFdcnqpB40UcJueeEEj7E374X2SAgRR4ZHkUJwQ0
 HOOU2UF1WmYSrqaUhg0LycaAWOTqOa0IqpQWnIhcBQXHynrZyz+dBB/MKRcSHU/YQboC
 yonw==
X-Gm-Message-State: AO0yUKWbw8ETIuckeH5zVMTewAXF3crcsN00F4SYXuQF7QKSdQvpj/zp
 HARkvJE8OpCh+EDZ2cFnTN8afNzUKqKxluSAG3o=
X-Google-Smtp-Source: AK7set+eS6Yr9Sdt2jdsFQ9G/v5CB4tIzVihx8nxVI+FMR3cfEu6LPWjuO0dpvFDTFCh3kjCEW21qw==
X-Received: by 2002:a05:6000:48:b0:2c8:f1fc:d84a with SMTP id
 k8-20020a056000004800b002c8f1fcd84amr18590844wrx.16.1678471415858; 
 Fri, 10 Mar 2023 10:03:35 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a1cf203000000b003e7f1086660sm529561wmc.15.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 598A21FFBD;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>
Subject: [PATCH v2 05/10] contrib/gitdm: Add SYRMIA to the domain map
Date: Fri, 10 Mar 2023 18:03:27 +0000
Message-Id: <20230310180332.2274827-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The company website lists QEMU amongst the things they work on so I
assume these are corporate contributions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index bd989d065c..570e63c9e1 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -40,6 +40,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      SYRMIA
 ventanamicro.com Ventana Micro Systems
 virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
-- 
2.39.2


