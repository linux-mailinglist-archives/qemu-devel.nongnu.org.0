Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D835A418B63
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:08:00 +0200 (CEST)
Received: from localhost ([::1]:38158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcJT-0003d3-Mx
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcD1-0007Lh-Eu; Sun, 26 Sep 2021 18:01:22 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcCz-0000W7-Sw; Sun, 26 Sep 2021 18:01:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id d6so46197336wrc.11;
 Sun, 26 Sep 2021 15:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tc/1tWsRAHXZFKC/1NGFB5yx5EFZYs37sQ6vTjkYEoo=;
 b=ZyJeXcT+I3zF7WvKNdA3otVe0Hzp3t2/kndztmLaMQEVHTc+nEcLRWn6Z2YV8OKfHs
 SzJNS/PdweBBGooayDM3tWUR85KWgPcZ0rtarehOJp5+LQQKi4xfgXWYmSdx+fIT69dW
 p8iy96iSIMEf7gUxLqSLd6enbyBzaakfwidWzOd7b/CkRzNju9nScvIA84Yv2so/uMMW
 PpjelTh1UYFN8eUGrXQknHOBZNRmEEPH/D8fXinFGnADkdi6xUQqFdhdRGw7OagyOgHg
 2AAIrEJJNDQyVQI04BhUwXuceIMAcNb7AL0nhEDDdciXPZu8tE/TgJCY6feavDv8uZxW
 USFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Tc/1tWsRAHXZFKC/1NGFB5yx5EFZYs37sQ6vTjkYEoo=;
 b=WUhryEdrrT9TL0uhoUn7TOD1P4edFrqf2zegnYBTcJr6pYWHE4874tiJPOXTjOvrbY
 2b8qUYY9hhMjr1sPECgn01TCLvwa0EdTnQfN9h2AvsKm1jtWLc73izBSvsQNdSb2X7Zb
 h0veDYMG5gCD+I4YVTSmzYYH+3pMybflYUasQMYcVKR/iM8uEQO8PCyxz/rCR8cyiJUn
 ZBSG6d7mDw4QQb2pvk5VFpa8wTIKkU1gF7Fs5TkfcIoSfYVbxI2IGo1xy5a6sK5N1RY3
 OucTE9ksC7R5io2ecLiLGubAFxuPHC/UZJdsTOfbr6g6YOrdocLmw3yM5heF7BkhrKPR
 vfBQ==
X-Gm-Message-State: AOAM530zvcVpUO3j9Xm1/s3vqpT2E77rutNxKquAaMQ0kBKUfuL/sxgr
 a8DDvuc3dG4RFBFOhYzduOAzUs/lK/c=
X-Google-Smtp-Source: ABdhPJw5cN180HCPez47HE/+hRKoFHUjwYKW0D06+rX+d9BMb4tvleSonLH/AQKIOB3MxTIzSfGyyg==
X-Received: by 2002:a5d:5142:: with SMTP id u2mr7712418wrt.180.1632693676129; 
 Sun, 26 Sep 2021 15:01:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 r4sm16127098wma.48.2021.09.26.15.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:01:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] linux-user: Only process meson rules on Linux host
Date: Mon, 27 Sep 2021 00:01:03 +0200
Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926220103.1721355-1-f4bug@amsat.org>
References: <20210926220103.1721355-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/meson.build | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/meson.build b/linux-user/meson.build
index 9549f81682d..1c4e94f0cc8 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -1,3 +1,7 @@
+if not config_host.has_key('CONFIG_LINUX')
+  subdir_done()
+endif
+
 linux_user_ss.add(files(
   'elfload.c',
   'exit.c',
-- 
2.31.1


