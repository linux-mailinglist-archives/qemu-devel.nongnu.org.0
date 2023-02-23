Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83F6A0626
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:26:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k5-0007mR-0p; Thu, 23 Feb 2023 05:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k0-0007T4-Ft
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jy-0002mA-Kq
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:20 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so3430199pjb.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVlvUBDvtffulBoPusPqKGRZ0+pngfJ5N/roeZOO/ec=;
 b=xiof4b3LrC6TfEG7mqTlB5XDMYZzTkzQsNrvBczJbicPUfncU01Tr/3DH2WErAJuHs
 iTqdSZm0zv83nFxlJOkFAZuZRmZwHsne3jyPw7GVqkhUJiTrpT5pMVegNi1enQ5o27pe
 LQb1rI0JFaRtrthYPvku7SismHDOx4xOSY1BHgNIHQRJgaeYBFe+PBiS+3xg3eCxJ1T6
 DjJ6bVsWLlkax6SbFhQ6jDWdje5oPLZJbJbsBtYcZ+v848JBAtnlz6E410IAIq9khVF+
 v8vTEWVOo/30k68mA409LL4yPWWu+85x4C2p6LgXUIrY/Te0B9MOGJNDOHPnHWcYfByk
 8CoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVlvUBDvtffulBoPusPqKGRZ0+pngfJ5N/roeZOO/ec=;
 b=3ZrZwkrAqAzcaaPGbRCXiQyFeIs4K5SSGHVVpIb1j4guWvXLHb/iwYE7FPhdRYWgjE
 RcnIsUamQXews3Eheo+t5hy52RuvtD+DoVX0WxQ+Nda2hW4rThEUgcegti2i6Kk50Fgi
 LVJJ2JjMEfUqx1Ry6nbdGeBTsLWHe0us+qlyNnYuS88e25iKDcba9zrgUcQVA4EYGw++
 D5iOBJIMFuZDeN7m8VnarmzntATRi2jrF8SlndyDNIHC9aSxFPGUGYu/E1dj4ilnxacT
 n+cfKgkBSBCvP4JUgnufTrSygjxbPkVFB0Got03xkCPef7DajzSWinm6btFZ8rCFSjdo
 9UAA==
X-Gm-Message-State: AO0yUKUilnxpX13/ydbDDAPePkQmksrJYbG46kpJhXYdzkO2RmBXYXeI
 iihbv4rA9w/6DtBMYFXWCdDVd04rnG8k1lXD
X-Google-Smtp-Source: AK7set8m9QR62c30CkA9T/gWy3NsaAXr6WnbZsCLfJAk3sFfdZoQE9ZXBx0yYm7AbAHnpwyArSeI2g==
X-Received: by 2002:a17:902:dacf:b0:19a:945d:e31 with SMTP id
 q15-20020a170902dacf00b0019a945d0e31mr12682335plx.13.1677147737256; 
 Thu, 23 Feb 2023 02:22:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 28/34] MAINTAINERS: Add Akihiko Odaki as a e1000e reviewer
Date: Thu, 23 Feb 2023 19:20:12 +0900
Message-Id: <20230223102018.141748-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

I want to know to be notified when there is a new change for e1000e
as e1000e is similar to igb and such a change may also be applicable for
igb.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9adb628627..993ebc6e08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2212,11 +2212,13 @@ F: docs/specs/rocker.txt
 
 e1000x
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000x*
 
 e1000e
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: hw/net/e1000e*
 F: tests/qtest/fuzz-e1000e-test.c
-- 
2.39.1


