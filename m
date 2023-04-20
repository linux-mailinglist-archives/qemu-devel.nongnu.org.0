Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3B6E8F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:08:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRAL-0000kp-TB; Thu, 20 Apr 2023 06:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRAB-0000a8-FD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA6-0003sE-B0
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f17b967bfbso14807145e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985107; x=1684577107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4eHg+lCv4M3dXl8nzALTGNTpBxoOVjzDm9hvt3AFK8=;
 b=YUo09dt36YzcluJ3C/maJU/HzhYBOLQzbW5iHJUF3VQTTpuyCtnx+6SrTRzXWdv8Um
 +z63Xh9sGKpJWS+LCdhIW0aI6mDL38bH4J/l5d7ttXuq4aJC9tx+g6H+6va1KTUyV1x5
 4Y3qci2mQFD5zxZCA/qm6XPfyjFkm/BkjjHSuuwTuSvOYEjS7xOb+F6g8fFu61PLg+Vi
 rapgpVrwhHtRxsZn5TfwpqgaGhwFD3F/ywIV6ZmU26UmC/ANggnevGVd3VTLEhl9g1FX
 7uW2e8iVMzDt5p0ARWSSy9WD5Nax0ccfaWAqf6B5HmCArV0ShOgtz2/rvIilVOWO/RAq
 klXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985107; x=1684577107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4eHg+lCv4M3dXl8nzALTGNTpBxoOVjzDm9hvt3AFK8=;
 b=fj0+rXdL5ffrJYF0K2fY+4Vwlv4p1nSyewtuQwIWAXmfDEm1iNiq85WK6gTq8EOYCX
 uBlER7ZNG+1I7122srrJ9DuECylpe8x01Ie0qs9Lmg4XGH2tcJrO6TpcOw2kRODBgV52
 n/vvphlnotC8oRMhTWIsBSZC3vlxT7dY0I5gFVtssI/o2nWNdhZBizU4TDuZ3m1Ck6Dw
 v9IS98DFW2iVnJsnvX2VQEvksnsK3nA+Zfsk6sM7aFQ/h0hDloaoG2gPV37S3s1WvVao
 TbisOCpj7rf+0cl+/uhYIJ7V9AXlVEKp1G05R525vSDXtc/NVCLr+zQN2VdbHC+rWXja
 6vuw==
X-Gm-Message-State: AAQBX9fhTxRTNWOg1sVSAssNROefniuNnvsQzOTwL8Jc5sMTEGAxWKlK
 c3APGF6pbtgsaIeZ7I8oIynFj4w/UDYYgHkrlb0=
X-Google-Smtp-Source: AKy350YOcElvTmS8X4Uux88VF1cCqXKPXRYpwtrIGtHhldX89oEAf63DcApDQTCedkBP2ANAIpQZ4g==
X-Received: by 2002:adf:fc0b:0:b0:2f0:2d96:1c5a with SMTP id
 i11-20020adffc0b000000b002f02d961c5amr979806wrr.32.1681985107522; 
 Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.05.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:05:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] docs/devel/kconfig.rst: Fix incorrect markup
Date: Thu, 20 Apr 2023 11:04:50 +0100
Message-Id: <20230420100456.944969-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420100456.944969-1-peter.maydell@linaro.org>
References: <20230420100456.944969-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In rST markup syntax, the inline markup (*italics*, **bold** and
``monospaced``) must be separated from the surrending text by
non-word characters, otherwise it is not interpreted as markup.
To force interpretation as markup in the middle of a word,
you need to use a backslash-escaped space (which will not
appear as a space in the output).

Fix a missing backslash-space in this file, which meant that the ``
after "select" was output literally and the monospacing was
incorrectly extended all the way to the end of the next monospaced
word.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230411105424.3994585-1-peter.maydell@linaro.org
---
 docs/devel/kconfig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cc1a456edf0..ac9453eba90 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -274,7 +274,7 @@ or commenting out lines in the second group.
 
 It is also possible to run QEMU's configure script with the
 ``--without-default-devices`` option.  When this is done, everything defaults
-to ``n`` unless it is ``select``ed or explicitly switched on in the
+to ``n`` unless it is ``select``\ ed or explicitly switched on in the
 ``.mak`` files.  In other words, ``default`` and ``imply`` directives
 are disabled.  When QEMU is built with this option, the user will probably
 want to change some lines in the first group, for example like this::
-- 
2.34.1


