Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBF7650BD5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:38:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7Q-0008Ig-UX; Mon, 19 Dec 2022 07:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F75-0008C2-8d
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:25 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F73-0006VZ-H4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso6262789wmo.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pZPXXRVx8r2AJXvOWThEc7V1aqVufq/9aV5+S6vC0cs=;
 b=xC5dtlblMuV4nUQ2OSJhkptkPsVABzRKUoMYp8GPbVGYgsIZ3a4wfCqAeL3ofTEpCV
 3q18aOiMGUgoX+FC+wXsdLhoT5ARmXv7DR51gLy6ri5cJQPLIFDwah9Vho8t8vafXHPZ
 Eb79ZYF/yy/ILjkihXV6foETcZkIlkBnKyx2uYOuw2K94rTzgvbm8l/rOxfjJJ+lrf8B
 Gnuc1WC9F3rmVZ7QXAf146fsKrSz6RZBdfjx+RCwPM2OnPnom2d9Jifzbi3KQnbUUS8E
 qo2hHEmQkWEUIJ8ig411QBUBbNk1DTlJ934DcylQAvjsnBk46hAgpVk3kWKwve67gU6X
 ZvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pZPXXRVx8r2AJXvOWThEc7V1aqVufq/9aV5+S6vC0cs=;
 b=KaBpnf8/ztPdkNyAnFJRGP57eqUK1m1wHHPve3wghwGBw5CdqEOU519t7y2WHd5woU
 NHfsA44Mq156WiMnnlnl9tvoweyTCsMjRqrlS3UsFvNHysMCTFiruRWrUfeFOZhnZfBe
 l2VrC3ojXZmCJ1q9k7D7TtS2got5uCT2u20lg3NYTFDCqak1YJPZDGrcy+wy9vi+VlOR
 HeKN7TwaxDPzTf1hP+WoBpOfm6bZaXoYE+HU2hug7J3fiD55Vl0o5huhqbS+yJDak7Dt
 u+a+pOvLiCP3ZstSWqTUMXJY3bPTq3SpClMFsAbnbK+HYvLxxYYRxCAWA8vs7vJz4l8G
 ZNAw==
X-Gm-Message-State: ANoB5plzE0AH+mitvocnXrm6I+n56HbSxq3P06d8lL+IEg8SfPhF82df
 5WRq6Pp7rjKsnS0aJbD/gGEuXA==
X-Google-Smtp-Source: AA0mqf5slxpRe6nJFQRqEDjyWxFLXqwQSZZCEzEb+G1vGyW7UYUPtck2t7oPAqXhVxb3ITllSLZoXw==
X-Received: by 2002:a05:600c:6543:b0:3d1:fcca:ce24 with SMTP id
 dn3-20020a05600c654300b003d1fccace24mr30548527wmb.32.1671452359999; 
 Mon, 19 Dec 2022 04:19:19 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a05600c0a4600b003d1e3b1624dsm21334342wmq.2.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1CF4C1FFBD;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Rahul Pathak <rpathak@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 05/11] contrib/gitdm: Add Ventana Micro Systems to the domain
 map
Date: Mon, 19 Dec 2022 12:19:08 +0000
Message-Id: <20221219121914.851488-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

We have a number of contributors from this domain which looks like it
is a corporate endeavour.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Rahul Pathak <rpathak@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 7ff511d5c6..727df18879 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -39,6 +39,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+ventanamicro.com Ventana Micro Systems
 virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
 wdc.com         Western Digital
-- 
2.34.1


