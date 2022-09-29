Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7185EF73D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:12:30 +0200 (CEST)
Received: from localhost ([::1]:33542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduH3-0008I9-7D
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3O-0000ZN-U5
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3I-0002P0-S3
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:10 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z13-20020a7bc7cd000000b003b5054c6f9bso3068722wmk.2
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=eojMqPAhRFgb7PwX6Obti6a+1AdWRxyR2s96Roci+l4=;
 b=LHdiFleEfPn44/62o7UYiYc+XNMT03HxPSOrkuwQogbRSpWfq3lXqouwKmz6xxFr8H
 cn7XhrE9m5XxmNQiEyKcoZeAo6A9tnF+uyr3I/Inj3Ip9m3OqS1jpSq3OO2aWaEoGEXT
 3fnSzrwZeODg7FGqthtpvFxESNySUb8yXouzE47LAldfd/sWj9/+WOGBkHgGSv6arXdn
 zRGnkXuq8WSqUAdb9Hv+UqJqEZyNpv0v+Vrr4kj6t31SnhVOF9AYdhgkHubz5IJgIxrS
 KglSOCr/FqPjBMuGchOzAPaIsYAjtXS74iL9bgoxsisR8swbaND9iVTk7buw/P6eANMU
 lnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=eojMqPAhRFgb7PwX6Obti6a+1AdWRxyR2s96Roci+l4=;
 b=dSaQ/+teeR7x+7bQkF59RgWzkyCewZzS+ODeUhqnO3nOu/6snX6pOghWIHoE8T7a+Z
 yvHUUyuU1UJu00zl9o6G9er26hYoEbIjWGe2cfjC5/KHUTaH4p5+ZGM1iC7QcRP4uu2/
 AA8t425hwEnI70RMIpzYh1ZLglIAj0laglVp0zZ+SZRWk5+8NV1xmxCLgdalQ+2gpFDY
 R64eRMsmvFKAe76kPTRzgfa1Xn8BNMR7sjsbvGqKrAD8B8M8TtJDatOWHfDaphkeAAsA
 VudX6yID2i/+KKG1QajyhDH2vAHmd13mGSbVR+sVHy8EHSp3nLsXXIMhhpOpsqYG6opM
 9OBQ==
X-Gm-Message-State: ACrzQf0RO69nrlwvP3CRI7mHrIMU25kqqpUk/mehWrx/5GaVHhKeSJri
 RkmeDeTGgWXVkSui7+SN0k91Vg==
X-Google-Smtp-Source: AMsMyM7nWuMocikExqO+ksrW/CGyeOXrlOmjSkQyg/6uJouAZPFT7lFwmIv4AbQ/fpZzB/R2JEKL9A==
X-Received: by 2002:a7b:c4c2:0:b0:3b4:fdc4:6df9 with SMTP id
 g2-20020a7bc4c2000000b003b4fdc46df9mr1962746wmk.123.1664452199587; 
 Thu, 29 Sep 2022 04:49:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c1c8300b003b497138093sm3965447wms.47.2022.09.29.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D88A21FFE3;
 Thu, 29 Sep 2022 12:42:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Subject: [PATCH  v1 47/51] contrib/gitdm: add mapping for Loongson Technology
Date: Thu, 29 Sep 2022 12:42:27 +0100
Message-Id: <20220929114231.583801-48-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Please confirm you are happy with this mapping.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Song Gao <gaosong@loongson.cn>
Message-Id: <20220926134609.3301945-3-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 2800d9f986..434ef53afc 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -19,6 +19,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+loongson.cn     Loongson Technology
 lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
-- 
2.34.1


