Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1DF14011B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 01:48:06 +0100 (CET)
Received: from localhost ([::1]:50700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isFnx-0003GU-7J
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 19:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1isFmV-00021F-I5
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 19:46:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1isFmU-00062g-9r
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 19:46:35 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46419)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1isFmU-00062F-54
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 19:46:34 -0500
Received: by mail-pg1-x541.google.com with SMTP id z124so10762637pgb.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 16:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oygK1NLyoPpmK0Gy1w7Ud04ubfmrMwSCnvZhv3v1fA=;
 b=ZGXvWtWnxr+3UrGd9KB3cgREFH2vCxq3koCIaf1dQxT07jYlKK+jDRi1+cXwBc2p+I
 a557mZEyQemMNAURv8PQ6c3hA9ww/uubcm//8Tki+KK9rC86SoAWyHmPp7hOdYd5sM+F
 GoxdaaV1ZA+fc7UPMpklHNJw++6Zvq32zBdZGnMqQnLav7u4KwnPoG1LSbcYtqGjCqO2
 /NC3qly15JTyCNSAsJ7mdf365YE5dh/ELa7zbqawVPjKb065/RKSP/IlpKwoveQWMq6H
 Ec1vyTIXg6cDU/dEzOYfoVLi7ss6YvABl9cOMZrWKYHyw0JmDxntVey39tKJvehzhM+/
 28rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oygK1NLyoPpmK0Gy1w7Ud04ubfmrMwSCnvZhv3v1fA=;
 b=LU6MyM7kymi2QFcB5BC7t9fa6URaf3GXwE3PJQmsO4l/JIVIsn2st2TZ3CyOcIvHba
 SMrLsOEIPo4lpyzWmaeNi/r118cgQ/zd2KOTuUK9i3iqkdQB15ooIlM51botW0RkEhQZ
 +NhQpzDHpF1Il9isPAqxu9VU5eTC5HVXTZJCCLkxGFbYaIWc964XhdjRb0Sp04h9Kt/Z
 IFKObU1adgF/uweuQRiCKRdirlSCa4pyWZz484YhcS4yVKcb3ICYQa65og7QGQZJ0o59
 YhNAHuJR/BM90wURDogP7320CJeZbz8aFH1pEUNhfK44U/1wle2QT53rCSH/X+WpnoC2
 cRrQ==
X-Gm-Message-State: APjAAAUlLn6/efWv8nVakyrPfEsYD1yEsdHw2fOvneIu4cWNgMb78dzl
 B2LSESueL/nOB86Z7sdh/S+EyTR2AOY=
X-Google-Smtp-Source: APXvYqwC/SWqXggQ75ANSTKOvPvUMCtUjZqkqOJxgAjTZUc3uvEES/9as23SkbCVqn7uzC+QCPX1TA==
X-Received: by 2002:a63:303:: with SMTP id 3mr42443101pgd.372.1579221992805;
 Thu, 16 Jan 2020 16:46:32 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-136-155.west.biz.rr.com.
 [66.91.136.155])
 by smtp.gmail.com with ESMTPSA id 81sm27663582pfx.30.2020.01.16.16.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 16:46:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/arm: Set ISSIs16Bit in make_issinfo
Date: Thu, 16 Jan 2020 14:46:18 -1000
Message-Id: <20200117004618.2742-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117004618.2742-1-richard.henderson@linaro.org>
References: <20200117004618.2742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, qemu-stable@nongnu.org,
 jeff.kubascik@dornerworks.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the conversion to decodetree, the setting of
ISSIs16Bit got lost.  This causes the guest os to
incorrectly adjust trapping memory operations.

Cc: qemu-stable@nongnu.org
Fixes: 46beb58efbb8a2a32 ("target/arm: Convert T16, load (literal)")
Reported-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5185e08641..c25921ef95 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8556,6 +8556,9 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
     /* ISS not valid if writeback */
     if (p && !w) {
         ret = rd;
+        if (s->base.pc_next - s->pc_curr == 2) {
+            ret |= ISSIs16Bit;
+        }
     } else {
         ret = ISSInvalid;
     }
-- 
2.20.1


