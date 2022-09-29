Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CED15EF86D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 17:13:20 +0200 (CEST)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odvDz-0003lW-C7
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 11:13:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD0-0007TK-Mq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:06 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCs-0004Ma-O0
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso3084417wmk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=mRFn/+xNvAxYQS5AsEN4ILDp7otuD2FLSBq+XpgS+Ok=;
 b=J4lNCUh2o4rOWW6W5x/C9jwEOCIqE0LG7YNkEAjsX6kPE43D9Np/9CXbrDMqJOQZfR
 1RpTtD2AouHHw86DxfSr17WTOebAFG3eK33vKuPBYTwV8w/vRcZK9lElcaSeaZwF12YL
 v6UFww+xhii1PX9GfaFtJtkFVIxbsOo9Hka+Rn7lGPmU/IUbCWkdX0cr00xKYU2eL/O4
 vQvbD3X/PITHkWTBXZx29vDEkQ+MZjw5u13ECmK8I4rjMPq8NesVdfX1LX0tJwg91Lbn
 ggRzmF9cykTOWoBSEe7IoKs7AqFZSo+blp93pcZ3JEiNZIqZeeRQhb4KOe48N/4L4nwY
 yjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=mRFn/+xNvAxYQS5AsEN4ILDp7otuD2FLSBq+XpgS+Ok=;
 b=vhzFBTAtHbIa4ZHcA1H9pqdL7WgVS7Tnv5jYBic1lDeAjpe9bNCKbHBJAuVvWh3Ksl
 3etcqRIfm8ks3tGLitBfMcL8bFoQ+LaoOOZNjTWIxxoKE629rSxa3k3rp0sNxemWbv2t
 zxH1jO7vRjHHbtbg9l0PJh+Q6VOBWMRLCIiOJOA60VF3AScYe667Jl1lrdD1FgLhJv9l
 5XCil8kNmg3HL+kRJmAm2RBQOJJ6xGl527j6BvGGsWNfHiR3fOkY/h7YHCDebvpkMo4+
 yFn0PEpxB3P7sBid1Zi2X/6jX0H3fYAhw6xJ11c+9iBus9LSzi4UOP1L91abkzyPKJQu
 ZXuw==
X-Gm-Message-State: ACrzQf0+QUoWB2Uk5VRsWuJe7mMPm+hA/kZA867sxeUoFFB44wF1NcDZ
 21CEhUA3URxA+KPdGy3R7BAo7g==
X-Google-Smtp-Source: AMsMyM7K7BWsMRMyHXbenAfyfPG3YVmkfIwdiIKK0xw2gcWG4DveZw2wLZ4Soiowcv+jR7r2C1aztA==
X-Received: by 2002:a7b:ca46:0:b0:3b4:7ff1:4fcc with SMTP id
 m6-20020a7bca46000000b003b47ff14fccmr10730275wml.47.1664452795880; 
 Thu, 29 Sep 2022 04:59:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003b476cabf1csm5781042wms.26.2022.09.29.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 456221FFC0;
 Thu, 29 Sep 2022 12:42:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH  v1 51/51] contrib/gitdm: add China Telecom to the domain map
Date: Thu, 29 Sep 2022 12:42:31 +0100
Message-Id: <20220929114231.583801-52-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Message-Id: <20220926134609.3301945-8-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 434ef53afc..3727918641 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -10,6 +10,7 @@ bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
 crudebyte.com   Crudebyte
+chinatelecom.cn China Telecom
 eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
-- 
2.34.1


