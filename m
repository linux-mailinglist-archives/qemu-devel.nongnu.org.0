Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C8445552
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:30:09 +0100 (CET)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midkm-0002Hp-FH
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midO2-0007dr-Ct
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:35812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNz-00014m-KS
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:38 -0400
Received: by mail-il1-x133.google.com with SMTP id w15so6284642ill.2
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=AIImSrI+5yifraxY1cijEXWfKdEiLny5ZHoZ0oucx/8AhDuRDzVLLNb89thINiV8dd
 xGYqV4KueoOOgxLbRlkMu1VppfBf/8qfBLmsMoT9SqPcAUjLgAx4mEASlNzhPCzCdUrK
 MDI20qD/qXTC24clPy8zq0KcsGl1dzf2xbHfnPi8iDYDR8U+EeurGzV1WwL3vCLYYJRq
 TBrB3uN3+Yvml4qba3+JeNrUkq8aPFmmGqMEmQO9rM8AptwDfHvnMAQTNL60ADgNJpJC
 /8WSB946b4wG3UwTljzBMwY64jjeeMmzHp25Ppcxzz007X+kar1eKcAV02uMWrGbuKiD
 Wkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VTdt3uC+ttB19F3HtSXrERhSxFv3zvRil3LE5812gSQ=;
 b=KF85Wgt5rLeh8E5JtHilyIEGBogZeCATLNeQ1uSC+5CWyvOJsK3X4nnNoLfF5FIbD1
 I/St2uXcbsyRyeGMp5DATGMr0MrbIrn9BH71nn1DPzvGyQVo5C8FbLteXDXlglxc5qU1
 haIFXWIsbbl9oySGOYYvc5FV2kwYvShoLiIEu5UZsNokkaAer89srng7ZWfRHcilaALT
 lx5M5+Qk2SN6Tdrf2fWkSUPR+W0hOYmCqZ0VaFfkCupJTejmrgD5qxMM1X6LOKdWXhvk
 6+R+/wWMpAG0lKUpXVp/fqi49igBpAwJEUH87eg+GgPAPYrhM9ShMOHzqusj8bqyIit/
 SQ1A==
X-Gm-Message-State: AOAM530CpwuPHqu0oLt3eMyXSwbAWWn4NQd+sJ6+cbjglroUrGrn+A+h
 X3d0sbS+kIq3+5u6zcSGt0G7GcnC8f80Ow==
X-Google-Smtp-Source: ABdhPJy+TYE0PxzR+TXXpkO4POIHOKH2FK/vhj5Pwd+fKjV41vFr7Mf84YPCnrPizNS4M1ICs3sJRQ==
X-Received: by 2002:a05:6e02:1989:: with SMTP id
 g9mr21213842ilf.61.1636034793261; 
 Thu, 04 Nov 2021 07:06:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 25/29] bsd-user: add arm target build
Date: Thu,  4 Nov 2021 08:05:32 -0600
Message-Id: <20211104140536.42573-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 0000000000..cb143e6426
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
-- 
2.33.0


