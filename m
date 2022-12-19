Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E2650BF6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:42:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7K-0008DT-VA; Mon, 19 Dec 2022 07:19:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0008B2-5H
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F6z-0006UB-RH
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id o15so6257958wmr.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y/iXkDyojGxfC9YEHph/HdwIw4RPttQ8f2qHdpm7iAw=;
 b=a0S9beXi0WyVz0tkWImR6B3akYBECNE2tavtPiDBkRNO+OuSJ3blDbexc829y4sijx
 8sS07eKJEglH11jbY1iYxsGSqsEScwpTMKrvsSzYe4BpB21ct5Bz+2+L6BtAnffxQ2CE
 TkrfX6fK95wSBNWE6DwZz8WvuGjkTAjtk5pn0xAPfxMnnp8/29IobDaOeNOZsESdYsNk
 p7GNMDMsvJKADHheJgDAD6cYXopPzCMeEMIt180uUzgMnvt7hv+la7jTxmOv4lCN9/5N
 KZLTkqVp8Dne8pphlwSBnmVy8J+gF3wZ4U2i17owV5UgnJPyLJ1FjkwsVGKwHmH5i858
 7Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y/iXkDyojGxfC9YEHph/HdwIw4RPttQ8f2qHdpm7iAw=;
 b=Tcvm9DSyevbBk4NEWQW/jzRFPPZ6TDbpysLaLI3cds0+W+Q8ynvIMW59ZFFYjoLg8l
 Y7F06rBeywZxhL1VIdjdzUA70+B4kEQ/FmLnyO8HrKIGUTTJcs1yBNM4nalarcAIEbe2
 YvZi8izBEqcWXolzmjYePgzzSM5DutiIWtRB8AkTMo77QduJ7QcMWZczgyzTjgofBV+f
 wdr1fPas5IV6/aexAWT3BrW1ukDkiseUu27hwAuiUnD8E6Fwhgc3YRmQnXjGASXuNDqY
 7OyV9eyUYsY0qMGGEfTx+4wBeZPoWkB0y0Q//8Mx7SP/at0PxJkBvH9NVx9W/fxLyRvr
 vRhQ==
X-Gm-Message-State: ANoB5pkELuM1RHwr1fICRR01yUPuk/nWHoTIET5Drv7bBTZJ1LMWH3w4
 x5K65bZVXerLwra8tENQLpMiCQ==
X-Google-Smtp-Source: AA0mqf7kCJS2QGv+sNg+Lv4tY9anpF8D4b7q9E/90V8Ox62Z34Sb4ykGHPIZqG0c4J6VI+vVGSdPcQ==
X-Received: by 2002:a05:600c:3d92:b0:3cf:75a8:ecf4 with SMTP id
 bi18-20020a05600c3d9200b003cf75a8ecf4mr31897667wmb.24.1671452356142; 
 Mon, 19 Dec 2022 04:19:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b47-20020a05600c4aaf00b003b4fe03c881sm18199571wmp.48.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8DC51FFBA;
 Mon, 19 Dec 2022 12:19:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Atish Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH 02/11] contrib/gitdm: Add Rivos Inc to the domain map
Date: Mon, 19 Dec 2022 12:19:05 +0000
Message-Id: <20221219121914.851488-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
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

Whatever they are up to a number of people for the company are
contributing to QEMU so lets group them together.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Dao Lu <daolu@rivosinc.com>
Cc: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 6f3a24b399..da51c44ccb 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -32,6 +32,7 @@ oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
+rivosinc.com    Rivos Inc
 rt-rk.com       RT-RK
 samsung.com     Samsung
 siemens.com     Siemens
-- 
2.34.1


