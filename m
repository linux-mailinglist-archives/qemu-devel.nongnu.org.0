Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1E6B4BCD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf8Q-0006iC-64; Fri, 10 Mar 2023 10:58:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7l-0006Uy-7N
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004KR-UB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:37 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso3737491wms.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAo2Ffu+I9a0QxHwxZYuWefFEG48ul5El99ovSCNuIE=;
 b=wB/jA3HL3+Ny+DcSh7dzRVpBtd/14RPAQimCfy4nY9BlQkrEGqYrfmyeMsw8x9Ef+t
 qCc9ESwws9YzjvX77vZo3MqJHqCqO78Tc3GKOZie1o/6F0oXAhKo24LSOYuVaca877H/
 x3LXyzFq4e03p0wLM5G4LWnmbyISJzuufrBEsOPBrZVaG2o/2AgVVFzCRkCRFHhICBmY
 bDJSkULJVyLkRf2iPrRRsP8yqESW+fZkE9MM+sVAA0zIBPYyOfoenTjFh3imwaXmm9fY
 TswhjJg8IkEoVik4bHVvUKOo15ls9ooZvYW//PJlJFo1YiS+Pow6MItAZzlfgOGgsDp0
 grKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TAo2Ffu+I9a0QxHwxZYuWefFEG48ul5El99ovSCNuIE=;
 b=JsfCrZAN1SwTf9zaN5RcuC6O+Lwwpy0DWCF7mBRHgcUFQrRlKHXBy1vZTxtQax9k3F
 yVneWOCSiFzoW0u1+YslY3e1KkYJz49TvVsCnD7/POKoMZmcc3pCjrqWWKsyMYpsIv4n
 bIGWKW5ktzU3MSGbv5aoAU98FqQMzxvt80nIv4r4jY9cKwlshERmnUat20KxTaHGYZc8
 qjV+p7ZB7uUapstEC5j19N3TehqaInnuQsS4AMo+YORLeZUfjzA0paIMgyRANc4bLgXu
 rdtofIwD3kDN5AGsBqBePZ8PyuGxRnwu8NU7J6EiHJhbHB+cnKdXbbIb0Hklq6UuYkjP
 saNA==
X-Gm-Message-State: AO0yUKWMbcLdU637XDrlRxB/dXziD7AEfsQKd99jjQc+i61LHKYXWokO
 pYVXhqXvQ8SYW0O0QdJA7OLefnXbRFS81y7zC74=
X-Google-Smtp-Source: AK7set95Whwguj7f2uCCPkuLuUg6GmBcpToeF/XZ/jWx1WHUSGrARNTgHbYjgqzUEzoD66kzSCgXvw==
X-Received: by 2002:a05:600c:46c7:b0:3d3:49db:9b25 with SMTP id
 q7-20020a05600c46c700b003d349db9b25mr3215120wmo.26.1678463847830; 
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003dc4480df80sm289971wmq.34.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3F571FFBA;
 Fri, 10 Mar 2023 15:57:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Rahul Pathak <rpathak@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PULL 2/5] contrib/gitdm: Add Ventana Micro Systems to the domain map
Date: Fri, 10 Mar 2023 15:57:23 +0000
Message-Id: <20230310155726.2222233-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Message-Id: <20221219121914.851488-6-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 16822fe471..1ea20b9890 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -37,6 +37,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+ventanamicro.com Ventana Micro Systems
 virtuozzo.com   Virtuozzo
 vrull.eu        VRULL
 wdc.com         Western Digital
-- 
2.39.2


