Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511406EBCE8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREY-0007yd-4x; Sun, 23 Apr 2023 00:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRE1-0007Cr-Tu
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:22 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRE0-0001Ny-8y
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a6670671e3so30687065ad.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223679; x=1684815679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=XKaqoplJD2nbjHn/WldmI9Oa9iar6rV5SMgiHQIAr2Jcq8hWTpTMtgr8aOiFXW4tXx
 xmGDYrWlJCFcVYhJvZWVScAxgiP8K82j3fFX8CspIxe2K5SyBRThrxnmvjH5yeuhHqwm
 R7Ta77OcrriBpZGU4tORD0KokgU+QV7vHOu3GeuXo/DjDGLSuhuOiKyyTDA/qZfqx/Vz
 ihPMQf2EShpGY7wCYmd80LgvNDEekiwYqP9TYQfMvOB0whoiLueMPheO1DEkcz6B9cT0
 DfWS2n9TBtB0zzqWcuF2ssajtKtNbCEUsabO/iQdHCRmQICSxEYS2JwnduoEUG7e3NR1
 7ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223679; x=1684815679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=Ee6K11PK0Nx4GKKT8VKrzMG0dh+4tdb5ISurxL7K7ioVF0IaAo/OShgHYReC3oaP/t
 A2CG3LAymKoIysnxWYGdR50zAs7rhqWXx5zIphPrZowfTozkLlXYXrBIXZNba1YYOroG
 3DlQI2447TawSKyC8/LGpHwPOs+sFqzwBJjuhi5WkaV2XOd+mw17w8c8RwagH1zjWk6e
 +NYLw+DXEku7gTLbssR62NnolJa7BYyWIAgvivkcKV4NgyF0HbuhOnQnfrZwKogLymQ+
 4xKRcdUKks4nzRAs2Ya0IbYh1x5lkU0WN+JF9MxuvdQecv6yGsBKNm/GNHkLFKCVV5Lr
 C/ag==
X-Gm-Message-State: AAQBX9cbMmH7ONKu6GYC9U54YbORtGnWugBNRWeSsUmqu1Q7a+ojeLvV
 IgAufGkw16UxJzLAwHAowk0Ihg==
X-Google-Smtp-Source: AKy350ZxQ1pJKoRyNY5I0DE28zQBI4gM9whNkm5gEoHxtpX62Rvs+k6Lyct0FsvC2+8FC8fnbw9qgA==
X-Received: by 2002:a17:903:2345:b0:1a8:626:6d9d with SMTP id
 c5-20020a170903234500b001a806266d9dmr11575576plh.62.1682223679126; 
 Sat, 22 Apr 2023 21:21:19 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:21:18 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 46/47] MAINTAINERS: Add a reviewer for network packet
 abstractions
Date: Sun, 23 Apr 2023 13:18:32 +0900
Message-Id: <20230423041833.5302-47-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I have made significant changes for network packet abstractions so add
me as a reviewer.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c31d2279ab..8b2ef5943c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2214,6 +2214,7 @@ F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: include/net/eth.h
 F: net/eth.c
-- 
2.40.0


