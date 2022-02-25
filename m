Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73444C4CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:39:22 +0100 (CET)
Received: from localhost ([::1]:33184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeYr-0000rL-PC
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:39:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGk-0003mZ-FT
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:38 -0500
Received: from [2a00:1450:4864:20::62b] (port=44767
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeGf-0002L0-TX
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:20:38 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p14so12121403ejf.11
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QXNfbz2XZ5OFaFMg/qr31EDMsEF38U9zMgzcWghwuX0=;
 b=H/sJvpOL/kAoUA7Zl1wwzIXkuE783dJyMDoxbnrowZ327VzL0a4HDj8tofCbzc/9vS
 MbzBhZGJDL/HtwT6Xnj9lWi2H5Wl6wP8VbOyIj3y9GkhFJ5uNZi+mQSwgj2lrGdSCN1Z
 dlxGIli3kk/SZ0Kk45FM9q2WDbklExzLC22uRLCel47tNvHBxtyadYjwznrPVicImoIh
 UJpJi5E+m/oTkPkFVn+QMGxGuc4wCczzKXwoi6D4f8YSA0V25yL09+voYoNM6hspP8B9
 QssG5QHGprHrqM94v+uSe4/RQvpV2q9b2lgJYRlRZtyiOqdrenrhbrkHz55SxZRk3R3e
 gomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QXNfbz2XZ5OFaFMg/qr31EDMsEF38U9zMgzcWghwuX0=;
 b=NBTdp4H4z1Z4PDzEtbvMB4eCPdBnMQ2/o+fy6NTQt0tXp+e/0auq65llKqBvL5dJtU
 CzS+jSjom7v5vZv/8+MzgOXOI8lpxuAnUDADphBSPNJsrPVTUSSHwIFQneg7vs4/GP+M
 5OUzbRzuHDJd+7gEXc7wLAZGY4F1GtUTZVazhJqMikr/3Wtw1Qxt316xGvvPs3YcWNfN
 ygFNFu6On79DFiaQCH5BBMPWuDd/EA0pK5qZPR0UCphOVyI360UI0xKjUCKeQPEF7+vH
 j3dfCMhY6u3zm6Q6gtpZVbjqKW4RJknj913kpAfHLn/RT07ojZ/9iQDX1fkxgNcybHvb
 dNrg==
X-Gm-Message-State: AOAM5334oeWHonfCNMgNtNDgY9FoXwtmJqnld+iKOaiP0aF0LPrIiPxA
 lUt1vD8sk/sLUF3YRuSGoJhh/Q==
X-Google-Smtp-Source: ABdhPJxbr3sF0T4VYNpge4Im8REsXi55SiPWSZ94wNVfkMW/lkGk0bB+slcFiUIegww2hdqWUGBuQg==
X-Received: by 2002:a17:906:181a:b0:6d0:ebf5:c064 with SMTP id
 v26-20020a170906181a00b006d0ebf5c064mr6662884eje.82.1645809625489; 
 Fri, 25 Feb 2022 09:20:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402231500b0041327b58030sm1669973eda.2.2022.02.25.09.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2ADCF1FFBA;
 Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 02/18] tests/docker: add NOUSER for alpine image
Date: Fri, 25 Feb 2022 17:20:05 +0000
Message-Id: <20220225172021.3493923-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm@nongnu.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alpine image doesn't have a standard useradd binary so disable
this convenience feature for it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220211160309.335014-3-alex.bennee@linaro.org>
---
 tests/docker/Makefile.include | 3 +++
 1 file changed, 3 insertions(+)

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


