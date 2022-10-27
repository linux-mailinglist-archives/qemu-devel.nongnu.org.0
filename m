Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E70610151
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7tE-0005kO-T6; Thu, 27 Oct 2022 14:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7sC-0005SZ-9Q
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:45:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7s9-0004jf-9r
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:44:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id bk15so3682152wrb.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UM2/sPchh948TxL5qcqzQ2Kv4REO/Oc6KzY1H86hlU=;
 b=vIpuNlYYBvYJUh9tNrDl6DbtWY8m9y0//NwqYHRiqopCUkTD5Uvsj/cCajdmixIsQX
 lZKi9i9mF1BdxQKpzOgpcw8BCAz9Ah+/iWH/oSEKxnHLLYLmv2ox/u37TqEKvWF/J00o
 9MTY+ZGvbFg/bnCO2wBstH5xT+Hgxt1/aAOsif984cYvWo3AdUaldI35GJ+eORxDOFjL
 KopIPFNLEfmggKjHQbTEyHE79FEMp3X9d4x7mByeHSK+J9pOvVzmfwv84gSjkcUmAabe
 Lh1+tF9zTuTf4gEbzzba30KPMPBBrxg71HKXABREUPKSGFx5W/dmso2UCO17JTJzpqwv
 Ji7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UM2/sPchh948TxL5qcqzQ2Kv4REO/Oc6KzY1H86hlU=;
 b=mpZhpQCgd0170mCHRx72+X02XUoyCZpapPi0UziWb9WSKMcyr+mZMKq2U4sHmaTV9z
 m78Qq8UEgkiKkNAH08gHcORE63/FwdynGNpgr3TciDX/j6eXdTJFLXhj3+Zjo/ihafEP
 xwBTe4VS/t2wNrqGR/G8jg0HS8QRmSz13/Fald4HtWdk7ipKdkUYG8uPzhxqLFxC2Gbv
 hD4/i/mPhJqY5+sXRaV+cy2eNnZO74YUPzzSfrtJBR2eeWi94fuGqhGdM1UwaxKgW8v/
 0ZGVFfP6kjAr/lth2Me1UWoA4TO0UoErt6RnIrxotI8tbLrPDhNZvIpVJclsXrsxnjCc
 x9eQ==
X-Gm-Message-State: ACrzQf0aljifMjd0S2MxoI2keH9rorphGo/gRmMpjw+Ky1Ch5LBKXhsp
 jwLOsA0NvoAfLjHq+Iv9qthxZg==
X-Google-Smtp-Source: AMsMyM6Y0Xu3BaTbo5oQ5Ivi+v1t7DwdZ0LjlHBL+IrGHakLgUT+xftCvCJU1qQDKRMjbS1hCCFoSA==
X-Received: by 2002:a5d:648c:0:b0:22e:63be:be09 with SMTP id
 o12-20020a5d648c000000b0022e63bebe09mr32451230wri.159.1666896295564; 
 Thu, 27 Oct 2022 11:44:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003c6b7f5567csm8901439wms.0.2022.10.27.11.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:44:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E60FF1FFC8;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v4 17/30] MAINTAINERS: fix-up for check-tcg Makefile changes
Date: Thu, 27 Oct 2022 19:36:23 +0100
Message-Id: <20221027183637.2772968-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fixes: fc76c56d3f ("tests/tcg: cleanup Makefile inclusions")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f0a6a588e8..3f353b56a7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3729,8 +3729,7 @@ Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
 S: Maintained
-F: tests/tcg/Makefile
-F: tests/tcg/Makefile.include
+F: tests/tcg/Makefile.target
 
 Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
-- 
2.34.1


