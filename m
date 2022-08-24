Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7859F728
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:10:46 +0200 (CEST)
Received: from localhost ([::1]:58932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnLO-0006kS-ML
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtf-0002w5-Jy
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:04 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:36580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmte-0001NS-3Q
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:03 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w29so10407716pfj.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uGLFIworI1xOFZhnwuk3wq/AntR+XkzGoiU2XFOTgo0=;
 b=hK3zf2SdQjnuubDCuPzkm2tPHXZvcyonSeV/7cfAvKHhaTWgLvDrirR1wgCLudhaO9
 EHyM5BUvxz0urxbDwRrsyvqGkF8nAwizB5HeZkxby0IFXTICcDoMgRcgOl1O5oAR+3Ud
 52BPnhCaufzCWEIEWyMNjJTO8vtHOD/lqEXUKZtT3FcgbSr0BjXxy2ocxRzy7lbvgacR
 stlK8n6mAUySGE5hmmS91CF4bBNIP0Ei/LeNAlWqEoFZFCVmDtidOaYeCrPyJY0P/QjA
 8MVPYDKiYYhiGQ3icK/ESlqomNAqN1zAHrXsRuW2TniGgTUilk6L64rnaYxip2sO3tP4
 eJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uGLFIworI1xOFZhnwuk3wq/AntR+XkzGoiU2XFOTgo0=;
 b=c615jSQIZjORRNlL2VJlpjYuMblGAUGcrOqLxd4XDDiIXorfoXoA1Cytq383m0nYnw
 1Uuq4VydndeRdqPomMLcQOFFk9006S7GV+YxfWxuO3y5t7912MfNwTWyih+sv61s8Xmq
 G/KrsPz2U3X2gtYXVNIjgSTFFvgdrgHY9l2BbQ9/CWGS99AM1P1eckT5ZeHSS2s+udSW
 Eto0E0q6Y2SqZs08uoo7UryijTkwWLLgzbtYUxJpqCxGTLO4+hYzgMyWriMigcpJElLN
 PcDEoifzsrvVFJNf7Plhxb/++TZV7ipH40uM0vm6YM7y2JsKWytzm2k6/uqkRDwln3sT
 w9JQ==
X-Gm-Message-State: ACgBeo1WlzvRONqxKnkQlJqneugyzNtwTwiLwk3q0haIfLAnmPjL9YtP
 y2FAnWEg/PHfp2UQCVE39tU1wr9jBk4=
X-Google-Smtp-Source: AA6agR5HL6ux2y05GQJjqW4yDOr+iimfNi1fY83MnW1Vi0+bCpgTOtPZJTGNZnjWjx1t+FNgqzAM9Q==
X-Received: by 2002:a63:18d:0:b0:42b:321e:b55 with SMTP id
 135-20020a63018d000000b0042b321e0b55mr406888pgb.39.1661334121145; 
 Wed, 24 Aug 2022 02:42:01 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 09/51] fsdev/virtfs-proxy-helper: Use g_mkdir_with_parents()
Date: Wed, 24 Aug 2022 17:39:47 +0800
Message-Id: <20220824094029.1634519-10-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use the same g_mkdir_with_parents() call to create a directory on
all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/virtfs-proxy-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 2dde27922f..d0cf76d6d1 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -639,7 +639,7 @@ static int do_create_others(int type, struct iovec *iovec)
         if (retval < 0) {
             goto err_out;
         }
-        retval = mkdir(path.data, mode);
+        retval = g_mkdir_with_parents(path.data, mode);
         break;
     case T_SYMLINK:
         retval = proxy_unmarshal(iovec, offset, "ss", &oldpath, &path);
-- 
2.34.1


