Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D1D6B4BCF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf8K-0006ZG-7y; Fri, 10 Mar 2023 10:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7l-0006Ux-5E
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:41 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004KM-TO
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id p26so3694026wmc.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMY8dvY13Pqnug8MKfJU9bIF1ZzoxssF8oKzAVGn1D4=;
 b=HaAX5VFa/dNrt+wlAEaQqesc7dGqvPMcaLuAJQJ0OBjlMnytRQAD34drbGGohvjxLY
 GzxyWpV8T75f2bV4tNiwgS78CCQtOsVxD+dBLOkH0dOTPy3oPiKyaQiQYkpLusrD1o7P
 v6rfMDNGyVImxqC5NWra0lKIf6Ms+R4/b93gG/qV0LG8wuqfjiUoSCDmwUyjlVPnF3o6
 pJEvLRG5frTOewdXtlvWz4zWEwto14EvKRg+pzVkGyipyr481WYBYu58zv/TQaktrFsp
 njhxzC2mbC7XhJMpYyNOEuMZF+NqH46ybcuqaC+JDPai0KReHVzWw6vcZGfrF/YB3iyX
 CG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMY8dvY13Pqnug8MKfJU9bIF1ZzoxssF8oKzAVGn1D4=;
 b=hXTm3MqKLHYabi9CWTS0Nb7yEuctNJ/DMH4a3cc1W9rQLC8/oGWJwTQMc1tPxb0WTD
 Sr747shumm++S1UMXh+JWRj7l/AbkpHAdgH2nuZSv4ul1DvYbAPes5OBFe/QWCSykdHn
 eeN6iXR3BmhxCt9jKricSsIeLDvR1MSZi/1svTGxYqJmxMGewq2eSb1U2FFHT2kxB98t
 fZnjdhY1sK/l5LXYtIERuQhOxlvf0qc46sPQpgdumeHTRZFs1A6Aa6VY18lq1Q29uk22
 TkdY+BxofC3nEBzFsr3Kzt/KVE6un7SJVxsagS18jL9IsC9hriPjxOenDbSASYOSl6C0
 Ws/g==
X-Gm-Message-State: AO0yUKX63Y0tdxZimj9HWm28FxNcNL2mtCcyzIeZcHCl7Uvdxcs5UW6T
 tTkp7pLhJ4gbccLCm0KAhf6K+A==
X-Google-Smtp-Source: AK7set/2GuiUkNC2LI1veLsdE3LlI+iwPY6GQDQDmZe/0PhINycVpnMFb/3lI5AlVnLC9JF0ckE1oQ==
X-Received: by 2002:a05:600c:524b:b0:3ea:dc1b:90c with SMTP id
 fc11-20020a05600c524b00b003eadc1b090cmr3097051wmb.20.1678463847425; 
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a5d570e000000b002c706c754fesm145605wrv.32.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CABF41FFB8;
 Fri, 10 Mar 2023 15:57:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PULL 1/5] contrib/gitdm: Add VRULL to the domain map
Date: Fri, 10 Mar 2023 15:57:22 +0000
Message-Id: <20230310155726.2222233-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Message-Id: <20221219121914.851488-4-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 3727918641..16822fe471 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -38,6 +38,7 @@ sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
 virtuozzo.com   Virtuozzo
+vrull.eu        VRULL
 wdc.com         Western Digital
 windriver.com   Wind River
 xilinx.com      Xilinx
-- 
2.39.2


