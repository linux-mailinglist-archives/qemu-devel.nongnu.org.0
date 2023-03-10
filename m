Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9B6B4FBC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:05:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5m-0001x5-Kn; Fri, 10 Mar 2023 13:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5h-0001tu-6R
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0004c8-I4
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id k37so3988071wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCT/n+2KJoWHhYNgxwPL3x//EQme/z7sRUrMnwz1Rh8=;
 b=XWlD8EWEVzKpkOQhVPIMum/eRiUlF4jhFLcpB7m1eFzlT1XhUfQnVCKNi38PTCXRrQ
 tjVUHXazZN6CZwJZb8H5xK2mb7hYKTk5C5TzWBMDirxG3vi60t6y1CG2vun/yq1YHx3I
 jGw5ojZg7rG3SBODQBSmKjX/cqryw0jT/ANhVGpilR6djPLTSdSavr/Xi+gILmGMQRzg
 XlIOct1SqtV3reqKRj0w/n6dYNXeATxy+giaDLXPKXoCC9Sc9VpO/T7p292DVN7VnQNg
 2uU9rsj7ab3V72tYARfwcS0cKI4N5r9IIBiFqBXNvE3QRK8oTnemrUtrdy3ZFU3GkC3U
 ROLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCT/n+2KJoWHhYNgxwPL3x//EQme/z7sRUrMnwz1Rh8=;
 b=uMW0qz5OEQfgk0FqX9/HPHNaV0cN+9bQ8l9U+aqrjaA+PO3uvv6EChnPkUNNuUPDs4
 Ww28/ZpfGEqw8eC02i5/+1vGfAXbKfD/V2D0khlcXPLJPLiRKNH68Z3SwJwp/Jmz8PLD
 t6VR/0a7ITWhpcNjkr8j6J5DHkpjoX9RlbEXveqrFpW2F8z5yXiFYwAPoHU3MqjMsvJ8
 1Nnev9Z7/YjgLEmJIZP15bagt6mxvyRqVtPn1iICkKWG6g2/dsv+0iPwUjrFjliUwhan
 PGcB3Myni+yDAOlgnWbylfUIeJVNMo2y2F/dZMLXrhO5HDODUrQKo87cBtsceqR6z8ka
 oB1Q==
X-Gm-Message-State: AO0yUKXTejdTi2fsVNxTKHDuHar/Tje3I/x/CZJ0ZCu2yoixfjOuqkUo
 qljv0IU03ASNCeOlugUeiDKRyXYjvdct+BCsNRQ=
X-Google-Smtp-Source: AK7set+nEr40qUn4msVpxL3zTuCtS7yUFiAz2BFfVksCudumeZbYtdp3pS04Wo2PbLMmkHJtXZQwzQ==
X-Received: by 2002:a05:600c:4686:b0:3e2:201a:5bce with SMTP id
 p6-20020a05600c468600b003e2201a5bcemr3371720wmo.40.1678471416216; 
 Fri, 10 Mar 2023 10:03:36 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a05600c224300b003eb5a0873e0sm551331wmm.39.2023.03.10.10.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B83A81FFB7;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Amarjargal Gundjalam <amarjargal16@gmail.com>,
 Bin Meng <bmeng@tinylab.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 09/10] contrib/gitdm: add more individual contributors
Date: Fri, 10 Mar 2023 18:03:31 +0000
Message-Id: <20230310180332.2274827-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

I'll only add names explicitly acked here. Let me know if you want
contributions mapped to a company instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>
Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
Cc: Bin Meng <bmeng@tinylab.org>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 contrib/gitdm/group-map-individuals | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index e2263a5ee3..0e4618f1ce 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -38,3 +38,8 @@ paul@nowt.org
 git@xen0n.name
 simon@simonsafar.com
 research_trasio@irq.a4lg.com
+shentey@gmail.com
+bmeng@tinylab.org
+amarjargal16@gmail.com
+strahinjapjankovic@gmail.com
+jason@zx2c4.com
-- 
2.39.2


